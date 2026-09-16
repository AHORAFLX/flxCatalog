# 13. Datos demo, reset y modelo funcional

> Parte de `docs/Catálogo Demo Flexygo - Funcionalidades.md` (secciones 92-94, 100).

## 92. Datos demo

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

## 93. Cliente demo

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

## 94. Reset de la demo

Como la aplicación estará abierta al público sería especialmente interesante disponer de mecanismos para mantenerla limpia.

Por ejemplo:

- Datos base protegidos.
- Pedidos demo eliminados periódicamente.
- Clientes demo temporales.
- Reset nocturno.
- Regeneración automática de datos.
- Límites de registros creados.

---

## 100. Modelo funcional principal

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
