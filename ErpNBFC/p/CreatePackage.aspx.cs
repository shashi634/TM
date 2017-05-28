using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Collections.ObjectModel;
using System.IO;
using System.Web;

namespace ErpNBFC.p
{
    public partial class CreatePackage : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                populateHotels();
            }
        }
        public void populateHotels()
        {
            PopulateDropDown("  select a.id,a.name +' - '+b.type as name from hotels a inner join HotelType b on a.HotelTypeId=b.Id", ddl_hotel, "Name", "Id");
            //Add a default item at first position.
            ddl_hotel.Items.Insert(0, new ListItem("Please Select Hotel", "0"));

            //Set the default item as selected.
            ddl_hotel.Items[0].Selected = true;
        }
        public void GetHotelRoomType() {
            DataTable hotelRoomTypes = GetData(@"select b.Id,a.Type,c.rate,c.roomnoavailable from RoomType a 
                                                    inner join HotelRoomTypes b on b.RoomTypeId = a.Id  inner join
                                                    HotelRoomTypePrice c on c.HotelRoomTypeId = b.Id
                                                    where b.HotelId =  "+ ddl_hotel.SelectedItem.Value);
            if (hotelRoomTypes.Rows.Count <= 0) {
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
                myCollection.Add( collageName);
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

                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        sqlConnection.Close();
                    }
                }

            }
            catch (Exception ex)
            {
                // ignored
            }
        }
    }

    public class RoomPrice{ 
          public string RoomId { get; set; }
          public string Price { get; set; }
    }
}