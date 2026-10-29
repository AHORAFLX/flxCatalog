# flxCatalog — Catálogo de demostración con Flexygo

> **Esto es un producto de demostración.** flxCatalog no es un producto comercial ni está pensado
> para usarse en producción: es un escaparate que enseña lo que se puede construir con
> [Flexygo](https://www.flexygo.com). Los productos, clientes, pedidos y precios son **datos
> ficticios** que se regeneran cuando hace falta.

flxCatalog es un catálogo B2B/B2C completo —portal de clientes, carrito, pedidos, postventa y
backoffice— construido íntegramente con Flexygo. Cada pantalla está pensada para enseñar una
capacidad concreta de la plataforma: listados en distintos formatos, formularios, seguridad por
rol, procesos, kanban, dashboards, notificaciones, gestión documental, ayuda integrada y acceso
desde fuera por WebAPI y asistentes de IA.

Sirve para demostraciones comerciales, formaciones, eventos y pruebas con clientes potenciales.

## Qué enseña la demo

### El cliente (portal privado)

- **Catálogo** con buscador en la barra superior, favoritos y comparador de productos.
- **Ficha de producto** con variantes de talla y color, fotos y **reseñas** de otros clientes.
- **Precios por tarifa**: cada cliente ve el precio de su tarifa (por ejemplo, la tarifa VIP).
- **Carrito** con contador en la barra superior y confirmación que genera un pedido real.
- **Mis pedidos** con seguimiento del estado y del envío.
- **Mis documentos**: lo que la gestión documental tiene asociado al cliente.
- **Devoluciones e incidencias**: el cliente las *solicita* con un proceso controlado (no puede
  devolver más unidades de las que compró) y solo puede cancelar las que siguen solicitadas.
- **Mi ficha**, con la dirección validada contra Google Places.
- **Notificaciones** cuando su pedido, devolución o incidencia cambia de estado.

### El administrador (backoffice)

- **Mesa de trabajo**: tres tableros kanban, de pedidos, devoluciones e incidencias, para
  moverlos de estado arrastrando.
- **Dashboard**: ventas del año y del mes, ventas por familia, artículos más vendidos y más
  devueltos, clientes que más compran y clientes con más incidencias.
- **Mantenimiento** de productos, familias, marcas, tallas, colores, tarifas y clientes, con
  accesos directos en el menú lateral.
- **Comentarios internos** entre el equipo.

### La plataforma por debajo

- **Seguridad por rol**: el rol Cliente solo ve sus propios datos, en pantalla y por la API.
- **Ayuda integrada**: tour de bienvenida por rol, tour por pantalla y una guía de cada flujo de
  trabajo con capturas.
- **WebAPI y asistente de IA (MCP)**: lo que se expone y para quién está en [API.md](API.md).
- **Tests**: unitarios de los procesos y recorridos de interfaz con Playwright que comparan cada
  pantalla con una captura de referencia.
- **Docker y CI**: imágenes de frontend, backend y base de datos, y pipeline para GitHub Actions
  y GitLab CI.

## Datos de demostración

Todos los datos son inventados: unos 140 productos con sus variantes, 110 clientes y unos 150
pedidos con devoluciones, incidencias, reseñas y favoritos. Las fotos de producto vienen de
Pexels.

El procedimiento `dbo.pSeed_ResetDemoData` borra y vuelve a generar los datos con fechas
relativas a hoy, así que la demo siempre parece reciente. Úsalo cada vez que quieras dejarla
como nueva.

## Estructura del repositorio

| Carpeta | Qué contiene |
|---|---|
| `flxCatalog.Frontend` | La aplicación web (Flexygo Frontend), con los estilos y scripts propios en `wwwroot/flxCatalog/`. |
| `flxCatalog.Backend` | El servidor (Flexygo Backend). |
| `flxCatalog.Processes` | Los procesos en C#: solicitar devoluciones e incidencias, carrito, etc. |
| `flxCatalog.Conf.Database` | La configuración de Flexygo: objetos, pantallas, módulos, menús, seguridad… |
| `flxCatalog.Data.Database` | Las tablas, vistas y procedimientos del negocio, incluido el seed de demo. |
| `flxCatalog.UnitTest` | Tests unitarios de los procesos. |
| `flxCatalog.InterfaceTest` | Tests de interfaz con Playwright y los recorridos de pantallas (`walks/`). |
| `flxCatalog.Help` | La documentación de usuario (MkDocs). |
| `flxCatalog.Marketing` | Vídeos promocionales del producto. |
| `docs/` | La especificación funcional de la demo. |
| `.flexygo/` | Plan, decisiones, verificaciones y calidad de cada desarrollo, escritos por las herramientas de Flexygo. |

## Ponerla en marcha en local

Necesitas .NET 9, SQL Server y acceso a los feeds NuGet de Flexygo (ver `nuget.config`).

1. **Bases de datos.** Publica `flxCatalog.Conf.Database` y `flxCatalog.Data.Database` en tu
   SQL Server, y luego ejecuta `dbo.pSeed_ResetDemoData` en la base de datos de datos para cargar la demo.
2. **Conexiones.** Crea `flxCatalog.Backend/conf/appsettings.Development.json` con
   `ConfConnectionString` (configuración) y `DataConnectionString` (datos). Este fichero no se
   versiona.
3. **Arrancar.** Desde Visual Studio, o con:
   ```powershell
   pwsh tools/app.ps1 start
   ```
   El Backend queda en `http://localhost:7110` y el Frontend en `http://localhost:7111`.
4. **Usuarios.** Los usuarios no viajan en los scripts. Crea el usuario `admin` y un usuario con
   rol *Cliente* enlazado a una ficha de cliente para ver el portal privado.

Para levantarla con contenedores, mira [DOCKER.md](DOCKER.md). Para el pipeline, mira [CI.md](CI.md).

## Tests

```powershell
dotnet test flxCatalog.UnitTest
dotnet test flxCatalog.InterfaceTest   # con la aplicación arrancada
```

Los tests de interfaz leen las credenciales de `flxCatalog.InterfaceTest/appsettings.local.json`,
que tampoco se versiona.

## Más documentación

- [ONBOARDING.md](ONBOARDING.md) — por dónde empezar y en qué estado está cada desarrollo.
- [API.md](API.md) — acceso por WebAPI y conexión de asistentes de IA.
- [DESIGN.md](DESIGN.md) — la guía visual del producto.
- [DOCKER.md](DOCKER.md) y [CI.md](CI.md) — despliegue e integración continua.
- [docs/Catálogo Demo Flexygo - Funcionalidades.md](docs/Catálogo%20Demo%20Flexygo%20-%20Funcionalidades.md)
  — la especificación funcional completa de la demo. No todo lo que describe está construido.

---

**Producto de demostración.** flxCatalog existe para enseñar Flexygo. Ni sus datos, ni sus precios,
ni sus clientes son reales, y no debe usarse como base de una instalación productiva sin revisarlo.
