using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TopCareWebApplication.UserControls
{
    public partial class SubscriptionFeeWebUserControl : System.Web.UI.UserControl
    {


        private decimal _MemberSubscriptionPaidID;
        public decimal MemberSubscriptionPaidID
        {
            get
            {
                return _MemberSubscriptionPaidID;
            }
            set
            {
                _MemberSubscriptionPaidID = value;
            }
        }


        //private decimal _paidAmount;
        public decimal PaidAmount
        {
            get { return Convert.ToDecimal( ViewState["_paidSubFeeAmount"] ?? 0) ; }
            set
            {
                ViewState["_paidSubFeeAmount"] = value;
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
                bool? isWaived = false;
                if (Utils.IsSubsrciptionPaid(MemberID, out isWaived)) //subscription is paid
                {
                    MultiView1.SetActiveView(View2);
                }
                else //subscription is not paid
                {
                    if (isWaived != null)
                    {
                        if (isWaived.Value)
                        {
                            IsWaived = true;
                            MultiView1.SetActiveView(View4);
                        }
                        else
                        {
                            MultiView1.SetActiveView(View1);
                        }
                    }
                    else
                    {
                        MultiView1.SetActiveView(View1);
                    }
                }
            }
        }

      

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text.Trim().Length > 0)
            {

                IsWaived = false;
                PaidAmount = Convert.ToDecimal(TextBox2.Text);
                MultiView1.SetActiveView(View2);
                //lblPaidAmount.Text = PaidAmount.ToString();
            }
            else if (chkWaived.Checked)
            {
                PaidAmount = 0;
                IsWaived = true;
                //lblPaidAmount.Text = "Waived";
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
           //PaidAmount = Convert.ToDecimal(lblPaidAmount.Text); 
           // MultiView1.SetActiveView(View3);
        }
    }
}