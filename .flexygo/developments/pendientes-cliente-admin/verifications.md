# Verifications — pendientes-cliente-admin

## 2026-10-02 · affects T-08

**Checked:** Estructura del objeto VTA_MesaTrabajo (tablero único del kanban) con la comprobación de objeto; no es una verificación en pantalla.

**Against what data:** Un registro en MesasTrabajo; ninguna pantalla abierta, el Backend está parado y no se tiene la contraseña.

**Verdict:** passes

**Result:** Existe con 2 propiedades y 4 vistas. Fallan ficha de detalle, filtros y páginas de lista y ficha, y es esperado: es un tablero interno de un solo registro, sin lista ni ficha. NO se ha comprobado en pantalla que los tres kanban pinten sus tarjetas con la relación 1=1.

## 2026-10-02 · affects T-17

**Checked:** Comprobación de estructura de los seis maestros con página de lista nueva: CAT_Color, CAT_Talla, VTA_EstadoPedido, VTA_EstadoDevolucion, VTA_EstadoIncidencia y VTA_TipoIncidencia.

**Against what data:** Lectura de la configuración, sin abrir pantallas: el Backend está parado y no se tiene la contraseña.

**Verdict:** does NOT pass

**Result:** Los seis fallan igual: tienen lista (1 vista) pero ninguna vista de detalle con descriptores de campo, ni filtros, ni página de ficha. Una fila de esas listas puede no abrir su registro. Pasan existencia, propiedades y combos. Además falta el nodo de Tallas. La tarea vuelve a pendiente.

## 2026-10-02 · affects T-17

**Checked:** Estructura de los seis maestros tras completar ficha, filtros y página de ficha. Comprobación de configuración, no de pantalla.

**Against what data:** CAT_Talla y VTA_TipoIncidencia volvieron a comprobarse yo mismo con flexygo_verify_object. Los otros cuatro (CAT_Color, VTA_EstadoPedido, VTA_EstadoDevolucion, VTA_EstadoIncidencia) constan solo por el informe del agente constructor. Ninguna pantalla abierta.

**Verdict:** passes

**Result:** Los dos comprobados pasan 8 de 8 con el aviso opcional de traducción. Siguen sin verse en pantalla las listas, las fichas y el panel lateral completo. Sigue faltando el nodo «Tallas».
