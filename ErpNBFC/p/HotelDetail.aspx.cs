using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Collections.ObjectModel;
using System.Web;
using static System.String;

namespace ErpNBFC.p
{
    public partial class HotelDetail : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var hotelId = Request.QueryString["h"];
            if (IsPostBack) return;
            PopulateFacilities(); 
            PopulateMealType(); 
            PopulateRoomType(); 
            PopulateHotelType(); 
            PopulateCity();
            PopulateContactPerson();
            HotelDetails(hotelId);
            GetHotelRoomType();
        }
        public void PopulateFacilities() {
            var facilityList = GetData("select Id,facility from Facilities");
            var nooffacilities = facilityList.Rows.Count;
            for (var i = 0; i < nooffacilities; i++) {
                var item = new ListItem
                {
                    Text = facilityList.Rows[i]["Facility"].ToString(),
                    Value = facilityList.Rows[i]["Id"].ToString()
                };
                facilities.Items.Add(item);
            }
        }
        public void PopulateMealType()
        {
            var facilityList = GetData("select Id,type from mealtype");
            var nooffacilities = facilityList.Rows.Count;
            for (var i = 0; i < nooffacilities; i++)
            {
                var item = new ListItem
                {
                    Text = facilityList.Rows[i]["type"].ToString(),
                    Value = facilityList.Rows[i]["Id"].ToString()
                };
                meal_type.Items.Add(item);
            }
        }
        public void PopulateRoomType()
        {
            var facilityList = GetData("select Id,type from roomtype");
            var nooffacilities = facilityList.Rows.Count;
            for (var i = 0; i < nooffacilities; i++)
            {
                var item = new ListItem
                {
                    Text = facilityList.Rows[i]["type"].ToString(),
                    Value = facilityList.Rows[i]["Id"].ToString()
                };
                room_type.Items.Add(item);
               
            }
        }
        public void PopulateHotelType()
        {
            var facilityList = GetData("select Id,type from hoteltype");
            var nooffacilities = facilityList.Rows.Count;
            for (var i = 0; i < nooffacilities; i++)
            {
                var item = new ListItem
                {
                    Text = facilityList.Rows[i]["type"].ToString(),
                    Value = facilityList.Rows[i]["Id"].ToString()
                };
                hotel_type.Items.Add(item);
            }
        }
        public void PopulateCity() {
            PopulateDropDown("select Id,Name+' - '+CountryName as Name from location", ddl_hotel_city,"Name","Id");
        }
        public void PopulateContactPerson()
        {
            PopulateDropDown("select Id,PresonName+' - '+ mobileno as PresonName from ContactPersons", ddl_contact_person, "PresonName", "Id");
        }

        public void HotelDetails(string hotelPublicId)
        {
            try
            {
                using (var con = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand("exec hotelDetails '" + hotelPublicId + "'"))
                    {
                        using (var sda = new SqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            using (var ds = new DataSet())
                            {
                                sda.Fill(ds);
                                // First Table will be related to hotel details including location
                                //Second table is related to contact person
                                //third table is related to facility
                                // fourth meal
                                //fifth room type
                                if (ds.Tables[0].Rows.Count > 0)
                                {
                                    txt_hotel_name.Text = ds.Tables[0].Rows[0][0].ToString();
                                    CKEditor1.Text = ds.Tables[0].Rows[0][1].ToString();
                                    txt_address.Text = ds.Tables[0].Rows[0][2].ToString();
                                    ddl_hotel_city.Items.FindByText(ds.Tables[0].Rows[0][3]+" - "+ ds.Tables[0].Rows[0][4]).Selected = true;
                                    hotel_type.Items.FindByText(ds.Tables[0].Rows[0][5].ToString()).Selected = true;
                                }
                                if (ds.Tables[1].Rows.Count > 0)
                                {
                                    ddl_contact_person.Items.FindByText(ds.Tables[1].Rows[0][0]+" - "+ ds.Tables[1].Rows[0][1]).Selected=true;
                                }
                                if (ds.Tables[3].Rows.Count > 0) {
                                    for (int i = 0; i < ds.Tables[3].Rows.Count; i++) {
                                        meal_type.Items.FindByText(ds.Tables[3].Rows[i][0].ToString()).Selected = true;
                                    }
                                }
                                if (ds.Tables[2].Rows.Count > 0)
                                {
                                    for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
                                    {
                                        facilities.Items.FindByText(ds.Tables[2].Rows[i][0].ToString()).Selected = true;
                                    }
                                }
                                if (ds.Tables[4].Rows.Count > 0)
                                {
                                    for (int i = 0; i < ds.Tables[4].Rows.Count; i++)
                                    {
                                        room_type.Items.FindByText(ds.Tables[4].Rows[i][0].ToString()).Selected = true;
                                    }
                                }
                                if (ds.Tables[5].Rows.Count > 0)
                                {
                                    DataList1.DataSource = ds.Tables[5];
                                    DataList1.DataBind();
                                }
                            }

                        }
                    }
                }
            }
            catch (Exception)
            {
                // ignored
            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
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
            var hotelMeal = Empty;
            var hotelRoom = Empty;
            var hotelFacility = Empty;
            var items = new Collection<string>();
            foreach (ListItem item in room_type.Items)
            {
                if (item.Selected) {
                    items.Add(item.Value);
                }
            }
            hotelRoom = Join(",", items);
            items.Clear();
            foreach (ListItem item in facilities.Items)
            {
                if (item.Selected)
                {
                    items.Add(item.Value);
                }
            }
            hotelFacility = Join(",", items);
            items.Clear();
            foreach (ListItem item in meal_type.Items)
            {
                if (item.Selected)
                {
                    items.Add(item.Value);
                }
            }
            hotelMeal = Join(",", items);
            items.Clear();
            try
            {
                using (var sqlConnection = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand("UpdateHotel", sqlConnection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@hotelId", SqlDbType.UniqueIdentifier).Value = Request.QueryString["h"];
                        cmd.Parameters.AddWithValue("@hotelName", SqlDbType.NVarChar).Value = txt_hotel_name.Text;
                        cmd.Parameters.AddWithValue("@hotelTypeId", SqlDbType.Decimal).Value = hotel_type.SelectedItem.Value;
                        cmd.Parameters.AddWithValue("@ContactPersonId", SqlDbType.Decimal).Value = ddl_contact_person.SelectedItem.Value;
                        cmd.Parameters.AddWithValue("@CityId", SqlDbType.Decimal).Value = ddl_hotel_city.SelectedItem.Value;
                        cmd.Parameters.AddWithValue("@address", SqlDbType.NVarChar).Value = txt_address.Text;
                        cmd.Parameters.AddWithValue("@mealTypeId", SqlDbType.NVarChar).Value = hotelMeal;
                        cmd.Parameters.AddWithValue("@facilities", SqlDbType.NVarChar).Value = hotelFacility;
                        cmd.Parameters.AddWithValue("@roomTypeId", SqlDbType.NVarChar).Value = hotelRoom;
                        cmd.Parameters.AddWithValue("@description", SqlDbType.NVarChar).Value = CKEditor1.Text;
                        cmd.Parameters.AddWithValue("@roomprice", SqlDbType.Structured).Value = dt;
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        sqlConnection.Close();
                        lblmsg.Text ="Hotel Details Updated Successfully.";
                        lblmsg.ForeColor = System.Drawing.Color.Green;
                    }
                }
                HotelDetails(Request.QueryString["h"]);
                GetHotelRoomType();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnSaveFile_Click(object sender, EventArgs e)
        {
            var imagesUploading = new Collection<string>();
            var httpFileCollection = Request.Files;
            for (var i = 0; i < httpFileCollection.Count; i++)
            {
                var httpPostedFile = httpFileCollection[i];
                var fileExtention = httpPostedFile.FileName.Substring(httpPostedFile.FileName.LastIndexOf('.'));
                var imageName = Guid.NewGuid();
                if (httpPostedFile.ContentLength > 0) httpPostedFile.SaveAs(Server.MapPath("~/p/images/" +imageName + fileExtention));
                imagesUploading.Add(imageName + fileExtention);
            }
            var hotelimages = Join(",", imagesUploading);
            using (var sqlConnection = new SqlConnection(ConnectionString))
            {
                using (var cmd = new SqlCommand("AddHotelImages", sqlConnection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@hotelId", SqlDbType.UniqueIdentifier).Value = Request.QueryString["h"];
                    cmd.Parameters.AddWithValue("@image", SqlDbType.NVarChar).Value = hotelimages;
                    sqlConnection.Open();
                    cmd.ExecuteNonQuery();
                    //sqlConnection.Close();
                    lblmsg.Text = "Hotel Images Updated Successfully.";
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                    HotelDetails(Request.QueryString["h"]);
                }
            }
        }

        public void GetHotelRoomType()
        {
            var hotelRoomTypes = GetData(@"select b.Id,a.Type,c.rate,c.roomnoavailable from RoomType a 
                                                    inner join HotelRoomTypes b on b.RoomTypeId = a.Id  inner join
                                                    HotelRoomTypePrice c on c.HotelRoomTypeId = b.Id
                                                    where b.HotelId =  (select id from hotels where publicid= '" + Request.QueryString["h"] + "')");
            if (hotelRoomTypes.Rows.Count <= 0)
            {
                hotelRoomTypes = GetData(@"select b.Id,a.Type,rate='',roomnoavailable='' from RoomType a 
                                                    inner join HotelRoomTypes b on b.RoomTypeId = a.Id 
                                                    where b.HotelId = (select id from hotels where publicid= '"+ Request.QueryString["h"] + "')");
            }
            Repeater1.DataSource = hotelRoomTypes;
            Repeater1.DataBind();
        }
    }
}