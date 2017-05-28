using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
namespace ErpNBFC.p
{
    public partial class Organization : Common
    {
        Guid organizationPublicId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                GetOrganizationDetails();
                //if (organizationPublicId == default(Guid))
                //{
                //    Panel1.Visible = false;
                //    Panel2.Visible = true;
                //}
                //else {
                //    Panel1.Visible = true;
                //    Panel2.Visible = false;
                //}
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            TextBox1.Text=Label1.Text;
            TextBox2.Text=Label2.Text;
            TextBox3.Text=Label3.Text;
            TextBox4.Text=Label4.Text;
            TextBox5.Text=Label5.Text;
            TextBox6.Text=Label6.Text;
            TextBox7.Text=Label7.Text;
            TextBox8.Text=Label8.Text;
            //Panel1.Visible = false;
            //Panel2.Visible = true;
        }

        private void GetOrganizationDetails()
        {
            var dt = GetData("Select * from organization");
            if (dt.Rows.Count <= 0) return;
            
            Label1.Text = dt.Rows[0][1].ToString();
            Label2.Text = dt.Rows[0][9].ToString();
            Label3.Text = dt.Rows[0][2].ToString();
            Label4.Text = dt.Rows[0][3].ToString();
            Label5.Text = dt.Rows[0][8].ToString();
            Label6.Text = dt.Rows[0][4].ToString();
            Label7.Text = dt.Rows[0][5].ToString();
            Label8.Text = dt.Rows[0][6].ToString();
            Label9.Text = dt.Rows[0][9].ToString();
            Label10.Text = dt.Rows[0][7].ToString();
            organizationPublicId = new Guid(dt.Rows[0][7].ToString());
        }

        protected int AddUpdateOrganizations()
        {
            try
            {
                using (var sqlConnection = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand("organizationAddUpdate", sqlConnection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@name", SqlDbType.NVarChar).Value = TextBox1.Text;
                        cmd.Parameters.AddWithValue("@pan", SqlDbType.NVarChar).Value = TextBox3.Text;
                        cmd.Parameters.AddWithValue("@registrationno", SqlDbType.NVarChar).Value = TextBox4.Text;
                        cmd.Parameters.AddWithValue("@address", SqlDbType.NVarChar).Value = TextBox7.Text;
                        cmd.Parameters.AddWithValue("@city", SqlDbType.NVarChar).Value = TextBox8.Text;
                        cmd.Parameters.AddWithValue("@state", SqlDbType.NVarChar).Value = State.SelectedValue;
                        cmd.Parameters.AddWithValue("@owner", SqlDbType.NVarChar).Value = TextBox2.Text;
                        cmd.Parameters.AddWithValue("@servicetaxno", SqlDbType.NVarChar).Value = TextBox6.Text;
                        cmd.Parameters.AddWithValue("@publicid", SqlDbType.UniqueIdentifier).Value = organizationPublicId;
                        var obj = new SqlParameter("@msg", SqlDbType.NVarChar, 100)
                        {
                            Direction = ParameterDirection.ReturnValue
                        };
                        cmd.Parameters.Add(obj);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        sqlConnection.Close();
                        //Panel1.Visible = true;
                        //Panel2.Visible = false;
                        return obj.Value.ToString() == "201" ? 201 : 200;
                    }
                }
                
            }
            catch (Exception)
            {
                return 203;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AddUpdateOrganizations();
        }
    }
}