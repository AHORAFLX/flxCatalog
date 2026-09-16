# Incidents

What went wrong while building this, with what came back word for word. ⚠️ This file is meant to be SENT to whoever supports the installation: it must carry no connection strings, no passwords and no business data.

⛔ **Read this as a list of LEADS, not a list of defects.** Every entry has two halves and they are not worth the same: what CAME BACK is measured and can be checked by searching for it; what was CONCLUDED is somebody's reading of it and has been wrong before. Check the literal before opening a ticket against anything.

## 2026-09-15 · catalogo-demo · modules · worked-around

**Trying to:** Activar el buscador (Searcher=true) en los listados de Producto, Familia, Marca, Cliente y Pedido, cuya barra de herramientas (con el botón de Filtro) vive en la cabecera del módulo.

**Came back, word for word:**

```
.pageContainer flx-module:has(> .cntHeader > .moduleToolbar) > .cntBodyHeader:not(:has(.item[data-label])):not(:has(.moduleButtons .btn)) { display: none }
```

**Said by:** the browser (CSS de la plataforma, skinBundle.css)

**What was done:** Regla de project plugin (flx-dashboard.css) con display:block !important sobre .cntBodyHeader:has(.listSearcher), con ámbito a los 6 módulos de listado de este proyecto (no a toda la instalación). Comprobado: el buscador filtra de verdad al escribir.

**What I concluded — a reading, not a measurement:** La regla de la plataforma oculta .cntBodyHeader cuando no contiene un chip de filtro ni un botón, sin contar el buscador inline (.listSearcher) como contenido — así que activar Searcher en cualquier lista cuya barra viva en la cabecera lo deja en el DOM con 0×0 y offsetParent=false, invisible pese a existir.

## 2026-09-15 · catalogo-demo · database · worked-around

**Trying to:** Ejecutar (EXEC) el stored procedure pSeed_ResetDemoData ya creado, para sembrar los datos de prueba del desarrollo.

**Came back, word for word:**

```
Statement type 'ExecuteStatement' is not allowed. Allowed: CREATE/ALTER/DROP TABLE, ... INSERT, UPDATE, DELETE, MERGE, SELECT.
```

**Said by:** flexygo tool (flexygo_execute_dml)

**What was done:** Registrado también como hueco de plataforma (área datos-semilla en gaps.md). Sembrado ejecutando directamente las mismas sentencias DELETE/INSERT/UPDATE del cuerpo del procedimiento, con GUID literales en vez de DECLARE.

**What I concluded — a reading, not a measurement:** Ninguna herramienta de este servidor admite EXEC sobre un procedimiento ya creado.

## 2026-09-15 · catalogo-demo · platform · open

**Trying to:** Aplicar la paleta aprobada del diseño al usuario real del proyecto, cuyo perfil usa la interfaz web2026 con la skin skin2026.

**Came back, word for word:**

```
Updates a single CSS skin variable in dbo.Skins_Variables for skin 'flexy2022' — sin parámetro para elegir otra skin.
```

**Said by:** flexygo tool (flexygo_set_skin_variable)

**What was done:** Registrado como hueco de plataforma (área paleta-skin2026 en gaps.md). No resuelto.

**What I concluded — a reading, not a measurement:** La paleta solo se pudo aplicar a flexy2022/webdefault (perfil sin usuarios reales); el usuario real ve la paleta por defecto de skin2026, medida en pantalla como --nav-color: #191d22 en vez del #1c1b1d configurado.
