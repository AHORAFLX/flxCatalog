# Reviews — pendientes-cliente-admin

## 2026-10-02 · affects B-1

**Agreed:** Borrar todo lo de Contacto y Demostración: nodos, páginas, módulos, los cuatro objetos y las tres tablas, incluida SolicitudesContacto.

**Found:** Los nodos, páginas, módulos, objetos y tablas ya no están, y la auditoría no ve referencias colgantes. El proyecto SSDT está limpio. Los scripts generados de flxCatalog.Conf.Database\scripts\staticdata siguen teniendo filas de COM_Solicitud*.

**Deviation:** Un despliegue de la base de configuración reintroduciría lo borrado hasta que se regeneren esos scripts. Tampoco se ha podido comprobar si quedan filas de seguridad por rol sobre los objetos borrados.

## 2026-10-02 · affects B-2

**Agreed:** Pantalla de trabajo con tres kanban nativos de Flexygo (incidencias, pedidos y devoluciones) dentro de un separador, solo para el administrador, con entrada desde el menú lateral.

**Found:** Existen los tres módulos kanban, el separador y la página VTA_MesaTrabajo_Page, con seguridad solo para admins y nodo «Mesa de trabajo» en el menú lateral. Para poder usar el kanban nativo se creó un esquema que el plan no contemplaba: tabla MesasTrabajo con un registro, objeto VTA_MesaTrabajo, tres relaciones con la expresión inventada 1=1 y una vista VTA_PedidoKanban (decisión D-3).

**Deviation:** Esquema extra no planificado y relaciones con una expresión constante que nadie ha comprobado en pantalla. No consta que las tarjetas se pinten en sus columnas ni que arrastrar una tarjeta guarde bien el estado.

## 2026-10-02 · affects B-3

**Agreed:** Dashboard con ventas del año y del mes, artículos más vendidos y más devueltos, clientes que más compran y que más problemas dan, como página de inicio del administrador en web2026.

**Found:** Hay un módulo con cinco indicadores, cuatro gráficos de barras horizontales, la página VTA_Dashboard_Page solo para admins, y web2026 arranca en ella. Los rankings salen de cuatro vistas de base de datos nuevas con TOP 8, porque los gráficos no admiten ORDER BY (decisión D-5). Los indicadores de pendientes cuentan solo Confirmado y En proceso.

**Deviation:** Cuatro vistas extra no previstas, y el orden del eje X depende de la vista y el framework puede reordenarlo. No se ha registrado el plugin de estilos recomendado, y el criterio de «pendientes» no lo ha confirmado el usuario. Nada verificado en pantalla.

## 2026-10-02 · affects B-4, T-17

**Agreed:** Árbol propio de accesos directos en «Barra lateral 2026» con Dashboard primero, y todas las colecciones sin «mostrar en menú», de modo que el árbol sea el único menú.

**Found:** El árbol tiene Dashboard, Mesa de trabajo, Pedidos, Clientes, Incidencias, Devoluciones, Productos, Tarifas y Maestros, y las 20 colecciones están desmarcadas. Para no dejar seis maestros sin acceso se construyeron sus páginas de lista y nodos (decisión D-6). Falta el nodo «Tallas»: su creación la denegó el clasificador de permisos (Modify Shared Resources). Siguen vacías las carpetas «Default Objects» y «Administración», y no se ha confirmado el orden de los nodos.

**Deviation:** El administrador no llega a Tallas desde el menú, aunque la página CAT_Talla_List existe. Se construyeron seis páginas y módulos que el plan no preveía. La auditoría avisa de páginas bajo varias raíces, con Work Area (webdefault) y el Menú Cliente, que se dejaron intactos.

## 2026-10-02 · affects B-5

**Agreed:** Icono en la barra superior igual que el del badge de noticias, que muestre cuántos elementos hay en el carrito.

**Found:** Existe un nodo «Mi carrito» en «Barra superior 2026», con icono de carrito, que lanza pVTA_AbrirMiCarrito y solo es visible para el rol cliente. No tiene contador, porque las herramientas de nodos no permiten uno dinámico (decisión D-8).

**Deviation:** Entrega parcial: falta el contador, que era lo esencial del punto. Que el proceso abra el carrito desde la barra superior y que el administrador no vea el icono son deducciones, no se han visto en pantalla.

## 2026-10-02 · affects B-6

**Agreed:** Circuitos de test de interfaz para pedido, devolución, incidencia y alta, modificación y borrado de artículo, cliente y tarifa.

