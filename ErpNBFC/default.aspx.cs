using System;
using System.Data;
using Newtonsoft.Json;

namespace ErpNBFC
{
    public partial class _default : Common
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var m = GetData("Select * from Location");
            Response.Write(DataTableToJsonWithJsonNet(m));
        }

        protected void Button1_OnClick(object sender, EventArgs e)
        {
            Label1.Text = TextBox1.Text;
        }
        public string DataTableToJsonWithJsonNet(DataTable table)
        {
            var jsonString = JsonConvert.SerializeObject(table);
            return jsonString;
        }
    }
}





