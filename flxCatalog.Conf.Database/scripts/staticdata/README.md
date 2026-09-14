# Carpeta StaticData

Esta carpeta se utiliza para guardar **scripts SQL de datos estáticos** del proyecto de base de datos.

Por “datos estáticos” entendemos, por ejemplo:

- Tablas de configuración o listas de valores (estados, tipos, categorías, etc.).
- Parámetros iniciales de la aplicación.
- Datos que deben existir después de una instalación o actualización.

Cada cambio de estos datos (INSERT/UPDATE/DELETE) se guarda como un archivo `.sql` dentro de esta carpeta, para que el proceso de despliegue/actualización pueda ejecutarlos de forma controlada.

> Nota: cambios de **estructura** de la base de datos (tablas, columnas, índices, etc.) **no** van aquí, sino en los scripts de esquema.
