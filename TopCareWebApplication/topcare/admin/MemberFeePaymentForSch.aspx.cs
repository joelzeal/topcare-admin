using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TopCareWebApplication.admin
{
    public partial class MemberFeePaymentForSch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedIndex == 0) //pay for a day
            {
                FormView1.Visible = true;
                pnlMultiPayments.Visible = false;
            }
            else //pay for a period
            {
                FormView1.Visible = false;
                pnlMultiPayments.Visible = true;
            }
        }
   decimal amountPaid; 
        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            amountPaid = Convert.ToDecimal(TextBox2.Text);
            //create data context for data entry
            TopCareDataContext db = new TopCareDataContext();


            foreach (ListItem item in CheckBoxList1.Items)
            {
                if (item.Selected)
                {
                    int scheduleId = Convert.ToInt32( item.Value);
                    PayforSchedule(scheduleId, db);
                }
            }
            Response.Redirect(Request.RawUrl);
        }

     

        /// <summary>
        /// This method inserts payment for a particular schdule with an amount thats supplied.
        /// It returns the remainder after the schedule amount due is subtructed.
        /// </summary>
        /// <param name="scheduleID"></param>
        /// <returns></returns>
        void PayforSchedule(int scheduleID, TopCareDataContext db)
        {
            Schedule _schedule = db.Schedules.FirstOrDefault(s => s.ScheduleID == scheduleID);

            if (amountPaid >= _schedule.PaymentExpected)
            {
                MemberAttendance memberAttendance = new MemberAttendance();
                memberAttendance.ScheduleID = scheduleID;
                memberAttendance.AmountPaid = _schedule.PaymentExpected;
                memberAttendance.HasPaid = true;
                memberAttendance.IsFeeWaived = false;
                memberAttendance.MemberID = Convert.ToInt32(Request.QueryString["mid"]);
                memberAttendance.PaymentDate = DateTime.Now;
                memberAttendance.PaymentRecievedBy = HttpContext.Current.User.Identity.Name;

                db.MemberAttendances.InsertOnSubmit(memberAttendance);
                db.SubmitChanges();

                amountPaid = amountPaid - _schedule.PaymentExpected.Value;
            }
        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            GridView1.DataBind();
        }
    }
}