using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Collections.ObjectModel;
using System.IO;
using System.Web;

namespace ErpNBFC.p
{
    public partial class UpdatePackage : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var hotelId = Request.QueryString["h"];
            if (!IsPostBack)
            {
                populateHotels();
                GetPackageDetails();
                ddl_hotel.Enabled = false;
                GetHotelRoomType();
            }
        }
        public void populateHotels()
        {
            PopulateDropDown("  select a.id,a.name +' - '+b.type as name from hotels a inner join HotelType b on a.HotelTypeId=b.Id", ddl_hotel, "Name", "Id");
        }
        public void GetHotelRoomType()
        {
            DataTable hotelRoomTypes = GetData(@"select b.Id,a.Type,c.rate,c.roomnoavailable from RoomType a 
                                                    inner join HotelRoomTypes b on b.RoomTypeId = a.Id  inner join
                                                    HotelRoomTypePrice c on c.HotelRoomTypeId = b.Id
                                                    where b.HotelId =  " + ddl_hotel.SelectedItem.Value);
            if (hotelRoomTypes.Rows.Count <= 0)
            {
                hotelRoomTypes = GetData(@"select b.Id,a.Type,rate='',roomnoavailable='' from RoomType a 
                                                    inner join HotelRoomTypes b on b.RoomTypeId = a.Id 
                                                    where b.HotelId =  " + ddl_hotel.SelectedItem.Value);
            }
            Repeater1.DataSource = hotelRoomTypes;
            Repeater1.DataBind();
        }

        protected void ddl_hotel_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetHotelRoomType();
        }

        protected void Save(object sender, EventArgs e)
        {
            Collection<String> myCollection = new Collection<string>();
            foreach (RepeaterItem item in Repeater1.Items)
            {
                string id = (item.FindControl("messageId") as TextBox).Text;
                string collageName = (item.FindControl("txtCollageName") as TextBox).Text;
                myCollection.Add(collageName);
            }
            var s = myCollection;
        }

        protected void btn_create_page_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("HotelRoomTypeId");
            dt.Columns.Add("HotelRoomTypePrice");
            dt.Columns.Add("HotelRoomTypeAvailability");

            foreach (RepeaterItem item in Repeater1.Items)
            {
                string roomtypeid = (item.FindControl("roomtypeid") as Label).Text;
                string roomtypeprice = (item.FindControl("txtRoomPrice") as TextBox).Text;
                string availableroomno = (item.FindControl("txt_room_available") as TextBox).Text;
                dt.Rows.Add(roomtypeid, roomtypeprice, availableroomno);
            }
            try
            {
                using (var sqlConnection = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand("CreatePackage", sqlConnection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@hotelId", SqlDbType.UniqueIdentifier).Value = ddl_hotel.SelectedItem.Value;
                        cmd.Parameters.AddWithValue("@startdate", SqlDbType.DateTime).Value = txt_startDate.Text;
                        cmd.Parameters.AddWithValue("@enddate", SqlDbType.DateTime).Value = txt_endDate.Text;
                        cmd.Parameters.AddWithValue("@noofdays", SqlDbType.Int).Value = txt_day.Text;
                        cmd.Parameters.AddWithValue("@noofnight ", SqlDbType.Int).Value = txt_night.Text;
                        cmd.Parameters.AddWithValue("@extraadultcharge", SqlDbType.Decimal).Value = txt_extraadult.Text;
                        cmd.Parameters.AddWithValue("@extrachildcharge", SqlDbType.Decimal).Value = txt_extrachild.Text;
                        cmd.Parameters.AddWithValue("@tac", SqlDbType.NVarChar).Value = txt_tac.Text;
                        cmd.Parameters.AddWithValue("@defaultnoofmembers ", SqlDbType.Int).Value = txt_noofperson.Text;
                        cmd.Parameters.AddWithValue("@roomprice", SqlDbType.Structured).Value = dt;
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        sqlConnection.Close();
                    }
                }

            }
            catch (Exception ex)
            {

            }
        }

        public void GetPackageDetails()
        {
            try
            {
                var packageDetail = GetData("select * from HotelPackage where publicId='"+ Request.QueryString["h"] + "'");
                if (packageDetail.Rows.Count > 0){
                    ddl_hotel.Items.FindByValue(packageDetail.Rows[0][1].ToString()).Selected=true;
                    txt_startDate.Text = Convert.ToDateTime(packageDetail.Rows[0][2].ToString()).ToString("yyyy-MM-dd");
                    txt_endDate.Text = Convert.ToDateTime(packageDetail.Rows[0][3].ToString()).ToString("yyyy-MM-dd");
                    txt_day.Text = packageDetail.Rows[0][4].ToString();
                    txt_night.Text= packageDetail.Rows[0][5].ToString();
                    txt_extraadult.Text = packageDetail.Rows[0][6].ToString();
                    txt_extrachild.Text = packageDetail.Rows[0][7].ToString();
                    txt_tac.Text = packageDetail.Rows[0][8].ToString();
                    txt_noofperson.Text = packageDetail.Rows[0][9].ToString();
                }

            }
            catch (Exception ex)
            {

            }

        }
        
    }

    
}