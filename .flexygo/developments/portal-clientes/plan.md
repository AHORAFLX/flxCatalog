# Plan — portal-clientes

**Request:** De momento no des acceso publico, simplemente ten dos roles, el que tenemos, que es capaz de hacer todo. y uno "Cliente", donde en la subreference guardemos el IdCliente y al loguearse pueda ver mis pedidos, con mis tarifas, el catalogo, mi ficha, mis ultimas compras, etc.

**State:** 5 block(s), 18 task(s)

## Assumptions

- [S-1] El precio específico por cliente/artículo y las promociones (los dos primeros escalones de la cadena de prioridad de la sección 21/24 de la especificación) no se construyen en este desarrollo: solo el escalón 'precio de tarifa', con fallback a PrecioBase. Los otros dos escalones necesitan sus propias tablas y quedan para un desarrollo posterior, igual que el carrito quedó como placeholder en catalogo-demo. — affects B-1
- [S-2] 'Mis últimas compras' se resuelve con la propia página 'Mis pedidos', PERO durante T-18 el usuario creó a mano una página de inicio en blanco ('Home Cliente') como StartupPageName del perfil 'Cliente', y pidió que se rellenara con un resumen básico (saludo, tarifa asignada, últimos 5 pedidos) — así que sí existe un pequeño dashboard para el cliente, añadido fuera del plan original a petición directa del usuario. — affects B-3
- [S-3] El rol Cliente es un rol normal (no invitado): por la regla general de seguridad, todo lo que no se deniegue explícitamente queda permitido, así que hay que denegar uno por uno los objetos y páginas del backoffice que no debe alcanzar en vez de conceder solo lo necesario. — affects B-4

## Open points

- T-06 — AspNetUsers.Subreference es donde Flexygo guarda el dato que alimenta {{currentSubreference}}. Rellenarlo para cada cliente es un paso manual del usuario en la pantalla de Usuarios de Flexygo (esta sesión no tiene una tool para crear logins ni para escribir ese campo) — lo documento aquí para no repetirlo en cada tarea que dependa de él.

## Blocks

### B-1 · Modelo de precios por tarifa

- [x] T-01 · Crear la tabla Tarifas_Precios (IdPrecio nvarchar(50) PK con DEFAULT NEWID() igual que el resto de claves del proyecto, IdTarifa FK a Tarifas, IdProducto FK a Productos, Precio decimal(18,2) NOT NULL, restricción UNIQUE sobre IdTarifa+IdProducto para que no haya dos precios del mismo producto en la misma tarifa).
- [x] T-02 · Llevar la tabla nueva al proyecto de datos con flexygo_script_data_structure, para que viaje en el publish como el resto del esquema.
- [x] T-03 [P] · Construir el objeto VTA_PrecioTarifa / VTA_PreciosTarifa completo (propiedades, vista, filtros, ficha) y colgarlo como listado relacionado dentro de la ficha de Tarifa (VTA_Tarifa_View), para que el administrador pueda mantener los precios de cada tarifa. Punto de entrada: ese listado relacionado en VTA_Tarifa_View, no lleva nodo de menu propio.
- [x] T-04 [P] · Sembrar datos demo de precios por tarifa: unos cuantos productos con precio distinto en 2-3 tarifas existentes, para poder verificar el cálculo. No insertar sin pedir confirmación de qué productos y tarifas usar.

### B-2 · Rol Cliente y su enlace con la ficha

- [x] T-05 · Crear el rol 'Cliente' (roleId: cliente) con flexygo_create_role.
- [x] T-06 · Crear el context variable {{currentClienteTarifaId}}: SELECT IdTarifa FROM Clientes WHERE IdCliente = '{{currentSubreference}}' contra DataConnectionString, con un order superior al de los tokens base para que se resuelva después de {{currentSubreference}}.
      [CLARIFY: AspNetUsers.Subreference es donde Flexygo guarda el dato que alimenta {{currentSubreference}}. Rellenarlo para cada cliente es un paso manual del usuario en la pantalla de Usuarios de Flexygo (esta sesión no tiene una tool para crear logins ni para escribir ese campo) — lo documento aquí para no repetirlo en cada tarea que dependa de él.]

### B-3 · Mi catálogo, mis pedidos y mi ficha

