using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TopCareWebApplication.UserControls
{
    public partial class PreSFToolbarUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        //{
        //    Response.Redirect("~//topcare//ReportPages//ScheduleDetails.aspx?sID=" + Request.QueryString["sID"]);
        //}

        //protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        //{

        //}

        //protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        //{
        //    Response.Redirect("~//topcare/admin//ScheduleDetailsMulti.aspx");
        //}

        protected void btnPrintPreSchedule_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~//topcare//ReportPages//PreScheduleFollowupSummary.aspx?sID=" + Request.QueryString["sID"]);
        }

        protected void btnScheduleDetails_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~//topcare//admin//NewSchedule.aspx?sID=" + Request.QueryString["sID"]);
        }

        protected void btnAttendanceCheck_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~//topcare//admin//AttendanceCheck.aspx?sID=" + Request.QueryString["sID"]);
        }

        protected void btnPreSFDetails_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~//topcare//admin//WeeklyClientFollowup.aspx?sID=" + Request.QueryString["sID"]);
        }
    }
}