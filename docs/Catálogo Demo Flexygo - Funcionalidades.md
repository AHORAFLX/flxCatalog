# Catálogo Demo Flexygo

## 1. Objetivo

Crear una aplicación pública de demostración construida íntegramente con **Flexygo**, que funcione como un catálogo B2B/B2C y permita mostrar de forma práctica las principales capacidades de la plataforma.

La aplicación debe poder utilizarse en demostraciones comerciales, formaciones, eventos y pruebas por parte de clientes potenciales.

El objetivo no es únicamente enseñar un catálogo de productos, sino mostrar una aplicación empresarial completa:

- Gestión de usuarios y permisos.
- Portal público.
- Portal privado de clientes.
- Backoffice administrativo.
- Catálogo de productos.
- Variantes de producto.
- Tarifas y precios personalizados.
- Pedidos.
- Estados y workflows.
- Documentos.
- Notificaciones.
- Dashboards.
- Informes.
- Automatizaciones.
- Integraciones.
- Gestión multimedia.
- Responsive.
- Auditoría.
- APIs.
- Ejemplos de personalización visual.

---

# 2. Tipos de usuario

La aplicación tendrá inicialmente tres tipos de acceso.

## 2.1 Usuario público

Usuario no autenticado.

Podrá:

- Acceder al catálogo.
- Consultar familias y categorías.
- Buscar productos.
- Consultar fichas de producto.
- Ver imágenes.
- Consultar características.
- Consultar variantes disponibles.
- Ver productos relacionados.
- Ver novedades.
- Ver productos destacados.
- Consultar promociones públicas.
- Añadir productos a una lista temporal.
- Crear una solicitud de información.
- Solicitar alta como cliente.
- Acceder al formulario de contacto.
- Iniciar sesión.

El precio mostrado podrá configurarse:

- Mostrar precio público.
- Mostrar únicamente "Consultar precio".
- Mostrar precio únicamente después de iniciar sesión.

---

# 3. Portal del cliente

Una vez identificado, el cliente dispondrá de un área privada.

## 3.1 Dashboard del cliente

La página principal debería mostrar información resumida.

Por ejemplo:

- Pedidos pendientes.
- Pedidos enviados.
- Pedidos entregados.
- Último pedido.
- Importe comprado este mes.
- Importe comprado este año.
- Productos comprados recientemente.
- Productos más comprados.
- Productos favoritos.
- Pedidos pendientes de pago.
- Ofertas pendientes.
- Notificaciones.
- Promociones disponibles.
- Documentos recientes.

También se pueden mostrar gráficos:

- Compras por mes.
- Compras por familia.
- Evolución del gasto.
- Productos más comprados.
- Estado de pedidos.

Esto permite mostrar las capacidades de **dashboards y gráficos de Flexygo**.

---

# 4. Catálogo de productos

## 4.1 Familias de productos

Los productos estarán organizados jerárquicamente.

Ejemplo:

```text
Ropa
 ├── Camisetas
 ├── Sudaderas
 ├── Pantalones
 └── Chaquetas

Calzado
 ├── Deportivo
 ├── Casual
 └── Seguridad

Accesorios
 ├── Mochilas
 ├── Gorras
 └── Complementos
```

Cada familia podrá tener:

- Código.
- Nombre.
- Descripción.
- Imagen.
- Icono.
- Familia padre.
- Orden.
- Visible.
- Destacada.
- Imagen de cabecera.
- Texto comercial.
- SEO URL.
- Fecha de publicación.

---

# 5. Productos

Cada producto podrá tener:

- Código.
- Referencia.
- Código de barras.
- Nombre.
- Nombre comercial.
- Descripción corta.
- Descripción larga.
- Familia.
- Subfamilia.
- Marca.
- Fabricante.
- Modelo.
- Precio base.
- IVA.
- Unidad de venta.
- Unidad mínima.
- Stock.
- Stock disponible.
- Peso.
- Alto.
- Ancho.
- Largo.
- Volumen.
- Estado.
- Fecha de alta.
- Fecha de publicación.
- Producto destacado.
- Novedad.
- Oferta.
- Producto descatalogado.
- Venta permitida.
- Visible en catálogo.
- Plazo estimado de entrega.
- Documentación asociada.

