using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TopCareWebApplication.topcare.UserControls
{
    public partial class RSVPWebUserControl : System.Web.UI.UserControl
    {

        private int _PreScheduleFollowupDetailID;
        public int PreScheduleFollowupDetailID
        {
            get
            {
                return Convert.ToInt32(ViewState["_PreScheduleFollowupDetailID"]);
                //_PreScheduleFollowupDetailID;
            }
            set
            {
                ViewState["_PreScheduleFollowupDetailID"] = value;
                //_PreScheduleFollowupDetailID = value;
            }
        }

        private string _userName;
        public string UserName
        {
            get { return _userName; }
            set
            {
                _userName = HttpContext.Current.User.Identity.Name;
            }
        }

        //private decimal _paidAmount;
        public string Pickup
        {
            get { return ViewState["_Pickup"].ToString(); }
            set
            {
                ViewState["_Pickup"] = value;
                txtPickup.Text = value.ToString();
                lblPickup.Text = value.ToString(); ;
            }
        }

        public string Dropoff
        {
            get { return ViewState["_Dropoff"].ToString(); }
            set
            {
                ViewState["_Dropoff"] = value;
                txtDropOff.Text = value.ToString();
                lblDropOff.Text = value.ToString();
            }
        }


        public int? MemberID
        {
            get { return Convert.ToInt32(ViewState["_MemberID"]); }
            set
            {
                ViewState["_MemberID"] = value;
            }
        }


        public Boolean? IsTransportBooked
        {
            get
            {
                return Convert.ToBoolean(ViewState["_IsTransportBooked"]);

            }
            set
            {
                ViewState["_IsTransportBooked"] = value;
                if (!Convert.ToBoolean( value )) //transport booked
                {
                    MultiView1.SetActiveView(View1);
                }
                else
                {
                    MultiView1.SetActiveView(View2);
                }
            }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //if (!IsPostBack)
            //{
            //if (!IsTransportBooked.Value) //transport booked
            //{
            //    MultiView1.SetActiveView(View1);
            //}
            //else
            //{
            //    MultiView1.SetActiveView(View2);
            //}
            //}
        }

        protected void lbtnEdit_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View3);
        }

        protected void lbtnSave_Click(object sender, EventArgs e)
        {
            IsTransportBooked = true;
            lblDropOff.Text = Dropoff = txtDropOff.Text;
            lblPickup.Text = Pickup = txtPickup.Text;
            //lbtnBookTransport_ModalPopupExtender.Hide();
            MultiView1.SetActiveView(View2);
        }

        protected void lbtnCancel_Click(object sender, EventArgs e)
        {
            //ToDo:
            //write code to undo
            //store initial values and revert to them OnCancel
            MultiView1.SetActiveView(View2);

        }

        protected void lbtnBookTransport_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View3);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            //cancel booking
            IsTransportBooked = false;
            MultiView1.SetActiveView(View1);
        }


    }
}