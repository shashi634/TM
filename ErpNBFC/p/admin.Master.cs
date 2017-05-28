using System;
using System.Web;

namespace ErpNBFC.p
{
    public partial class Admin : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TLogin"] == null)
            {
                Response.Redirect("../Login");
            }
            else {
                var sessionValueArray = Session["TLogin"].ToString().Split('|');
                ltr_name.Text = sessionValueArray[0].ToString();
                ltr_name1.Text = sessionValueArray[0].ToString();
                ltr_type1.Text = sessionValueArray[1].ToString();
                ltr_type2.Text = sessionValueArray[1].ToString();
                ltr_online.Text = sessionValueArray[0].ToString();
                if(ltr_type1.Text== "Agent  ")
                setting.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("../");
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }
    }
}