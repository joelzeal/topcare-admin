using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TopCareWebApplication
{
    [Serializable]
    public class clsReportAttachementComplexType
    {
        public Object AttachedFileContent { get; set; }
        public string AttachedFileName { get; set; }
    }
}