using System;
using System.Web;

namespace ErpNBFC
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
        }

        void Application_AcquireRequestState(object sender, EventArgs e)
        {
            if (System.Web.HttpContext.Current.Session != null)
            {
                if (Session["TLogin"] == null)
                {
                    Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Cache.SetNoStore();
                }

            }
        }
    }
}