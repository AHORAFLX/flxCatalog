# Origen de las fotos de producto (demo)

Todas descargadas de la API de Pexels (https://www.pexels.com/api/), uso libre para catálogos de
demostración. Una foto por familia de producto, hasta 6 variantes por familia, cicladas entre los
productos de esa familia. Se asignan tanto en los datos ya cargados (`Productos.ImagenPrincipal`)
como en la carga de datos de demostración (`dbo.pSeed_ResetDemoData`), para que un reset del catálogo
no las pierda.

Archivos: `{familia-slug}-1.jpg` .. `{familia-slug}-6.jpg` (5 en `camisetas-tecnicas` y
`mallas-deportivas`, por disponibilidad de resultados en Pexels).
