using System;
using System.Web.UI.WebControls;

namespace ErpNBFC.p
{
    public partial class HotelType : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Button2.Visible = false;
            string hotelTypeId = Request.QueryString["C"];

            if (IsPostBack) return;
            ShowData();
            if (hotelTypeId != null)
            {
                Button1.Visible = false;
                Button2.Visible = true;
                GetHotelType(hotelTypeId);
            }
        }
       
        protected void ShowData()
        {
            hotelsTypes.DataSource = GetData("select * from HotelType where isdeleted=0 ");
            hotelsTypes.DataBind();
        }

        //protected void hotelsTypes_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    //NewEditIndex property used to determine the index of the row being edited.  
        //    hotelsTypes.EditIndex = e.NewEditIndex;
        //    ShowData();
        //}
        //protected void hotelsTypes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    //Finding the controls from Gridview for the row which is going to update  
        //    Label id = hotelsTypes.Rows[e.RowIndex].FindControl("h") as Label;
        //    TextBox name = hotelsTypes.Rows[e.RowIndex].FindControl("txt_type") as TextBox;

        //    // update databse
        //    UpdateSignleValue("UpdateHotelsType",name.Text,Convert.ToInt16(id.Text));
        //    //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
        //    hotelsTypes.EditIndex = -1;
        //    //Call ShowData method for displaying updated data  
        //    ShowData();
        //}
        //protected void hotelsTypes_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        //{
        //    //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
        //    hotelsTypes.EditIndex = -1;
        //    ShowData();
        //}
        protected void hotelsTypes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = hotelsTypes.Rows[e.RowIndex].FindControl("h") as Label;
            DeleteData("DeleteHotelType", new Guid(id.Text));
            ShowData();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == null || TextBox1.Text == "")
            {
                lblmsg.Text = "Please enter Hotel Type";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                int dataValue = EnterSignleValue("AddHotelType", TextBox1.Text);
                if (dataValue == 200)
                {
                    lblmsg.Text = "Hotel Type Listed Successfully";
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                    ShowData();
                }
                if (dataValue == 201)
                {
                    lblmsg.Text = "Hotel Type Already Listed";
                    lblmsg.ForeColor = System.Drawing.Color.AliceBlue;
                }
                if (dataValue == 202)
                {
                    lblmsg.Text = "Hotel Type Listed is active now";
                    lblmsg.ForeColor = System.Drawing.Color.AliceBlue;
                }
            }
        }
        public void GetHotelType(string publicId)
        {
            var HotelType = GetData("select * from HotelType where publicid='" + publicId + "' and isdeleted=0");
            if (HotelType.Rows.Count <= 0) return;
            TextBox1.Text = HotelType.Rows[0][1].ToString();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == null || TextBox1.Text == "")
            {
                lblmsg.Text = "Please enter location";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                try
                {
                    UpdateSignleValue("UpdateHotelType", TextBox1.Text, Request.QueryString["C"]);
                    Button2.Visible = false;
                    Button1.Visible = true;
                    TextBox1.Text = null;
                    ShowData();
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