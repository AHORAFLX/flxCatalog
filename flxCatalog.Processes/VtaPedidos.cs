using FLEXYGO.Data;
using FLEXYGO.Objects;
using Microsoft.Data.SqlClient;
using System.Data;
using System.Data.Common;
using System.Globalization;
using static FLEXYGO.Processing.ProcessManager;
using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;

namespace flxCatalog_processes
{
    public class VtaPedidos
    {
        /// <summary>
        ///     ''' Genera un PDF básico de la ficha de pedido (cliente, líneas, totales) y lo descarga en el navegador.
        ///     ''' </summary>
        public static bool GenerarPdfPedido(string IdPedido, EntityObject Entity, ref ProcessHelper Ret)
        {
            DataManager dm = new DataManager(Ret.ConfToken.UserSecurity.ConnectionStrings["DataConnectionString"]);
            try
            {
                // El id llega como texto desde la plantilla; se valida como GUID antes de usarlo
                // y se pasa siempre como parámetro — nunca concatenado en el SQL.
                string idPedido = Guid.Parse(IdPedido).ToString();

                DataTable cabecera = dm.DataTable(
                    @"SELECT p.Numero, p.Fecha, p.FormaPago, p.DireccionEntrega, p.Total,
                              c.RazonSocial, c.CifNif, c.DireccionFiscal, c.Email,
                              e.Nombre AS Estado
                       FROM Pedidos p
                       LEFT JOIN Clientes c ON c.IdCliente = p.IdCliente
                       LEFT JOIN Pedidos_Estados e ON e.IdEstado = p.IdEstado
                       WHERE p.IdPedido = @IdPedido",
                    new List<DbParameter> { new SqlParameter("@IdPedido", SqlDbType.NVarChar, 50) { Value = idPedido } });

                if (cabecera.Rows.Count == 0)
                {
                    Ret.Success = false;
                    Ret.LastException = new Exception("El pedido no existe.");
                    return false;
                }
                DataRow ped = cabecera.Rows[0];

                DataTable lineas = dm.DataTable(
                    @"SELECT pr.Nombre AS Producto, l.Cantidad, l.Precio, l.Subtotal
                       FROM Pedidos_Lineas l
                       LEFT JOIN Productos pr ON pr.IdProducto = l.IdProducto
                       WHERE l.IdPedido = @IdPedido",
                    new List<DbParameter> { new SqlParameter("@IdPedido", SqlDbType.NVarChar, 50) { Value = idPedido } });

                QuestPDF.Settings.License = LicenseType.Community;

                byte[] pdf = QuestPDF.Fluent.Document.Create(container =>
                {
                    container.Page(page =>
                    {
                        page.Size(PageSizes.A4);
                        page.Margin(30);
                        page.DefaultTextStyle(x => x.FontSize(10));

                        page.Header().Column(col =>
                        {
                            col.Item().Text($"Pedido {ped["Numero"]}").FontSize(18).Bold();
                            col.Item().Text($"Estado: {ped["Estado"]}").FontSize(10);
                        });

                        page.Content().PaddingVertical(15).Column(col =>
                        {
                            col.Item().Text("Cliente").Bold();
                            col.Item().Text(Convert.ToString(ped["RazonSocial"]));
                            col.Item().Text($"CIF/NIF: {ped["CifNif"]}");
                            col.Item().Text(Convert.ToString(ped["DireccionFiscal"]));
                            col.Item().Text(Convert.ToString(ped["Email"]));

                            col.Item().PaddingTop(10).Text("Entrega").Bold();
                            col.Item().Text($"Fecha: {Convert.ToDateTime(ped["Fecha"]):dd/MM/yyyy}");
                            col.Item().Text($"Dirección: {ped["DireccionEntrega"]}");
                            col.Item().Text($"Forma de pago: {ped["FormaPago"]}");

                            col.Item().PaddingTop(15).Table(table =>
                            {
                                table.ColumnsDefinition(c =>
                                {
                                    c.RelativeColumn(3);
                                    c.RelativeColumn(1);
                                    c.RelativeColumn(1);
                                    c.RelativeColumn(1);
                                });

                                table.Header(h =>
                                {
                                    h.Cell().Text("Producto").Bold();
                                    h.Cell().Text("Cantidad").Bold();
                                    h.Cell().Text("Precio").Bold();
                                    h.Cell().Text("Subtotal").Bold();
                                });

                                foreach (DataRow l in lineas.Rows)
                                {
                                    table.Cell().Text(Convert.ToString(l["Producto"]));
                                    table.Cell().Text(Convert.ToString(l["Cantidad"]));
                                    table.Cell().Text(Convert.ToDecimal(l["Precio"]).ToString("N2", new CultureInfo("es-ES")) + " €");
                                    table.Cell().Text(Convert.ToDecimal(l["Subtotal"]).ToString("N2", new CultureInfo("es-ES")) + " €");
                                }
                            });

                            col.Item().PaddingTop(10).AlignRight().Text($"Total: {Convert.ToDecimal(ped["Total"]).ToString("N2", new CultureInfo("es-ES"))} €").FontSize(13).Bold();
                        });

                        page.Footer().AlignCenter().Text(x =>
                        {
                            x.Span("flxCatalog — documento generado automáticamente, sin validez fiscal.").FontSize(8);
                        });
                    });
                }).GeneratePdf();

                string b64 = Convert.ToBase64String(pdf);
                string fileName = $"Pedido_{ped["Numero"]}.pdf".Replace("'", "");
                Ret.JSCode = "(function(){" +
                    $"var b='{b64}';var s=atob(b);var n=s.length;var u=new Uint8Array(n);" +
                    "while(n--){u[n]=s.charCodeAt(n);}" +
                    "var blob=new Blob([u],{type:'application/pdf'});" +
                    "var a=document.createElement('a');" +
                    $"a.href=URL.createObjectURL(blob);a.download='{fileName}';" +
                    "document.body.appendChild(a);a.click();document.body.removeChild(a);" +
                    "setTimeout(function(){URL.revokeObjectURL(a.href);},100);})();";
                Ret.SuccessMessage = "PDF generado.";
                Ret.Success = true;
                return true;
            }
            catch (Exception ex)
            {
                Ret.Success = false;
                Ret.LastException = ex;
                return false;
            }
            finally
            {
                dm?.Close();
            }
        }
    }
}
