

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"TemplateId":"flx-cat-familia-list",
	"ObjectName":"CAT_Familia",
	"TypeId":"list",
	"Descrip":"CAT_Familia list template",
	"Body":"<div class=\"row row-line clickable {{FamiliaPadre|isnull:flx-fam-parent,flx-fam-child}}\"><flx-navbutton type=\"openpage\" pagetypeid=\"view\" objectname=\"CAT_Familia\" objectwhere=\"(Familias.IdFamilia=''{{IdFamilia}}'')\" targetid=\"current\"><div class=\"col-6 flx-fam-name\">{{Nombre}}<\/div><div class=\"col-3 txt-right flx-fam-count\">{{TextoProductos}}<\/div><div class=\"col-2\">{{Visible|switch:[true:<span class=\"flx-state-success\">Visible<\/span>,else:<span class=\"flx-state-danger\">Oculta<\/span>]}}<\/div><\/flx-navbutton><div class=\"col-1 txt-right\">{{objectmenu}}<\/div><\/div>",
	"ViewName":"CAT_FamiliaDefaultList",
	"Header":"<div class=\"row row-line bold\"><div class=\"col-6\">{{translate|Familia}}<\/div><div class=\"col-3 txt-right\">{{translate|Productos}}<\/div><div class=\"col-2\">{{translate|Estado}}<\/div><div class=\"col-1\">{{translate|Acciones}}<\/div><\/div>",
	"Empty":"<div class=\"padding-l txt-muted\">{{translate|Sin familias todavía}}<\/div>",
	"IsDefault":true,
	"Offline":false,
	"UserDefinedGroups":false,
	"Active":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2026-09-16T17:58:00",
	"flxUpdatedDate":"2026-09-16T18:11:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TemplateId":"flx-cat-familia-view",
	"ObjectName":"CAT_Familia",
	"TypeId":"view",
	"Descrip":"CAT_Familia view template",
	"Body":"<div class=\"padding-l\">\n',
N'<div class=\"row\"><div class=\"col-12\"><h3>{{Nombre}}<\/h3><\/div><\/div>\n',
N'<div class=\"row margin-top-m\">\n',
N'<div class=\"col-6\"><label class=\"txt-muted\">{{translate|Familia padre}}<\/label><div>{{FamiliaPadreNombre|isnull:—}}<\/div><\/div>\n',
N'<div class=\"col-3\"><label class=\"txt-muted\">{{translate|Orden}}<\/label><div>{{Orden}}<\/div><\/div>\n',
N'<div class=\"col-3\"><label class=\"txt-muted\">{{translate|Activo}}<\/label><div>{{Activo|switch:[true:<span class=\"flx-state-success\">Sí<\/span>,else:<span class=\"flx-state-danger\">No<\/span>]}}<\/div><\/div>\n',
N'<\/div>\n',
N'<div class=\"row margin-top-m\"><div class=\"col-12\"><label class=\"txt-muted\">{{translate|Descripción}}<\/label><div>{{Descripcion|isnull:—}}<\/div><\/div><\/div>\n',
N'<\/div>",
	"ViewName":"CAT_FamiliaDefaultView",
	"IsDefault":true,
	"Offline":false,
	"UserDefinedGroups":false,
	"Active":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:02:00",
	"flxUpdatedDate":"2026-09-16T13:41:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TemplateId":"flx-cat-marca-list",
	"ObjectName":"CAT_Marca",
	"TypeId":"list",
	"Descrip":"CAT_Marca list template",
	"Body":"<div class=\"row row-line clickable\"><flx-navbutton type=\"openpage\" pagetypeid=\"view\" objectname=\"CAT_Marca\" objectwhere=\"(Marcas.IdMarca=''{{IdMarca}}'')\" targetid=\"current\"><div class=\"col-9\">{{Nombre}}<\/div><div class=\"col-2\">{{Activo|switch:[true:<span class=\"flx-state-success\">Sí<\/span>,else:<span class=\"flx-state-danger\">No<\/span>]}}<\/div><\/flx-navbutton><div class=\"col-1 txt-right\">{{objectmenu}}<\/div><\/div>",
	"ViewName":"CAT_MarcaDefaultList",
	"Header":"<div class=\"row row-line bold\"><div class=\"col-9\" data-sort=\"Nombre\">{{translate|Nombre}}<\/div><div class=\"col-2\">{{translate|Activo}}<\/div><div class=\"col-1\">{{translate|Acciones}}<\/div><\/div>",
	"Empty":"<div class=\"padding-l txt-muted\">{{translate|Sin marcas todavía}}<\/div>",
	"IsDefault":true,
	"Offline":false,
	"UserDefinedGroups":false,
	"Active":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:03:00",
	"flxUpdatedDate":"2026-09-16T12:26:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TemplateId":"flx-cat-marca-view",
	"ObjectName":"CAT_Marca",
	"TypeId":"view",
	"Descrip":"CAT_Marca view template",
	"Body":"<div class=\"padding-l\">\n',
