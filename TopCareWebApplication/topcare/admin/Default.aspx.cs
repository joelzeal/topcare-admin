using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

namespace TopCareWebApplication.admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Chart2.Series["Series1"].Label = "#PERCENT{P2}";
                Chart2.Series["Series1"].LegendText = "#VALX";
            }

            //new Thread(() =>
            //{
            //    Thread.CurrentThread.IsBackground = true;
            //    /* Get all upcoming birthdays with specified range. */


               
            //    //foreach (Member item in birthdayCelebrants)
            //    //{
            //    //    if (db.Notifications.First )
            //    //    {
                        
            //    //    }
            //    //}
            //}).Start();
        }


    }
}