using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;

namespace TopCareWebApplication.UserControls
{
    
    public partial class TimePickerWebUserControl_New : System.Web.UI.UserControl
    {
        private string _eventTime;

    
        public string EventTime
        {
            get { return _eventTime; }
            set
            {
                _eventTime = value;
                txtTime.Text = value;
            }
        }


        private string _waterMarkText;

        public string WaterMarkText
        {
            get { return _waterMarkText; }
            set
            {
                _waterMarkText = value;
                txtTime.Text = value;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (EventTime.Length > 0)
                    {
                        txtTime.Text = EventTime;
                    }
                    else
                    {
                        txtTime.Text = _waterMarkText;
                    }
                }
                catch (Exception)
                {
                    
                }
              
                //TextBoxWatermarkExtender4.WatermarkText = _waterMarkText;
            }
        }

        protected void txtTime_TextChanged(object sender, EventArgs e)
        {
            _eventTime = txtTime.Text;
        }
    }
}