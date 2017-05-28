using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.UI.WebControls;

namespace ErpNBFC.p
{
    public partial class SubAdmin : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button2.Visible = false;
            string userId = Request.QueryString["C"];
            if (IsPostBack) return;
            PopulateDropDown("Select Id,Usertype from UserType where isDeleted=0", ddl_usertype, "Usertype", "Id");
            ShowData();
            if(userId!=null) {
                Button1.Visible = false;
                Button2.Visible = true;
                GetUser(userId);
            }
        }
        protected void ShowData()
        {
            SubAdminTable.DataSource = GetData("select publicid as id,Name,emailId,Mobileno,password,createddate,case when UserType=1 then 'Admin' when UserType=2 then 'SubAdmin' when UserType=3 then 'Agent' when UserType=4 then 'Admin' else 'Unauthorised' end as UserType from  AdminAccount where isdeleted=0");
            SubAdminTable.DataBind();
        }
        protected void subAdmin_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var id = SubAdminTable.Rows[e.RowIndex].FindControl("h") as Label;
            if (id != null) DeleteData("DeleteSubAdmin", new Guid(id.Text));
            ShowData();
        }

        protected void CreateSubAdmin()
        {
            try
            {
                if (TextBox1.Text == string.Empty)
                {
                    lblmsg.Text = "Sub Admin Name is required!";
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
                    using (var cmd = new SqlCommand("AddSubAdmin", sqlConnection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Name", SqlDbType.NVarChar).Value = TextBox1.Text.Trim();
                        cmd.Parameters.AddWithValue("@mobileNo", SqlDbType.NVarChar).Value = TextBox3.Text.Trim();
                        cmd.Parameters.AddWithValue("@EmailId", SqlDbType.NVarChar).Value = TextBox2.Text.Trim();
                        cmd.Parameters.AddWithValue("@Landlineno", SqlDbType.NVarChar).Value = TextBox4.Text.Trim();
                        cmd.Parameters.AddWithValue("@password", SqlDbType.NVarChar).Value = GenerateRandonNumber().ToString(CultureInfo.InvariantCulture);
                        cmd.Parameters.AddWithValue("@address", SqlDbType.NVarChar).Value = TextBox7.Text.Trim();
                        cmd.Parameters.AddWithValue("@PublicId", SqlDbType.UniqueIdentifier).Value = Guid.NewGuid().ToString();
                        cmd.Parameters.AddWithValue("@roleId", SqlDbType.Int).Value = ddl_usertype.SelectedItem.Value;
                        var obj = new SqlParameter("@msg", SqlDbType.NVarChar, 100)
                        {
                            Direction = ParameterDirection.ReturnValue
                        };
                        cmd.Parameters.Add(obj);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        if (obj.Value.ToString() == "201")
                        {
                            lblmsg.Text = "This user is already available";
                            lblmsg.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {

                            lblmsg.Text = " Sub admin created successfully!";
                            lblmsg.ForeColor = System.Drawing.Color.Green;
                            TextBox1.Text = "";
                            TextBox2.Text = "";
                            TextBox3.Text = "";
                            TextBox4.Text = "";
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
            CreateSubAdmin();
        }
        protected void postList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            SubAdminTable.PageIndex = e.NewPageIndex;
            ShowData();
        }
        public void GetUser(string id) {
            var userdetail = GetData("select Name,EmailId,Mobileno,LandLineno,Address,publicid,usertype from AdminAccount where publicid='"+id+"'");
            if (userdetail.Rows.Count <= 0) return;
            TextBox1.Text = userdetail.Rows[0][0].ToString();
            TextBox2.Text = userdetail.Rows[0][1].ToString();
            TextBox3.Text = userdetail.Rows[0][2].ToString();
            TextBox4.Text = userdetail.Rows[0][3].ToString();
            TextBox7.Text = userdetail.Rows[0][4].ToString();
            ddl_usertype.SelectedValue = userdetail.Rows[0][6].ToString();
        }
        protected void Button2_OnClick(object sender, EventArgs e)
        {
            UpdateSubAdmin();
        }

        protected void UpdateSubAdmin()
        {
            try
            {
                if (TextBox1.Text == string.Empty)
                {
                    lblmsg.Text = "Sub Admin Name is required!";
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
                    using (var cmd = new SqlCommand("UpdateSubAdmin", sqlConnection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Id", SqlDbType.NVarChar).Value = Request.QueryString["C"];
                        cmd.Parameters.AddWithValue("@Name", SqlDbType.NVarChar).Value = TextBox1.Text.Trim();
                        cmd.Parameters.AddWithValue("@mobileNo", SqlDbType.NVarChar).Value = TextBox3.Text.Trim();
                        cmd.Parameters.AddWithValue("@EmailId", SqlDbType.NVarChar).Value = TextBox2.Text.Trim();
                        cmd.Parameters.AddWithValue("@Landlineno", SqlDbType.NVarChar).Value = TextBox4.Text.Trim();
                        cmd.Parameters.AddWithValue("@address", SqlDbType.NVarChar).Value = TextBox7.Text.Trim();
                        cmd.Parameters.AddWithValue("@roleId", SqlDbType.Int).Value = ddl_usertype.SelectedItem.Value;
                        var obj = new SqlParameter("@msg", SqlDbType.NVarChar, 100)
                        {
                            Direction = ParameterDirection.ReturnValue
                        };
                        cmd.Parameters.Add(obj);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        if (obj.Value.ToString() == "201")
                        {
                            lblmsg.Text = "This user is already available";
                            lblmsg.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {

                            lblmsg.Text = " Sub admin updated successfully!";
                            lblmsg.ForeColor = System.Drawing.Color.Green;
                            TextBox1.Text = "";
                            TextBox2.Text = "";
                            TextBox3.Text = "";
                            TextBox4.Text = "";
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
    }
}