---

# 6. Imágenes y multimedia

Cada artículo debe permitir múltiples imágenes.

Por ejemplo:

- Imagen principal.
- Vista frontal.
- Vista trasera.
- Vista lateral.
- Detalles.
- Producto en uso.
- Imagen de variante.

Características:

- Galería de imágenes.
- Zoom.
- Carrusel.
- Imagen destacada.
- Orden de imágenes.
- Vídeos.
- Enlaces externos.
- Manuales PDF.
- Fichas técnicas.
- Certificados.
- Documentación comercial.

Esto permite demostrar la **gestión documental y multimedia de Flexygo**.

---

# 7. Variantes de producto

Los artículos podrán tener variantes.

## 7.1 Tallas

Ejemplo:

- XS
- S
- M
- L
- XL
- XXL

O:

- 38
- 39
- 40
- 41
- 42
- 43

## 7.2 Colores

Cada color podrá tener:

- Código.
- Nombre.
- Código hexadecimal.
- Imagen.
- Orden.

Ejemplo:

```text
Negro     #000000
Blanco    #FFFFFF
Rojo      #D32F2F
Azul      #1976D2
Verde     #388E3C
```

## 7.3 Variantes

Cada combinación podrá ser una referencia diferente.

| Producto | Talla | Color | Referencia |
|---|---|---|---|
| Camiseta Urban | S | Negro | CAM-URB-S-NEG |
| Camiseta Urban | M | Negro | CAM-URB-M-NEG |
| Camiseta Urban | L | Negro | CAM-URB-L-NEG |
| Camiseta Urban | M | Blanco | CAM-URB-M-BLA |

Cada variante podrá disponer de:

- Referencia.
- Código de barras.
- Stock.
- Imagen.
- Precio adicional.
- Peso.
- Estado.
- Disponible/no disponible.

---

# 8. Otros atributos

Para mostrar un sistema de producto flexible deberían existir atributos dinámicos.

Por ejemplo:

- Material.
- Composición.
- Acabado.
- Potencia.
- Capacidad.
- Longitud.
- Diámetro.
- Certificación.
- País de fabricación.
- Temporada.
- Colección.

Esto permitiría demostrar productos de sectores diferentes sin modificar el modelo principal.

---

# 9. Etiquetas

Los productos podrán tener etiquetas.

Ejemplos:

- Nuevo.
- Oferta.
- Bestseller.
- Eco.
- Reciclado.
- Profesional.
- Premium.
- Outlet.
- Últimas unidades.

Las etiquetas podrán utilizarse para filtros y promociones.

---

# 10. Buscador

El catálogo debería disponer de un buscador potente.

Buscar por:

- Nombre.
- Referencia.
- Código de barras.
- Descripción.
- Marca.
- Familia.
- Etiquetas.

El buscador debería disponer de sugerencias mientras se escribe.

---

# 11. Filtros

El usuario podrá filtrar por:

- Familia.
- Subfamilia.
- Marca.
- Precio.
- Talla.
- Color.
- Disponibilidad.
- Novedad.
- Oferta.
- Características.
- Etiquetas.

Los filtros deben cambiar dinámicamente dependiendo de los productos mostrados.

---

# 12. Ordenación del catálogo

Permitir ordenar por:

- Relevancia.
- Precio ascendente.
- Precio descendente.
- Nombre.
- Más vendidos.
- Más recientes.
- Promociones.
- Disponibilidad.

---

# 13. Productos relacionados

Cada artículo podrá mostrar:

- Productos relacionados.
- Productos alternativos.
- Productos equivalentes.
- Productos complementarios.
- Accesorios.
- Productos de la misma colección.

Ejemplo:

> Los clientes que compraron este producto también compraron...

---

# 14. Favoritos

El cliente podrá marcar productos como favoritos.

Tendrá una sección:

**Mis favoritos**

Desde ella podrá:

- Añadir al carrito.
- Eliminar.
- Comparar.
- Compartir.
- Consultar disponibilidad.

---

# 15. Listas de compra

Además de favoritos, el cliente podrá crear listas.

Ejemplos:

