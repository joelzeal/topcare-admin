using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace TopCareWebApplication.ReportPages
{
    public partial class ScheAttendanceDetailedRpt_noCash : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //ReportParameter[] reportParameter = new ReportParameter[2];
            //reportParameter[0] = new ReportParameter("prmStartDate1", txtStartDate.Text);
            //reportParameter[1] = new ReportParameter("prmEndDate1", txtEndDate.Text);
            //ReportViewer1.LocalReport.SetParameters(reportParameter);
            //}
            ReportViewer1.LocalReport.SubreportProcessing += new SubreportProcessingEventHandler(SetSubDataSource);
            this.ReportViewer1.LocalReport.Refresh();

            //ReportViewer1.LocalReport.
        }

        public void SetSubDataSource(object sender, SubreportProcessingEventArgs e)
        {
            if (e.ReportPath.StartsWith("rptAttendanceDetailedReportNoMoney_sub"))
            {
                vwSchAttForReportSqlDataSource.SelectParameters["ScheduleID"].DefaultValue = e.Parameters["prmScheduleID"].Values[0];
                e.DataSources.Add(new ReportDataSource("DataSet1", vwSchAttForReportSqlDataSource));
                vwSchAttForReportSqlDataSource.DataBind();
            }
            else if (e.ReportPath.StartsWith("rptScheduleList_sub"))
            {
                ScheduleDetailsSqlDataSource.SelectParameters["ScheduleID"].DefaultValue = e.Parameters["prmScheduleID"].Values[0];
                e.DataSources.Add(new ReportDataSource("DataSet1", ScheduleDetailsSqlDataSource));
                ScheduleDetailsSqlDataSource.DataBind();
            }
        }

        protected void Run_Click(object sender, EventArgs e)
        {
            ReportParameter[] reportParameter = new ReportParameter[2];
            reportParameter[0] = new ReportParameter("prmStartDate1", txtStartDate.Text);
            reportParameter[1] = new ReportParameter("prmEndDate1", txtEndDate.Text);
            ReportViewer1.LocalReport.SetParameters(reportParameter);

            scheduleSqlDataSource.DataBind();//  .Select(new DataSourceSelectArguments());
            this.ReportViewer1.LocalReport.Refresh();
        }
    }
}