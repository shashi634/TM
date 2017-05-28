using System;
using System.Web.UI.WebControls;

namespace ErpNBFC.p
{
    public partial class MealPlan : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button2.Visible = false;
            string mealTypeId = Request.QueryString["C"];

            if (IsPostBack) return;
            ShowData();
            if (mealTypeId != null)
            {
                Button1.Visible = false;
                Button2.Visible = true;
                GetMealType(mealTypeId);
            }
        }

        protected void ShowData()
        {
            hotelsTypes.DataSource = GetData("select * from MealType where isdeleted=0 ");
            hotelsTypes.DataBind();
        }

        
        protected void hotelsTypes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = hotelsTypes.Rows[e.RowIndex].FindControl("h") as Label;
            DeleteData("DeleteMealType", new Guid(id.Text));
            ShowData();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == null || TextBox1.Text == "")
            {
                lblmsg.Text = "Please enter meal plan";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                int dataValue = EnterSignleValue("AddMealType", TextBox1.Text);
                if (dataValue == 200)
                {
                    lblmsg.Text = "Meal Plan Listed Successfully";
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                    ShowData();
                }
                if (dataValue == 201)
                {
                    lblmsg.Text = "Meal Plan Already Listed";
                    lblmsg.ForeColor = System.Drawing.Color.AliceBlue;
                }
            }
        }
        public void GetMealType(string publicId)
        {
            var HotelType = GetData("select * from MealType where publicid='" + publicId + "' and isdeleted=0");
            if (HotelType.Rows.Count <= 0) return;
            TextBox1.Text = HotelType.Rows[0][1].ToString();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == null || TextBox1.Text == "")
            {
                lblmsg.Text = "Please enter Meal Plan";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                try
                {
                    UpdateSignleValue("UpdateMealType", TextBox1.Text, Request.QueryString["C"]);
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