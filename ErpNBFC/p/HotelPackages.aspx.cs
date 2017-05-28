using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ErpNBFC.p
{
    public partial class HotelPackages : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var locationGuid = Request.QueryString["C"];
            if (!IsPostBack)
            {   if (locationGuid == null) return;
                PopulateHotels(locationGuid);
                GetHotelRoomTypes();
                GetHotelMealType();
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
        public void GetHotelMealType()
        {
            var availableData= GetData("select Id, [Type] from MealType where IsDeleted=0");
            ddl_mealType.DataSource = availableData;
            ddl_mealType.DataTextField = "Type";
            ddl_mealType.DataValueField = "Id";
            ddl_mealType.DataBind();
            ddl_weekdaysxtraChildMealType.DataSource = availableData;
            ddl_weekdaysxtraChildMealType.DataTextField = "Type";
            ddl_weekdaysxtraChildMealType.DataValueField = "Id";
            ddl_weekdaysxtraChildMealType.DataBind();
            ddl_weekdaysxtraAdultMealType.DataSource = availableData;
            ddl_weekdaysxtraAdultMealType.DataTextField = "Type";
            ddl_weekdaysxtraAdultMealType.DataValueField = "Id";
            ddl_weekdaysxtraAdultMealType.DataBind();
            ddl_weekendsxtraChildMealType.DataSource = availableData;
            ddl_weekendsxtraChildMealType.DataTextField = "Type";
            ddl_weekendsxtraChildMealType.DataValueField = "Id";
            ddl_weekendsxtraChildMealType.DataBind();
            ddl_weekendsxtraAdultMealType.DataSource = availableData;
            ddl_weekendsxtraAdultMealType.DataTextField = "Type";
            ddl_weekendsxtraAdultMealType.DataValueField = "Id";
            ddl_weekendsxtraAdultMealType.DataBind();
            ddl_specialDayxtraChildMealType.DataSource = availableData;
            ddl_specialDayxtraChildMealType.DataTextField = "Type";
            ddl_specialDayxtraChildMealType.DataValueField = "Id";
            ddl_specialDayxtraChildMealType.DataBind();
            ddl_specialDayxtraAdultMealType.DataSource = availableData;
            ddl_specialDayxtraAdultMealType.DataTextField = "Type";
            ddl_specialDayxtraAdultMealType.DataValueField = "Id";
            ddl_specialDayxtraAdultMealType.DataBind();
            ddl_normalxtraChildMealType.DataSource = availableData;
            ddl_normalxtraChildMealType.DataTextField = "Type";
            ddl_normalxtraChildMealType.DataValueField = "Id";
            ddl_normalxtraChildMealType.DataBind();
            ddl_normalxtraAdultMealType.DataSource = availableData;
            ddl_normalxtraAdultMealType.DataTextField = "Type";
            ddl_normalxtraAdultMealType.DataValueField = "Id";
            ddl_normalxtraAdultMealType.DataBind();
            ddl_spMealType.DataSource = availableData;
            ddl_spMealType.DataTextField = "Type";
            ddl_spMealType.DataValueField = "Id";
            ddl_spMealType.DataBind();
        }

        public void GetHotelRoomTypes()
        {
            PopulateDropDown("Select Id, Type from RoomType", ddl_roomType,"Type","Id");
        }

        public void CreateHotelPackage()
        {
            try
            {
                using (var sqlConnection = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand("CreatePackageGeneral", sqlConnection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@HotelId", SqlDbType.Decimal).Value                 = Convert.ToDecimal(ddl_hotel.SelectedValue);
                        cmd.Parameters.AddWithValue("@LocationId", SqlDbType.UniqueIdentifier).Value     = Request.QueryString["C"];
                        cmd.Parameters.AddWithValue("@HotelRoomTypeId", SqlDbType.Int).Value             = ddl_roomType.SelectedValue;
                        cmd.Parameters.AddWithValue("@HotelMealPlan", SqlDbType.Int).Value               = Convert.ToInt16(ddl_mealType.SelectedValue);
                        cmd.Parameters.AddWithValue("@StartDate", SqlDbType.DateTime).Value              = Convert.ToDateTime(txt_startDate.Text);
                        cmd.Parameters.AddWithValue("@EndDate", SqlDbType.DateTime).Value                = Convert.ToDateTime(txt_endDate.Text);
                        cmd.Parameters.AddWithValue("@DefaultNoOfMember", SqlDbType.Int).Value           = Convert.ToInt16(txt_noofperson.Text);
                        cmd.Parameters.AddWithValue("@NoOfDays", SqlDbType.Int).Value                    = Convert.ToInt16(txt_day.Text);
                        cmd.Parameters.AddWithValue("@NoOfNight", SqlDbType.Int).Value                   = Convert.ToInt16(txt_night.Text);
                        cmd.Parameters.AddWithValue("@NDP", SqlDbType.Decimal).Value                     = !(CheckBox2.Checked)?Convert.ToDecimal(normalPrice.Text):0;
                        cmd.Parameters.AddWithValue("@NDTax", SqlDbType.Decimal).Value                   = !(CheckBox2.Checked)?Convert.ToDecimal(normalPriceTax.Text):0;
                        cmd.Parameters.AddWithValue("@NDECP", SqlDbType.Decimal).Value                   = !(CheckBox2.Checked)?Convert.ToDecimal(normalExtraChildPrice.Text):0;
                        cmd.Parameters.AddWithValue("@NDECPT", SqlDbType.Decimal).Value                  = !(CheckBox2.Checked)?Convert.ToDecimal(normalExtraChildPricePercentage.Text):0;
                        cmd.Parameters.AddWithValue("@NDECMP", SqlDbType.Int).Value                      = !(CheckBox2.Checked)?Convert.ToInt16(ddl_normalxtraChildMealType.SelectedValue):11;
                        cmd.Parameters.AddWithValue("@NDEAP", SqlDbType.Decimal).Value                   = !(CheckBox2.Checked)?Convert.ToDecimal(normalExtraAdultPrice.Text):0;
                        cmd.Parameters.AddWithValue("@NDEAPT", SqlDbType.Decimal).Value                  = !(CheckBox2.Checked)?Convert.ToDecimal(normalExtraAdultTax.Text):0;
                        cmd.Parameters.AddWithValue("@NDEAMP", SqlDbType.Int).Value                      = !(CheckBox2.Checked) ? Convert.ToInt16(ddl_normalxtraAdultMealType.SelectedValue):11;
                        cmd.Parameters.AddWithValue("@WKP", SqlDbType.Decimal).Value                     = CheckBox2.Checked?Convert.ToDecimal(weekdaysPrice.Text) : 0;
                        cmd.Parameters.AddWithValue("@WKTax", SqlDbType.Decimal).Value                   = CheckBox2.Checked?Convert.ToDecimal(weekdaysPriceTax.Text) : 0;
                        cmd.Parameters.AddWithValue("@WKECP", SqlDbType.Decimal).Value                   = CheckBox2.Checked?Convert.ToDecimal(weekdaysExtraChildPrice.Text) : 0;
                        cmd.Parameters.AddWithValue("@WKECPT", SqlDbType.Decimal).Value                  = CheckBox2.Checked?Convert.ToDecimal(weekdaysExtraChildPricePercentage.Text) : 0;
                        cmd.Parameters.AddWithValue("@WKECMP", SqlDbType.Int).Value                      = CheckBox2.Checked?Convert.ToInt16(ddl_weekdaysxtraChildMealType.SelectedValue) : 11;
                        cmd.Parameters.AddWithValue("@WKEAP", SqlDbType.Decimal).Value                   = CheckBox2.Checked?Convert.ToDecimal(weekdaysExtraAdultPrice.Text) : 0;
                        cmd.Parameters.AddWithValue("@WKEAPT", SqlDbType.Decimal).Value                  = CheckBox2.Checked?Convert.ToDecimal(weekdaysExtraAdultTax.Text) : 0;
                        cmd.Parameters.AddWithValue("@WKEAMP", SqlDbType.Int).Value                      = CheckBox2.Checked?Convert.ToInt16(ddl_weekdaysxtraAdultMealType.SelectedValue) : 11;
                        cmd.Parameters.AddWithValue("@WDP", SqlDbType.Decimal).Value                     = CheckBox2.Checked?Convert.ToDecimal(weekendsPrice.Text) : 0;
                        cmd.Parameters.AddWithValue("@WDTax", SqlDbType.Decimal).Value                   = CheckBox2.Checked?Convert.ToDecimal(weekendsPriceTax.Text) : 0;
                        cmd.Parameters.AddWithValue("@WDECP", SqlDbType.Int).Value                       = CheckBox2.Checked?Convert.ToInt16(weekendsExtraChildPrice.Text) : 0;
                        cmd.Parameters.AddWithValue("@WDECPT", SqlDbType.Decimal).Value                  = CheckBox2.Checked?Convert.ToDecimal(weekendsExtraChildPricePercentage.Text) : 0;
                        cmd.Parameters.AddWithValue("@WDECMP", SqlDbType.Int).Value                      = CheckBox2.Checked?Convert.ToInt16(ddl_weekendsxtraChildMealType.SelectedValue) : 11;
                        cmd.Parameters.AddWithValue("@WDEAP", SqlDbType.Decimal).Value                   = CheckBox2.Checked?Convert.ToDecimal(weekendsExtraAdultPrice.Text) : 0;
                        cmd.Parameters.AddWithValue("@WDEAPT", SqlDbType.Decimal).Value                  = CheckBox2.Checked?Convert.ToDecimal(weekendsExtraAdultTax.Text) : 0;
                        cmd.Parameters.AddWithValue("@WDEAMP", SqlDbType.Int).Value                      = CheckBox2.Checked?Convert.ToInt16(ddl_weekendsxtraAdultMealType.SelectedValue) : 11;
                        cmd.Parameters.AddWithValue("@SDP", SqlDbType.Decimal).Value                     = CheckBox2.Checked?Convert.ToDecimal(specialDayPrice.Text) : 0;
                        cmd.Parameters.AddWithValue("@SDTax", SqlDbType.Decimal).Value                   = CheckBox2.Checked?Convert.ToDecimal(specialDayPriceTax.Text) : 0;
                        cmd.Parameters.AddWithValue("@SDECP", SqlDbType.Int).Value                       = CheckBox2.Checked?Convert.ToInt16(specialDayExtraChildPrice.Text) : 0;
                        cmd.Parameters.AddWithValue("@SDECPT", SqlDbType.Decimal).Value                  = CheckBox2.Checked?Convert.ToDecimal(specialDayExtraChildPricePercentage.Text) : 0;
                        cmd.Parameters.AddWithValue("@SDECMP", SqlDbType.Int).Value                      = CheckBox2.Checked?Convert.ToInt16(ddl_specialDayxtraChildMealType.SelectedValue) : 11;
                        cmd.Parameters.AddWithValue("@SDEAP", SqlDbType.Decimal).Value                   = CheckBox2.Checked?Convert.ToDecimal(specialDayExtraAdultPrice.Text) : 0;
                        cmd.Parameters.AddWithValue("@SDEAPT", SqlDbType.Decimal).Value                  = CheckBox2.Checked?Convert.ToDecimal(specialDayExtraAdultTax.Text) : 0;
                        cmd.Parameters.AddWithValue("@SDEAMP", SqlDbType.Int).Value                      = CheckBox2.Checked ? Convert.ToInt16(ddl_specialDayxtraAdultMealType.SelectedValue) : 11;
                        cmd.Parameters.AddWithValue("@SPP", SqlDbType.Decimal).Value                     = Convert.ToDecimal(spPrice.Text);
                        cmd.Parameters.AddWithValue("@SPT", SqlDbType.Decimal).Value                     = Convert.ToDecimal(spPriceTax.Text);
                        cmd.Parameters.AddWithValue("@SPMP", SqlDbType.Int).Value                        = Convert.ToInt16(ddl_spMealType.SelectedValue);
                        cmd.Parameters.AddWithValue("@Inclusion", SqlDbType.NVarChar).Value              = txt_inclusion.Text;
                        cmd.Parameters.AddWithValue("@WDPoRFCouple", SqlDbType.Bit).Value                = CheckBox1.Checked ? true : false;
                        cmd.Parameters.AddWithValue("@WDPoRFChild", SqlDbType.Bit).Value                 = normalpriceonrequestchild.Checked ? true : false;
                        cmd.Parameters.AddWithValue("@WDPoRFAdult", SqlDbType.Bit).Value                 = normalpriceonrequestadult.Checked ? true : false;
                        cmd.Parameters.AddWithValue("@WNDPoRFCouple", SqlDbType.Bit).Value               = weekendsCheckBox1.Checked ? true : false;
                        cmd.Parameters.AddWithValue("@WNDPoRFChild", SqlDbType.Bit).Value                = weekendspriceonrequestchild.Checked ? true : false;
                        cmd.Parameters.AddWithValue("@WNDPoRFAdult", SqlDbType.Bit).Value                = weekendspriceonrequestadult.Checked ? true : false;
                        cmd.Parameters.AddWithValue("@SDPoRFCouple", SqlDbType.Bit).Value                = specialDayCheckBox1.Checked ? true : false;
                        cmd.Parameters.AddWithValue("@SDPoRFChild", SqlDbType.Bit).Value                 = specialpriceonrequestchild.Checked ? true : false;
                        cmd.Parameters.AddWithValue("@SDPoRFAdult", SqlDbType.Bit).Value                 = specialpriceonrequestadult.Checked ? true : false;
                        cmd.Parameters.AddWithValue("@NDPoRFCouple", SqlDbType.Bit).Value                = normalCheckBox1.Checked ? true : false;
                        cmd.Parameters.AddWithValue("@NDPoRFChild", SqlDbType.Bit).Value                 = normalpriceonrequestchild.Checked ? true : false;
                        cmd.Parameters.AddWithValue("@NDPoRFAdult", SqlDbType.Bit).Value                 = normalpriceonrequestadult.Checked ? true : false;
                        cmd.Parameters.AddWithValue("@SpPoR", SqlDbType.Bit).Value                       = CheckBox3.Checked ? true : false;
                        cmd.Parameters.AddWithValue("@Description", SqlDbType.NVarChar).Value = CKEditor1.Text.Trim();
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        sqlConnection.Close();
                    }
                }

            }
            catch (Exception ex)
            {
                txt_inclusion.Text = ex.Message;
            }
        }

        protected void Button1_OnClick(object sender, EventArgs e)
        {
            if (normalCheckBox1.Checked)
            {
                normalPriceTax.Text = "0";
                normalExtraChildPrice.Text = "0";
                normalPrice.Text = "0";
                normalExtraChildPricePercentage.Text = "0";
                //ddl_normalxtraChildMealType.SelectedValue = "0";
                normalExtraAdultPrice.Text = "0";
                normalExtraAdultTax.Text = "0";
            }
            if (CheckBox1.Checked)
            {
                 weekdaysPrice.Text = "0";
                weekdaysPriceTax.Text = "0";
                weekdaysExtraChildPrice.Text = "0";
                weekdaysExtraChildPricePercentage.Text = "0";
                //ddl_weekdaysxtraChildMealType.SelectedValue = "0";
                weekdaysExtraAdultPrice.Text = "0";
                weekdaysExtraAdultTax.Text = "0";
                //ddl_weekdaysxtraAdultMealType.SelectedValue = "0";
            }
            if (weekendsCheckBox1.Checked)
            {
                weekendsPrice.Text = "0";
                weekendsPriceTax.Text = "0";
                weekendsExtraChildPrice.Text = "0";
                weekendsExtraChildPricePercentage.Text = "0";
                //ddl_weekendsxtraChildMealType.SelectedValue = "0";
                weekendsExtraAdultPrice.Text = "0";
                weekendsExtraAdultTax.Text = "0";
                //ddl_weekendsxtraAdultMealType.SelectedValue = "0";
            }
            if (specialDayCheckBox1.Checked)
            {
                specialDayPrice.Text = "0";
                specialDayPriceTax.Text = "0";
                specialDayExtraChildPrice.Text = "0";
                specialDayExtraChildPricePercentage.Text = "0";
                //ddl_specialDayxtraChildMealType.SelectedValue = "0";
                specialDayExtraAdultPrice.Text = "0";
                specialDayExtraAdultTax.Text = "0";
                //ddl_specialDayxtraAdultMealType.SelectedValue = "0";
            }
            if (CheckBox3.Checked)
            {
                spPrice.Text = "0";
                spPriceTax.Text = "0";
                //ddl_spMealType.SelectedValue = "0";
            }
            CreateHotelPackage();
        }
    }
}

