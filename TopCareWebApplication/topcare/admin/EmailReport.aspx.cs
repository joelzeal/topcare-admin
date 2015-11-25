using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Net.Mail;
using System.Net;
using Microsoft.Reporting.WebForms;
using System.IO;
using System.Threading;

namespace TopCareWebApplication.topcare.admin
{
    public partial class EmailReport : System.Web.UI.Page
    {

        TopCareDataContext db = new TopCareDataContext();
        public int scheduleID
        {
            get
            {
                return Convert.ToInt32(Request.QueryString["sID"]);
            }
        }

        //clsReportAttachementComplexType _attachement;
        //public Attachment MyAttachement
        //{
        //    get
        //    {
        //        return ViewState["ReportAttachment"] as Attachment;
        //    }
        //    set
        //    {
        //        ViewState["ReportAttachment"] = value;
        //    }
        //}

        public Schedule MySchedule
        {
            get
            {
                return Session["currentSchedule"] as Schedule;
            }
            set
            {
                Session["currentSchedule"] = value;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //clsScheduleDetailsForAttach scheduleReportForAttach = new clsScheduleDetailsForAttach(Convert.ToInt32(Request.QueryString["sID"]));
                //MyAttachement = GetReportAttachement();

                TopCareDataContext db = new TopCareDataContext();
                MySchedule = db.Schedules.FirstOrDefault(sch => sch.ScheduleID == scheduleID);

                lblAttachedFile.Text = String.Format("Charisma Programe Outline-{0}.pdf", MySchedule.DateOfEvent.Value.ToShortDateString());
                txtSubject.Text = String.Format("Charisma Programe Outline for {0}", MySchedule.DateOfEvent.Value.ToShortDateString());
                txtRecipients.Text = GetRecipients();
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            //send email now
            if (rbtnSendNow.Checked)
            {
                try
                {
                    sendEmail(new object());

                    Session["Message"] = "Email successfully sent.";
                    Response.Redirect("EmailSentSuccesfully.aspx?msgType=success");
                }
                catch (ThreadAbortException)
                {
                    Session["Message"] = "Email successfully sent.";
                    Response.Redirect("EmailSentSuccesfully.aspx?msgType=success");
                }
                catch (Exception ex)
                {
                    Session["myLastErrorMessage"] = ex.Message;
                    Response.Redirect(string.Format("EmailSentSuccesfully.aspx?msgType={0}", "error"));
                }
            }
            else //send email later
            {
                var t = new System.Threading.Timer(sendEmail);

                // Figure how much time until 4:00
                DateTime now = DateTime.Now;
                DateTime executionDate = Convert.ToDateTime(txtSendDate.Text);

                // If it's already past 4:00, wait until 4:00 tomorrow    
                if (now > executionDate)
                {
                    executionDate = executionDate.AddDays(1.0);
                }

                int msUntilFour = (int)((executionDate - now).TotalMilliseconds);

                // Set the timer to elapse only once, at 4:00.
                t.Change(msUntilFour, Timeout.Infinite);

                Response.Redirect(String.Format( "EmailSentSuccesfully.aspx?msgType=info&msg=Emails have been successfully scheduled for send on {0}", txtSendDate.Text ));
            }
        }


        void sendEmail(object obj)
        {
            //get company profile
            CompanyProfile _companyProfile = db.CompanyProfiles.FirstOrDefault();

            MailMessage message = new MailMessage();

            if (_companyProfile == null)
            {
                //show error message
                return;
            }

            //add attachment
            foreach (string item in ExtractEmails(txtRecipients.Text))
            {
                message.To.Add(item);
                message.ReplyToList.Add(item);
            }

            message.Subject = txtSubject.Text;
            message.Body = txtBody.Text;
            message.Attachments.Add(GetReportAttachement());
            
            message.From = new MailAddress(_companyProfile.SmtpEmailAddress, _companyProfile.CompanyName);
            SmtpClient smtp = new SmtpClient(_companyProfile.SmtpServer, Convert.ToInt32(_companyProfile.smtpPort));
            smtp.Credentials = new NetworkCredential(_companyProfile.SmtpEmailAddress, _companyProfile.SmtpPassword);
            smtp.EnableSsl = true;
            smtp.Send(message);

            Session["Message"] = "Email successfully sent.";
            Response.Redirect("EmailSentSuccesfully.aspx?msgType=success");
        }

        string GetRecipients()
        {
            string recipients = "";
            TopCareDataContext db = new TopCareDataContext();
            foreach (DBSSTaff item in db.DBSSTaffs.Where(s => s.EmailAddress.Length > 0 ))
            {
                recipients += item.FirstName + " " + item.LastName + "<" + item.EmailAddress + ">;";
            }
            return recipients;
        }

        //string extractEmail(string str)
        //{
        //    Match match = Regex.Match(str, @"'([^']*)");
        //    if (match.Success)
        //    {
        //        return match.Groups[1].Value;
        //    }
        //}

        List<string> ExtractEmails(string str)
        {
            List<string> _matchResult = new List<string>();
            //Match match = Regex.Match(str, @"\S+@\S+|\{(?:\w+, *)+\w+\}@[\w.-]+");

            Regex emailRegex = new Regex(@"\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*",
            RegexOptions.IgnoreCase);
            //find items that matches with our pattern
            MatchCollection emailMatches = emailRegex.Matches(str);

            foreach (Match emailMatch in emailMatches)
            {
                _matchResult.Add(emailMatch.Value);
            }

            return _matchResult;
        }


        public Attachment GetReportAttachement()
        {
            //
            string reportPath = "~/topcare/Reports/rptProgramOutLine.rdlc";

            try
            {
                
                Attachment a;

                LocalReport lr = new LocalReport();
                lr.ReportPath = HttpContext.Current.Server.MapPath(reportPath);

                TopCareDataSetTableAdapters.ScheduleDetailsTableAdapter ta1 = new TopCareDataSetTableAdapters.ScheduleDetailsTableAdapter();
                TopCareDataSetTableAdapters.SchedulesTableAdapter ta2 = new TopCareDataSetTableAdapters.SchedulesTableAdapter();

                //int scheduleID = Convert.ToInt32(Request.QueryString["sID"]);

                ReportDataSource ds1 = new ReportDataSource("DataSet1", (System.Data.DataTable)ta2.GetDataByScheduleID(scheduleID));
                ReportDataSource ds2 = new ReportDataSource("DataSet2", (System.Data.DataTable)ta1.GetDataByScheduleID(scheduleID));

                lr.DataSources.Add(ds1);
                lr.DataSources.Add(ds2);

                Warning[] warnings;
                string[] streamids;
                string mimeType;
                string encoding;
                string extension;

                byte[] bytes = lr.Render("PDF", null, out mimeType,
                        out encoding, out extension, out streamids, out warnings);


                MemoryStream s = new MemoryStream(bytes);
                s.Seek(0, SeekOrigin.Begin);

                string _attachmentFileName = String.Format("Charisma Programe Outline-{0}.pdf", MySchedule.DateOfEvent.Value.ToShortDateString()); 

                //create instance of attachement and initialize it
                a = new Attachment(s, _attachmentFileName);

                return a;
            }
            catch (Exception)
            {
                return null;
            }
        }

        protected void rbtnSendNow_CheckedChanged(object sender, EventArgs e)
        {
            txtSendDate.ReadOnly = true;
            txtSendDate.Enabled = false;
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            txtSendDate.ReadOnly = false;
            txtSendDate.Enabled = true;
        }
    }
}