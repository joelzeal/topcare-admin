using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

namespace TopCareWebApplication
{
    public class Utils
    {
        public static List<Member> SearchMember(string searchStrin)
        {
            using (TopCareDataContext db = new TopCareDataContext())
            {
                List<Member> members = (from m in db.Members
                                        where m.FirstName.ToLower().Contains(searchStrin.ToLower()) ||
                                        m.LastName.ToLower().Contains(searchStrin) || m.EmailAddress.ToLower().Contains(searchStrin)
                                        select m).ToList<Member>();

                return members;
            }
        }

        public static bool IsSubsrciptionPaid(int memberId)
        {
            using (TopCareDataContext db = new TopCareDataContext())
            {
                MemberSubscriptionsPaid MostRecentlyPaidSubscription = db.MemberSubscriptionsPaids.Where(mi => mi.MemberID == memberId).OrderByDescending(m => m.MemberSubscriptionPaidID).FirstOrDefault();
                if (MostRecentlyPaidSubscription == null)
                {
                    return false;
                }
                else
                {
                    if (MostRecentlyPaidSubscription.ExpiryDate <= DateTime.Today)
                    {
                        return false;
                    }
                    else
                    {
                        return true;
                    }
                }
            }
        }


        public static bool IsSubsrciptionPaid(int memberId, out bool? isWaived )
        {
            using (TopCareDataContext db = new TopCareDataContext())
            {
                MemberSubscriptionsPaid MostRecentlyPaidSubscription = db.MemberSubscriptionsPaids.Where(mi => mi.MemberID == memberId).OrderByDescending(m => m.MemberSubscriptionPaidID).FirstOrDefault();
                if (MostRecentlyPaidSubscription == null)
                {
                    isWaived = false;
                    return false;
                }
                else
                {
                    if (MostRecentlyPaidSubscription.ExpiryDate <= DateTime.Today)
                    {
                        isWaived = MostRecentlyPaidSubscription.IsWaived;
                        return false;
                    }
                    else
                    {
                        isWaived = MostRecentlyPaidSubscription.IsWaived;
                        return true;
                    }
                }
            }
        }


        //public static SendEmail(string ToAddresses, List<clsReportAttachementComplexType> attachements)
        //{
        //    MailMessage message = new MailMessage();

        //    using (TopCareDataContext db = new TopCareDataContext())
        //    {
                
        //            message.To.Add(ToAddresses);
                

        //        //create instance of attachement and initialize it
        //        foreach (clsReportAttachementComplexType item in attachements)
        //        {
        //  //add attachment
        //    message.Attachments.Add(new Attachment( item.AttachedFileContent, item.AttachedFileName));
        //        }

        //       // a = new Attachment(attachement, String.Format("Charisma Programe Outline-{0}.pdf", _tempSchedule.DateOfEvent.Value.ToShortDateString()));
        //    }

           
        //    message.From = new MailAddress("edem.a@praisehouse.org.uk");
        //    SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
        //    smtp.Credentials = new NetworkCredential("edem.a@praisehouse.org.uk", "sessionman1515pianist1515joel");
        //    smtp.EnableSsl = true;
        //    smtp.Send(message);
        //}


        
    }
}