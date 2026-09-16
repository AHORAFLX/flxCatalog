# 06. Presupuestos y postventa

> Parte de `docs/Catálogo Demo Flexygo - Funcionalidades.md` (secciones 34, 35, 36, 40-44).

## 34. Presupuestos

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

## 35. Solicitar precio

Un producto podría permitir:

**Solicitar precio**

Especialmente para productos personalizados o proyectos.

---

## 36. Productos personalizados

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

## 40. Seguimiento del pedido

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

## 41. Facturas

El cliente podrá consultar:

- Facturas.
- Abonos.
- Pedidos.
- Albaranes.

Y descargarlos en PDF.

---

## 42. Documentos

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

## 43. Devoluciones

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

## 44. Incidencias

Desde un pedido se podrá crear una incidencia.

Por ejemplo:

- Producto incorrecto.
- Producto defectuoso.
- Falta material.
- Problema de entrega.
- Facturación.
- Consulta general.

El cliente podrá adjuntar imágenes.
