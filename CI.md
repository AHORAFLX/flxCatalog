# Integracion continua

El producto trae pipeline para **GitHub Actions** y **GitLab CI**. Las etapas estan escritas
**inline en cada fichero de pipeline**: son comandos `dotnet` de una linea y se leen mejor ahi
que detras de una llamada a un script. La unica excepcion son los tests, que necesitan
levantar un contenedor, esperar su healthcheck y limpiar en un `finally`; eso vive en
`tools/run-tests-with-db.ps1` y lo llaman los dos.

| Fichero | Que es |
|---|---|
| `.github/workflows/flxCatalog.yml` | Pipeline de GitHub Actions. |
| `.gitlab-ci.yml` | Pipeline de GitLab CI. |
| `tools/run-tests-with-db.ps1` | Los tests contra la imagen de BBDD. Lo llaman los dos pipelines. |
| `tools/dev-pipeline.ps1` | Atajo para reproducir el pipeline en local. |

**Quien manda es el YAML.** `tools/dev-pipeline.ps1` es comodidad, no la fuente de verdad:
cuando el script local y el fichero de pipeline no coincidan, **el equivocado es el script**.
Y la regla que mantiene esto sano: en `dev-pipeline.ps1` no vive logica. Solo encadena los
mismos comandos de una linea que estan en los YAML. En cuanto algo necesite mas que eso, se
saca a un script propio que llamen tambien los YAML, como ya pasa con los tests.

## Las seis etapas

| Etapa | Que hace |
|---|---|
| `restore` | Anade el origen de DevExpress desde `DEVEXPRESS_API` y restaura la solucion. |
| `publish` | Publica Frontend, Backend y UnitTest a `publish/flxCatalog/` con la version estampada. |
| `db` | Compila los dos `.sqlproj` y construye la imagen de base de datos con `tools/build-docker-images.ps1`. El `docker build` publica los dacpacs por dentro, asi que **es la validacion del esquema**. |
| `test` | Levanta esa imagen, escribe un `appsettings.local.json` apuntando a ella, ejecuta los tests unitarios y limpia. **Bloquea**: si fallan, no se empaqueta ni se publica. |
| `pack` | Genera los cinco NuGets del producto en `publish/nuget/`, uno por `.nuspec`. |
| `push` | Los sube al feed. |

En GitHub cada etapa es un paso del job, con su bloque plegable. En GitLab van todas en un
solo job (ver mas abajo por que); dentro de ese job, marcadores `section_start`/`section_end`
delimitan las mismas seis etapas como bloques plegables independientes en la UI, con su
propia duracion, aunque siga siendo un unico job para GitLab.

## Que hay que dar de alta al crear un producto

Tres secretos. En GitHub se pueden definir **a nivel de organizacion** y en GitLab **a nivel
de grupo**; puestos ahi, los productos futuros los heredan sin tocar nada.

| Secreto | Para que | Si falta |
|---|---|---|
| `DEVEXPRESS_API` | Restore | **El pipeline falla en la primera etapa.** El producto arrastra `DevExpress.AspNetCore.Reporting` transitivamente desde `Flexygo.Library`, y ese paquete no esta en nuget.org. |
| `NUGET_API_KEY` | Push a los feeds | Falla la etapa `push`. |
| `SQL_PASSWORD` | Contrasena de `sa` del contenedor de BBDD en los tests | Se usa `-CHANGE_me1234`, que funciona pero no deberia usarse. |

En **GitHub** cada paso recibe solo el secreto que necesita: `DEVEXPRESS_API` en `restore`,
`SQL_PASSWORD` en `test`, `NUGET_API_KEY` en `push`. En **GitLab** eso no es posible: al ser
un job unico, las tres variables estan disponibles durante todo el job.

El origen de DevExpress se anade con `dotnet nuget add source ... --configfile nuget.config`,
es decir **al `nuget.config` del checkout**, que es efimero y desaparece al acabar el job. Es
deliberado: la API key viaja dentro de la URL del feed, y escribirla en el `NuGet.Config` del
*usuario del agente* la dejaria en disco indefinidamente en un agente de larga vida.
`dotnet restore` toma ese mismo `nuget.config`, asi que no hace falta nada mas.

Aun asi, **la clave puede acabar en el log**. Cuando NuGet falla es *el* quien escribe la URL
del origen en su propio mensaje de error, clave incluida. La proteccion real es el
enmascarado de la plataforma:

- **GitHub Actions** enmascara automaticamente cualquier valor que venga de `secrets.*`.
  Basta con que la clave este dada de alta como *secret* y no como *variable*.
- **GitLab CI** solo enmascara las variables marcadas **Masked** en
  Settings -> CI/CD -> Variables. Comprueba que las tres lo esten; una variable normal
  aparece tal cual en el log.

Si vas a montar el pipeline en un tercer sitio (TeamCity, por ejemplo), verifica primero que
tenga enmascarado de secretos y que este configurado, antes de darle la clave.

En GitLab, ademas, el runner necesita **executor `docker` en modo privilegiado** para el
servicio `docker:dind` que usan la imagen de base de datos y los tests.

La imagen del job instala **`nodejs`** en el `before_script`, y no es opcional: el Frontend
compila TypeScript con `Microsoft.TypeScript.MSBuild`, que lanza `node` para ejecutar `tsc`.
Sin el, el `publish` del Frontend falla con `MSB6003: The specified task executable "node"
could not be run`. Los runners de GitHub (`ubuntu-latest`) ya traen node; la imagen
`mcr.microsoft.com/dotnet/sdk:9.0` no.

