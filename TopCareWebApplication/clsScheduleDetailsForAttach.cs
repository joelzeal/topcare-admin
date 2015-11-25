using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.Reporting.WebForms;
using System.IO;
using System.Net.Mail;

namespace TopCareWebApplication
{
    public class clsScheduleDetailsForAttach : IReportAttachementInterface   
    {
        public int ScheduleID { get; set; }
        Schedule _tempSchedule;
        string reportPath = "~/topcare/Reports/rptProgramOutLine.rdlc";


        public clsScheduleDetailsForAttach(int scheduleID)
        {
            ScheduleID = scheduleID;
        }


        public clsReportAttachementComplexType GetReportAttachement()
        {
            try
            {
                TopCareDataContext db = new TopCareDataContext();
                Attachment a;

                _tempSchedule = db.Schedules.FirstOrDefault(sch => sch.ScheduleID == ScheduleID);

                LocalReport lr = new LocalReport();
                lr.ReportPath = HttpContext.Current.Server.MapPath(reportPath);

                TopCareDataSetTableAdapters.ScheduleDetailsTableAdapter ta1 = new TopCareDataSetTableAdapters.ScheduleDetailsTableAdapter();
                TopCareDataSetTableAdapters.SchedulesTableAdapter ta2 = new TopCareDataSetTableAdapters.SchedulesTableAdapter();

                //int scheduleID = Convert.ToInt32(Request.QueryString["sID"]);

                ReportDataSource ds1 = new ReportDataSource("DataSet1", (System.Data.DataTable)ta2.GetDataByScheduleID(ScheduleID));
                ReportDataSource ds2 = new ReportDataSource("DataSet2", (System.Data.DataTable)ta1.GetDataByScheduleID(ScheduleID));

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

                string _attachmentFileName = String.Format("Charisma Programe Outline-{0}.pdf", _tempSchedule.DateOfEvent.Value.ToShortDateString());

                //create instance of attachement and initialize it
                a = new Attachment(s, _attachmentFileName);

                return new clsReportAttachementComplexType() { AttachedFileContent = a, AttachedFileName = _attachmentFileName };
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}