- Compra mensual.
- Material oficina.
- Uniformes verano.
- Productos habituales.

Esto es especialmente interesante para clientes B2B.

---

# 16. Comparador de productos

El usuario podrá seleccionar varios artículos y compararlos.

| Característica | Producto A | Producto B | Producto C |
|---|---|---|---|
| Precio | | | |
| Material | | | |
| Peso | | | |
| Stock | | | |
| Marca | | | |

---

# 17. Clientes

El administrador podrá gestionar clientes.

Información:

- Código cliente.
- Razón social.
- Nombre comercial.
- CIF/NIF.
- Dirección fiscal.
- Direcciones de envío.
- País.
- Provincia.
- Población.
- Código postal.
- Teléfono.
- Email.
- Web.
- Persona de contacto.
- Comercial.
- Tarifa.
- Descuento.
- Forma de pago.
- Riesgo.
- Límite de crédito.
- Estado.
- Fecha de alta.
- Notas.
- Documentos.

---

# 18. Contactos del cliente

Un cliente podrá tener diferentes personas de contacto.

Por ejemplo:

- Compras.
- Administración.
- Dirección.

Cada contacto podrá disponer de acceso independiente al portal.

---

# 19. Direcciones de envío

Un cliente podrá tener múltiples direcciones.

Ejemplo:

```text
Oficina central
Delegación Valencia
Delegación Madrid
Tienda Barcelona
```

Al realizar el pedido podrá seleccionar dónde debe enviarse.

---

# 20. Tarifas

Cada artículo tendrá un precio base.

Sobre este precio podrán existir diferentes tarifas.

Ejemplo:

- Precio público.
- Tarifa distribuidor.
- Tarifa profesional.
- Tarifa mayorista.
- Tarifa VIP.

---

# 21. Tarifas específicas por cliente

Un cliente podrá disponer de una tarifa particular.

Prioridad propuesta:

```text
Precio específico cliente/artículo
        ↓
Precio tarifa cliente
        ↓
Precio promocional
        ↓
Precio base artículo
```

Esto permite mostrar lógica empresarial compleja dentro de Flexygo.

---

# 22. Descuentos

Los descuentos podrán configurarse por:

- Cliente.
- Familia.
- Producto.
- Marca.
- Cantidad.
- Promoción.
- Campaña.

Ejemplo:

```text
Cliente A
10 % en ropa
15 % en calzado
20 % en Producto X
```

---

# 23. Descuentos por volumen

| Cantidad | Descuento |
|---|---:|
| 1-9 | 0 % |
| 10-24 | 5 % |
| 25-49 | 10 % |
| 50+ | 15 % |

---

# 24. Promociones

El administrador podrá crear promociones.

Ejemplos:

- 10 % de descuento.
- 2x1.
- 3x2.
- Segunda unidad al 50 %.
- Envío gratuito.
- Descuento por importe.
- Descuento por familia.
- Descuento por marca.
- Descuento por código promocional.

Cada promoción tendrá:

- Fecha inicio.
- Fecha fin.
- Clientes aplicables.
- Productos.
- Familias.
- Condiciones.
- Prioridad.
- Acumulable.
- Estado.

---

# 25. Códigos promocionales

Ejemplo:

```text
FLEXYGO10
WELCOME
VERANO26
DEMO20
```

Podrán tener:

- Porcentaje.
- Importe.
- Uso máximo.
- Fecha de caducidad.
- Clientes válidos.

---

# 26. Carrito

El carrito permitirá:

- Añadir productos.
- Cambiar cantidades.
- Seleccionar variantes.
- Eliminar productos.
- Guardar carrito.
- Aplicar promociones.
- Aplicar descuentos.
- Introducir código promocional.
- Añadir observaciones.
- Seleccionar dirección.
- Consultar impuestos.
- Consultar total.

---

# 27. Carrito persistente

Si el cliente abandona la aplicación, el carrito podrá permanecer guardado.

Cuando vuelva:

> Tienes un carrito pendiente con 6 productos.

---

# 28. Pedido rápido

Especialmente útil en B2B.

Una tabla permitirá introducir directamente:

```text
Referencia     Cantidad
CAM001         10
PAN023         5
ZAP004         20
```

