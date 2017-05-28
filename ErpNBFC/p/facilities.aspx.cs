using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ErpNBFC.p
{
    public partial class facilities : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button2.Visible = false;
            string facilityId = Request.QueryString["C"];

            if (IsPostBack) return;
            ShowData();
            if (facilityId != null)
            {
                Button1.Visible = false;
                Button2.Visible = true;
                GetFacility(facilityId);
            }
        }

        protected void ShowData()
        {
            hotelsTypes.DataSource = GetData("select * from facilities ");
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
            UpdateSignleValue("UpdateHotelsType", name.Text, Convert.ToInt16(id.Text));
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
            if (TextBox1.Text == null || TextBox1.Text == "")
            {
                lblmsg.Text = "Please enter Facility";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                int dataValue = EnterSignleValue("AddFacilities", TextBox1.Text);
                if (dataValue == 200)
                {
                    lblmsg.Text = "Facility Listed Successfully";
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                    ShowData();
                }
                if (dataValue == 201)
                {
                    lblmsg.Text = "Facility Already Listed";
                    lblmsg.ForeColor = System.Drawing.Color.AliceBlue;
                }
            }
        }
        public void GetFacility(string facilityId)
        {
            var facility = GetData("select * from facilities where id=" + Convert.ToInt32(facilityId));
            if (facility.Rows.Count <= 0) return;
            TextBox1.Text = facility.Rows[0][1].ToString();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            UpdateSignleValue("UpdateFacility", TextBox1.Text, Convert.ToInt16(Request.QueryString["C"]));
            Button2.Visible = false;
            Button1.Visible = true;
            TextBox1.Text = null;
            ShowData();
        }
    }
}