En GitLab todo va en **un solo job**, no en varios. Es deliberado: la imagen de BBDD que
construye la etapa `db` vive en el demonio `dind` de ese job -cada job levanta el suyo,
vacio-, y los dacpacs que necesitan los `dotnet pack` de base de datos se quedan en
`<Proyecto>/bin/Release/`, que no esta dentro del artifact `publish/`. Repartir las etapas
entre jobs rompe las dos cosas. Las seis etapas se pliegan igualmente gracias a marcadores
`section_start`/`section_end` dentro del propio job (ver mas arriba). Por el mismo motivo el pipeline
exporta `SQL_HOST=docker`: bajo `dind`, el `-p 1433:1433` del contenedor de BBDD publica el
puerto **en el servicio**, que el job ve como `docker`, no como `localhost`.

## Cuando publica

| Evento | Que pasa |
|---|---|
| Pull request / merge request | Compila, construye la imagen db, ejecuta los tests y genera los NuGets. **No publica.** |
| Push a `develop` | Lo mismo + push a `nugetbeta.ahorabh.com`. |
| Push a `master` o tag `v*` | Lo mismo + push a `nuget.ahorabh.com`. |

**Los tests son puerta de publicacion.** Si la etapa `test` falla, el pipeline se para ahi:
no se generan los NuGets y no se publica nada. El fallo se ve en el paso y en el `.trx`.

La version es `1.0.<numero de ejecucion>.1`, y alimenta a la vez la version de los ensamblados,
la `DacVersion` de los dacpacs, la version de los NuGets y el tag de la imagen de base de datos.
Paquete e imagen llevan siempre el mismo numero.

## Reproducirlo en local

```powershell
$env:SQL_PASSWORD = "TuPassword123!"

pwsh tools/dev-pipeline.ps1 -Version 1.0.1.1
```

Encadena restore, publish, imagen de base de datos, tests y los cinco `dotnet pack`. `push` no
esta: no se publica desde una maquina de desarrollo.

Dos diferencias deliberadas con el CI:

- **No toca la configuracion de NuGet.** El CI escribe el origen de DevExpress en el
  `nuget.config` del checkout, que es efimero; en tu maquina ese fichero esta versionado. En
  local se usa tu `NuGet.Config` de usuario tal cual, asi que necesitas tener ahi configurado
  el origen de DevExpress, que es lo que ya te hace falta para compilar `flexygo`.
- **No hay `push`.** No se publica desde una maquina de desarrollo.

Igual que en el CI, los tests bloquean: si fallan no se llega al paso de `pack`.

Los tests tambien se pueden lanzar sueltos, que es exactamente lo que hace el CI:

```powershell
pwsh tools/run-tests-with-db.ps1 -Version 1.0.1.1
```

**En Windows sin PowerShell 7**, sustituye `pwsh` por
`powershell -NoProfile -ExecutionPolicy Bypass -File`. Los dos scripts son compatibles con
Windows PowerShell 5.1. Los ficheros de pipeline si invocan `pwsh`, porque los runners son
Linux y ahi PowerShell 7 es lo que hay.

Y si lo que quieres es reproducir una etapa concreta tal y como la ejecuta el CI, abre el
fichero de pipeline y copia la linea: estan todas a la vista.

## Limitaciones conocidas

- **En local, el 1433 del contenedor choca con un SQL Server instalado en la maquina.**
  `tools/run-tests-with-db.ps1` publica el 1433 del contenedor en el 1433 del host. Si ya tienes
  una instancia de SQL Server escuchando ahi, Windows deja que Docker haga el bind igualmente
  pero las conexiones se las lleva tu instancia local, y los tests fallan con un enganoso
  `Login failed for user 'sa'` aunque el contenedor este sano. Para el servicio local mientras
  corres los tests, o cambia el puerto publicado con `$env:SQL_PORT = "14433"` (o el que este
  libre) antes de lanzar el script. En los runners de CI el 1433 esta libre y no se da el caso.

- **El pipeline de GitLab esta sin validar contra un runner real.** La configuracion de
  docker-in-docker es la estandar, pero no se ha ejecutado en `cc.ahora.es`.
- **En GitLab, marcar `SQL_PASSWORD` como *Protected* hace que las ramas no protegidas no la
  reciban.** Las feature branches (y sus pipelines de merge request) corren sin esa variable, y
  la etapa `test` no falla por eso: el script cae en silencio al valor por defecto,
  `-CHANGE_me1234`. El pipeline queda en verde usando una contrasena distinta de la que el
  equipo cree que tiene, sin avisar de nada - el tipo de cosa que se descubre seis meses
  despues. `NUGET_API_KEY` es distinta a proposito: conviene marcarla *Protected* para que una
  rama de feature no pueda publicar, y ahi si falta falla ruidosamente, con un 401 del feed.
  Decide con esto delante si quieres `SQL_PASSWORD` como Protected o no.

- **Los tests de interfaz (`InterfaceTest`, Playwright) no entran todavia.** Requieren
  levantar frontend y backend en el runner e instalar los navegadores.
- **Las imagenes de frontend y backend no se construyen ni se suben a ningun registry.**
  Para generarlas en local: `pwsh tools/build-docker-images.ps1`. Ver `DOCKER.md`.
- **TeamCity no tiene pipeline todavia.** Cuando lo tenga sera un tercer fichero con las mismas
  etapas escritas en su dialecto, reutilizando `tools/run-tests-with-db.ps1` para los tests.
