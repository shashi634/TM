using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ErpNBFC.Login
{
    public partial class PasswordRecovery : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                using (var sqlConnection = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand("PasswordResetAction", sqlConnection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@password", SqlDbType.NVarChar).Value = txtPassword.Text.Trim();
                        cmd.Parameters.AddWithValue("@key", SqlDbType.NVarChar).Value = txtuniquecode.Text.Trim();
                        var obj = new SqlParameter("@msg", SqlDbType.Int, 100)
                        {
                            Direction = ParameterDirection.ReturnValue
                        };
                        cmd.Parameters.Add(obj);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        if (obj.Value.ToString() == "200")
                        {
                            Response.Redirect("/Login");
                        }
                        else
                        {

                        }
                    }
                }
            }
            catch (Exception)
            {

            }
        }
    }
}