También se podría permitir pegar datos desde Excel.

---

# 29. Importar pedido

Permitir importar pedidos desde:

- Excel.
- CSV.

Esto sería una funcionalidad interesante para enseñar importaciones mediante Flexygo.

---

# 30. Pedidos

El cliente podrá crear pedidos.

Estados posibles:

```text
Borrador
Pendiente de confirmación
Confirmado
En proceso
Enviado
Entregado
Cancelado
```

Visualmente se podría mostrar un timeline.

```text
Pedido realizado
      ●
      │
Pedido confirmado
      ●
      │
En proceso
      ●
      │
Enviado
      ○
      │
Entregado
      ○
```

---

# 31. Detalle del pedido

Mostrar:

- Número.
- Fecha.
- Estado.
- Cliente.
- Dirección entrega.
- Forma de pago.
- Productos.
- Cantidades.
- Precio.
- Descuentos.
- IVA.
- Total.
- Observaciones.
- Documentos.
- Tracking.

---

# 32. Repetir pedido

Desde cualquier pedido anterior:

**Repetir pedido**

La aplicación generará un nuevo carrito con las líneas originales.

Antes de añadirlas deberá comprobar:

- Precio actual.
- Stock actual.
- Producto descatalogado.
- Variante disponible.

---

# 33. Pedido habitual

El cliente podrá convertir un pedido en:

**Pedido habitual**

Para repetirlo con facilidad posteriormente.

---

# 34. Presupuestos

El cliente podrá solicitar presupuesto.

Estados:

```text
Solicitado
En estudio
Enviado
Aceptado
Rechazado
Caducado
```

Desde un presupuesto aceptado se podrá generar un pedido.

---

# 35. Solicitar precio

Un producto podría permitir:

**Solicitar precio**

Especialmente para productos personalizados o proyectos.

---

# 36. Productos personalizados

Para enseñar configuraciones complejas podría existir algún producto configurable.

Ejemplo:

### Camiseta personalizada

Opciones:

- Modelo.
- Color.
- Talla.
- Texto.
- Logotipo.
- Tipo de impresión.
- Cantidad.

La configuración modificaría dinámicamente el precio.

---

# 37. Pedidos recurrentes

El cliente podrá configurar:

```text
Repetir pedido cada:
○ Semana
○ 15 días
○ Mes
○ Trimestre
```

Esto permitiría demostrar tareas programadas.

---

# 38. Stock

Gestionar únicamente la parte de disponibilidad necesaria para el catálogo:

- Stock actual.
- Disponible/no disponible.
- Stock mínimo.
- Fecha estimada de reposición.

No se incluirán procesos de almacén, picking ni preparación física de pedidos.

---

# 39. Aviso de reposición

Si un artículo no tiene stock:

**Avísame cuando esté disponible**

Cuando se reponga se genera una notificación.

Esto permite demostrar automatizaciones y eventos.

---

# 40. Seguimiento del pedido

El cliente podrá consultar el progreso comercial del pedido.

Por ejemplo:

- Confirmado.
- En proceso.
- Enviado.
- Entregado.

Podrá mostrarse:

- Transportista.
- Número de seguimiento.
- URL de seguimiento.
- Fecha estimada de entrega.

---

# 41. Facturas

El cliente podrá consultar:

- Facturas.
- Abonos.
- Pedidos.
- Albaranes.

Y descargarlos en PDF.

---

# 42. Documentos

Sección:

**Mis documentos**

Tipos:

- Facturas.
- Albaranes.
- Presupuestos.
- Tarifas.
- Certificados.
- Contratos.
- Fichas técnicas.

Permite mostrar el gestor documental de Flexygo.

---

# 43. Devoluciones

El cliente podrá solicitar una devolución.

Seleccionará:

- Pedido.
- Línea.
- Cantidad.
- Motivo.
- Fotografías.
- Comentario.

Estados:

```text
Solicitada
En revisión
Aceptada
Rechazada
Abonada
```

---

# 44. Incidencias

Desde un pedido se podrá crear una incidencia.

Por ejemplo:

- Producto incorrecto.
- Producto defectuoso.
- Falta material.
- Problema de entrega.
- Facturación.
- Consulta general.

