using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TopCareWebApplication.UserControls;

namespace TopCareWebApplication.topcare.admin
{
    public partial class ScheduleDetails_new : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Schedule _schedule;
                using (TopCareDataContext db = new TopCareDataContext())
                {
                    _schedule = db.Schedules.FirstOrDefault(s => s.ScheduleID == Convert.ToInt32(Request.QueryString["sID"]));
                    if (_schedule != null)
                    {
                        //set header - schedule date
                        headerHyperLink.Text = _schedule.DateOfEvent.Value.ToString("dd-MMM-yyyy");
                        headerHyperLink.NavigateUrl = String.Format("NewSchedule.aspx?sID={0}", Request.QueryString["sID"]);


                        if (_schedule.ScheduleDetails.Count == 0) //schedule without details
                        {
                            LoadTimesFromTemplate();
                        }
                        else //load details from database
                        {
                            LoadScheduleDetailsFromDatabase(_schedule);
                        }
                    }
                }
            }
        }


        //load template items
        void LoadScheduleDetailsFromDatabase(Schedule schedule)
        {
            GridView1.DataSource = schedule.ScheduleDetails;
            GridView1.DataBind();
        }


        //load template items
        void LoadTimesFromTemplate()
        {
            List<TimeTemplateItem> _tempListItems = new List<TimeTemplateItem>();

            using (TopCareDataContext db = new TopCareDataContext())
            {
                foreach (ProgrameTimeTemplate templateItem in db.ProgrameTimeTemplates)
                {
                    _tempListItems.Add(new TimeTemplateItem()
                    {
                        StartTime = templateItem.StartTime.Value.ToString(),
                        EndTime = templateItem.EndTime.Value.ToString(),
                        Item = templateItem.Template
                    });
                }
            }

            GridView1.DataSource = _tempListItems;
            GridView1.DataBind();
        }


        //load template items
        void LoadTimesFromTemplate(bool deleteScheduleDetails)
        {
            List<TimeTemplateItem> _tempListItems = new List<TimeTemplateItem>();

            using (TopCareDataContext db = new TopCareDataContext())
            {
                foreach (ProgrameTimeTemplate templateItem in db.ProgrameTimeTemplates)
                {
                    _tempListItems.Add(new TimeTemplateItem()
                    {
                        StartTime = templateItem.StartTime.Value.ToString(),
                        EndTime = templateItem.EndTime.Value.ToString(),
                        Item = templateItem.Template
                    });
                }

                if (deleteScheduleDetails)
                {
                    db.Schedules.FirstOrDefault(s => s.ScheduleID == Convert.ToInt32(Request.QueryString["sID"])).ScheduleDetails.Clear();
                    db.SubmitChanges();
                }
            }

            GridView1.DataSource = _tempListItems;
            GridView1.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            save();
            Response.Redirect("ScheduleList_MultiView.aspx");
        }

        protected void btnLoadFromTemplate_Click(object sender, EventArgs e)
        {
            LoadTimesFromTemplate(true);
        }



        void save()
        {
            TopCareDataContext db = new TopCareDataContext();
            Schedule _schedule = db.Schedules.FirstOrDefault(s => s.ScheduleID == Convert.ToInt32(Request.QueryString["sID"]));

           // List<ScheduleDetail> _scheduleLists = new List<ScheduleDetail>();
            TimeSpan _tempStartTimeStamp;
            TimeSpan _tempEndTimeStamp;

            foreach (GridViewRow item in GridView1.Rows)
            {
                if (item.RowType == DataControlRowType.DataRow)
                {
                    TextBox _txtStartTime = item.FindControl("txtStartTime") as TextBox;
                    TextBox _txtEndTime = item.FindControl("txtEndTime") as TextBox;
                    TextBox _textBox2 = item.FindControl("TextBox2") as TextBox;
                    HiddenField _hiddenField = item.FindControl("HiddenField1") as HiddenField;

                    TimeSpan.TryParse(_txtStartTime.Text, out _tempStartTimeStamp);
                    TimeSpan.TryParse(_txtEndTime.Text, out _tempEndTimeStamp);


                    if (_hiddenField.Value.Length == 0) //schedule has no items add all template items
                    {
                        _schedule.ScheduleDetails.Add(new ScheduleDetail()
                            {
                                EndTime = _tempEndTimeStamp,
                                Item = _textBox2.Text,
                                StartTime = _tempStartTimeStamp
                            });
                    }
                    else
                    {
                        ScheduleDetail _tempScheduleDetail = _schedule.ScheduleDetails.FirstOrDefault(s => s.ScheduleDetailID == Convert.ToInt32(_hiddenField.Value));
                        _tempScheduleDetail.StartTime = _tempStartTimeStamp;
                        _tempScheduleDetail.EndTime = _tempEndTimeStamp;
                        _tempScheduleDetail.Item = _textBox2.Text;
                    }
                }
            }
            db.SubmitChanges();
        }
    }

    class TimeTemplateItem
    {
        private string _startTime;

        public string StartTime
        {
            get { return _startTime; }
            set { _startTime = value; }
        }
        private string _endTime;

        public string EndTime
        {
            get { return _endTime; }
            set { _endTime = value; }
        }
        private string _description;


        public string Item
        {
            get { return _description; }
            set { _description = value; }
        }

        private int? _scheduleDetailID;

        public int? ScheduleDetailID
        {
            get { return _scheduleDetailID; }
            set { _scheduleDetailID = value; }
        }
    }
}