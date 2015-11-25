using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TopCareWebApplication.UserControls
{
    public partial class MemberToolbarUserControl1 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnAttendanceHistory_Click(object sender, ImageClickEventArgs e)
        {
            if (Request.QueryString["mid"] != null)
            {
                Response.Redirect("~//topcare/admin//AttendanceHistory.aspx?mid=" + Request.QueryString["mid"]);
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            if (Request.QueryString["mid"] != null)
            {
                Response.Redirect("~//topcare/admin//SubscriptionFeePayments.aspx?mid=" + Request.QueryString["mid"]);
            }
        }

        protected void btnMemberAttendancePayments_Click(object sender, ImageClickEventArgs e)
        {
            if (Request.QueryString["mid"] != null)
            {
                Response.Redirect("~//topcare/admin//MemberFeePaymentForSch.aspx?mid=" + Request.QueryString["mid"]);
            }
        }
    }
}