El cliente podrá adjuntar imágenes.

---

# 45. Notificaciones

Centro de notificaciones.

Ejemplos:

- Pedido confirmado.
- Pedido enviado.
- Presupuesto disponible.
- Factura disponible.
- Producto repuesto.
- Nueva promoción.
- Incidencia actualizada.

---

# 46. Email

La aplicación podría generar emails automáticos cuando:

- Se registre un cliente.
- Se genere un pedido.
- Cambie el estado de un pedido.
- Se genere una factura.
- Se produzca un envío.
- Se resuelva una incidencia.

---

# 47. Perfil del cliente

El usuario podrá modificar:

- Nombre.
- Email.
- Teléfono.
- Contraseña.
- Idioma.
- Dirección.
- Preferencias.
- Notificaciones.

---

# 48. Administración

El administrador tendrá acceso al backoffice completo.

---

# 49. Dashboard administrador

Mostrar indicadores como:

- Ventas hoy.
- Ventas mes.
- Pedidos hoy.
- Pedidos pendientes.
- Pedidos confirmados.
- Pedidos enviados.
- Clientes activos.
- Clientes nuevos.
- Ticket medio.
- Productos sin stock.
- Productos con stock bajo.
- Presupuestos pendientes.
- Incidencias abiertas.

---

# 50. Gráficos administrador

Ejemplos:

### Ventas por mes

Gráfico de barras.

### Ventas por familia

Gráfico circular.

### Top productos

Ranking.

### Top clientes

Ranking.

### Evolución pedidos

Gráfico temporal.

### Estados de pedido

Distribución.

---

# 51. Gestión de clientes

El administrador podrá:

- Crear clientes.
- Modificar clientes.
- Bloquear clientes.
- Asignar tarifas.
- Asignar descuentos.
- Gestionar contactos.
- Gestionar direcciones.
- Consultar pedidos.
- Consultar facturas.
- Consultar incidencias.
- Consultar documentos.
- Consultar actividad.

---

# 52. Gestión de productos

El administrador podrá:

- Crear productos.
- Duplicar productos.
- Editar productos.
- Archivar productos.
- Gestionar imágenes.
- Gestionar variantes.
- Gestionar atributos.
- Gestionar precios.
- Gestionar stock.
- Gestionar documentación.
- Gestionar productos relacionados.

---

# 53. Edición masiva

Permitir acciones como:

```text
Seleccionar 20 productos
→ Cambiar familia
→ Cambiar precio
→ Aplicar descuento
→ Activar
→ Desactivar
```

Ideal para demostrar acciones múltiples de Flexygo.

---

# 54. Importación masiva

Permitir importar:

- Productos.
- Clientes.
- Tarifas.
- Precios.
- Stock.

Desde Excel o CSV.

---

# 55. Exportación

Permitir exportar listados a:

- Excel.
- CSV.
- PDF.

---

# 56. Gestión de pedidos

El administrador podrá:

- Crear pedidos.
- Modificar pedidos.
- Confirmarlos.
- Cambiar estado.
- Marcarlos como enviados.
- Cancelarlos.
- Duplicarlos.
- Crear documentos.
- Consultar historial.

---

# 57. Workflow de pedidos

Los cambios de estado deben estar controlados.

Ejemplo:

```text
BORRADOR
   ↓
CONFIRMADO
   ↓
EN PROCESO
   ↓
ENVIADO
   ↓
ENTREGADO
```

No debería permitirse pasar arbitrariamente entre estados.

Esto puede utilizar el sistema de procesos y acciones de Flexygo.

---

# 58. Histórico

Registrar modificaciones importantes.

Ejemplo:

```text
14/09/2026 10:25
Pedido creado por Cliente Demo

14/09/2026 10:27
Pedido confirmado

14/09/2026 12:15
Estado cambiado a En proceso por Admin

14/09/2026 16:20
Pedido enviado
```

---

# 59. Auditoría

Registrar:

- Usuario.
- Fecha.
- Operación.
- Registro.
- Valor anterior.
- Valor nuevo.

Especialmente en:

- Precios.
- Pedidos.
- Clientes.
- Tarifas.
- Descuentos.

---

