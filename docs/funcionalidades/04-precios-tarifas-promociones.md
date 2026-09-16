# 04. Precios, tarifas y promociones

> Parte de `docs/Catálogo Demo Flexygo - Funcionalidades.md` (secciones 20-25).

## 20. Tarifas

Cada artículo tendrá un precio base.

Sobre este precio podrán existir diferentes tarifas.

Ejemplo:

- Precio público.
- Tarifa distribuidor.
- Tarifa profesional.
- Tarifa mayorista.
- Tarifa VIP.

---

## 21. Tarifas específicas por cliente

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

## 22. Descuentos

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

## 23. Descuentos por volumen

| Cantidad | Descuento |
|---|---:|
| 1-9 | 0 % |
| 10-24 | 5 % |
| 25-49 | 10 % |
| 50+ | 15 % |

---

## 24. Promociones

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

## 25. Códigos promocionales

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
