# 00. Visión general

> Parte de `docs/Catálogo Demo Flexygo - Funcionalidades.md` (secciones 1, 96, 101). Documento fuente conservado como referencia completa.

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

## 96. Elementos de Flexygo que debería enseñar expresamente

### Objetos

- Clientes.
- Productos.
- Pedidos.
- Líneas.
- Tarifas.
- Promociones.
- Incidencias.

### Listados

- Cards.
- Grid.
- Listados agrupados.
- Listados editables.
- Kanban.
- Calendario.
- Timeline.

### Formularios

- Formularios simples.
- Formularios complejos.
- Dependencias entre campos.
- Campos dinámicos.
- Validaciones.
- Combos dependientes.
- Edición inline.

### Acciones

- Crear.
- Modificar.
- Eliminar.
- Duplicar.
- Aprobar.
- Rechazar.
- Cambiar estado.
- Generar PDF.
- Enviar email.

### Seguridad

- Roles.
- Usuarios.
- Permisos por objeto.
- Permisos por acción.
- Permisos por registro.

### Procesos

- Workflows.
- Aprobaciones.
- Automatizaciones.
- Tareas programadas.

### Documentos

- Adjuntos.
- Imágenes.
- PDFs.
- Informes.

### Integración

- API REST.
- Webhooks.
- Servicios externos.

### Visualización

- Dashboards.
- KPIs.
- Gráficos.
- Mapas.
- Calendarios.
- Kanban.

---

## 101. Filosofía de la aplicación

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
