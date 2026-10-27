# Quick changes

Minor changes built through /flx-fast, outside any plan: what was asked, word for word, and what was touched. When a development was open, its slug is in the heading. ⚠️ A change listed here is not a deviation of that development's plan: it was asked for on its own.

## 2026-10-26 · pendientes-cliente-admin

**Asked, word for word:** Las barras de los charts son todas del mismo color, cada barra deberia ser de un color unico.

**Changed:** Las cuatro vistas que alimentan las gráficas de barras del Dashboard del administrador (VTA_Dashboard_Page) ya no devuelven un color fijo: VTA_DashTopArticulosVendidos, VTA_DashTopArticulosDevueltos, CLI_DashTopClientesCompras y CLI_DashTopClientesCasos asignan backgroundColor y borderColor por posición en el ranking con CHOOSE(ROW_NUMBER() OVER (ORDER BY valor DESC, etiqueta), 8 colores: #6366f1 #16a34a #d97706 #0ea5e9 #a855f7 #dc2626 #14b8a6 #ec4899). El desempate por etiqueta se añadió también al ORDER BY del TOP (8) para que el ranking sea estable. Scripts sincronizados en flxCatalog.Data.Database/dbo/Views. Los módulos de gráfica no se tocaron (leen los colores por fila desde el SQL). No se cambió la gráfica 'Ventas por mes' de HOME (serie temporal, un solo color).

## 2026-10-26 · pendientes-cliente-admin

**Asked, word for word:** Ejecutalo ya (aplicar también a «Ventas por mes» un color único por barra)

**Changed:** mod-home-ventas-mes-chart (flx-echart, página HOME): el SQL ya no devuelve '#6366f1' fijo; backgroundColor y borderColor salen por mes en orden cronológico con CHOOSE((ROW_NUMBER() OVER (ORDER BY año, mes) - 1) % 8 + 1, misma paleta de 8 colores del Dashboard). Comprobado en datos: 5 meses, 5 colores distintos. Pendiente de recargar la caché del Backend para que llegue a pantalla.

## 2026-10-26 · pendientes-cliente-admin

**Asked, word for word:** Ahora salen todas azules, quiero cada barra de un color

**Changed:** Corrección del cambio anterior: flx-chart y flx-echart toman el color por SERIE (de la primera fila de cada serie), no por fila, así que con una sola serie todas las barras salían del primer color (#6366f1). Ahora cada barra es su propia serie: en las vistas VTA_DashTopArticulosVendidos, VTA_DashTopArticulosDevueltos, CLI_DashTopClientesCompras y CLI_DashTopClientesCasos la columna serie = label (scripts de flxCatalog.Data.Database sincronizados), y en mod-home-ventas-mes-chart serie = mes. Para que no se pinten como barras agrupadas estrechas, se apilan: jsonOptions de los cuatro mod-dash-*-chart = legend oculta + scales xAxes/yAxes stacked:true (conservando beginAtZero y, en los dos de recuentos, stepSize 1 / precision 0); jsonOptions de mod-home-ventas-mes-chart = {"legend":null,"flx":{"series":{"stack":"total"}}}. Se oculta la leyenda porque tendría una entrada por barra. Pendiente: recargar la caché del Backend y verlo en pantalla.

## 2026-10-26 · pendientes-cliente-admin

**Asked, word for word:** Cambia todos los modulos de chart por echart

**Changed:** Los cuatro únicos módulos flx-chart (todos en VTA_Dashboard_Page) se sustituyen por flx-echart con la misma consulta y posición: mod-dash-top-vendidos-echart (LeftPosition 0), mod-dash-top-devueltos-echart (RightPosition 0), mod-dash-top-clientes-echart (BottomPosition 0), mod-dash-clientes-problemas-echart (BottomPosition 1); tipo horizontalbar, tema syscth-default, jsonOptions {"legend":null,"flx":{"series":{"stack":"total"}}} para un color por barra (serie = label en las vistas). Los flx-chart antiguos (mod-dash-*-chart) se retiraron de la página pero NO se borraron: el borrado fue denegado por permisos; quedan huérfanos en dbo.Modules a la espera de que el usuario decida. Test de interfaz AdminNavegacionTests.Login_AbreElDashboardConSusIndicadores actualizado a los nombres nuevos. Pendiente: recargar caché y verlo en pantalla.

## 2026-10-26 · pendientes-cliente-admin

**Asked, word for word:** Vuelve a los colores originales que habia en un principio en cada modulo.

**Changed:** Revertido el color por barra. Vistas VTA_DashTopArticulosVendidos (#6366f1, serie 'Unidades vendidas'), VTA_DashTopArticulosDevueltos (#dc2626, 'Unidades devueltas'), CLI_DashTopClientesCompras (#16a34a, 'Importe comprado') y CLI_DashTopClientesCasos (#d97706, 'Incidencias y devoluciones') restauradas a su definición original en la base de datos y en flxCatalog.Data.Database (git checkout). mod-home-ventas-mes-chart: SQL original ('Ventas', #6366f1) y jsonOptions vaciado. Los cuatro mod-dash-*-echart se quedan como ECharts (pedido anterior) con jsonOptions vaciado: sin apilar y con leyenda por defecto. Los mod-dash-*-chart clásicos, retirados de la página, recuperan sus jsonOptions originales. Pendiente: recargar caché y verlo en pantalla.

## 2026-10-26 · pendientes-cliente-admin

**Asked, word for word:** Puedes quitar la leyenda en todos los modulos del dashboard? solo tienen un valor

**Changed:** jsonOptions = {"legend":null} en las cuatro gráficas ECharts de VTA_Dashboard_Page: mod-dash-top-vendidos-echart, mod-dash-top-devueltos-echart, mod-dash-top-clientes-echart y mod-dash-clientes-problemas-echart. Cada una tiene una sola serie, así que la leyenda no aportaba nada. Pendiente: recargar caché y verlo en pantalla.
