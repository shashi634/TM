using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ErpNBFC.p
{
    public partial class Hotel : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowData();
                PopulateDropDown("Select Id,[Type] as type from HotelType", DropDownList1, "type", "Id");
                PopulateDropDown("Select Id,Name,CountryName from location", DropDownList2, "Name", "Id");
            }
        }

        protected void ShowData()
        {
            hotelsTypes.DataSource = GetData("select a.Id,a.publicId,a.Name as hotelName, b.Name from Hotels a inner join AdminAccount b on a.LoggingUserId=b.PublicId");
            hotelsTypes.DataBind();
        }

        protected void hotelsTypes_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            hotelsTypes.EditIndex = e.NewEditIndex;
            ShowData();
        }
        protected void hotelsTypes_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label id = hotelsTypes.Rows[e.RowIndex].FindControl("h") as Label;
            TextBox name = hotelsTypes.Rows[e.RowIndex].FindControl("txt_type") as TextBox;

            // update databse
            UpdateSignleValue("UpdateHotel", name.Text, Convert.ToInt16(id.Text));
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            hotelsTypes.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            ShowData();
        }
        protected void hotelsTypes_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            hotelsTypes.EditIndex = -1;
            ShowData();
        }
        protected void hotelsTypes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = hotelsTypes.Rows[e.RowIndex].FindControl("h") as Label;
            DeleteData("DeleteHotelType", Convert.ToInt16(id.Text));
            ShowData();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TextBox1.Text))
            {
                lblmsg.Text = "Please enter Hotel name";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                try
                {
                    using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
                    {
                        using (SqlCommand cmd = new SqlCommand("AddHotel", sqlConnection))
                        {
                            var userGuid = Session["TLogin"].ToString().Split('|');
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@Name", SqlDbType.NVarChar).Value = TextBox1.Text.Trim();
                            cmd.Parameters.AddWithValue("@userId", SqlDbType.UniqueIdentifier).Value = new Guid(userGuid[2]);
                            cmd.Parameters.AddWithValue("@hotelTypeId", SqlDbType.Decimal).Value = DropDownList1.SelectedItem.Value;
                            cmd.Parameters.AddWithValue("@cityId", SqlDbType.Decimal).Value = DropDownList2.SelectedItem.Value;
                            cmd.Parameters.AddWithValue("@address", SqlDbType.NVarChar).Value = TextBox6.Text;
                            SqlParameter obj = new SqlParameter("@msg", SqlDbType.NVarChar, 100);
                            obj.Direction = ParameterDirection.ReturnValue;
                            cmd.Parameters.Add(obj);
                            sqlConnection.Open();
                            cmd.ExecuteNonQuery();
                            if (obj.Value.ToString() == "201") {
                                lblmsg.Text = "This package is already available";
                                lblmsg.ForeColor = System.Drawing.Color.Red;
                            }
                            else{
                               
                               lblmsg.Text = " Package Created successfully!";
                                lblmsg.ForeColor = System.Drawing.Color.Green;
                                ShowData();
                            }
                                
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblmsg.Text = ex.Message;
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}