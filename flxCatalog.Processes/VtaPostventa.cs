using FLEXYGO.Data;
using FLEXYGO.Objects;
using Microsoft.Data.SqlClient;
using System.Data;
using System.Data.Common;
using static FLEXYGO.Processing.ProcessManager;

namespace flxCatalog_processes
{
    public class VtaPostventa
    {
        /// <summary>
        ///     ''' Solicita la devolución de una línea de pedido, para el rol cliente. Valida que la
        ///     ''' cantidad solicitada no supere las unidades de esa línea menos lo ya devuelto en
        ///     ''' devoluciones previas que no estén Rechazada ni Cancelada. Si es válida, crea la
        ///     ''' devolución en estado 'Solicitada'. Si no, no crea nada y devuelve un error claro.
        ///     ''' </summary>
        public static bool SolicitarDevolucion(string IdLinea, int Cantidad, string Motivo, string Comentario, EntityObject Entity, ref ProcessHelper Ret)
        {
            DataManager dm = new DataManager(Ret.ConfToken.UserSecurity.ConnectionStrings["DataConnectionString"]);
            try
            {
                string idLinea = Guid.Parse(IdLinea).ToString();

                if (Cantidad <= 0)
                {
                    Ret.Success = false;
                    Ret.LastException = new Exception("La cantidad a devolver debe ser mayor que cero.");
                    return false;
                }
                if (string.IsNullOrWhiteSpace(Motivo))
                {
                    Ret.Success = false;
                    Ret.LastException = new Exception("Indica el motivo de la devolución.");
                    return false;
                }

                // La línea, su pedido y el cliente propietario del pedido — nunca concatenado, siempre parametrizado.
                DataTable linea = dm.DataTable(
                    @"SELECT pl.IdPedido, pl.Cantidad AS CantidadPedida, p.IdCliente, e.Nombre AS EstadoPedido
                       FROM Pedidos_Lineas pl
                       JOIN Pedidos p ON p.IdPedido = pl.IdPedido
                       JOIN Pedidos_Estados e ON e.IdEstado = p.IdEstado
                       WHERE pl.IdLinea = @IdLinea",
                    new List<DbParameter> { new SqlParameter("@IdLinea", SqlDbType.NVarChar, 50) { Value = idLinea } });

                if (linea.Rows.Count == 0)
                {
                    Ret.Success = false;
                    Ret.LastException = new Exception("La línea de pedido no existe.");
                    return false;
                }

                DataRow fila = linea.Rows[0];
                string idPedido = Convert.ToString(fila["IdPedido"]);
                string idClientePedido = Convert.ToString(fila["IdCliente"]);
                int cantidadPedida = Convert.ToInt32(fila["CantidadPedida"]);

                string clienteActual = Ret.ConfToken.UserSecurity.Reference;
                if (!string.IsNullOrEmpty(clienteActual) && !string.Equals(idClientePedido, clienteActual, StringComparison.OrdinalIgnoreCase))
                {
                    Ret.Success = false;
                    Ret.LastException = new Exception("No tienes permiso sobre este pedido.");
                    return false;
                }

                // Solo se devuelve lo que ya ha llegado.
                string estadoPedido = Convert.ToString(fila["EstadoPedido"]);
                if (!string.Equals(estadoPedido, "Entregado", StringComparison.OrdinalIgnoreCase))
                {
                    Ret.Success = false;
                    Ret.LastException = new Exception($"Solo se puede pedir la devolución de un pedido entregado (estado actual: {estadoPedido}).");
                    return false;
                }

                // Unidades ya devueltas (o en trámite) de esta línea: se excluyen Rechazada y Cancelada.
                DataTable yaDevueltoTabla = dm.DataTable(
                    @"SELECT ISNULL(SUM(d.Cantidad), 0) AS YaDevuelto
                       FROM Devoluciones d
                       JOIN Devoluciones_Estados e ON e.IdEstado = d.IdEstado
                       WHERE d.IdLinea = @IdLinea AND e.Nombre NOT IN (N'Rechazada', N'Cancelada')",
                    new List<DbParameter> { new SqlParameter("@IdLinea", SqlDbType.NVarChar, 50) { Value = idLinea } });

                int yaDevuelto = Convert.ToInt32(yaDevueltoTabla.Rows[0]["YaDevuelto"]);
                int disponible = cantidadPedida - yaDevuelto;

                if (Cantidad > disponible)
                {
                    Ret.Success = false;
                    Ret.LastException = new Exception(
                        $"Solo puedes solicitar la devolución de hasta {disponible} unidad(es) de esta línea " +
                        $"(pedidas: {cantidadPedida}, ya devueltas o en trámite: {yaDevuelto}).");
                    return false;
                }

                // GUID fijo de 'Solicitada': VTA_Devolucion.IdEstado lo lleva grabado como DefaultValue.
                const string idEstadoSolicitada = "CB6E0913-0A81-4C7B-BC78-925F53FCF836";

                var parametros = new List<DbParameter>
                {
                    new SqlParameter("@IdDevolucion", SqlDbType.NVarChar, 50) { Value = Guid.NewGuid().ToString() },
                    new SqlParameter("@IdPedido", SqlDbType.NVarChar, 50) { Value = idPedido },
                    new SqlParameter("@IdLinea", SqlDbType.NVarChar, 50) { Value = idLinea },
                    new SqlParameter("@Cantidad", SqlDbType.Int) { Value = Cantidad },
                    new SqlParameter("@Motivo", SqlDbType.NVarChar, 200) { Value = Motivo },
                    new SqlParameter("@Comentario", SqlDbType.NVarChar, 500) { Value = (object)Comentario ?? DBNull.Value },
                    new SqlParameter("@IdEstado", SqlDbType.NVarChar, 50) { Value = idEstadoSolicitada }
                };

                int filas = dm.ExecuteSql(
                    @"INSERT INTO Devoluciones (IdDevolucion, IdPedido, IdLinea, Cantidad, Motivo, Comentario, IdEstado, FechaSolicitud, Activo)
                       VALUES (@IdDevolucion, @IdPedido, @IdLinea, @Cantidad, @Motivo, @Comentario, @IdEstado, SYSDATETIME(), 1)",
                    parametros);
                if (filas <= 0)
                {
                    Ret.Success = false;
                    Ret.LastException = dm.LastException ?? new Exception("No se pudo registrar la devolución.");
                    return false;
                }

                Ret.SuccessMessage = "Devolución solicitada. Quedará pendiente de revisión.";
                Ret.Refresh = true;
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

        /// <summary>
        ///     ''' Solicita una incidencia sobre un pedido, para el rol cliente. Sin validación de
        ///     ''' cantidad (no aplica): crea la incidencia directamente en su estado inicial 'Abierta'.
        ///     ''' </summary>
        public static bool SolicitarIncidencia(string IdPedido, string IdTipo, string Descripcion, EntityObject Entity, ref ProcessHelper Ret)
        {
            DataManager dm = new DataManager(Ret.ConfToken.UserSecurity.ConnectionStrings["DataConnectionString"]);
            try
            {
                string idPedido = Guid.Parse(IdPedido).ToString();
                string idTipo = Guid.Parse(IdTipo).ToString();

                if (string.IsNullOrWhiteSpace(Descripcion))
                {
                    Ret.Success = false;
                    Ret.LastException = new Exception("Describe la incidencia.");
                    return false;
                }

                DataTable pedido = dm.DataTable(
                    @"SELECT p.IdCliente, e.Nombre AS EstadoPedido
                       FROM Pedidos p
                       JOIN Pedidos_Estados e ON e.IdEstado = p.IdEstado
                       WHERE p.IdPedido = @IdPedido",
                    new List<DbParameter> { new SqlParameter("@IdPedido", SqlDbType.NVarChar, 50) { Value = idPedido } });

                if (pedido.Rows.Count == 0)
                {
                    Ret.Success = false;
                    Ret.LastException = new Exception("El pedido no existe.");
                    return false;
                }

                string idClientePedido = Convert.ToString(pedido.Rows[0]["IdCliente"]);
                string clienteActual = Ret.ConfToken.UserSecurity.Reference;
                if (!string.IsNullOrEmpty(clienteActual) && !string.Equals(idClientePedido, clienteActual, StringComparison.OrdinalIgnoreCase))
                {
                    Ret.Success = false;
                    Ret.LastException = new Exception("No tienes permiso sobre este pedido.");
                    return false;
                }

                // Un carrito (Borrador) todavía no es un pedido: no hay nada sobre lo que reclamar.
                string estadoPedido = Convert.ToString(pedido.Rows[0]["EstadoPedido"]);
                if (string.Equals(estadoPedido, "Borrador", StringComparison.OrdinalIgnoreCase))
                {
                    Ret.Success = false;
                    Ret.LastException = new Exception("No se puede abrir una incidencia sobre un pedido en Borrador: confírmalo antes.");
                    return false;
                }

                // Ningún DefaultValue graba el GUID de 'Abierta' (a diferencia de 'Solicitada' en
                // devoluciones), así que se resuelve por nombre en cada llamada.
                DataTable estadoInicial = dm.DataTable(
                    "SELECT TOP 1 IdEstado FROM Incidencias_Estados WHERE Nombre = N'Abierta'", null);

                if (estadoInicial.Rows.Count == 0)
                {
                    Ret.Success = false;
                    Ret.LastException = new Exception("No se encuentra el estado inicial 'Abierta' de incidencias.");
                    return false;
                }
                string idEstadoAbierta = Convert.ToString(estadoInicial.Rows[0]["IdEstado"]);

                var parametros = new List<DbParameter>
                {
                    new SqlParameter("@IdIncidencia", SqlDbType.NVarChar, 50) { Value = Guid.NewGuid().ToString() },
                    new SqlParameter("@IdPedido", SqlDbType.NVarChar, 50) { Value = idPedido },
                    new SqlParameter("@IdTipo", SqlDbType.NVarChar, 50) { Value = idTipo },
                    new SqlParameter("@IdEstado", SqlDbType.NVarChar, 50) { Value = idEstadoAbierta },
                    new SqlParameter("@Descripcion", SqlDbType.NVarChar, 500) { Value = Descripcion }
                };

                int filas = dm.ExecuteSql(
                    @"INSERT INTO Incidencias (IdIncidencia, IdPedido, IdTipo, IdEstado, Descripcion, FechaAlta, Activo)
                       VALUES (@IdIncidencia, @IdPedido, @IdTipo, @IdEstado, @Descripcion, SYSDATETIME(), 1)",
                    parametros);
                if (filas <= 0)
                {
                    Ret.Success = false;
                    Ret.LastException = dm.LastException ?? new Exception("No se pudo registrar la incidencia.");
                    return false;
                }

                Ret.SuccessMessage = "Incidencia registrada.";
                Ret.Refresh = true;
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
