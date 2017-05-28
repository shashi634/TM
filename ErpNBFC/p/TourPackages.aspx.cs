using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Collections.ObjectModel;
using System.IO;
using System.Web;

namespace ErpNBFC.p
{
    public partial class TourPackages : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { Getpackage(); }
        }
        public void Getpackage() {
            DataTable dt = GetData(@"select a.Name, b.startDate,b.endDate,b.noofdays ,b.noofnight ,b.tac,b.publicid,b.defaultnoofmembers,c.name +' - '+c.countryname as location from 
  Hotels a inner join HotelPackage b on b.hotelid = a.Id inner join Location c on c.Id = a.LocationId");
            hotelspackage.DataSource = dt;
            hotelspackage.DataBind();
        }
    }
}