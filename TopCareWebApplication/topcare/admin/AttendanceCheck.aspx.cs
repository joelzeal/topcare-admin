using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TopCareWebApplication.admin
{
    public partial class AttendanceCheck : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["sID"] != null)
            {
                if (!IsPostBack)
                {
                    
                    using (TopCareDataContext db = new TopCareDataContext())
                    {
                        int SchdeuleID;
                        int.TryParse(Request.QueryString["sID"], out SchdeuleID);
                        //var tempList = db.vwMemberAttendances.Where(s => s.ScheduleID == SchdeuleID);
                        lblTitle.Text += " "+ db.Schedules.FirstOrDefault(s => s.ScheduleID == SchdeuleID).DateOfEvent.Value .ToShortDateString();
                        Session["TempvwMemberAttendance"] = GetVwMemberAttendance(db);

                        GridView1.DataSource = Session["TempvwMemberAttendance"];
                        GridView1.DataBind();
                    }
                }
            }
        }


        List<vwMemberAttendance> GetVwMemberAttendance(TopCareDataContext db)
        {
            int ScheduleID = Convert.ToInt32(Request.QueryString["sID"]);
            List<vwMemberAttendance> temp = new List<vwMemberAttendance>();
            vwMemberAttendance _tempMAToAdd;
            foreach (Member memberItem in db.Members)
            {
                _tempMAToAdd = new vwMemberAttendance();
                var _tempMA = memberItem.MemberAttendances.OrderBy(o => o.Member.FirstName).OrderBy(l => l.Member.LastName).FirstOrDefault(t => t.ScheduleID == ScheduleID);
                if (_tempMA == null)
                {
                    _tempMAToAdd.HasPaid = false;
                    _tempMAToAdd.AmountPaid = 0;
                    _tempMAToAdd.HasAttended = false;
                }
                else
                {
                    _tempMAToAdd.HasPaid = true;
                    _tempMAToAdd.AmountPaid = _tempMA.AmountPaid;
                    _tempMAToAdd.HasAttended = _tempMA.HasAttended;
                    _tempMAToAdd.IsFeeWaived = _tempMA.IsFeeWaived;
                }
                
                _tempMAToAdd.FirstName = memberItem.FirstName;
                _tempMAToAdd.HasAttended = _tempMAToAdd.HasAttended.HasValue ? _tempMAToAdd.HasAttended : false;
                //_tempMAToAdd.IsFeeWaived = false;
                _tempMAToAdd.LastName = memberItem.LastName;
                _tempMAToAdd.MemberID = memberItem.MemberID;
                _tempMAToAdd.ScheduleID = ScheduleID;
                _tempMAToAdd.IsSubscriptionPaid = Utils.IsSubsrciptionPaid(memberItem.MemberID) ? 0 : 1;
                
                temp.Add(_tempMAToAdd);
            }
            return temp;
        }


       


        protected void btnSave_Click(object sender, EventArgs e)
        {
            //GridView1.Rows
            try
            {
                MemberAttendance tempMA;
                using (TopCareDataContext db = new TopCareDataContext())
                {
                    foreach (GridViewRow item in GridView1.Rows)
                    {
                        if (item.RowType == DataControlRowType.DataRow)
                        {
                            CheckBox chkBox = item.FindControl("CheckBox1") as CheckBox;
                            UserControls.AttendanceWebUserControl usrControl = item.FindControl("AttendanceWebUserControl1") as UserControls.AttendanceWebUserControl;
                            UserControls.SubscriptionFeeWebUserControl usrControl2 = item.FindControl("SubscriptionFeeWebUserControl1") as UserControls.SubscriptionFeeWebUserControl;

                            decimal d = usrControl.PaidAmount;
                            tempMA = db.MemberAttendances.FirstOrDefault(m => m.MemberID == usrControl.MemberID && m.ScheduleID == usrControl.ScheduleID);


                            //if payment for subscription is made, save it in the database
                            if (usrControl2.PaidAmount > 0)
                            {
                                MemberSubscriptionsPaid _memberSubscriptionsPaid = new MemberSubscriptionsPaid();
                                _memberSubscriptionsPaid.AmountPaid = usrControl2.PaidAmount;
                                _memberSubscriptionsPaid.CreatedBy = HttpContext.Current.User.Identity.Name;
                                _memberSubscriptionsPaid.CreatedDate = DateTime.Now;
                                _memberSubscriptionsPaid.ExpiryDate = DateTime.Today.AddYears(1).AddDays(-1);
                                _memberSubscriptionsPaid.IsWaived = usrControl2.IsWaived;
                                _memberSubscriptionsPaid.MemberID = usrControl2.MemberID;
                                _memberSubscriptionsPaid.PaymentDate = DateTime.Now;
                                _memberSubscriptionsPaid.PaymentRecievedBy = HttpContext.Current.User.Identity.Name;
                                db.MemberSubscriptionsPaids.InsertOnSubmit(_memberSubscriptionsPaid);
                            }


                            if (tempMA != null)
                            {
                                tempMA.HasAttended = chkBox.Checked;
                                tempMA.IsFeeWaived = usrControl.IsWaived;
                                tempMA.AmountPaid = usrControl.PaidAmount;
                                //db.SubmitChanges();
                            }
                            else
                            {
                                tempMA = new MemberAttendance();
                                tempMA.HasAttended = chkBox.Checked;
                                tempMA.IsFeeWaived = usrControl.IsWaived;
                                tempMA.PaymentDate = DateTime.Now;
                                tempMA.AmountPaid = usrControl.PaidAmount;
                                tempMA.MemberID = usrControl.MemberID;
                                tempMA.ScheduleID = usrControl.ScheduleID;
                                tempMA.PaymentRecievedBy = HttpContext.Current.User.Identity.Name;
                                db.MemberAttendances.InsertOnSubmit(tempMA);
                            }
                            db.SubmitChanges();
                        }
                    }
                }

                //Response.Redirect("ScheduleList_MultiView.aspx");
                Response.Redirect("~/topcare/ReportPages/SchAttendanceSummary.aspx?sID=" + Request.QueryString["sID"]);
            }
            catch (Exception)
            {
                throw;
            }

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/topcare/ReportPages/SchAttendanceSummary.aspx?sID=" + Request.QueryString["sID"]);
        }
    }
}