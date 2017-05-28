using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
namespace ErpNBFC.p
{
    public partial class Country : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button2.Visible = false;
            string countryId = Request.QueryString["C"];
           
            if (IsPostBack) return;
            ShowData();
            if (countryId != null)
            {
                Button1.Visible = false;
                Button2.Visible = true;
                GetCountry(countryId);
            }
            if (!IsLoggedIn)
            {
                Response.Redirect("../Login");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == null || TextBox1.Text == "")
            {
                lblmsg.Text = "Please enter location";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                try
                {
                    using (var sqlConnection = new SqlConnection(ConnectionString))
                    {
                        using (var cmd = new SqlCommand("AddLocation", sqlConnection))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@value", SqlDbType.NVarChar).Value = TextBox1.Text;
                            cmd.Parameters.AddWithValue("@country", SqlDbType.NVarChar).Value = ddlCountry.SelectedItem.ToString();
                            var obj = new SqlParameter("@msg", SqlDbType.NVarChar, 100)
                            {
                                Direction = ParameterDirection.ReturnValue
                            };
                            cmd.Parameters.Add(obj);
                            sqlConnection.Open();
                            cmd.ExecuteNonQuery();
                            sqlConnection.Close();
                            if (obj.Value.ToString() == "201")
                            {
                                lblmsg.Text = "Already listed location.";
                                lblmsg.ForeColor = System.Drawing.Color.Red;
                            }
                            else
                            {
                                lblmsg.Text = "Location listed successfully.";
                                lblmsg.ForeColor = System.Drawing.Color.Green;
                                ShowData();
                            }
                            sqlConnection.Close();
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblmsg.Text = ex.Message;
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void location_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var id = LocationTable.Rows[e.RowIndex].FindControl("h") as Label;
            if (id != null) { 
            int returnValue=DeleteData("DeleteLocation", new Guid(id.Text));
                if (returnValue == 500) {
                    lblmsg.Text = "You are not authorised to delete!";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    return;
                }
            ShowData(); }
            
        }

        protected void ShowData()
        {
            LocationTable.DataSource = GetData("Select Id,Name,CountryName,publicid from Location where isdeleted=0");
            LocationTable.DataBind();
        }
        public void GetCountry(string publicId)
        {
            var country = GetData("select Name,countryName from Location where publicid='"+publicId+ "' and isdeleted=0");
            if (country.Rows.Count <= 0) return;
               ddlCountry.SelectedItem.Text = country.Rows[0][1].ToString();
               TextBox1.Text = country.Rows[0][0].ToString();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == null || TextBox1.Text == "")
            {
                lblmsg.Text = "Please enter location";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                try
                {
                    using (var sqlConnection = new SqlConnection(ConnectionString))
                    {
                        using (var cmd = new SqlCommand("UpdateLocation", sqlConnection))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@id", SqlDbType.NVarChar).Value = Request.QueryString["C"];
                            cmd.Parameters.AddWithValue("@value", SqlDbType.NVarChar).Value = TextBox1.Text;
                            cmd.Parameters.AddWithValue("@country", SqlDbType.NVarChar).Value = ddlCountry.SelectedItem.ToString();
                            var obj = new SqlParameter("@msg", SqlDbType.NVarChar, 100)
                            {
                                Direction = ParameterDirection.ReturnValue
                            };
                            cmd.Parameters.Add(obj);
                            sqlConnection.Open();
                            cmd.ExecuteNonQuery();
                            sqlConnection.Close();
                            if (obj.Value.ToString() == "201")
                            {
                                lblmsg.Text = "Incorrect location.";
                                lblmsg.ForeColor = System.Drawing.Color.Red;
                            }
                            else
                            {
                                lblmsg.Text = "Location Updated successfully.";
                                lblmsg.ForeColor = System.Drawing.Color.Green;
                                Button2.Visible = false;
                                Button1.Visible = true;
                                TextBox1.Text = null;
                                ShowData();
                            }
                            sqlConnection.Close();
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblmsg.Text = ex.Message;
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void postList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LocationTable.PageIndex = e.NewPageIndex;
            ShowData();
        }
    }
}