N'<div class=\"row\"><div class=\"col-12\"><h3>{{Nombre}}<\/h3><\/div><\/div>\n',
N'<div class=\"row margin-top-m\"><div class=\"col-3\"><label class=\"txt-muted\">{{translate|Activo}}<\/label><div>{{Activo|switch:[true:<span class=\"flx-state-success\">Sí<\/span>,else:<span class=\"flx-state-danger\">No<\/span>]}}<\/div><\/div><\/div>\n',
N'<\/div>",
	"ViewName":"CAT_MarcaDefaultView",
	"IsDefault":true,
	"Offline":false,
	"UserDefinedGroups":false,
	"Active":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:03:00",
	"flxUpdatedDate":"2026-09-16T13:41:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TemplateId":"flx-cat-producto-list",
	"ObjectName":"CAT_Producto",
	"TypeId":"list",
	"Descrip":"CAT_Producto list template",
	"Body":"<div class=\"row row-line clickable\"><flx-navbutton type=\"openpage\" pagetypeid=\"view\" objectname=\"CAT_Producto\" objectwhere=\"(Productos.IdProducto=''{{IdProducto}}'')\" targetid=\"current\"><div class=\"col-1\">{{Referencia}}<\/div><div class=\"col-3 bold\">{{Nombre}}<\/div><div class=\"col-2\">{{Familia}}<\/div><div class=\"col-1\">{{Marca}}<\/div><div class=\"col-1 txt-right\">{{PrecioBase|decimal:2}} €<\/div><div class=\"col-1 txt-right\">{{Stock}}<\/div><div class=\"col-2\">{{EstadoCodigo|switch:[sinstock:<span class=\"flx-state-danger\">Sin stock<\/span>,novedad:<span class=\"flx-state-tools\">Novedad<\/span>,oferta:<span class=\"flx-state-warning\">Oferta<\/span>,activo:<span class=\"flx-state-success\">Activo<\/span>,else:Inactivo]}}<\/div><\/flx-navbutton><div class=\"col-1 txt-right\">{{objectmenu}}<\/div><\/div>",
	"ViewName":"CAT_ProductoDefaultList",
	"Header":"<div class=\"row row-line bold\"><div class=\"col-1\" data-sort=\"Referencia\">{{translate|Referencia}}<\/div><div class=\"col-3\" data-sort=\"Nombre\">{{translate|Nombre}}<\/div><div class=\"col-2\">{{translate|Familia}}<\/div><div class=\"col-1\">{{translate|Marca}}<\/div><div class=\"col-1 txt-right\" data-sort=\"PrecioBase\">{{translate|Precio}}<\/div><div class=\"col-1 txt-right\" data-sort=\"Stock\">{{translate|Stock}}<\/div><div class=\"col-2\">{{translate|Estado}}<\/div><div class=\"col-1\">{{translate|Acciones}}<\/div><\/div>",
	"Empty":"<div class=\"padding-l txt-muted\">{{translate|No hay productos todavía}}<\/div>",
	"IsDefault":false,
	"Offline":false,
	"UserDefinedGroups":false,
	"Active":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:08:00",
	"flxUpdatedDate":"2026-09-16T12:26:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TemplateId":"flx-cat-producto-publico-list",
	"ObjectName":"CAT_Producto",
	"TypeId":"list",
	"Descrip":"CAT_Producto list template",
	"Body":"<div class=\"pub-cell col-3 col-l-4 col-m-6 padding-m\">\n',
