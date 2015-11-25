using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TopCareWebApplication.admin
{
    public partial class SubscriptionFeePayments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            try
            {
                using (TopCareDataContext db = new TopCareDataContext())
                {
                    MemberSubscriptionsPaid _tempMemberSubscriptionsPaid = new MemberSubscriptionsPaid();
                    _tempMemberSubscriptionsPaid.MemberID = Convert.ToInt32(Request.QueryString["mid"]);
                    _tempMemberSubscriptionsPaid.AmountPaid = Convert.ToDecimal(AmountPaidTextBox.Text.Trim());
                   // _tempMemberSubscriptionsPaid.CreatedBy = Session["CurrentUser"].ToString();
                    _tempMemberSubscriptionsPaid.CreatedDate = DateTime.Now;
                    _tempMemberSubscriptionsPaid.ExpiryDate = Convert.ToDateTime(PaymentDateTextBox.Text.Trim()).AddYears(1).AddDays(-1);
                    _tempMemberSubscriptionsPaid.PaymentDate = Convert.ToDateTime(PaymentDateTextBox.Text.Trim());
                   // _tempMemberSubscriptionsPaid.PaymentRecievedBy = Session["CurrentUser"].ToString();

                    db.MemberSubscriptionsPaids.InsertOnSubmit(_tempMemberSubscriptionsPaid);
                    db.SubmitChanges();

                    GridView1.DataBind();

                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}