using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TopCareWebApplication.admin
{
    public partial class SearchResultsPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                if (Request.QueryString["searchStr"] != null)
                {
                    txtSearch.Text = Request.QueryString["searchStr"];
                    ImageButton1_Click(this, new ImageClickEventArgs(0, 1));
                }
            }
        }


        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            
            Member _member = e.Item.DataItem as Member;
            //((Image)e.Item.FindControl("Image1")).ImageUrl = "ImageDisplay.ashx?mid=" + _member.MemberID;

            ((HyperLink)e.Item.FindControl("HyperLink1")).NavigateUrl = "CreateMember.aspx?mid=" + _member.MemberID;
            ((HyperLink)e.Item.FindControl("hplAttendanceHistory")).NavigateUrl = "AttendanceHistory.aspx?mid=" + _member.MemberID;
            ((HyperLink)e.Item.FindControl("hplSubscriptionFeeHistory")).NavigateUrl = "SubscriptionFeePayments.aspx?mid=" + _member.MemberID;
            ((HyperLink)e.Item.FindControl("hplAttendancePayment")).NavigateUrl = "MemberFeePaymentForSch.aspx?mid=" + _member.MemberID;
/*

            if (NavigateUrl.Length > 0)
            {
                ((HyperLink)e.Item.FindControl("mainLink")).NavigateUrl = NavigateUrl + "?mid=" + _member.MemberId;
                ((HyperLink)e.Item.FindControl("HyperLink1")).NavigateUrl = NavigateUrl + "?mid=" + _member.MemberId;
            }
            //((HyperLink)e.Item.FindControl("mainLink")).NavigateUrl = NavigateUrl + "?GroupId=" + _group.GroupId;
            else
            {
                ((HyperLink)e.Item.FindControl("mainLink")).NavigateUrl = "MemberDetails.aspx?mid=" + _member.MemberId;
                ((HyperLink)e.Item.FindControl("HyperLink1")).NavigateUrl = "MemberDetails.aspx?mid=" + _member.MemberId;
            }
             * */
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            //run search only when there is text in search box
            if (txtSearch.Text.Trim().Length > 0)
            {
                var searchResults = Utils.SearchMember(txtSearch.Text.Trim());
                Repeater2.DataSource = searchResults;
                Repeater2.DataBind();
            }


            if (Repeater2.Items.Count == 0)
            {
                lblNoResults.Visible = true;
            }
            else
            {
                lblNoResults.Visible = false;
            }

         
        }
    }
}