N'  <div class=\"pub-card\">\n',
N'    <flx-navbutton class=\"pub-open\" type=\"openpage\" pagetypeid=\"view\" objectname=\"CAT_Producto\" objectwhere=\"(Productos.IdProducto=''{{IdProducto}}'')\" targetid=\"current\">\n',
N'      <img is=\"flx-img\" class=\"pub-photo\" src=\"{{ImagenPrincipal|isnull:,{{ImagenPrincipal|url}}}}\" alt=\"{{Nombre}}\" \/>\n',
N'      <div class=\"pub-band\">\n',
N'        <div class=\"pub-cat\">{{Familia}} · {{Marca}}<\/div>\n',
N'        <div class=\"pub-name\">{{Nombre}}<\/div>\n',
N'        <div class=\"pub-foot\">\n',
N'          <span class=\"pub-price\">{{PrecioBase|decimal:2}} €<\/span>\n',
N'          {{EstadoCodigo|switch:[sinstock:<span class=\"flx-state-danger\">{{translate|Sin stock}}<\/span>,novedad:<span class=\"flx-state-tools\">{{translate|Novedad}}<\/span>,oferta:<span class=\"flx-state-warning\">{{translate|Oferta}}<\/span>,else:]}}\n',
N'        <\/div>\n',
N'      <\/div>\n',
N'    <\/flx-navbutton>\n',
N'    <button type=\"button\" class=\"pub-cart\" disabled title=\"{{translate|Próximamente}}\">{{translate|Añadir al carrito}}<\/button>\n',
N'  <\/div>\n',
N'<\/div>",
	"ViewName":"CAT_ProductoPublicoList",
	"Header":"<style>\n',
N'  .pub-grid { display: flex; flex-flow: row wrap; }\n',
N'  .pub-cell { display: flex; }\n',
N'  .pub-card { position: relative; width: 100%; background: var(--module-color); border: 1px solid var(--border-module-color); border-radius: 12px; overflow: hidden; }\n',
N'  .pub-card:hover { border-color: var(--outstanding-color); }\n',
N'  .pub-open { display: block; cursor: pointer; }\n',
N'  .pub-photo { display: block; width: 100%; aspect-ratio: 1 \/ 1; object-fit: cover; border-bottom: 1px solid var(--border-module-color); background: light-dark(#f3f3f4, #292929); }\n',
N'  .pub-band { padding: 12px 16px; }\n',
N'  .pub-cat { font-size: 12px; color: light-dark(#555e6c, #a7b0bd); }\n',
N'  .pub-name { font-size: 14px; font-weight: 600; color: var(--txt-color); margin-top: 2px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }\n',
N'  .pub-foot { display: flex; align-items: center; justify-content: space-between; gap: 8px; margin-top: 8px; }\n',
N'  .pub-price { font-size: 16px; font-weight: 700; color: var(--txt-color); font-variant-numeric: tabular-nums; }\n',
N'  .pub-cart { margin-top: 12px; width: 100%; padding: 10px; border: 0; border-radius: 8px; background: var(--primary-color); color: var(--on-primary-color, #fff); font-weight: 600; cursor: pointer; }\n',
N'<\/style>\n',
N'<div class=\"pub-grid\">",
	"Footer":"<\/div>",
	"Empty":"<div style=\"text-align:center;padding:48px 16px;color:light-dark(#555e6c,#a7b0bd);\">{{translate|Todavía no hay productos publicados}}<\/div>",
	"IsDefault":true,
	"Offline":false,
	"UserDefinedGroups":false,
	"Active":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:39:00",
	"flxUpdatedDate":"2026-09-15T08:39:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TemplateId":"flx-cat-producto-view",
	"ObjectName":"CAT_Producto",
	"TypeId":"view",
	"Descrip":"CAT_Producto view template",
	"Body":"<div class=\"padding-l\">\n',