# 60. Usuarios y roles

Roles propuestos:

```text
Administrador
Comercial
Administración
Cliente
Cliente consulta
Usuario público
```

Cada rol tendrá permisos diferentes.

---

# 61. Comercial

El comercial podrá:

- Consultar sus clientes.
- Crear pedidos.
- Crear presupuestos.
- Consultar ventas.
- Consultar actividad.
- Aplicar descuentos hasta determinado límite.

---

# 62. Multiidioma

La aplicación debería permitir al menos:

- Español.
- Inglés.

Opcionalmente:

- Francés.
- Portugués.

---

# 63. Responsive

Debe funcionar correctamente en:

- Ordenador.
- Tablet.
- Smartphone.

---

# 64. Tema claro y oscuro

Podría incluir:

```text
☀ Tema claro
🌙 Tema oscuro
```

---

# 65. Personalización por cliente

Algunos clientes podrían disponer de:

- Logo personalizado.
- Color corporativo.
- Productos destacados.
- Catálogo específico.

Permitirá enseñar capacidades de personalización.

---

# 66. Configuración del catálogo

Desde administración se podrán configurar:

- Logo.
- Nombre.
- Colores.
- Banner.
- Imagen principal.
- Productos destacados.
- Promociones.
- Textos.
- Redes sociales.
- Datos de contacto.

---

# 67. Banners

El administrador podrá crear banners.

Ejemplo:

```text
Nueva colección 2027
Hasta -20 %
Ver colección
```

Configurables por:

- Fecha.
- Imagen.
- Texto.
- Enlace.
- Orden.
- Audiencia.

---

# 68. Novedades

Página específica con productos recientemente publicados.

---

# 69. Más vendidos

Página dinámica calculada a partir de pedidos.

---

# 70. Recomendaciones

En función de compras anteriores:

> Quizá también te interese...

Incluso se podría incorporar posteriormente IA para generar recomendaciones.

---

# 71. Historial de navegación

Para usuarios identificados:

**Vistos recientemente**

---

# 72. Landing pública

Página de inicio muy visual.

Secciones:

```text
Banner principal

Categorías destacadas

Productos destacados

Novedades

Ofertas

Más vendidos

Marcas

Ventajas de comprar

Noticias

Contacto
```

---

# 73. Noticias

Pequeño CMS para crear noticias.

Campos:

- Título.
- Imagen.
- Resumen.
- Contenido.
- Autor.
- Fecha.
- Etiquetas.

---

# 74. Página de contacto

Formulario:

- Nombre.
- Empresa.
- Email.
- Teléfono.
- Motivo.
- Mensaje.

Generará automáticamente una solicitud en administración.

---

# 75. Formularios dinámicos

Podría existir una sección pública:

**Solicita una demostración**

Con campos configurables desde administración.

---

# 76. Centro de ayuda

Sección con:

- Preguntas frecuentes.
- Manuales.
- Vídeos.
- Documentos.
- Contacto.

---

# 77. Tareas administrativas

Ejemplos:

- Revisar nuevos clientes.
- Revisar pedidos.
- Aprobar descuentos.
- Gestionar incidencias.
- Revisar devoluciones.

Las tareas aparecerán en el dashboard.

---

# 78. Aprobaciones

Algunas operaciones podrían necesitar aprobación.

Ejemplo:

```text
Descuento > 20 %
        ↓
Solicitar aprobación
        ↓
Responsable comercial
        ↓
Aprobado / Rechazado
```

---

# 79. Timeline

Los objetos principales deberían disponer de timeline.

Por ejemplo:

### Cliente

```text
Cliente creado
Pedido realizado
Presupuesto enviado
Pedido enviado
Factura generada
Incidencia creada
```

---

# 80. Comentarios

Permitir comentarios internos asociados a:

- Cliente.
- Pedido.
- Producto.
- Incidencia.

Ejemplo:

```text
@Marta revisar condiciones comerciales.
```

---

# 81. Adjuntos

Permitir drag & drop.

Adjuntos en:

- Clientes.
- Productos.
- Pedidos.
- Incidencias.
- Devoluciones.

---

# 82. Calendario

Incluir una vista calendario para:

