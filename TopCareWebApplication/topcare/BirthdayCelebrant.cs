using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;

namespace TopCareWebApplication.topcare
{
    public  class BirthdayCelebrant
    {
        private string _fullName;

        public string FullName
        {
            get { return _fullName; }
            set { _fullName = value; }
        }
        private string _monthAndDay;

        public string MonthAndDay
        {
            get { return _monthAndDay; }
            set { _monthAndDay = value; }
        }
        private int _memberId;

        public int MemberId
        {
            get { return _memberId; }
            set { _memberId = value; }
        }

        static  public List<BirthdayCelebrant>  GenerateBirthdayCelebrants(List<Member> membersList)
        {
            List<BirthdayCelebrant> tempBirthdayCelebrants = new List<BirthdayCelebrant>();
            foreach (Member item in membersList)
            {
                BirthdayCelebrant tempBirthdayCelebrant = new BirthdayCelebrant();
                tempBirthdayCelebrant.FullName = item.FirstName + " " + item    .LastName;
                tempBirthdayCelebrant.MonthAndDay = item.DOB.Value.Day + " " + item.DOB.Value.ToString("MMM", CultureInfo.InvariantCulture);
                tempBirthdayCelebrant.MemberId = item.MemberID;

                tempBirthdayCelebrants.Add(tempBirthdayCelebrant);
            }
            return tempBirthdayCelebrants;
        }
    }
}