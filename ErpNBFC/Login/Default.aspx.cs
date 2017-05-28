using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;

namespace ErpNBFC
{
    public partial class Default : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsLoggedIn) {
                Response.Redirect("/p");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtUserName.Text == "")
            {
                lblmsg.Text = "Username is Incorrect!";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else {
                if (txtPassword.Text == "")
                {
                    lblmsg.Text = "Password is Incorrect!";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    string query = "exec ManagementLogin '" + txtUserName.Text.Trim() + "','" + txtPassword.Text.Trim() + "'";
                    using (SqlConnection con = new SqlConnection(ConnectionString))
                    {
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            using (SqlDataAdapter sda = new SqlDataAdapter())
                            {
                                cmd.Connection = con;
                                sda.SelectCommand = cmd;
                                using (DataTable dt = new DataTable())
                                {
                                    sda.Fill(dt);
                                    if (dt.Rows.Count > 0)
                                    {
                                        Session["TLogin"] = dt.Rows[0]["Name"].ToString() + "|" + dt.Rows[0]["UserType"].ToString() + "|" + dt.Rows[0]["publicid"].ToString();
                                        Response.Redirect("/p");
                                    }
                                    else
                                    {
                                        lblmsg.Text = "Invalid Credential!";
                                        lblmsg.CssClass = "fa fa-exclamation-triangle";
                                        lblmsg.ForeColor = System.Drawing.Color.Red;
                                    }
                                }
                            }
                        }
                    }
                }
            
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                using (var sqlConnection = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand("PasswordResetRequest", sqlConnection))
                    {
                    string keyvalue= GenerateId(); 
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@emailid", SqlDbType.NVarChar).Value = txtEmail.Text.Trim();
                        cmd.Parameters.AddWithValue("@key", SqlDbType.NVarChar).Value = keyvalue;
                        var obj = new SqlParameter("@msg", SqlDbType.Int, 100)
                        {
                            Direction = ParameterDirection.ReturnValue
                        };
                        cmd.Parameters.Add(obj);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        if (obj.Value.ToString() == "200")
                        {
                            SendEmail();
                            Response.Redirect("passwordrecovery.aspx");
                        }
                        else { 

                        }
                    }
                }
            }
            catch (Exception)
            {
                
            }
        }
        private string GenerateId()
        {
            long i = 1;
            foreach (byte b in Guid.NewGuid().ToByteArray())
            {
                i *= ((int)b + 1);
            }
            return string.Format("{0:x}", i - DateTime.Now.Ticks);
        }

        protected void SendEmail()
        {
            using (MailMessage mm = new MailMessage("shashank@initiontechnology.com", txtEmail.Text.Trim()))
            {
                mm.Subject = "Password Recovery Travel Management Service";
                mm.Body = "Test Code: "+ GenerateId();
                mm.IsBodyHtml = false;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential("shashank@initiontechnology.com", "inition1234aA");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
            }
        }

        protected void Button3_OnClick(object sender, EventArgs e)
        {
            try
            {
                using (var sqlConnection = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand("Contactus", sqlConnection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@name", SqlDbType.NVarChar).Value = txtName.Text.Trim();
                        cmd.Parameters.AddWithValue("@email", SqlDbType.NVarChar).Value = extEmail.Text.Trim();
                        cmd.Parameters.AddWithValue("@mobile", SqlDbType.NVarChar).Value = txtMobile.Text.Trim();
                        cmd.Parameters.AddWithValue("@message", SqlDbType.NVarChar).Value = messagetest.Text.Trim();
                        var obj = new SqlParameter("@msg", SqlDbType.Int, 100)
                        {
                            Direction = ParameterDirection.ReturnValue
                        };
                        cmd.Parameters.Add(obj);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        if (obj.Value.ToString() == "200")
                        {
                            Label1.Text = "Message Send successfully!";
                        }
                        
                    }
                }
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
        }
    }
}