N'<div class=\"row\">\n',
N'  <div class=\"col-12\">\n',
N'    <span class=\"txt-muted\">{{Referencia}}<\/span>\n',
N'    <h3 class=\"margin-top-s\">{{Nombre}}<\/h3>\n',
N'    {{Activo|switch:[true:<span class=\"flx-state-success\">Activo<\/span>,else:<span class=\"flx-state-danger\">Inactivo<\/span>]}}\n',
N'  <\/div>\n',
N'<\/div>\n',
N'<h4 class=\"margin-top-m\">{{translate|Detalles}}<\/h4>\n',
N'<div class=\"row margin-top-s\">\n',
N'  <div class=\"col-6\"><label class=\"txt-muted\">{{translate|Familia}}<\/label><div>{{Familia}}<\/div><\/div>\n',
N'  <div class=\"col-6\"><label class=\"txt-muted\">{{translate|Marca}}<\/label><div>{{Marca}}<\/div><\/div>\n',
N'<\/div>\n',
N'<div class=\"row margin-top-s\">\n',
N'  <div class=\"col-3\"><label class=\"txt-muted\">{{translate|Precio base}}<\/label><div>{{PrecioBase|decimal:2}} €<\/div><\/div>\n',
N'  <div class=\"col-3\"><label class=\"txt-muted\">{{translate|IVA}}<\/label><div>{{IVA|decimal:0}} %<\/div><\/div>\n',
N'  <div class=\"col-3\"><label class=\"txt-muted\">{{translate|Stock}}<\/label><div>{{Stock}} {{translate|unidades}}<\/div><\/div>\n',
N'  <div class=\"col-3\"><label class=\"txt-muted\">{{translate|Destacado}}<\/label><div>{{Destacado|switch:[true:Sí,else:No]}}<\/div><\/div>\n',
N'<\/div>\n',
N'<div class=\"row margin-top-s\"><div class=\"col-12\"><label class=\"txt-muted\">{{translate|Descripción corta}}<\/label><div>{{DescripcionCorta|isnull:—}}<\/div><\/div><\/div>\n',
N'<\/div>",
	"ViewName":"CAT_ProductoView",
	"IsDefault":true,
	"Offline":false,
	"UserDefinedGroups":false,
	"Active":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:09:00",
	"flxUpdatedDate":"2026-09-16T13:41:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TemplateId":"flx-cat-variante-list",
	"ObjectName":"CAT_Variante",
	"TypeId":"list",
	"Descrip":"CAT_Variante list template",
	"Body":"<div class=\"row row-line clickable\"><flx-navbutton type=\"openpage\" pagetypeid=\"view\" objectname=\"CAT_Producto\" objectwhere=\"(Productos.IdProducto=''{{IdProducto}}'')\" targetid=\"current\"><div class=\"col-3\">{{Talla}}<\/div><div class=\"col-3\">{{Color}}<\/div><div class=\"col-4\">{{Referencia}}<\/div><div class=\"col-2 txt-right\">{{Stock}}<\/div><\/flx-navbutton><div class=\"col-0\">{{objectmenu}}<\/div><\/div>",
	"ViewName":"CAT_VarianteList",
	"Header":"<div class=\"row row-line bold\"><div class=\"col-3\">{{translate|Talla}}<\/div><div class=\"col-3\">{{translate|Color}}<\/div><div class=\"col-4\">{{translate|Referencia}}<\/div><div class=\"col-2 txt-right\">{{translate|Stock}}<\/div><\/div>",
	"Empty":"<div class=\"padding-l txt-muted\">{{translate|Sin variantes todavía}}<\/div>",
	"IsDefault":true,
	"Offline":false,
	"UserDefinedGroups":false,
	"Active":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:09:00",
	"flxUpdatedDate":"2026-09-15T08:09:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TemplateId":"flx-cli-cliente-list",
	"ObjectName":"CLI_Cliente",
	"TypeId":"list",
	"Descrip":"CLI_Cliente list template",
	"Body":"<div class=\"row row-line clickable\"><flx-navbutton type=\"openpage\" pagetypeid=\"view\" objectname=\"CLI_Cliente\" objectwhere=\"(Clientes.IdCliente=''{{IdCliente}}'')\" targetid=\"current\"><div class=\"col-2\">{{CodigoCliente}}<\/div><div class=\"col-3 bold\">{{RazonSocial}}<\/div><div class=\"col-2\">{{CifNif}}<\/div><div class=\"col-2\">{{Tarifa}}<\/div><div class=\"col-1\">{{Comercial|isnull:—}}<\/div><div class=\"col-1\">{{Activo|switch:[true:<span class=\"flx-state-success\">Activo<\/span>,else:<span class=\"flx-state-danger\">Bloqueado<\/span>]}}<\/div><\/flx-navbutton><div class=\"col-1 txt-right\">{{objectmenu}}<\/div><\/div>",
	"ViewName":"CLI_ClienteDefaultList",
	"Header":"<div class=\"row row-line bold\"><div class=\"col-2\" data-sort=\"CodigoCliente\">{{translate|Código}}<\/div><div class=\"col-3\" data-sort=\"RazonSocial\">{{translate|Razón social}}<\/div><div class=\"col-2\">{{translate|CIF}}<\/div><div class=\"col-2\">{{translate|Tarifa}}<\/div><div class=\"col-1\">{{translate|Comercial}}<\/div><div class=\"col-1\">{{translate|Estado}}<\/div><div class=\"col-1\">{{translate|Acciones}}<\/div><\/div>",
	"Empty":"<div class=\"padding-l txt-muted\">{{translate|No hay clientes todavía}}<\/div>",
	"IsDefault":true,
	"Offline":false,
	"UserDefinedGroups":false,
	"Active":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:30:00",
	"flxUpdatedDate":"2026-09-15T18:10:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TemplateId":"flx-cli-cliente-view",
	"ObjectName":"CLI_Cliente",
	"TypeId":"view",
	"Descrip":"CLI_Cliente view template",
	"Body":"<div class=\"padding-l\">\n',
