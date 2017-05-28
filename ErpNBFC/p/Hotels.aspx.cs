using System;
using System.Data;
using System.Data.SqlClient;

namespace ErpNBFC.p
{
    public partial class Hotels : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            PopulateDropDown("Select Id,name from Hotels", DropDownList5, "name", "Id");
            PopulateDropDown("Select Id,[plan] from HotelsMealPlan", DropDownList2, "plan", "Id");
            PopulateDropDown("Select Id,[type] as type from HotelsRoomType", DropDownList3, "type", "Id");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                using (var sqlConnection = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand("createAndUpdatePackage", sqlConnection))
                    {
                        var userGuid = Session["TLogin"].ToString().Split('|');
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@HotelId", SqlDbType.Decimal).Value = DropDownList5.SelectedItem.Value;
                        cmd.Parameters.AddWithValue("@MealPlanId", SqlDbType.Decimal).Value = DropDownList2.SelectedItem.Value;
                        cmd.Parameters.AddWithValue("@RoomTypeId", SqlDbType.Decimal).Value = DropDownList3.SelectedItem.Value;
                        cmd.Parameters.AddWithValue("@ValidFrom", SqlDbType.Date).Value = Convert.ToDateTime(TextBox11.Text);
                        cmd.Parameters.AddWithValue("@ValidTo", SqlDbType.Date).Value = Convert.ToDateTime(TextBox1.Text);
                        cmd.Parameters.AddWithValue("@Rate", SqlDbType.Decimal).Value = Convert.ToDecimal(TextBox3.Text);
                        cmd.Parameters.AddWithValue("@NoOfNights", SqlDbType.Int).Value = Convert.ToDecimal(TextBox4.Text);
                        cmd.Parameters.AddWithValue("@NoOfDays", SqlDbType.Int).Value = Convert.ToDecimal(TextBox5.Text);
                        cmd.Parameters.AddWithValue("@RateForExtraAdult", SqlDbType.Decimal).Value = Convert.ToDecimal(TextBox7.Text);
                        cmd.Parameters.AddWithValue("@RateForExtraChild", SqlDbType.Decimal).Value = Convert.ToDecimal(TextBox8.Text);
                        cmd.Parameters.AddWithValue("@TDS", SqlDbType.Decimal).Value = Convert.ToDecimal(TextBox2.Text);
                        cmd.Parameters.AddWithValue("@Description", SqlDbType.Text).Value = TextBox10.Text;
                        cmd.Parameters.AddWithValue("@createdById", SqlDbType.UniqueIdentifier).Value = new Guid(userGuid[1]);
                        cmd.Parameters.AddWithValue("@createddatetime", SqlDbType.DateTime).Value = DateTime.Now;
                        cmd.Parameters.AddWithValue("@packageTitle", SqlDbType.DateTime).Value = TextBox6.Text.Trim();
                        var obj = new SqlParameter("@msg", SqlDbType.NVarChar, 100)
                        {
                            Direction = ParameterDirection.ReturnValue
                        };
                        cmd.Parameters.Add(obj);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        if (obj.Value.ToString() == "201") { 
                            lblmsg.Text = "Package Created Successfully";
                            lblmsg.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            lblmsg.Text = "package Already created!";
                        lblmsg.ForeColor = System.Drawing.Color.Green;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
        }
    }


}
                          