using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TopCareWebApplication.admin
{
    public partial class ScheduleList_MultiView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // GridView1.Style["TABLE-LAYOUT"] = "fixed";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void AllSchedulesSqlDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            //e.Row.Cells[8].Wrap = false;
            //e.Row.Cells[8].Style["overflow"] = "hidden";
            //e.Row.Cells[8].Style["text-overflow"] = "ellipsis";
        }
    }

}