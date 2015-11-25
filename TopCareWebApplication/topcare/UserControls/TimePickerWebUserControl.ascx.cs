using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_TimePickerWebUserControl : System.Web.UI.UserControl
{
    private string _eventTime;

    public string EventTime
    {
        get { return _eventTime; }
        set { _eventTime = value;
        TextBox1.Text = value;
        }
    }


    private string _waterMarkText;

    public string WaterMarkText
    {
        get { return _waterMarkText; }
        set { _waterMarkText = value;
        TextBox1.Text = value;
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtTime.Text = _waterMarkText;
            //TextBoxWatermarkExtender4.WatermarkText = _waterMarkText;
        }
    }
    protected void txtTime_TextChanged(object sender, EventArgs e)
    {
        _eventTime = txtTime.Text;
    }
}