N'<div class=\"row\"><div class=\"col-12\"><h3>{{RazonSocial}}<\/h3><span class=\"txt-muted\">{{CodigoCliente}}<\/span><\/div><\/div>\n',
N'<div class=\"row margin-top-m\">\n',
N'<div class=\"col-6\"><label class=\"txt-muted\">{{translate|Nombre comercial}}<\/label><div>{{NombreComercial|isnull:—}}<\/div><\/div>\n',
N'<div class=\"col-6\"><label class=\"txt-muted\">{{translate|CIF\/NIF}}<\/label><div>{{CifNif}}<\/div><\/div>\n',
N'<\/div>\n',
N'<div class=\"row margin-top-s\">\n',
N'<div class=\"col-6\"><label class=\"txt-muted\">{{translate|Email}}<\/label><div>{{Email|isnull:—}}<\/div><\/div>\n',
N'<div class=\"col-6\"><label class=\"txt-muted\">{{translate|Teléfono}}<\/label><div>{{Telefono|isnull:—}}<\/div><\/div>\n',
N'<\/div>\n',
N'<div class=\"row margin-top-s\"><div class=\"col-12\"><label class=\"txt-muted\">{{translate|Dirección fiscal}}<\/label><div>{{DireccionFiscal|isnull:—}}<\/div><\/div><\/div>\n',
N'<div class=\"row margin-top-s\">\n',
N'<div class=\"col-4\"><label class=\"txt-muted\">{{translate|Tarifa}}<\/label><div>{{Tarifa}}<\/div><\/div>\n',
N'<div class=\"col-4\"><label class=\"txt-muted\">{{translate|Comercial}}<\/label><div>{{Comercial|isnull:—}}<\/div><\/div>\n',
N'<div class=\"col-4\"><label class=\"txt-muted\">{{translate|Activo}}<\/label><div>{{Activo|switch:[true:<span class=\"flx-state-success\">Sí<\/span>,else:<span class=\"flx-state-danger\">No<\/span>]}}<\/div><\/div>\n',
N'<\/div>\n',
N'<\/div>",
	"ViewName":"CLI_ClienteDefaultView",
	"IsDefault":true,
	"Offline":false,
	"UserDefinedGroups":false,
	"Active":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:30:00",
	"flxUpdatedDate":"2026-09-16T13:41:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TemplateId":"flx-vta-lineapedido-list",
	"ObjectName":"VTA_LineaPedido",
	"TypeId":"list",
	"Descrip":"VTA_LineaPedido list template",
	"Body":"<div class=\"row row-line\"><div class=\"col-5\"><div class=\"bold\">{{Producto}}<\/div><div class=\"txt-muted\">{{Variante|isnull:—}}<\/div><\/div><div class=\"col-2 txt-right\">{{Cantidad}}<\/div><div class=\"col-2 txt-right\">{{Precio|decimal:2}} €<\/div><div class=\"col-3 txt-right bold\">{{Subtotal|decimal:2}} €<\/div><\/div>",
	"ViewName":"VTA_LineaPedidoDefaultList",
	"Header":"<div class=\"row row-line bold\"><div class=\"col-5\">{{translate|Producto}}<\/div><div class=\"col-2 txt-right\">{{translate|Cantidad}}<\/div><div class=\"col-2 txt-right\">{{translate|Precio}}<\/div><div class=\"col-3 txt-right\">{{translate|Subtotal}}<\/div><\/div>",
	"Empty":"<div class=\"padding-l txt-muted\">{{translate|Sin líneas todavía}}<\/div>",
	"IsDefault":true,
	"Offline":false,
	"UserDefinedGroups":false,
	"Active":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:32:00",
	"flxUpdatedDate":"2026-09-15T08:32:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TemplateId":"flx-vta-pedido-list",
	"ObjectName":"VTA_Pedido",
	"TypeId":"list",
	"Descrip":"VTA_Pedido list template",
	"Body":"<div class=\"row row-line clickable\"><flx-navbutton type=\"openpage\" pagetypeid=\"view\" objectname=\"VTA_Pedido\" objectwhere=\"(Pedidos.IdPedido=''{{IdPedido}}'')\" targetid=\"current\"><div class=\"col-2 bold\">{{Numero}}<\/div><div class=\"col-3\">{{Cliente}}<\/div><div class=\"col-2\">{{Fecha|fromnow}}<\/div><div class=\"col-2\">{{Estado|switch:[Borrador:<span class=\"flx-state-primary\">Borrador<\/span>,Confirmado:<span class=\"flx-state-confirmed\">Confirmado<\/span>,En proceso:<span class=\"flx-state-warning\">En proceso<\/span>,Enviado:<span class=\"flx-state-shipped\">Enviado<\/span>,Entregado:<span class=\"flx-state-success\">Entregado<\/span>,Cancelado:<span class=\"flx-state-danger\">Cancelado<\/span>,else:{{Estado}}]}}<\/div><div class=\"col-2 txt-right\">{{Total|decimal:2}} €<\/div><\/flx-navbutton><div class=\"col-1 txt-right\">{{objectmenu}}<\/div><\/div>",
	"ViewName":"VTA_PedidoDefaultList",
	"Header":"<div class=\"row row-line bold\"><div class=\"col-2\" data-sort=\"Numero\">{{translate|Número}}<\/div><div class=\"col-3\">{{translate|Cliente}}<\/div><div class=\"col-2\" data-sort=\"Fecha\">{{translate|Fecha}}<\/div><div class=\"col-2\">{{translate|Estado}}<\/div><div class=\"col-2 txt-right\" data-sort=\"Total\">{{translate|Total}}<\/div><div class=\"col-1\">{{translate|Acciones}}<\/div><\/div>",
	"Empty":"<div class=\"padding-l txt-muted\">{{translate|No hay pedidos todavía}}<\/div>",
	"IsDefault":false,
	"Offline":false,
	"UserDefinedGroups":false,
	"Active":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:31:00",
	"flxUpdatedDate":"2026-09-15T18:10:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TemplateId":"flx-vta-pedido-recent-list",
	"ObjectName":"VTA_Pedido",
	"TypeId":"list",
	"Descrip":"Widget de pedidos recientes del panel de control",
	"Body":"<div class=\"row row-line clickable\"><flx-navbutton type=\"openpage\" pagetypeid=\"view\" objectname=\"VTA_Pedido\" objectwhere=\"(Pedidos.IdPedido=''{{IdPedido}}'')\" targetid=\"current\"><div class=\"col-2 bold\">{{Numero}}<\/div><div class=\"col-3\">{{Cliente}}<\/div><div class=\"col-2\">{{Estado|switch:[Borrador:<span class=\"flx-state-primary\">Borrador<\/span>,Confirmado:<span class=\"flx-state-confirmed\">Confirmado<\/span>,En proceso:<span class=\"flx-state-warning\">En proceso<\/span>,Enviado:<span class=\"flx-state-shipped\">Enviado<\/span>,Entregado:<span class=\"flx-state-success\">Entregado<\/span>,Cancelado:<span class=\"flx-state-danger\">Cancelado<\/span>,else:{{Estado}}]}}<\/div><div class=\"col-2 txt-right\">{{Total|decimal:2}} €<\/div><div class=\"col-3 txt-right txt-muted\">{{Fecha|fromnow}}<\/div><\/flx-navbutton><\/div>",
	"ViewName":"VTA_PedidoDefaultList",
	"Header":"<div class=\"row row-line bold\"><div class=\"col-2\">{{translate|Pedido}}<\/div><div class=\"col-3\">{{translate|Cliente}}<\/div><div class=\"col-2\">{{translate|Estado}}<\/div><div class=\"col-2 txt-right\">{{translate|Total}}<\/div><div class=\"col-3 txt-right\">{{translate|Fecha}}<\/div><\/div>",
	"Empty":"<div class=\"padding-l txt-muted\">{{translate|No hay pedidos todavía}}<\/div>",
	"IsDefault":true,
	"Offline":false,
	"UserDefinedGroups":false,
	"Active":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T16:37:00",
	"flxUpdatedDate":"2026-09-16T17:39:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TemplateId":"flx-vta-pedido-view",
	"ObjectName":"VTA_Pedido",
	"TypeId":"view",
	"Descrip":"VTA_Pedido view template",
	"Body":"<div class=\"padding-l\">\n',
