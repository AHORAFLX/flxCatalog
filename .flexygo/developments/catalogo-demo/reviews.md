# Reviews — catalogo-demo

## 2026-09-15 · affects T-07

**Agreed:** Productos con Referencia, Nombre, DescripcionCorta, IdFamilia, IdMarca, PrecioBase, IVA, Stock, Activo y columnas de auditoría.

**Found:** Además se crearon Destacado, Novedad, Oferta e ImagenPrincipal, no mencionadas en el texto literal de la tarea.

**Deviation:** Sí, ya justificada durante la construcción: las pantallas aprobadas L-P y el catálogo público (P) las necesitan para las píldoras de estado y la foto de producto.

## 2026-09-15 · affects T-08, T-14

**Agreed:** Variante (T-08) y LíneaPedido (T-14): solo objeto, propiedades y vista (y filtros en el caso de Variante), sin módulo de listado propio.

**Found:** Se creó un módulo de listado genérico para cada una (mod-cat-variante-list, mod-vta-lineapedido-list), no colocado en ninguna página propia. flexygo_audit_origin los marca como "módulos huérfanos" (2).

**Deviation:** Sí, pero necesaria: flexygo_create_related_list_module exige que ese módulo genérico exista primero para reutilizar su plantilla en el listado embebido. Es el efecto colateral esperado del mecanismo, no un defecto.

## 2026-09-15 · affects T-10

**Agreed:** Ficha de producto con acciones Editar (formulario estándar), Duplicar (clona sin variantes, Activo=0) y Archivar (Activo=0) funcionando.

**Found:** Solo el toolbar estándar de edición (systb-edit). Duplicar y Archivar no están implementados.

**Deviation:** Sí, sin resolver. Ya se había anotado como abierto al cerrar T-10.

## 2026-09-15 · affects T-18

**Agreed:** Ficha de pedido con Confirmar/Cancelar cambiando realmente el estado del pedido, y Generar PDF construido ya como PDF básico (decisión D-4).

**Found:** Solo el toolbar estándar de vista (systb-view). Ninguna de las tres acciones cambia el estado ni genera un PDF.

**Deviation:** Sí, sin resolver. Incumple en concreto la decisión D-4 sobre "Generar PDF: ya, básico".

## 2026-09-15 · affects T-21

**Agreed:** Aplicar la paleta de 6 colores leída de las pantallas aprobadas a la skin que usa la aplicación.

**Found:** Aplicada solo a la skin 'flexy2022' (flexygo_set_skin_variable no admite otra). El único perfil con un usuario real asignado ("2026") usa la interfaz web2026, sobre 'skin2026', sin tocar.

**Deviation:** Sí, parcialmente sin resolver: no hay herramienta en este servidor para escribir variables de skin2026.

## 2026-09-15 · affects T-24

**Agreed:** Catálogo público con cabecera pública propia (logo, nav Marcas/Novedades/Ofertas/Ayuda/Contacto, buscador, carrito, Iniciar sesión) — no la barra lateral oscura del backoffice.

**Found:** La página vive dentro del mismo árbol de navegación que el backoffice y se pinta con la misma barra lateral oscura que el resto de la aplicación.

**Deviation:** Sí, deliberada: el supuesto S-4 del plan ya decía que el acceso público real (interfaz propia, sin login) queda para un bloque de seguridad posterior.

## 2026-09-15 · affects T-25

**Agreed:** Árbol de navegación propio, en el orden aprobado, con los objetos ya creados en showInMenu=false.

**Found:** Construido correctamente en el orden acordado, pero duplicado bajo DOS raíces distintas ("Barra lateral 2026" y "Work Area"). flexygo_audit_origin marca 7 páginas como alcanzables desde más de una raíz de navegación.

**Deviation:** Sí: cobertura deliberada al descubrir a mitad de bloque que el usuario real no estaba en la interfaz prevista — pero deja el menú duplicado también en la interfaz que no usa nadie (perfil "default", 0 usuarios).

## 2026-09-15 · affects T-26

**Agreed:** Stored procedure de datos de prueba, ejecutable y repetible (decisión del usuario).

**Found:** Procedimiento dbo.pSeed_ResetDemoData creado y datos cargados en esta pasada, pero no existe ninguna herramienta MCP capaz de ejecutar (EXEC) un procedimiento almacenado.

**Deviation:** Sí, menor: el procedimiento queda creado para que el usuario lo ejecute manualmente en el futuro. Ya registrado como capacidad ausente (gaps.md).

## 2026-09-15 · affects B-1

**Agreed:** No aplica — hallazgo de flexygo_audit_origin, no del plan. Se anota aquí por no tener un task propio al que atar un hallazgo del origen en general.

**Found:** Referencia rota: Tours_Steps.ObjectName='Account' no corresponde a ningún objeto. 1 fila, origen 0 (la instalación estándar de la plantilla).

**Deviation:** Ninguna — no es de esta construcción, vino con la plantilla del proyecto antes de empezar.
