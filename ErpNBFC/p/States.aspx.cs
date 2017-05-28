using System;
using System.Data;
using System.Data.SqlClient;

namespace ErpNBFC.p
{
    public partial class States : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                GetCountries();
            }
        }

        private void GetCountries() {
            DropDownList1.DataSource = GetData("select Id, country from country");
            DropDownList1.DataTextField = "Country";
            DropDownList1.DataValueField = "Id";
            DropDownList1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if(TextBox1.Text=="")
                {
                    lblmsg.Text="Enter State Name";

                }
                using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("AddState", sqlConnection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@CountryId", SqlDbType.Int).Value = DropDownList1.SelectedValue;
                        cmd.Parameters.AddWithValue("@StateName", SqlDbType.NVarChar).Value = TextBox1.Text.Trim();
                        SqlParameter obj = new SqlParameter("@msg", SqlDbType.NVarChar, 100);
                        obj.Direction = ParameterDirection.ReturnValue;
                        cmd.Parameters.Add(obj);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        if (obj.Value.ToString() == "201")
                        { }
                        else
                        { }
                    }
                }
            }
            catch (Exception ex)
            {
                
            }
        }
    }
}