using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ErpNBFC
{
    public partial class HotelList : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                ShowData();
            }
        }

        public void ShowData() {
            Repeater1.DataSource = GetData("select a.Id,a.description,a.NoOfDays,a.NoOfNights,a.rate, b.name from Package a inner join Hotels b on a.HotelId=b.Id");
            Repeater1.DataBind();
        }
    }
}