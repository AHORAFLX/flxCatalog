# 05. Carrito y pedidos

> Parte de `docs/Catálogo Demo Flexygo - Funcionalidades.md` (secciones 14-16, 26-33, 37, 56, 57).

## 14. Favoritos

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

## 15. Listas de compra

Además de favoritos, el cliente podrá crear listas.

Ejemplos:

- Compra mensual.
- Material oficina.
- Uniformes verano.
- Productos habituales.

Esto es especialmente interesante para clientes B2B.

---

## 16. Comparador de productos

El usuario podrá seleccionar varios artículos y compararlos.

| Característica | Producto A | Producto B | Producto C |
|---|---|---|---|
| Precio | | | |
| Material | | | |
| Peso | | | |
| Stock | | | |
| Marca | | | |

---

## 26. Carrito

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

## 27. Carrito persistente

Si el cliente abandona la aplicación, el carrito podrá permanecer guardado.

Cuando vuelva:

> Tienes un carrito pendiente con 6 productos.

---

## 28. Pedido rápido

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

## 29. Importar pedido

Permitir importar pedidos desde:

- Excel.
- CSV.

Esto sería una funcionalidad interesante para enseñar importaciones mediante Flexygo.

---

## 30. Pedidos

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

## 31. Detalle del pedido

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

## 32. Repetir pedido

Desde cualquier pedido anterior:

**Repetir pedido**

La aplicación generará un nuevo carrito con las líneas originales.

Antes de añadirlas deberá comprobar:

- Precio actual.
- Stock actual.
- Producto descatalogado.
- Variante disponible.

---

## 33. Pedido habitual

El cliente podrá convertir un pedido en:

**Pedido habitual**

Para repetirlo con facilidad posteriormente.

---

## 37. Pedidos recurrentes

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

## 56. Gestión de pedidos

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

## 57. Workflow de pedidos

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
