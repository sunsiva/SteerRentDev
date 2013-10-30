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
        public List<LookupCategoryModel> LookupCategoryList { get; set; }
    }

    public class LookupCategoryModel
    {
        public decimal LookupCategoryID { get; set; }
        public string LookupCategoryCode { get; set; }
        public string LookupCategoryDesc { get; set; }
        public bool IsActive { get; set; }
        public bool IsGLookup { get; set; }
        public int UserId { get; set; }
        public GlobalEnum.MasterPages PageMode { get; set; }
        public GlobalEnum.Flag ActionMode { get; set; }
        public List<GLookupDataModel> GLookupList { get; set; }
        public List<HLookupDataModel> HLookupList { get; set; }
        public List<LookupCategoryModel> LookupCategoryList { get; set; }
    }

    public class GLookupDataModel
    {
        public decimal GLookupID { get; set; }
        public decimal LookupCategoryID { get; set; }
        public string GLookupDesc { get; set; }
        public GlobalEnum.Flag ActionMode { get; set; }
        public int UserId { get; set; }
        public bool IsActive { get; set; }
    }

    public class HLookupDataModel
    {
        public decimal HLookupID { get; set; }
        public decimal GlookupID { get; set; }
        public decimal LookupCategoryID { get; set; }
        public string HLookupDesc { get; set; }
        public GlobalEnum.Flag ActionMode { get; set; }
        public int UserId { get; set; }
        public bool IsActive { get; set; }
    }

    public class LocationModel
    {
        public decimal LocationId { get; set; }
        public string LocationCode { get; set; }
	    public string LocationName { get; set; }
	    public bool ListedInWeb { get; set; }
	    public decimal WorkingHrs { get; set; }
	    public DateTime? WorkFrom { get; set; }
	    public DateTime? WorksTill { get; set; }
	    public string Phone { get; set; }
	    public string Fax { get; set; }
	    public string Email { get; set; }
	    public decimal ReciptNoStart { get; set; }
	    public decimal ReceiptNoCurrent { get; set; }
	    public decimal RentalAgreementNoStart { get; set; }
	    public decimal RentalAgreementNoCurrent { get; set; }
	    public decimal LeaseAgreementNoStart { get; set; }
	    public decimal LeaseAgreementNoCurrent { get; set; }
	    public bool IsARevenue { get; set; }    
	    public bool IsACounter { get; set; }
	    public bool IsAWorkShop { get; set; }
	    public bool IsAVirtual { get; set; }
	    public bool LeasingAllowed { get; set; }
	    public bool RentingAllowed { get; set; }
	    public decimal BuId { get; set; }
        public int UserId { get; set; }
	    public bool IsActive { get; set; }
        public GlobalEnum.Flag ActionMode { get; set; }
        public IList<LocationModel> lstLocation { get; set; }
    }

    public class EmployeeModel
    {
        public decimal LookupCategoryID { get; set; }
        public string LookupCategoryCode { get; set; }
        public string LookupCategoryDesc { get; set; }

        public GlobalEnum.Flag ActionMode { get; set; }
        public int UserId { get; set; }
        public bool IsActive { get; set; }
    }
}
