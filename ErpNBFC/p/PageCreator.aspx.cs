using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Collections.ObjectModel;
using System.IO;
using System.Web;

namespace ErpNBFC.p
{
    public partial class PageCreator : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    populateCity();
                    GetPage();
                    GetLocationImage();
                }
                catch (Exception exception)
                {
                    
                    throw;
                }
            }
        
    }
        protected void btnSaveFile_Click(object sender, EventArgs e)
        {
            Collection<string> imagesUploading = new Collection<string>();
            HttpFileCollection _HttpFileCollection = Request.Files;
            for (int i = 0; i < _HttpFileCollection.Count; i++)
            {
                HttpPostedFile _HttpPostedFile = _HttpFileCollection[i];
                string fileExtention = _HttpPostedFile.FileName.Substring(_HttpPostedFile.FileName.LastIndexOf('.'));
                Guid imageName = Guid.NewGuid();
                if (_HttpPostedFile.ContentLength > 0) _HttpPostedFile.SaveAs(Server.MapPath("~/p/images/" + imageName + fileExtention));
                imagesUploading.Add(imageName + fileExtention);
            }
            string hotelimages = String.Join(",", imagesUploading);
            using (var sqlConnection = new SqlConnection(ConnectionString))
            {
                using (var cmd = new SqlCommand("AddLocationImages", sqlConnection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@LocationId", SqlDbType.Int).Value = ddl_location.SelectedItem.Value;
                    cmd.Parameters.AddWithValue("@image", SqlDbType.NVarChar).Value = hotelimages;
                    sqlConnection.Open();
                    cmd.ExecuteNonQuery();
                    sqlConnection.Close();
                }
                GetLocationImage();
            }
        }
        public void populateCity()
        {
            PopulateDropDown("select Id,Name+' - '+CountryName as Name from location", ddl_location, "Name", "Id");
        }
        public void GetLocationImage() {
            try
            {
                DataList1.DataSource = GetData("select ImageName from LocationImages where locationid=" + ddl_location.SelectedItem.Value);
                DataList1.DataBind();
            }
            catch (Exception e)
            {
               
                //
            }
            
        }

        protected void ddl_location_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetPage();
            GetLocationImage();
        }

        public void SavePage() {
            try
            {
                using (var sqlConnection = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand("CreateLocationPage", sqlConnection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@title", SqlDbType.NVarChar).Value = location_title.Text.Trim();
                        cmd.Parameters.AddWithValue("@description", SqlDbType.NVarChar).Value = CKEditor1.Text;
                        cmd.Parameters.AddWithValue("@locationId", SqlDbType.Int).Value = ddl_location.SelectedItem.Value;
                        var obj = new SqlParameter("@msg", SqlDbType.NVarChar, 100)
                        {
                            Direction = ParameterDirection.ReturnValue
                        };
                        cmd.Parameters.Add(obj);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        if (obj.Value.ToString() == "200")
                        {
                            lblmsg.Text = "Page Already Created!";
                            lblmsg.ForeColor = System.Drawing.Color.Red;
                        }
                        else {
                            lblmsg.Text = "Page created successfully!";
                            lblmsg.ForeColor = System.Drawing.Color.Green;
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            ddl_location.Enabled = true;
        }

        protected void btn_create_page_Click(object sender, EventArgs e)
        {
            SavePage();
        }

        public void GetPage() {
            try
            {
                var data = GetData("  select publicid,Title ,description,CreatedDate from LocationPage where locationid=" + ddl_location.SelectedItem.Value);
                if (data.Rows.Count == 0) { location_title.Text = null; CKEditor1.Text = null; return; }
                location_title.Text = data.Rows[0][1].ToString();
                CKEditor1.Text = data.Rows[0][2].ToString();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            
        }
    }
}