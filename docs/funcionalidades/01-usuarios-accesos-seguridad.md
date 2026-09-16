# 01. Usuarios, accesos y seguridad

> Parte de `docs/Catálogo Demo Flexygo - Funcionalidades.md` (secciones 2, 59, 60, 61, 95).

## 2. Tipos de usuario

La aplicación tendrá inicialmente tres tipos de acceso.

### 2.1 Usuario público

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

## 59. Auditoría

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

## 60. Usuarios y roles

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

## 61. Comercial

El comercial podrá:

- Consultar sus clientes.
- Crear pedidos.
- Crear presupuestos.
- Consultar ventas.
- Consultar actividad.
- Aplicar descuentos hasta determinado límite.

---

## 95. Seguridad de una demo pública

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
