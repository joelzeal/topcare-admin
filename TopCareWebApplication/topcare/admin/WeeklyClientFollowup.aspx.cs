using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TopCareWebApplication.topcare.admin
{
    public partial class WeeklyClientFollowup : System.Web.UI.Page
    {

        public int ScheduleID
        {
            get
            {
                return Convert.ToInt32(Request.QueryString["sID"]);
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //load all members. No filter
            if (DropDownList1.SelectedIndex == 0)
            {
                GridView1.DataSource = GetMemberList(null);
            }
            else
            {
                //load all members with selected transport type
                GridView1.DataSource = GetMemberList(Convert.ToInt32(DropDownList1.SelectedValue));
            }
            GridView1.DataBind();
        }


        List<vwPreScheduleFollowup> GetMemberList(int? transportOptionID )
        {
            List<vwPreScheduleFollowup> _tempVwPreScheduleFollowup = new List<vwPreScheduleFollowup>();
            using (TopCareDataContext db = new TopCareDataContext())
            {
                IQueryable<Member> _tempMembersList;

                //select all members if [all] is selected
                if (transportOptionID == null)
                {
                    _tempMembersList = db.Members;
                }
                else //filter by transport option if selected
                {
                    _tempMembersList = db.Members.Where<Member>(m => m.TransportationOptionID == transportOptionID);
                }

                foreach (Member memberItem in _tempMembersList)
                {
                    var tempPreScheduleFollowupDetail = GetPreScheduleFollowupDetail(Convert.ToInt32(Request.QueryString["sID"]), memberItem.MemberID, db);

                    string clientNumbers = "";
                    if ((memberItem.PhoneNumber1 ?? "").Length > 0)
                    {
                        clientNumbers += memberItem.PhoneNumber1;
                    }
                    if ((memberItem.PhoneNumber2 ?? "").Length > 0)
                    {
                        clientNumbers += ", " + memberItem.PhoneNumber2;
                    }
                    if ((memberItem.PhoneNumber3 ?? "").Length > 0)
                    {
                        clientNumbers += ", " + memberItem.PhoneNumber3;
                    }

                    if (tempPreScheduleFollowupDetail == null)
                    {
                        //var x = memberItem.PhoneNumber1 + memberItem.PhoneNumber2 == null ? memberItem.PhoneNumber3 == null ? "" : memberItem.PhoneNumber2 : memberItem.PhoneNumber3;


                        _tempVwPreScheduleFollowup.Add(new vwPreScheduleFollowup()
                        {
                            IsTransportBooked = false,
                            MemberID = memberItem.MemberID,
                            Name = memberItem.FirstName + " " + memberItem.LastName,
                            PhoneNumber1 = clientNumbers,
                            MemberTransportationID = memberItem.MemberTransportationID,
                            RSVPStatusID = 4 /*4 is the default stands for Not called*/
                        });
                    }
                    else
                    {
                        _tempVwPreScheduleFollowup.Add(new vwPreScheduleFollowup()
                        {
                            Comments = tempPreScheduleFollowupDetail.Comments,
                            DropOffTime = tempPreScheduleFollowupDetail.DropOffTime,
                            IsTransportBooked = tempPreScheduleFollowupDetail.IsTransportBooked,
                            Name = memberItem.FirstName + " " + memberItem.LastName,
                            RSVPStatusID = tempPreScheduleFollowupDetail.RSVPStatusID,
                            MemberID = tempPreScheduleFollowupDetail.MemberID.Value,
                            PickOffTime = tempPreScheduleFollowupDetail.PickOffTime,
                            PreScheduleFollowupDetailID = tempPreScheduleFollowupDetail.PreScheduleFollowupDetailID,
                            PreScheduleFollowupID = tempPreScheduleFollowupDetail.PreScheduleFollowupID.Value,
                            PhoneNumber1 = clientNumbers,
                            MemberTransportationID = memberItem.MemberTransportationID
                        });
                    }

                }

                return _tempVwPreScheduleFollowup;
            }
        }

        PreScheduleFollowupDetail GetPreScheduleFollowupDetail(int scheduleID, int MemberID, TopCareDataContext db)
        {
            try
            {
                var result = db.PreScheduleFollowups.FirstOrDefault(p => p.ScheduleID == scheduleID).PreScheduleFollowupDetails.FirstOrDefault(pd => pd.MemberID == MemberID);
                if (result == null)
                {
                    return null;
                }
                else
                {
                    return result;
                }
            }
            catch (Exception)
            {
                return null;
            }
        }

        /// <summary>
        /// Save RSVP details
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                using (TopCareDataContext db = new TopCareDataContext())
                {
                    PreScheduleFollowup tempPrescheduleFollowUp = db.PreScheduleFollowups.FirstOrDefault(p => p.ScheduleID == ScheduleID);
                    if (tempPrescheduleFollowUp == null)
                    {
                        tempPrescheduleFollowUp = new PreScheduleFollowup()
                        {
                            DateCreated = DateTime.Now,
                            ScheduleID = ScheduleID,
                            CreatedBy = User.Identity.Name,
                            FollowupDoneBy = User.Identity.Name
                        };

                        //insert into database. Treat it as a new record.
                        db.PreScheduleFollowups.InsertOnSubmit(tempPrescheduleFollowUp);
                    }
                    else //jst set modified fields
                    {
                        tempPrescheduleFollowUp.ModifiedBy = User.Identity.Name;
                        tempPrescheduleFollowUp.ModifiedDate = DateTime.Now;
                        //tempPrescheduleFollowUp.FollowupDoneBy = 
                    }


                    foreach (GridViewRow item in GridView1.Rows)
                    {
                        if (item.RowType == DataControlRowType.DataRow)
                        {
                            PreScheduleFollowupDetail tempPreScheduleFollowupDetail;
                            UserControls.RSVPWebUserControl usrControl = item.FindControl("RSVPWebUserControl1") as UserControls.RSVPWebUserControl;
                            TextBox txtComments = item.FindControl("TextBox3") as TextBox;
                            vwPreScheduleFollowup temDataItem = new vwPreScheduleFollowup()
                            {
                                DropOffTime = usrControl.Dropoff,
                                Comments = (item.FindControl("TextBox3") as TextBox).Text,
                                MemberID = usrControl.MemberID.Value,
                                PickOffTime = usrControl.Pickup,
                                RSVPStatusID = Convert.ToInt32((item.FindControl("DropDownList2") as DropDownList).SelectedValue),
                                PreScheduleFollowupDetailID = usrControl.PreScheduleFollowupDetailID,
                                IsTransportBooked = usrControl.IsTransportBooked

                            };


                            if (tempPrescheduleFollowUp.PreScheduleFollowupID > 0) //already in the database
                            {
                                tempPreScheduleFollowupDetail = tempPrescheduleFollowUp.PreScheduleFollowupDetails.FirstOrDefault(d => d.PreScheduleFollowupDetailID == temDataItem.PreScheduleFollowupDetailID);
                                if (tempPreScheduleFollowupDetail != null)
                                {
                                    tempPreScheduleFollowupDetail.Comments = temDataItem.Comments;
                                    tempPreScheduleFollowupDetail.DropOffTime = temDataItem.DropOffTime;
                                    tempPreScheduleFollowupDetail.PickOffTime = temDataItem.PickOffTime;
                                    tempPreScheduleFollowupDetail.RSVPStatusID = temDataItem.RSVPStatusID;
                                    tempPreScheduleFollowupDetail.IsTransportBooked = temDataItem.IsTransportBooked;
                                }
                                else
                                {
                                    tempPreScheduleFollowupDetail = new PreScheduleFollowupDetail();
                                    tempPreScheduleFollowupDetail.Comments = temDataItem.Comments;
                                    tempPreScheduleFollowupDetail.DropOffTime = temDataItem.DropOffTime;
                                    tempPreScheduleFollowupDetail.PickOffTime = temDataItem.PickOffTime;
                                    tempPreScheduleFollowupDetail.RSVPStatusID = temDataItem.RSVPStatusID;
                                    tempPreScheduleFollowupDetail.MemberID = temDataItem.MemberID;
                                    tempPreScheduleFollowupDetail.IsTransportBooked = temDataItem.IsTransportBooked;
                                    //tempPreScheduleFollowupDetail.TransportArrangementStatusID = temDataItem.Transpo;


                                    //add detail to header
                                    tempPrescheduleFollowUp.PreScheduleFollowupDetails.Add(tempPreScheduleFollowupDetail);
                                }
                            }
                            else
                            {
                                tempPreScheduleFollowupDetail = new PreScheduleFollowupDetail();
                                tempPreScheduleFollowupDetail.Comments = temDataItem.Comments;
                                tempPreScheduleFollowupDetail.DropOffTime = temDataItem.DropOffTime;
                                tempPreScheduleFollowupDetail.PickOffTime = temDataItem.PickOffTime;
                                tempPreScheduleFollowupDetail.RSVPStatusID = temDataItem.RSVPStatusID;
                                tempPreScheduleFollowupDetail.MemberID = temDataItem.MemberID;
                                tempPreScheduleFollowupDetail.IsTransportBooked = temDataItem.IsTransportBooked;
                                //add detail to header
                                tempPrescheduleFollowUp.PreScheduleFollowupDetails.Add(tempPreScheduleFollowupDetail);
                            }

                            //CheckBox chkBox = item.FindControl("CheckBox1") as CheckBox;
                            //UserControls.RSVPWebUserControl usrControl = item.FindControl("AttendanceWebUserControl1") as UserControls.RSVPWebUserControl;

                            db.SubmitChanges();
                        }
                    }
                }
                Response.Redirect("~//topcare//ReportPages//PreScheduleFollowupSummary.aspx?sID=" + Request.QueryString["sID"]);
            }
            catch (Exception)
            {
                
            }
        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //add an item on top of the list\
                DropDownList1.Items.Insert(0, new ListItem() { Text = "[All]",  Value = null });

                //fire DropDownList1_SelectedIndexChanged upon getting on the page the first time
                DropDownList1_SelectedIndexChanged(this, new EventArgs());
            }
        }
    }
}