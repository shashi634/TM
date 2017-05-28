using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.UI.WebControls;

namespace ErpNBFC.p
{
    public partial class ContactPerson : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button2.Visible = false;
            string personId = Request.QueryString["C"];

            if (IsPostBack) return;
            ShowData();
            if (personId != null)
            {
                Button1.Visible = false;
                Button2.Visible = true;
                GetContactPerson(personId);
            }
        }
        protected void ShowData()
        {
            SubAdminTable.DataSource = GetData("select Id,PresonName,emailId,Mobileno,address from ContactPersons");
            SubAdminTable.DataBind();
        }
        protected void subAdmin_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                var id = SubAdminTable.Rows[e.RowIndex].FindControl("h") as Label;
                if (id != null) { 
                int statusCode= DeleteData("DeleteContactPerson", Convert.ToInt32(id.Text));
                    if (statusCode == 203) {
                        lblmsg.Text = "Can't be deleted as it is in used!";
                    }
                    if (statusCode == 200)
                    {
                        lblmsg.Text = "Contact deleted!";
                    }
                } 
                ShowData();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
           
        }

        protected void CreateSubAdmin()
        {
            try
            {
                if (TextBox1.Text == string.Empty)
                {
                    lblmsg.Text = "Person Name is required!";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    TextBox1.Focus();
                    return;
                }
                if (TextBox2.Text == string.Empty)
                {
                    lblmsg.Text = "Email Id is required!";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    TextBox2.Focus();
                    return;
                }
                if (TextBox3.Text == string.Empty)
                {
                    lblmsg.Text = "Mobile No. is required!";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    TextBox3.Focus();
                    return;
                }

                using (var sqlConnection = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand("AddContactPerson", sqlConnection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Name", SqlDbType.NVarChar).Value = TextBox1.Text.Trim();
                        cmd.Parameters.AddWithValue("@mobileNo", SqlDbType.NVarChar).Value = TextBox3.Text.Trim();
                        cmd.Parameters.AddWithValue("@EmailId", SqlDbType.NVarChar).Value = TextBox2.Text.Trim();
                        cmd.Parameters.AddWithValue("@address", SqlDbType.NVarChar).Value = TextBox7.Text.Trim();
                        cmd.Parameters.AddWithValue("@password", SqlDbType.NVarChar).Value = GenerateRandonNumber().ToString(CultureInfo.InvariantCulture);
                        var obj = new SqlParameter("@msg", SqlDbType.NVarChar, 100)
                        {
                            Direction = ParameterDirection.ReturnValue
                        };
                        cmd.Parameters.Add(obj);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        if (obj.Value.ToString() == "201")
                        {
                            lblmsg.Text = "This Person is already available";
                            lblmsg.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {

                            lblmsg.Text = " Contact Person created successfully!";
                            lblmsg.ForeColor = System.Drawing.Color.Green;
                            TextBox1.Text = "";
                            TextBox2.Text = "";
                            TextBox3.Text = "";
                            TextBox7.Text = "";
                            ShowData();
                        }
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }


        protected void Button1_OnClick(object sender, EventArgs e)
        {
            try
            {
                if (TextBox1.Text == string.Empty)
                {
                    lblmsg.Text = "Person Name is required!";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    TextBox1.Focus();
                    return;
                }
                if (TextBox2.Text == string.Empty)
                {
                    lblmsg.Text = "Email Id is required!";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    TextBox2.Focus();
                    return;
                }
                if (TextBox3.Text == string.Empty)
                {
                    lblmsg.Text = "Mobile No. is required!";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    TextBox3.Focus();
                    return;
                }

                using (var sqlConnection = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand("AddContactPerson", sqlConnection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Name", SqlDbType.NVarChar).Value = TextBox1.Text.Trim();
                        cmd.Parameters.AddWithValue("@mobileNo", SqlDbType.NVarChar).Value = TextBox3.Text.Trim();
                        cmd.Parameters.AddWithValue("@EmailId", SqlDbType.NVarChar).Value = TextBox2.Text.Trim();
                        cmd.Parameters.AddWithValue("@address", SqlDbType.NVarChar).Value = TextBox7.Text.Trim();
                        cmd.Parameters.AddWithValue("@password", SqlDbType.NVarChar).Value = GenerateRandonNumber().ToString(CultureInfo.InvariantCulture);
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
                            lblmsg.Text = "This Person is already available";
                            lblmsg.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {

                            lblmsg.Text = " Contact Person created successfully!";
                            lblmsg.ForeColor = System.Drawing.Color.Green;
                            TextBox1.Text = "";
                            TextBox2.Text = "";
                            TextBox3.Text = "";
                            TextBox7.Text = "";
                            ShowData();
                        }
                    }
                }
            }
            catch (Exception)
            {
                // ignored
            }
        }
        protected void Button2_OnClick(object sender, EventArgs e)
        {
            UpdateContactPerson();
        }
        protected void postList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            SubAdminTable.PageIndex = e.NewPageIndex;
            ShowData();
        }

        protected void UpdateContactPerson()
        {
            try
            {
                if (TextBox1.Text == string.Empty)
                {
                    lblmsg.Text = "Person Name is required!";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    TextBox1.Focus();
                    return;
                }
                if (TextBox2.Text == string.Empty)
                {
                    lblmsg.Text = "Email Id is required!";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    TextBox2.Focus();
                    return;
                }
                if (TextBox3.Text == string.Empty)
                {
                    lblmsg.Text = "Mobile No. is required!";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    TextBox3.Focus();
                    return;
                }

                using (var sqlConnection = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand("UpdateContactPerson", sqlConnection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@id", SqlDbType.Decimal).Value = Convert.ToDecimal(Request.QueryString["C"]);
                        cmd.Parameters.AddWithValue("@Name", SqlDbType.NVarChar).Value = TextBox1.Text.Trim();
                        cmd.Parameters.AddWithValue("@mobileNo", SqlDbType.NVarChar).Value = TextBox3.Text.Trim();
                        cmd.Parameters.AddWithValue("@EmailId", SqlDbType.NVarChar).Value = TextBox2.Text.Trim();
                        cmd.Parameters.AddWithValue("@address", SqlDbType.NVarChar).Value = TextBox7.Text.Trim();
                        
                        var obj = new SqlParameter("@msg", SqlDbType.NVarChar, 100)
                        {
                            Direction = ParameterDirection.ReturnValue
                        };
                        cmd.Parameters.Add(obj);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        if (obj.Value.ToString() == "200")
                        {
                            lblmsg.Text = "Person Updated!";
                            lblmsg.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            TextBox1.Text = "";
                            TextBox2.Text = "";
                            TextBox3.Text = "";
                            TextBox7.Text = "";
                            Button1.Visible = true;
                            Button2.Visible = false;
                            ShowData();
                        }
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public void GetContactPerson(string personId) {
            var contactPerson = GetData("select * from ContactPersons where id="+Convert.ToInt32(personId));
            if (contactPerson.Rows.Count <= 0) return;
            TextBox1.Text= contactPerson.Rows[0]["PresonName"].ToString();
            TextBox3.Text= contactPerson.Rows[0]["MobileNo"].ToString();
            TextBox2.Text= contactPerson.Rows[0]["EmailId"].ToString();
            TextBox7.Text = contactPerson.Rows[0]["Address"].ToString();
        }
    }
}