N'<div class=\"row\">\n',
N'  <div class=\"col-12\">\n',
N'    <span class=\"txt-muted\">{{Numero}}<\/span>\n',
N'    <h3 class=\"margin-top-s\">{{translate|Pedido de}} {{Cliente}}<\/h3>\n',
N'    {{Estado|switch:[Borrador:<span class=\"flx-state-primary\">Borrador<\/span>,Confirmado:<span class=\"flx-state-tools\">Confirmado<\/span>,En proceso:<span class=\"flx-state-warning\">En proceso<\/span>,Enviado:<span class=\"flx-state-tools\">Enviado<\/span>,Entregado:<span class=\"flx-state-success\">Entregado<\/span>,Cancelado:<span class=\"flx-state-danger\">Cancelado<\/span>,else:{{Estado}}]}}\n',
N'  <\/div>\n',
N'<\/div>\n',
N'<h4 class=\"margin-top-m\">{{translate|Detalles}}<\/h4>\n',
N'<div class=\"row margin-top-s\">\n',
N'  <div class=\"col-4\"><label class=\"txt-muted\">{{translate|Cliente}}<\/label><div>{{Cliente}}<\/div><\/div>\n',
N'  <div class=\"col-4\"><label class=\"txt-muted\">{{translate|Fecha}}<\/label><div>{{Fecha|date:DD\/MM\/YYYY}}<\/div><\/div>\n',
N'  <div class=\"col-4\"><label class=\"txt-muted\">{{translate|Forma de pago}}<\/label><div>{{FormaPago|isnull:—}}<\/div><\/div>\n',
N'<\/div>\n',
N'<div class=\"row margin-top-s\"><div class=\"col-12\"><label class=\"txt-muted\">{{translate|Dirección de entrega}}<\/label><div>{{DireccionEntrega|isnull:—}}<\/div><\/div><\/div>\n',
N'<div class=\"row margin-top-m\">\n',
N'  <div class=\"col-4\"><label class=\"txt-muted\">{{translate|Base imponible}}<\/label><div>{{BaseImponible|decimal:2}} €<\/div><\/div>\n',
N'  <div class=\"col-4\"><label class=\"txt-muted\">{{translate|Total pedido}}<\/label><div class=\"bold\">{{Total|decimal:2}} €<\/div><\/div>\n',
N'<\/div>\n',
N'<h4 class=\"margin-top-m\">{{translate|Progreso del pedido}}<\/h4>\n',
N'<div class=\"row margin-top-s\">\n',
N'  <div class=\"col-2 txt-center\">{{Estado|switch:[Cancelado:<span class=\"flx-state-danger\">Cancelado<\/span>,else:<span class=\"flx-state-success\">Realizado<\/span>]}}<\/div>\n',
N'  <div class=\"col-2 txt-center\">{{Estado|switch:[Borrador:<span class=\"txt-muted\">Confirmado<\/span>,Cancelado:<span class=\"txt-muted\">Confirmado<\/span>,else:<span class=\"flx-state-success\">Confirmado<\/span>]}}<\/div>\n',
N'  <div class=\"col-2 txt-center\">{{Estado|switch:[En proceso:<span class=\"flx-state-success\">En proceso<\/span>,Enviado:<span class=\"flx-state-success\">En proceso<\/span>,Entregado:<span class=\"flx-state-success\">En proceso<\/span>,else:<span class=\"txt-muted\">En proceso<\/span>]}}<\/div>\n',
N'  <div class=\"col-2 txt-center\">{{Estado|switch:[Enviado:<span class=\"flx-state-success\">Enviado<\/span>,Entregado:<span class=\"flx-state-success\">Enviado<\/span>,else:<span class=\"txt-muted\">Enviado<\/span>]}}<\/div>\n',
N'  <div class=\"col-2 txt-center\">{{Estado|switch:[Entregado:<span class=\"flx-state-success\">Entregado<\/span>,else:<span class=\"txt-muted\">Entregado<\/span>]}}<\/div>\n',
N'<\/div>\n',
N'<\/div>",
	"ViewName":"VTA_PedidoView",
	"IsDefault":true,
	"Offline":false,
	"UserDefinedGroups":false,
	"Active":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:32:00",
	"flxUpdatedDate":"2026-09-16T13:41:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Objects_Templates] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[TemplateId] nvarchar(50) '$.TemplateId'
