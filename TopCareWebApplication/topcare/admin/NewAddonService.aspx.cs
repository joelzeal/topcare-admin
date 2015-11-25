using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TopCareWebApplication.topcare.admin
{
    public partial class NewAddonService : System.Web.UI.Page
    {
        TopCareDataContext db = new TopCareDataContext();

        public int? AddonServiceId
        {
            get { return Convert.ToInt32(Request.QueryString["AddonServiceId"]); }
            //set { Session["AddonServiceID"] = value;  }
        }

        public AddonService MyAddOnService
        {
            get
            {
                if (ViewState["MyAddOnService"] == null)
                {
                    if (Request.QueryString["AddonServiceId"] != null)
                    {
                        ViewState["MyAddOnService"] = db.AddonServices.FirstOrDefault<AddonService>(a => a.AddonServiceID == AddonServiceId);
                    }
                    else
                    {
                        ViewState["MyAddOnService"] = new AddonService();
                    }
                    return ViewState["MyAddOnService"] as AddonService;
                }
                else
                {
                    return (AddonService)ViewState["MyAddOnService"];
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                if (AddonServiceId != null)
                {
                    FormView1.DefaultMode = FormViewMode.Edit;
                }
                else
                {
                    FormView1.DefaultMode = FormViewMode.Insert;
                }
              
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            /*
            //save data to database
            TopCareDataContext db = new TopCareDataContext();
           
            if (Request.QueryString["AddonServiceId"] == null)//inserting
            {
                 AddonService temAddonService = new AddonService() {  AddonServiceTypeId  = Convert.ToInt32( cboServiceType.SelectedValue), 
             Comments = txtComments.Text, MemberId = Convert.ToInt32(cboMember.SelectedValue), StaffID = Convert.ToInt32( cboDBSStaff.SelectedValue)};
                 db.AddonServices.InsertOnSubmit(temAddonService);
                 db.SubmitChanges();
            }
            else //editing
            {

            }*/

        }
    }
}