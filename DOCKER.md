# Docker

El producto se despliega en tres imagenes: **frontend**, **backend** y **base de datos**. Son
imagenes de *runtime*: el `docker build` no compila nada, copia la salida de `dotnet publish`.

## Generar las imagenes

Desde VS Code: **F1 → Run Task → `docker-build-images`**, o directamente
**`docker-up`**, que genera las imagenes y levanta el compose. Con la extension
Container Tools instalada tambien puedes hacer clic derecho sobre `docker-compose.yml`.

```powershell
pwsh tools\build-docker-images.ps1
```

Genera `flxcatalog-frontend`, `flxcatalog-backend` y `flxcatalog-db` con tag `latest`.
Opciones utiles:

```powershell
pwsh tools\build-docker-images.ps1 -Only db          # solo una imagen
pwsh tools\build-docker-images.ps1 -NoBuild          # reutiliza el publish/dacpacs ya compilados
pwsh tools\build-docker-images.ps1 -Tag 1.2.3        # otro tag
```

## Arrancar

El producto recien creado desde la plantilla ya trae su `.env` (lo genera `init.ps1`
copiando `.env.example`). Todas las variables del compose tienen valor por defecto, asi
que arranca tambien sin `.env`; el fichero sirve para sobreescribir esos valores, sobre
todo `SQL_PASSWORD`.

El puerto del frontend se asigna solo al crear el producto desde la plantilla (evita a
proposito el 7110/7111, que es lo que usa Visual Studio al ejecutarlo en local), asi que
puedes tener varios productos levantados a la vez sin tocar nada. Si necesitas uno
concreto, fija `FRONTEND_PORT` en tu `.env` o exportalo antes de arrancar.

Si clonas el repositorio de un producto ya creado no tendras `.env`: esta en `.gitignore`
porque cada entorno pone sus propios valores. Copia `.env.example` a `.env` antes de
arrancar.

```powershell
$env:SQL_PASSWORD = "TuPassword123!"
docker compose -p Mi_Flexygo up -d
```

El frontend queda en `http://localhost:7628` (el puerto generado para este producto, o el
que hayas fijado en `FRONTEND_PORT`). El backend no publica puerto al host: solo se llega
a el por la red interna.

## Ficheros

| Fichero | Para que |
|---|---|
| `flxCatalog.Backend/Dockerfile` | Imagen de backend. Contexto de build = carpeta de publish. |
| `flxCatalog.Backend/entrypoint_backend.sh` | Aplica `$MSSQL_SA_PASSWORD` a las cadenas de conexion y arranca la dll. |
| `flxCatalog.Backend/.dockerignore` | Deja fuera los `appsettings.*.json` de desarrollo. |
| `flxCatalog.Frontend/Dockerfile` | Imagen de frontend. |
| `flxCatalog.Frontend/.dockerignore` | Idem para el frontend. |
| `flxCatalog.Conf.Database/Dockerfile` | Imagen de base de datos: publica los dacpacs y deja los `mdf/ldf` listos. |
| `flxCatalog.Conf.Database/entrypoint_db.sh` | Adjunta las bases de datos en el primer arranque. |
| `tools/build-docker-images.ps1` | Publica, prepara el contexto y lanza los tres `docker build`. |
| `docker-compose.yml` | Compose de desarrollo local. |

Backend y frontend llevan su `Dockerfile` al publish gracias a los
`<Content Include="Dockerfile" CopyToPublishDirectory="PreserveNewest" />` de su `.csproj`; si
quitas esas lineas, el `docker build` deja de encontrarlo.

## Base de datos

La imagen incluye los dos catalogos en la misma instancia: `flxCatalog_IC`
(configuracion) y `flxCatalog_I` (datos). El producto usa referencias entre catalogos con
nombres de tres partes, que SQL Server solo resuelve dentro de una misma instancia.

Los dos proyectos SQL son obligatorios: la imagen siempre publica los dos dacpacs, y si
falta alguno el build falla en vez de generar una imagen incompleta.

Si tu producto no necesita base de datos de datos, quita el proyecto
`flxCatalog.Data.Database` y ajusta a mano el paso `db` de `tools/build-docker-images.ps1`,
el `Dockerfile` de `flxCatalog.Conf.Database` y su `entrypoint_db.sh`.

## En integracion continua

El pipeline construye la imagen de base de datos en cada ejecucion y corre los tests contra
ella. Las de frontend y backend, de momento, solo se generan en local con el script de arriba.
Ver `CI.md`.

## Limitaciones conocidas

Los webhooks de OAuth (Google, Mail, Office) no funcionan bajo compose. La URL de
redireccion se construye a partir de `FrontendEndpoint`, y ese valor tiene que quedarse en
el nombre interno del servicio (`http://flxcatalog-frontend:8080`) porque tambien lo usan,
servidor a servidor desde el contenedor de backend: SignalR para los eventos de usuario, el
updater y la comprobacion de estado de la aplicacion. Apuntarlo a `localhost:<puerto>`
resolveria al propio contenedor de backend y romperia esos tres consumidores. Hace falta un
segundo ajuste en el core de Flexygo para separar los dos usos; queda fuera del alcance de
este cambio.