**Found:** Pedido, devolución e incidencia ya tenían tests. Se crearon tres de alta, modificación y borrado en Admin\AdminCircuitosTests.cs y se borraron los tests obsoletos de Contacto. El proyecto compila con 0 errores, pero ningún test se ha ejecutado.

**Deviation:** Ningún test se ha lanzado con el Backend en marcha. Es probable que fallen tests de administrador: Login_AbreElPanelDeControlConSusIndicadores espera HOME y sus KPI antiguos, y la fila «Panel de control» de MenuAdministrador_AbreSuPantalla apunta a un nodo que ya no está en el menú lateral.

## 2026-10-02 · affects B-4

**Agreed:** Que tras el desarrollo no queden páginas ni módulos huérfanos por culpa de este trabajo.

**Found:** La auditoría no ve duplicados de objetos ni referencias rotas. Avisa de que «Home Cliente» no tiene entrada, de cinco procesos sin enlazar y de siete módulos sin página. Ninguno lo creó este desarrollo.

**Deviation:** Ninguna atribuible a este desarrollo: son avisos que ya había antes.

## 2026-10-13 · affects B-1

**Agreed:** Borrar todo lo de Contacto y Demostración sin que una publicación de la base de configuración lo reintroduzca, y sin filas de seguridad huérfanas.

**Found:** Revisado de nuevo el 13/10: ni los scripts exportados de Conf.Database, ni el proyecto Data, ni los procesos C#, ni el plugin contienen referencias a COM_SolicitudContacto, COM_SolicitudDemo, COM_EstadoSolicitud, COM_TipoSolicitud ni SolicitudesContacto. En flxCatalog_IC: 0 objetos, 0 páginas, 0 nodos y 0 filas de Security_Objects_Roles relacionadas.

**Deviation:** Ninguna

**Decisions on record:** D-8

## 2026-10-13 · affects B-5

**Agreed:** Icono en la barra superior, igual que el del distintivo de noticias, que muestre los elementos del carrito.

**Found:** Nodo «Mi carrito» en la barra superior y en el menú del cliente, con un contador SQL (unidades del pedido en Borrador del cliente) que se refresca cada 15 s. Visible solo para el rol cliente. Comprobado en pantalla por el test del carrito el 13/10.

**Deviation:** Ninguna

**Decisions on record:** D-8

## 2026-10-13 · affects B-6

**Agreed:** Circuitos de test de interfaz para pedido, devolución, incidencia y altas, modificaciones y borrados de artículo, cliente y tarifa.

**Found:** Ejecutados el 13/10 contra la aplicación en marcha (beta.137). Corregidos los tests desfasados (dashboard en lugar de HOME, aviso de privacidad, nodo duplicado, «Correo»). Añadido el recorrido de pantallas por rol con captura. Todos los circuitos pasan; solo falla la mesa de trabajo, que es un defecto real del bloque B-2.

**Deviation:** Ninguna

**Decisions on record:** D-8

## 2026-10-13 · affects B-3

**Agreed:** Dashboard con más devueltos, más vendidos, clientes que más compran, clientes con más problemas, ventas del año y ventas del mes.

**Found:** Visto en pantalla el 13/10: 5 indicadores y 4 rankings ordenados de mayor a menor con eje desde cero. Hoja flx-dashboard.css registrada. Las 4 vistas extra son las que permiten el top N, que el gráfico no admite.

**Deviation:** Solo falta que el usuario confirme el criterio de «Pedidos pendientes» (estados Confirmado y En proceso).

**Decisions on record:** D-8

## 2026-10-13 · affects B-3

**Agreed:** Dashboard con más devueltos, más vendidos, clientes que más compran, clientes con más problemas, ventas del año y ventas del mes.

**Found:** Visto en pantalla el 13/10, con rankings ordenados y eje desde cero. El usuario acepta el criterio de «Pedidos pendientes» (Confirmado y En proceso), decisión D-10.

**Deviation:** Ninguna

**Decisions on record:** D-12

## 2026-10-13 · affects B-2

**Agreed:** Pantalla de trabajo con 3 kanban (incidencias, pedidos y devoluciones) dentro de un separador, con el kanban de Flexygo.

**Found:** Funciona en beta.137 tras sustituir la relación constante 1=1 por Activo=Activo (D-9). Esto añade la columna Activo a MesasTrabajo y Pedidos. Se ha visto que las tarjetas salen en su columna en las tres pestañas, y un test comprueba que arrastrar una tarjeta guarda el estado.

**Deviation:** Ninguna

**Decisions on record:** D-12