- Promociones.
- Pedidos previstos.
- Campañas.
- Tareas.

---

# 83. Mapa

Mostrar clientes o direcciones en un mapa.

Puede servir para demostrar componentes geográficos sin convertir la aplicación en una solución logística.

---

# 84. APIs

La aplicación debería disponer de ejemplos de API.

Por ejemplo:

```text
GET /api/products
GET /api/products/{id}
GET /api/orders
POST /api/orders
GET /api/customers
```

---

# 85. Webhooks

Ejemplo:

Al cambiar un pedido a enviado:

```text
POST https://example.com/webhook/order-shipped
```

---

# 86. Integraciones externas

Crear alguna integración demostrativa.

Ejemplos:

- ERP.
- CRM.
- Plataforma de pago.
- Power BI.
- Teams.
- Email.

---

# 87. Automatizaciones

Ejemplos interesantes:

### Carrito abandonado

Si un carrito permanece 24 horas:

> Tienes productos pendientes en tu carrito.

### Producto sin stock

Avisar al administrador.

### Reposición

Avisar automáticamente a clientes interesados.

### Pedido grande

Si supera determinado importe:

> Solicitar aprobación comercial.

### Cliente inactivo

Si no compra en 6 meses:

> Crear tarea para comercial.

---

# 88. Informes

Incluir algunos informes demostrativos.

### Informe de pedido

PDF.

### Catálogo de productos

PDF.

### Tarifa cliente

PDF.

### Ventas por cliente

PDF / Excel.

### Ventas por producto

PDF / Excel.

---

# 89. Generación de documentos

Permitir generar:

```text
Pedido.pdf
Presupuesto.pdf
TarifaCliente.pdf
CatalogoProductos.pdf
```

---

# 90. Firma

Opcionalmente algún documento podría permitir firma.

Por ejemplo:

**Aceptación de presupuesto**

---

# 91. IA

Para mostrar capacidades modernas se podría incorporar IA en algunos puntos.

Ejemplos:

### Generar descripción de producto

A partir de:

- Nombre.
- Características.
- Categoría.

### Resumir actividad cliente

> Este cliente ha realizado 14 pedidos durante el último año...

### Buscador natural

```text
Muéstrame camisetas negras talla L por menos de 30 €
```

### Asistente de catálogo

```text
Necesito ropa de trabajo para 15 empleados.
```

---

# 92. Datos demo

La aplicación debería venir preparada con información atractiva.

Por ejemplo:

- 100 productos.
- 10 familias.
- 6 marcas.
- 20 clientes.
- 200 pedidos.
- 500 líneas de pedido.
- 5 comerciales.
- Varias tarifas.
- Varias promociones.

Los datos deben ser suficientemente ricos para que dashboards y estadísticas tengan sentido.

---

# 93. Cliente demo

Crear clientes preconfigurados.

Por ejemplo:

```text
Cliente Demo Básico
Cliente Demo Distribuidor
Cliente Demo Premium
Cliente Demo Internacional
```

Cada uno podría mostrar comportamientos distintos de precios y descuentos.

---

# 94. Reset de la demo

Como la aplicación estará abierta al público sería especialmente interesante disponer de mecanismos para mantenerla limpia.

Por ejemplo:

- Datos base protegidos.
- Pedidos demo eliminados periódicamente.
- Clientes demo temporales.
- Reset nocturno.
- Regeneración automática de datos.
- Límites de registros creados.

---

# 95. Seguridad de una demo pública

Al estar expuesta a Internet debe limitarse especialmente:

- Acciones administrativas.
- Subida de archivos.
- Tamaño de archivos.
- Extensiones permitidas.
- Número de operaciones.
- APIs.
- Envíos de emails.
- Formularios públicos.
- Rate limiting.
- CAPTCHA cuando sea necesario.
- Protección frente a automatismos.
- Sanitización de contenidos.

---

# 96. Elementos de Flexygo que debería enseñar expresamente

## Objetos

- Clientes.
- Productos.
- Pedidos.
- Líneas.
- Tarifas.
- Promociones.
- Incidencias.

## Listados

- Cards.
- Grid.
- Listados agrupados.
- Listados editables.
- Kanban.
- Calendario.
- Timeline.

