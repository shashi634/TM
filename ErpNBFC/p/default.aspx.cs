using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ErpNBFC.p
{
    public partial class _default : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetStatus();
            }
        }

        public void GetStatus()
        {
            var myStatics = GetData("exec Summary");
            if (myStatics.Rows.Count <= 0) return;
            Literal1.Text = myStatics.Rows[0][0].ToString();
            Literal2.Text = myStatics.Rows[0][1].ToString();
            Literal3.Text = myStatics.Rows[0][2].ToString();
            Literal4.Text = myStatics.Rows[0][3].ToString();
            Literal5.Text = myStatics.Rows[0][4].ToString();
            Literal6.Text = myStatics.Rows[0][5].ToString();
        }
    }
}