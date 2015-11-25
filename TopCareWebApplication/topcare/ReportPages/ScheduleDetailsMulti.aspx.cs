using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace TopCareWebApplication.ReportPages
{
    public partial class ScheduleDetailsMulti : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ReportViewer1.LocalReport.SubreportProcessing += new Microsoft.Reporting.WebForms.SubreportProcessingEventHandler(LocalReport_SubreportProcessing);
        }

        void LocalReport_SubreportProcessing(object sender, Microsoft.Reporting.WebForms.SubreportProcessingEventArgs e)
        {
            if (e.ReportPath == "rptScheduleList_sub")
            {
                ReportParameterInfoCollection prmCollection = e.Parameters;
                ScheduleDetailsSqlDataSource.SelectParameters["ScheduleID"].DefaultValue = prmCollection["prmScheduleID"].Values[0];
                e.DataSources.Add(new ReportDataSource("ScheduleDetailsSqlDataSource", "DataSet1"));
            }
        }

    }
}