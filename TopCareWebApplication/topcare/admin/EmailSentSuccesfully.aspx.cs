using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TopCareWebApplication.topcare.admin
{
    public partial class EmailSentSuccesfully : System.Web.UI.Page
    {
        string defaultMessage = "Email sent successfully.";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Request.QueryString["msgType"] != null)
                //{
                //    if (Request.QueryString["msg"].Length > 0)
                //    {
                //        lblMessage.Text = Server.HtmlDecode( Request.QueryString["msg"]);
                //    }
                //    else
                //    {
                //        lblMessage.Text = defaultMessage;
                //    }
                //}
                //else
                //{
                //    lblMessage.Text = defaultMessage;
                //}

                lblMessage.Text = defaultMessage;
                //alert-danger
                switch (Request.QueryString["msgType"])
                {
                    case "error":
                        divContainer.Attributes.Add("class", "alert alert-danger");
                        lblMessage.Text = Session["myLastErrorMessage"].ToString();
                        break;
                    case "success":
                        divContainer.Attributes.Add("class", "alert alert-success");
                        lblMessage.Text = Session["Message"].ToString();
                        break;
                    //alert-info
                    case "info":
                        divContainer.Attributes.Add("class", "alert alert-info");
                        lblMessage.Text = Session["Message"].ToString();
                        break;
                    default:
                        break;
                }
            }
        }
    }
}