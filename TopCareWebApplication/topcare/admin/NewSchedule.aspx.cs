using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TopCareWebApplication.admin
{
    public partial class NewSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["sID"] != null)
                {
                    FormView1.DefaultMode = FormViewMode.Edit;
                }
            }
        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            //string sID = e.Command.Parameters["@Identity"].Value.ToString();
        }

        protected void ScheduleSqlDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            Response.Redirect("ScheduleDetails_new.aspx?sID=" + e.Command.Parameters["@sID"].Value.ToString());
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Response.Redirect("ScheduleDetails_new.aspx?sID=" + Request.QueryString["sID"] + "&isEdit=1");
        }
    }
}