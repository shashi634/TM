using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ErpNBFC.p
{
    public partial class PackageManagement : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var locationGuid = Request.QueryString["C"];
            if (!IsPostBack)
            {
                if (locationGuid == null) Response.Redirect("Country.aspx"); ;
                PopulateHotels(locationGuid);
            }
        }
        public void PopulateHotels(string locationPublicId)
        {
            string query = @"select a.id,a.name +' - '+b.type as name from hotels a inner join HotelType b on a.HotelTypeId=b.Id
                            where a.LocationId=(select Id from Location where PublicId='" + locationPublicId + "')";
            PopulateDropDown(query, ddl_hotel, "Name", "Id");
            //Add a default item at first position.
            ddl_hotel.Items.Insert(0, new ListItem("Please Select Hotel", "0"));

            //Set the default item as selected.
            ddl_hotel.Items[0].Selected = true;
        }
    }
}