- [x] T-07 · Crear una vista nueva CAT_ProductoClienteList (no tocar la vista del catálogo público ni la del backoffice): mismo SELECT con sus LEFT JOIN habituales más un LEFT JOIN a Tarifas_Precios filtrado por {{currentClienteTarifaId}}, y una columna PrecioCliente = ISNULL(precio de tarifa, PrecioBase).
- [x] T-08 [P] · Página y módulo propios 'Mi catálogo' (objeto CAT_Producto, la vista anterior, plantilla propia mostrando PrecioCliente en vez de PrecioBase, sin Nuevo/Editar/Eliminar/Procesos). Punto de entrada: el nodo 'Mi catálogo' del menú raíz del bloque 5.
- [x] T-09 [P] · Página y módulo propios 'Mis pedidos' (objeto VTA_Pedido, listado y ficha de solo lectura, sin Nuevo/Editar/Eliminar/Duplicar/Archivar/Confirmar/Cancelar; se conserva Generar PDF). Punto de entrada: el nodo 'Mis pedidos' del menú raíz del bloque 5.
- [x] T-10 [P] · Página y módulo propios 'Mi ficha' (objeto CLI_Cliente, listado que por el filtro de seguridad del bloque siguiente solo contendrá su propio registro, ficha de solo lectura mostrando también el nombre de su tarifa). Punto de entrada: el nodo 'Mi ficha' del menú raíz del bloque 5.

### B-4 · Seguridad de datos: cada cliente ve solo lo suyo

- [x] T-11 · Object security en CLI_Cliente para el rol cliente: canView/canViewCollection true con ViewFilter y ViewFilterCollection = IdCliente = '{{currentSubreference}}'; canInsert/canEdit/canDelete/canPrint false.
- [x] T-12 [P] · Object security en VTA_Pedido para el rol cliente: mismo filtro IdCliente = '{{currentSubreference}}'; canInsert/canEdit/canDelete false, canPrint true.
- [x] T-13 [P] · Object security en CAT_Producto, CAT_Familia y CAT_Marca para el rol cliente: solo lectura (canView/canViewCollection true, canInsert/canEdit/canDelete/canPrint false), sin filtro de fila — el catálogo completo, con su precio.
- [x] T-14 [P] · Object security denegando (canView/canViewCollection false) al rol cliente el resto de objetos del backoffice que no debe tocar: CAT_Color, CAT_Talla, CAT_Variante, VTA_LineaPedido, VTA_EstadoPedido, VTA_Tarifa, VTA_PrecioTarifa.
- [x] T-15 · Page/module security: canView true para el rol cliente en las tres páginas nuevas del bloque anterior y sus módulos (no crea páginas, solo concede/deniega sobre las ya creadas); canView false explícito en todas las páginas de administración existentes (listados y fichas de Clientes, Productos, Familias, Marcas, Pedidos, Tarifas, PrecioTarifa del backoffice) para que no sean alcanzables ni tecleando la URL.

### B-5 · Menú y entrada propios del cliente

- [x] T-16 [P] · Nodo de navegación raíz 'Menú Cliente' con tres entradas: Mi catálogo, Mis pedidos, Mi ficha — apuntando a las páginas del bloque 3. No crea páginas: este nodo ES el punto de entrada que las tres tareas anteriores ya declaran. — ⚠️ failed 2026-09-17 · see execution.md
- [x] T-17 · Nueva interfaz 'webcliente' (skin flexy2022, mismo NavigateId de barra superior que webdefault para conservar Inicio/Usuario/Cerrar sesión, MainNavigateId = el nodo anterior, StartupPageName = Mi catálogo). No crea páginas.
- [x] T-18 · Verificación real: pedir la contraseña del usuario administrador, crear con su ayuda un perfil 'cliente' (apuntando a webcliente) y un login de prueba (rol cliente, Subreference = un IdCliente real, perfil cliente) en la pantalla de Flexygo, entrar como ese cliente y comprobar que solo ve su propio pedido/ficha, su precio de tarifa en el catálogo, y que las URLs de administración quedan denegadas. No crea páginas.

## Impact on what exists

Añade una tabla y un objeto nuevos (Tarifas_Precios / VTA_PrecioTarifa) sin tocar los existentes. Añade un rol, un context variable, tres páginas/módulos/vistas nuevos y una interfaz nueva, todos propios de este bloque. Toca seguridad (objetos y páginas) solo para el nuevo rol 'cliente' — no cambia ninguna fila de seguridad de los roles existentes (admins, allUsers, registered, notRegistered). No toca el desarrollo 'seguridad-acceso-publico', que queda aparcado tal y como decidió el usuario.