,[ObjectName] nvarchar(50) '$.ObjectName'
,[TypeId] nvarchar(50) '$.TypeId'
,[Descrip] nvarchar(500) '$.Descrip'
,[Body] nvarchar(max) '$.Body'
,[ViewName] nvarchar(255) '$.ViewName'
,[WhereSentence] nvarchar(1000) '$.WhereSentence'
,[Header] nvarchar(max) '$.Header'
,[Footer] nvarchar(max) '$.Footer'
,[Empty] nvarchar(max) '$.Empty'
,[ModuleClass] nvarchar(100) '$.ModuleClass'
,[IsDefault] bit '$.IsDefault'
,[Offline] bit '$.Offline'
,[UserDefinedGroups] bit '$.UserDefinedGroups'
,[Active] bit '$.Active'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([TemplateId],[ObjectName],[TypeId],[Descrip],[Body],[ViewName],[WhereSentence],[Header],[Footer],[Empty],[ModuleClass],[IsDefault],[Offline],[UserDefinedGroups],[Active],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[TemplateId] = Source.[TemplateId])
WHEN MATCHED AND (
	NULLIF(Source.[ObjectName], Target.[ObjectName]) IS NOT NULL OR NULLIF(Target.[ObjectName], Source.[ObjectName]) IS NOT NULL OR 
	NULLIF(Source.[TypeId], Target.[TypeId]) IS NOT NULL OR NULLIF(Target.[TypeId], Source.[TypeId]) IS NOT NULL OR 
	NULLIF(Source.[Descrip], Target.[Descrip]) IS NOT NULL OR NULLIF(Target.[Descrip], Source.[Descrip]) IS NOT NULL OR 
	NULLIF(Source.[Body], Target.[Body]) IS NOT NULL OR NULLIF(Target.[Body], Source.[Body]) IS NOT NULL OR 
	NULLIF(Source.[ViewName], Target.[ViewName]) IS NOT NULL OR NULLIF(Target.[ViewName], Source.[ViewName]) IS NOT NULL OR 
	NULLIF(Source.[WhereSentence], Target.[WhereSentence]) IS NOT NULL OR NULLIF(Target.[WhereSentence], Source.[WhereSentence]) IS NOT NULL OR 
	NULLIF(Source.[Header], Target.[Header]) IS NOT NULL OR NULLIF(Target.[Header], Source.[Header]) IS NOT NULL OR 
	NULLIF(Source.[Footer], Target.[Footer]) IS NOT NULL OR NULLIF(Target.[Footer], Source.[Footer]) IS NOT NULL OR 
	NULLIF(Source.[Empty], Target.[Empty]) IS NOT NULL OR NULLIF(Target.[Empty], Source.[Empty]) IS NOT NULL OR 
	NULLIF(Source.[ModuleClass], Target.[ModuleClass]) IS NOT NULL OR NULLIF(Target.[ModuleClass], Source.[ModuleClass]) IS NOT NULL OR 
	NULLIF(Source.[IsDefault], Target.[IsDefault]) IS NOT NULL OR NULLIF(Target.[IsDefault], Source.[IsDefault]) IS NOT NULL OR 
	NULLIF(Source.[Offline], Target.[Offline]) IS NOT NULL OR NULLIF(Target.[Offline], Source.[Offline]) IS NOT NULL OR 
	NULLIF(Source.[UserDefinedGroups], Target.[UserDefinedGroups]) IS NOT NULL OR NULLIF(Target.[UserDefinedGroups], Source.[UserDefinedGroups]) IS NOT NULL OR 
	NULLIF(Source.[Active], Target.[Active]) IS NOT NULL OR NULLIF(Target.[Active], Source.[Active]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [ObjectName] = Source.[ObjectName], 
  [TypeId] = Source.[TypeId], 
  [Descrip] = Source.[Descrip], 
  [Body] = Source.[Body], 
  [ViewName] = Source.[ViewName], 
  [WhereSentence] = Source.[WhereSentence], 
  [Header] = Source.[Header], 
  [Footer] = Source.[Footer], 
  [Empty] = Source.[Empty], 
  [ModuleClass] = Source.[ModuleClass], 
  [IsDefault] = Source.[IsDefault], 
  [Offline] = Source.[Offline], 
  [UserDefinedGroups] = Source.[UserDefinedGroups], 
  [Active] = Source.[Active], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([TemplateId],[ObjectName],[TypeId],[Descrip],[Body],[ViewName],[WhereSentence],[Header],[Footer],[Empty],[ModuleClass],[IsDefault],[Offline],[UserDefinedGroups],[Active],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[TemplateId],Source.[ObjectName],Source.[TypeId],Source.[Descrip],Source.[Body],Source.[ViewName],Source.[WhereSentence],Source.[Header],Source.[Footer],Source.[Empty],Source.[ModuleClass],Source.[IsDefault],Source.[Offline],Source.[UserDefinedGroups],Source.[Active],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
WHEN NOT MATCHED BY SOURCE AND TARGET.OriginId = 1 THEN 
 DELETE
;
END TRY
BEGIN CATCH
    DECLARE @ERRORNUMBER	INT,@ERRORMSG		VARCHAR(MAX),@ERRORSTATE		INT
    SELECT @ERRORNUMBER = 50000 + ERROR_NUMBER(),@ERRORMSG = ERROR_MESSAGE(), @ERRORSTATE = ERROR_STATE();
    THROW @ERRORNUMBER, @ERRORMSG, @ERRORSTATE
END CATCH
GO





