using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TopCareWebApplication.UserControls
{
    public partial class AttendanceWebUserControl : System.Web.UI.UserControl
    {


        private decimal _MemberAttendanceID;
        public decimal MemberAttendanceID
        {
            get
            {
                return _MemberAttendanceID;
            }
            set
            {
                _MemberAttendanceID = value;
            }
        }


        //private decimal _paidAmount;
        public decimal PaidAmount
        {
            get { return Convert.ToDecimal( ViewState["_paidAmount"] ?? 0) ; }
            set
            {
                ViewState["_paidAmount"] = value;
                TextBox2.Text = value.ToString();
            }
        }


        //private int _memberID;
        public int MemberID
        {
            get { return Convert.ToInt32(ViewState["_memberID"] ?? 0);  }
            set
            {
                ViewState["_memberID"] = value;
            }
        }


        //private int _scheduleID;
        public int ScheduleID
        {
            get { return Convert.ToInt32(ViewState["_scheduleID"] ?? 0); }
            set
            {
                ViewState["_scheduleID"] = value;
            }
        }

        public bool IsWaived
        {
            get { return Convert.ToBoolean(ViewState["_IsWaived"] ?? false); }
            set
            {
                ViewState["_IsWaived"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                decimal result = AmountPaidByMemberForSchedule();
                if (result > 0) //paid view
                {
                    PaidAmount = result;
                    lblPaidAmount.Text = PaidAmount.ToString();
                    MultiView1.SetActiveView(View2);
                }
                else if (result == 0)//click to payment view
                {
                    MultiView1.SetActiveView(View1);
                }
                else if (result == -50000)
                {
                    MultiView1.SetActiveView(View4);
                }
            }
        }

        decimal AmountPaidByMemberForSchedule()
        {
            try
            {
                using (TopCareDataContext db = new TopCareDataContext())
                {
                    MemberAttendance mAttendace = db.MemberAttendances.FirstOrDefault(m => m.MemberID == MemberID && m.ScheduleID == ScheduleID);
                    if (mAttendace != null)
                    {
                        //assiging the MemberAttendanceID
                        MemberAttendanceID = mAttendace.MemberAttendanceID;

                        if (mAttendace.AmountPaid.Value > 0)
                        {
                             return mAttendace.AmountPaid.Value;
                        }
                        else if (mAttendace.IsFeeWaived.Value)
                        {
                            return -50000;
                        }
                        else
                        {
                            return 0;
                        }
                    }
                    else
                    {
                        return 0;
                    }
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text.Trim().Length > 0)
            {

                IsWaived = false;
                PaidAmount = Convert.ToDecimal(TextBox2.Text);
                MultiView1.SetActiveView(View2);
                lblPaidAmount.Text = PaidAmount.ToString();
            }
            else if (chkWaived.Checked)
            {
                PaidAmount = 0;
                IsWaived = true;
                lblPaidAmount.Text = "Waived";
                MultiView1.SetActiveView(View4);
            }
        }

        protected void chkWaived_CheckedChanged(object sender, EventArgs e)
        { PaidAmount = 0;
            TextBox2.Enabled = false;
        }

        protected void btnEnterPayment_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View3);
        }

        protected void lbtnEdit_Click(object sender, EventArgs e)
        {
           PaidAmount = Convert.ToDecimal(lblPaidAmount.Text); 
            MultiView1.SetActiveView(View3);
        }
    }
}