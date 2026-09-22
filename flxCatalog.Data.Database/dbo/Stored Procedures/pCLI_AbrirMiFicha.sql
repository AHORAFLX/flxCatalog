CREATE   PROCEDURE [dbo].[pCLI_AbrirMiFicha]
  @CurrentReference NVARCHAR(50) = NULL
AS
BEGIN
  SET NOCOUNT ON;
  IF @CurrentReference IS NULL
  BEGIN
    RAISERROR (N'No se pudo identificar al cliente actual.', 16, 1);
    RETURN 0;
  END

  DECLARE @JsCode NVARCHAR(MAX);
  SET @JsCode = N'flexygo.nav.openPageName(' + CHAR(39) + N'CLI_Cliente_Mi_Ficha_View' + CHAR(39) + N',' + CHAR(39) + N'CLI_Cliente' + CHAR(39) + N',"(Clientes.IdCliente=' + CHAR(39) + @CurrentReference + CHAR(39) + N')",null,' + CHAR(39) + N'current' + CHAR(39) + N');';

  SELECT @JsCode AS JSCode, 0 AS Refresh;
  RETURN 1;
END
GO
