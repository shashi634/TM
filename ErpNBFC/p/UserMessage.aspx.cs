using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ErpNBFC.p
{
    public partial class UserMessage : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string countryId = Request.QueryString["C"];

            if (IsPostBack) return;
            ShowData();
            if (countryId != null)
            {
                GetCountry(countryId);
            }
            if (!IsLoggedIn)
            {
                Response.Redirect("../Login");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void location_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var id = LocationTable.Rows[e.RowIndex].FindControl("h") as Label;
            if (id != null)
            {
                int returnValue = DeleteData("DeleteLocation", new Guid(id.Text));
                if (returnValue == 500)
                {
                    lblmsg.Text = "You are not authorised to delete!";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    return;
                }
                ShowData();
            }

        }

        protected void ShowData()
        {
            LocationTable.DataSource = GetData("select * from ContactQuery order by samay desc");
            LocationTable.DataBind();
        }
        public void GetCountry(string publicId)
        {
            try
            {
                var message = GetData("select Name,Email,Message from ContactQuery where publicid='" + publicId + "' ");
                if (message.Rows.Count <= 0) return;
                name.Text = message.Rows[0][0].ToString();
                email.Text = message.Rows[0][1].ToString();
                usermessage.Text = message.Rows[0][2].ToString();
            }
            catch (Exception)
            {
                lblmsg.Text = "Incorrect Request";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            
        }

        protected void SendEmail()
        {
            using (MailMessage mm = new MailMessage("shashank@initiontechnology.com", email.Text))
            {
                mm.Subject = "Reply: Holiday Zone Travel Company";
                mm.Body = "<p>Hi  "+ name.Text+"</p><br/><p>"+adminmessage.Text+"</p>";
                mm.IsBodyHtml = true;
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

        protected void OnClick(object sender, EventArgs e)
        {
            if (adminmessage.Text == null)
            {
                lblmsg.Text = "Message is required!";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            if (email.Text == "")
            {
                lblmsg.Text = "User Email is not correct";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            try
            {
                SendEmail();
            }
            catch (Exception)
            {
                lblmsg.Text = "Failed to Reply! Please Try again after some time or check net connection.";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
           
        }
    }
}