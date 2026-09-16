# Gaps

What was asked for that this server does not know how to do, recorded so it can be prioritised.

## 2026-09-15 · datos-semilla

**Asked for:** Ejecutar (EXEC) un stored procedure ya creado en la base de datos de la aplicación, para poder reutilizarlo como reset de datos de demostración repetible.

**Tried:** flexygo_execute_dml con 'EXEC dbo.pSeed_ResetDemoData;' — rechazado explícitamente: "Statement type 'ExecuteStatement' is not allowed. Allowed: CREATE/ALTER/DROP TABLE, ... INSERT, UPDATE, DELETE, MERGE, SELECT." Ni flexygo_execute_ddl ni flexygo_execute_query lo admiten tampoco (ambos redirigen fuera de su ámbito). No existe ninguna herramienta en este servidor para invocar EXEC sobre un procedimiento.

**Resolved:** El procedimiento queda creado en la base de datos para que el usuario lo ejecute él mismo cuando quiera (SSMS, una tarea programada, etc.). Para sembrar los datos de esta pasada, ejecuté directamente las mismas sentencias DELETE/INSERT/UPDATE del cuerpo del procedimiento vía flexygo_execute_dml (sustituyendo las variables por GUID literales), en vez de EXEC. No es un parche silencioso: el procedimiento sigue existiendo tal cual para uso futuro, esta vez solo se evitó la única vía de invocarlo que falta.

## 2026-09-15 · paleta-skin2026

**Asked for:** Aplicar la paleta aprobada del diseño (NavColor, txtNavColor, HeaderColor, bgColor, OutstandingColor, PrimaryColor) al usuario real de este proyecto, cuyo perfil usa la interfaz 'web2026' con la skin 'skin2026', no la 'flexy2022'/'webdefault' por defecto.

**Tried:** flexygo_set_skin_variable actualiza dbo.Skins_Variables para la skin 'flexy2022' en exclusiva (no acepta parámetro de skin). Medido en vivo durante /flx-verify: la variable CSS --nav-color en la pantalla real resuelve a light-dark(#191d22,#191d22) — el valor propio de skin2026, no el #1c1b1d que se configuró en flexy2022.

**Resolved:** No resuelto. La paleta queda aplicada correctamente en flexy2022/webdefault (perfil sin usuarios reales) pero no en skin2026 (el perfil que sí usa el usuario). Se deja anotado como hueco de plataforma; no hay forma de rodearlo sin escribir SQL directo sobre dbo.Skins_Variables de skin2026, que ninguna herramienta de este servidor expone.

## 2026-09-16 · object-views

**Asked for:** Establecer un orden por defecto fiable en la lista de un object-list module, sin recurrir a un sqllist ni a click-to-sort.

**Tried:** flexygo_create_view y flexygo_update_view solo exponen `sqlSentence` (que además rechaza explícitamente ORDER BY). Ninguna herramienta de este servidor lee ni escribe la columna OrderBy de Objects_Views, que sí existe en la base de configuración y se edita a mano desde la propia pantalla de administración de Flexygo ("Ordenar por", bajo la Sentencia SQL).

**Resolved:** No resuelto por este servidor — lo resolvió el usuario directamente en la pantalla de administración de Flexygo, rellenando ese campo con "ORDER BY Familias.OrdenJerarquico".
