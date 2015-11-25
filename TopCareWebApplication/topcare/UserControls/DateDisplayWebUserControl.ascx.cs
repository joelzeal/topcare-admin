using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TopCareWebApplication.topcare.UserControls
{
    public partial class DateDisplayWebUserControl : System.Web.UI.UserControl
    {
        private DateTime _theDate;

        public DateTime TheDate
        {
            get { return _theDate; }
            
            set
            {
                //_theDate = value;
                string[] tempDate = value.ToShortDateString().Split('-');
                lblDay.Text = tempDate[0];
                lblMonth.Text = tempDate[1];
                lblYear.Text = tempDate[2];
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }


    }
}