## Formularios

- Formularios simples.
- Formularios complejos.
- Dependencias entre campos.
- Campos dinámicos.
- Validaciones.
- Combos dependientes.
- Edición inline.

## Acciones

- Crear.
- Modificar.
- Eliminar.
- Duplicar.
- Aprobar.
- Rechazar.
- Cambiar estado.
- Generar PDF.
- Enviar email.

## Seguridad

- Roles.
- Usuarios.
- Permisos por objeto.
- Permisos por acción.
- Permisos por registro.

## Procesos

- Workflows.
- Aprobaciones.
- Automatizaciones.
- Tareas programadas.

## Documentos

- Adjuntos.
- Imágenes.
- PDFs.
- Informes.

## Integración

- API REST.
- Webhooks.
- Servicios externos.

## Visualización

- Dashboards.
- KPIs.
- Gráficos.
- Mapas.
- Calendarios.
- Kanban.

---

# 97. Posible menú público

```text
Inicio
Catálogo
 ├── Productos
 ├── Categorías
 ├── Novedades
 ├── Ofertas
 └── Más vendidos

Marcas
Noticias
Ayuda
Contacto
Iniciar sesión
```

---

# 98. Posible menú del cliente

```text
Inicio

Catálogo
 ├── Productos
 ├── Favoritos
 └── Listas de compra

Compras
 ├── Carrito
 ├── Mis pedidos
 ├── Presupuestos
 ├── Facturas
 └── Devoluciones

Mi cuenta
 ├── Perfil
 ├── Direcciones
 ├── Usuarios
 ├── Documentos
 └── Notificaciones

Ayuda
```

---

# 99. Posible menú de administración

```text
Dashboard

Ventas
 ├── Pedidos
 ├── Presupuestos
 ├── Carritos
 ├── Devoluciones
 └── Incidencias

Catálogo
 ├── Productos
 ├── Familias
 ├── Marcas
 ├── Variantes
 ├── Tallas
 ├── Colores
 ├── Atributos
 └── Multimedia

Comercial
 ├── Clientes
 ├── Contactos
 ├── Comerciales
 └── Actividad

Precios
 ├── Tarifas
 ├── Precios especiales
 ├── Descuentos
 ├── Promociones
 └── Cupones

Contenido
 ├── Banners
 ├── Noticias
 ├── FAQ
 └── Páginas

Sistema
 ├── Usuarios
 ├── Roles
 ├── Configuración
 ├── Automatizaciones
 ├── Integraciones
 └── Auditoría
```

---

# 100. Modelo funcional principal

Las entidades principales podrían ser:

```text
Cliente
 ├── Contactos
 ├── Direcciones
 ├── Usuarios
 ├── Tarifas
 ├── Descuentos
 └── Pedidos

Producto
 ├── Familia
 ├── Marca
 ├── Imágenes
 ├── Variantes
 │    ├── Talla
 │    └── Color
 ├── Atributos
 ├── Tarifas
 ├── Stock
 ├── Documentos
 └── Productos relacionados

Pedido
 ├── Cliente
 ├── Dirección
 ├── Líneas
 ├── Estados
 ├── Documentos
 ├── Seguimiento
 └── Incidencias
```

---

# 101. Filosofía de la aplicación

El principal criterio de diseño debería ser que **cada pantalla enseñe algo de Flexygo**.

No hacer simplemente:

> Un catálogo hecho con Flexygo.

Sino:

> Una aplicación empresarial de referencia construida con Flexygo.

Un visitante debería poder navegar durante varios minutos y descubrir constantemente funcionalidades diferentes.

Por ejemplo:

```text
Catálogo
→ cards y filtros

Ficha producto
→ multimedia, relaciones y acciones

Carrito
→ edición inline y cálculos

Pedido
→ workflow y timeline

Dashboard
→ KPIs y gráficos

Incidencia
→ formularios, fotografías y estados

Administración
→ CRUD y permisos

Informes
→ PDF / Excel

Integraciones
→ APIs y webhooks
```

De esta forma la aplicación puede convertirse en una **showcase permanente de Flexygo**, además de servir como proyecto de referencia para clientes, partners y desarrolladores.