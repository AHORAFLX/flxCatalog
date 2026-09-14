using FLEXYGO.Exceptions;
using FLEXYGO.Objects;
using System.Data;
using static FLEXYGO.Processing.ProcessManager;

namespace flxCatalog_processes
{
    public class flxCatalogProcesses
    {
        /// <summary>
        ///     ''' Insert new object
        ///     ''' </summary>
        ///     ''' <param name="Entity">User Entity object with all info</param>
        ///     ''' <param name="Ret">ProcessHelper for returning results</param>
        public static bool InsertObj(EntityObject Entity, ProcessHelper Ret)
        {
            try
            {
                if (!Entity.CanInsert)
                {
                    Ret.LastException = new LocalizedException("You do Not have enough credentials to insert this Object.");
                    return false;
                }

                // 'Do something here before insert


                if (Entity.InsertProcess(Entity.TableName, FLEXYGO.Objects.Settings.ObjectSettings.eUpdateType.Standard, ""))
                {

                    // 'Do something here after insert

                    Ret.Success = true;
                    return true;
                }
                else
                {
                    Ret.Success = false;
                    Ret.LastException = Entity.LastException;
                    return false;
                }
            }
            catch (Exception ex)
            {
                Ret.Success = false;
                Ret.LastException = ex;
                return false;
            }
        }

        /// <summary>
        ///     ''' Update an object.
        ///     ''' </summary>
        ///     ''' <param name="Entity">User Entity object with all info</param>
        ///     ''' <param name="Ret">ProcessHelper for returning results</param>
        public static bool UpdateObj(EntityObject Entity, ProcessHelper Ret)
        {
            try
            {
                if (!Entity.CanUpdate)
                {
                    Ret.LastException = new LocalizedException("You do Not have enough credentials to update this Object.");
                    return false;
                }

                DataTable lTabla = Entity.GetData.Tables[0].GetChanges();

                // Dim OldValue As String = lTabla.Rows(0)("my_data_field", DataRowVersion.Original)
                // Dim NewValue As String = lTabla.Rows(0)("my_data_field", DataRowVersion.Current)
                // Use this sintax to compare old and new values

                // 'Do something here before update.

                if (Entity.UpdateProcess(FLEXYGO.Objects.Settings.ObjectSettings.eUpdateType.Standard, ""))
                {


                    // 'Do something here after update.

                    Ret.Success = true;
                    return true;
                }
                else
                {
                    Ret.Success = false;
                    Ret.LastException = Entity.LastException;
                    return false;
                }
            }
            catch (Exception ex)
            {
                Ret.Success = false;
                Ret.LastException = ex;
                return false;
            }
        }

        /// <summary>
        ///     ''' Delete an object
        ///     ''' </summary>
        ///     ''' <param name="Entity">User Entity object with all info</param>
        ///     ''' <param name="Ret">ProcessHelper for returning results</param>
        public static bool DeleteObj(EntityObject Entity, ProcessHelper Ret)
        {
            try
            {
                if (!Entity.CanDelete)
                {
                    Ret.LastException = new LocalizedException("You do Not have enough credentials to delete this Object.");
                    return false;
                }

                // Do something here before delete

                if (Entity.DeleteProcess(Entity.TableName, FLEXYGO.Objects.Settings.ObjectSettings.eUpdateType.Standard, ""))
                {

                    // Do something here after delete

                    Ret.Success = true;
                    return true;
                }
                else
                {
                    Ret.Success = false;
                    Ret.LastException = Entity.LastException;
                    return false;
                }
            }
            catch (Exception ex)
            {
                Ret.Success = false;
                Ret.LastException = ex;
                return false;
            }
        }

        /// <summary>
        ///     ''' Sample object process executed from object 
        ///     ''' </summary>
        ///     ''' <param name="Entity">The entity.</param>
        ///     ''' <param name="Ret">Returns a Process Helper.</param>
        ///     ''' <returns><c>true</c> if no error, <c>false</c> otherwise.</returns>
        ///     ''' <exception cref="System.Exception">Returns error</exception>
        public static bool SampleUserProcess(EntityObject Entity, ref ProcessHelper Ret)
        {
            try
            {


                // 'Do Something

                Ret.Success = true;
                Ret.SuccessMessage = "Cache reloaded";
                return true;
            }
            catch (Exception ex)
            {
                Ret.Success = false;
                Ret.LastException = ex;
                return false;
            }
        }

        /// <summary>
        ///     ''' Sample object process executed from object with params
        ///     ''' </summary>
        ///     ''' <param name="Entity">The entity.</param>
        ///     ''' <param name="Ret">Returns a Process Helper.</param>
        ///     ''' <param name="Param1">Sample string param</param>
        ///     ''' <param name="Param2">Sample integer param</param>
        ///     ''' <returns><c>true</c> if no error, <c>false</c> otherwise.</returns>
        ///     ''' <exception cref="System.Exception">Returns error</exception>
        public static bool SampleUserProcessWithParams(EntityObject Entity, ref ProcessHelper Ret, string Param1, int Param2)
        {
            try
            {

                // 'Do Something

                Ret.Success = true;
                Ret.SuccessMessage = "Cache reloaded";
                return true;
            }
            catch (Exception ex)
            {
                Ret.Success = false;
                Ret.LastException = ex;
                return false;
            }
        }
    }
}
