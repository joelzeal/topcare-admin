using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace TopCareWebApplication.admin
{
    public partial class CreateMember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //DropDownList1.DataSource = GetCountryList();
            //DropDownList1.DataBind();
            //DropDownList1.Items.Insert(0, "Select");
            if (!IsPostBack)
            {
                if (Request.QueryString["mid"] != null)
                {
                    MemberDetailsFormView.DefaultMode = FormViewMode.Edit;
                }
            }
        }

        public List<string> GetCountryList()
        {
            //CultureTypes.SpecificCultures
            List<string> list = new List<string>();
            CultureInfo[] cultures =
                        CultureInfo.GetCultures(
                        CultureTypes.SpecificCultures);
            foreach (CultureInfo info in cultures)
            {
                RegionInfo info2 = new RegionInfo(info.LCID);
                if (!list.Contains(info2.EnglishName))
                {
                    list.Add(info2.EnglishName);
                }
            }
            return list;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
        
        }

    }
}