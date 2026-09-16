# 02. Catálogo de productos

> Parte de `docs/Catálogo Demo Flexygo - Funcionalidades.md` (secciones 4-13, 38, 39, 68-71).

## 4. Catálogo de productos

### 4.1 Familias de productos

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

## 5. Productos

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

## 6. Imágenes y multimedia

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

## 7. Variantes de producto

Los artículos podrán tener variantes.

### 7.1 Tallas

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

### 7.2 Colores

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

### 7.3 Variantes

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

## 8. Otros atributos

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

## 9. Etiquetas

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

## 10. Buscador

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

## 11. Filtros

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

## 12. Ordenación del catálogo

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

## 13. Productos relacionados

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

## 38. Stock

Gestionar únicamente la parte de disponibilidad necesaria para el catálogo:

- Stock actual.
- Disponible/no disponible.
- Stock mínimo.
- Fecha estimada de reposición.

No se incluirán procesos de almacén, picking ni preparación física de pedidos.

---

## 39. Aviso de reposición

Si un artículo no tiene stock:

**Avísame cuando esté disponible**

Cuando se reponga se genera una notificación.

Esto permite demostrar automatizaciones y eventos.

---

## 68. Novedades

Página específica con productos recientemente publicados.

---

## 69. Más vendidos

Página dinámica calculada a partir de pedidos.

---

## 70. Recomendaciones

En función de compras anteriores:

> Quizá también te interese...

Incluso se podría incorporar posteriormente IA para generar recomendaciones.

---

## 71. Historial de navegación

Para usuarios identificados:

**Vistos recientemente**
