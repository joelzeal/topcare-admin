using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TopCareWebApplication.topcare.admin
{
    public partial class NotificationsPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //TopCareDataContext db = new TopCareDataContext();
            TopCareDataContext db = new TopCareDataContext();

            int daysToBirthday = 5;
            var birthdayCelebrants = db.Members.Where(m => (DateTime.Today - m.DOB.Value).Days == daysToBirthday);

            //get all celebrants who fall into the criteria
            Repeater1.DataSource = BirthdayCelebrant.GenerateBirthdayCelebrants(birthdayCelebrants.ToList<Member>());
            Repeater1.DataBind();
        }
    }
}