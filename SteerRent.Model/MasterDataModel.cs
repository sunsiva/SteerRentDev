using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace SteerRent.Model
{
    public class MasterDataModel
    {
        public decimal LookupCategoryID { get; set; }
        public string LookupCategoryCode { get; set; }
        public string LookupCategoryDesc { get; set; }
    }
}
