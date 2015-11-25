using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Net.Mail;
using System.Net;

namespace TopCareWebApplication
{
    interface IReportAttachementInterface
    {
        clsReportAttachementComplexType GetReportAttachement();
    }
}
