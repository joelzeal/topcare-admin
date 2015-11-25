using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.IO;
using System.Net.Mail;
using System.Net;

namespace TopCareWebApplication.ReportPages
{
    public partial class ScheduleDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEmail_Click(object sender, EventArgs e)
        {
            //Schedule _tempSchedule;
            //Attachment a;
            //LocalReport lr = new LocalReport();
            //lr.ReportPath = HttpContext.Current.Server.MapPath("~/topcare/Reports/rptProgramOutLine.rdlc");

            //TopCareDataSetTableAdapters.ScheduleDetailsTableAdapter ta1 = new TopCareDataSetTableAdapters.ScheduleDetailsTableAdapter();
            //TopCareDataSetTableAdapters.SchedulesTableAdapter ta2 = new TopCareDataSetTableAdapters.SchedulesTableAdapter();

            Response.Redirect(String.Format("~/topcare/admin/EmailReport.aspx?sID={0}", Request.QueryString["sID"]), false);
            //int scheduleID = Convert.ToInt32(Request.QueryString["sID"]);

            //ReportDataSource ds1 = new ReportDataSource("DataSet1", (System.Data.DataTable)ta2.GetDataByScheduleID(scheduleID));
            //ReportDataSource ds2 = new ReportDataSource("DataSet2", (System.Data.DataTable)ta1.GetDataByScheduleID(scheduleID));

            //lr.DataSources.Add(ds1);
            //lr.DataSources.Add(ds2);

            //Warning[] warnings;
            //string[] streamids;
            //string mimeType;
            //string encoding;
            //string extension;

            //byte[] bytes = lr.Render("PDF", null, out mimeType,
            //        out encoding, out extension, out streamids, out warnings);

            
            //MemoryStream s = new MemoryStream(bytes);
            //s.Seek(0, SeekOrigin.Begin);

            //MailMessage message = new MailMessage();



            //using (TopCareDataContext db = new TopCareDataContext())
            //{
            //    _tempSchedule = db.Schedules.FirstOrDefault(sch => sch.ScheduleID == scheduleID);
            //    foreach (DBSSTaff item in db.DBSSTaffs)
            //    {
            //        message.To.Add(new MailAddress(item.EmailAddress, item.FirstName + " " + item.LastName));
            //    }

            //    //create instance of attachement and initialize it
            //    a = new Attachment(s, String.Format("Charisma Programe Outline-{0}.pdf", _tempSchedule.DateOfEvent.Value.ToShortDateString()));
            //}

            ////add attachment
            //message.Attachments.Add(a);
            //message.From = new MailAddress("edem.a@praisehouse.org.uk");
            //SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            //smtp.Credentials = new NetworkCredential("edem.a@praisehouse.org.uk", "sessionman1515pianist1515joel");
            //smtp.EnableSsl = true;
            //smtp.Send(message);
        }

        
    }
}