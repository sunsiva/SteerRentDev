using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SteerRent.Model;
using SteerRent.BAL;
using System.Collections;

namespace SteerRentMVC.Controllers
{
    public class MasterController : Controller
    {
        MasterData objBal = new MasterData();
        LookupCategoryModel objModel;
        List<LookupCategoryModel> lstObjModel;

        #region "Lookup"
        //
        // GET: /Master/
        public ActionResult GeneralLookups_A001()
        {
            objBal = new MasterData();
            objModel = new LookupCategoryModel();
            objModel.PageMode = GlobalEnum.MasterPages.Lookup;
            objModel.ActionMode = GlobalEnum.Flag.Select;
            objModel = objBal.GetLookupData(objModel);
            //if (objModel.LookupCategoryList.Count>0)
            //{
            //    ViewBag["CategoryDataList"] = from item in objModel.LookupCategoryList
            //                                  select new SelectListItem() { Text = item.LookupCategoryDesc, Value = item.LookupCategoryID.ToString() };
            //}
            return PartialView(objModel);
        }

        public ActionResult GeneralLookupSubmit(int id, string value, string status)
        {
            objBal = new MasterData();
            objModel = new LookupCategoryModel();
            lstObjModel = new List<LookupCategoryModel>();

            if (status == "Select")
            {
                objModel.ActionMode = GlobalEnum.Flag.Select;
                objModel.PageMode = GlobalEnum.MasterPages.GAndLookup;
            }
            else
            {
                objModel.PageMode = GlobalEnum.MasterPages.GLookup;
                objModel.ActionMode = GlobalEnum.Flag.Insert;
                objModel.UserId = 1;
                objModel.IsActive = true;
                objModel.LookupCategoryCode = value; //To be inserted in Glookup value column
            }

            objModel.LookupCategoryID = id;
            objModel = objBal.GetLookupData(objModel);
            //objModel = (from item in lstObjModel where (item.LookupCategoryID == id) select item).SingleOrDefault();
            //objModel.LookupCategoryList = objModel.GLookupList;

            //IEnumerable<SelectListItem> stateList = (from m in lstObjModel where m.LookupCategoryID == id select m).AsEnumerable().Select(m => new SelectListItem() { Text = m.LookupCategoryCode, Value = m.LookupCategoryID.ToString() });
            //SelectList obj = new SelectList(stateList, "Value", "Text", id);
            //ViewBag.SubCategory = obj;
            return PartialView("_SearchResults", objModel);
        }

        public void GLookupStatusUpdate(int Id, bool Status)
        {
            LookupCategoryModel objModel = new LookupCategoryModel();
            objModel.LookupCategoryID = Id;
            objModel.LookupCategoryDesc = string.Empty;
            objModel.IsActive = Status;
            objModel.UserId = 1;
            objModel.ActionMode = GlobalEnum.Flag.StatusUpdate;
            objModel.PageMode = GlobalEnum.MasterPages.GLookup;
            objBal.GetLookupData(objModel);

        }

        public ActionResult HierarchicalLookup_A002()
        {
            objBal = new MasterData();
            objModel = new LookupCategoryModel();
            objModel.PageMode = GlobalEnum.MasterPages.Lookup;
            objModel.ActionMode = GlobalEnum.Flag.Select;
            objModel = objBal.GetLookupData(objModel);
            return PartialView(objModel);
        }

        public ActionResult HierarchicalLookupSubmit(int id, string catValue, string subCatValue, string status)
        {
            objBal = new MasterData();
            objModel = new LookupCategoryModel();
            lstObjModel = new List<LookupCategoryModel>();
            if (status == "Select")
            {
                objModel.ActionMode = GlobalEnum.Flag.Select;
                objModel.PageMode = GlobalEnum.MasterPages.HLookup;
            }
            else
            {
                HLookupDataModel objHLData = new HLookupDataModel();
                List<HLookupDataModel> lstobjHLData = new List<HLookupDataModel>();
                objModel.PageMode = GlobalEnum.MasterPages.HLookup;
                objModel.ActionMode = GlobalEnum.Flag.Insert;
                objModel.UserId = 1;
                objModel.IsActive = true;
                objHLData.GLookupDesc = catValue;
                objHLData.HLookupDesc = subCatValue;
                objHLData.GLookupID = 0;//TODO value to be set
                objHLData.LookupCategoryID = id;
                lstobjHLData.Add(objHLData);
                objModel.HLookupList = lstobjHLData;
            }
            objModel.LookupCategoryID = id;
            objModel = objBal.GetLookupData(objModel);
            return PartialView("_HLookupSearchResults", objModel);
        }

        public void HLookupStatusUpdate(int Id, bool Status)
        {
            LookupCategoryModel objModel = new LookupCategoryModel();
            objModel.LookupCategoryID = Id;
            objModel.LookupCategoryDesc = string.Empty;
            objModel.IsActive = Status;
            objModel.UserId = 1;
            objModel.ActionMode = GlobalEnum.Flag.StatusUpdate;
            objModel.PageMode = GlobalEnum.MasterPages.HLookup;
            objBal.GetLookupData(objModel);

        }

        public JsonResult getHLookupExistCategory(int selCatId)
        {
            return Json(getExistingCategory(selCatId));
        }

        public SelectList getExistingCategory(int id)
        {
            IEnumerable<SelectListItem> getGlookupdata = new List<SelectListItem>();
                objBal = new MasterData();
                objModel = new LookupCategoryModel();
                lstObjModel = new List<LookupCategoryModel>();
                objModel.ActionMode = GlobalEnum.Flag.Select;
                objModel.PageMode = GlobalEnum.MasterPages.GLookup;
                objModel.UserId = 1;
                objModel.IsActive = true;
                objModel.LookupCategoryID = id;
                objModel = objBal.GetLookupData(objModel);

                getGlookupdata = (from m in objModel.GLookupList where m.IsActive == true && m.LookupCategoryID == id select m).AsEnumerable().Select(m => new SelectListItem() { Text = m.GLookupDesc, Value = m.GLookupID.ToString() });
                return new SelectList(getGlookupdata, "Value", "Text", null);

                //List<SelectListItem> list = new List<SelectListItem>();
                //foreach (DataRow bd in getGlookupdata as IEnumerable)
                //{
                //    list.Add(new SelectListItem { Text = bd["buildid"].ToString(), Value = bd["buildid"].ToString() });
                //}
 
        }

        //public void BindData()
        //{
        //    objBal = new MasterData();
        //    objModel = new LookupCategoryModel();
        //    lstObjModel = new List<LookupCategoryModel>();
        //    lstObjModel = new List<LookupCategoryModel>(objBal.GetMasterData());

        //    if (lstObjModel.Count > 0)
        //    {
        //        var spnActCnt = (from item in lstObjModel group item by item.IsActive).Count().ToString();
        //        var spnInActCnt = (from item in lstObjModel where item.IsActive == false select item).Count().ToString();
        //        //spnTotCnt.InnerText = lstObjModel.Count().ToString() + " records found. " + spnActCnt + " - Active, " + spnInActCnt + " - Inactive.";
        //    }
        //}
        #endregion

        #region "Location"
                       /// <summary>
       /// Get location data
       /// </summary>
       /// <returns></returns>
        /// //
        // GET: /Master/
        public ActionResult Location_A004()
        {
            LocationModel objModel = new LocationModel();
            objModel = objBal.GetLocationData(0);
            return PartialView(objModel);
        }

        public ActionResult LocationSelect(decimal id)
        {
            LocationModel objModel = new LocationModel();
            if (id > 0)
            { 
            //To bind location data
            objModel.LocationId = id;
            objModel.BuId = 1;
            objModel.ActionMode = GlobalEnum.Flag.Select;
            return PartialView("_LocationAddUpdate", objBal.LocationInsertUpdate(objModel));
            }else{
            return PartialView("_LocationAddUpdate", objModel);
            }
        }

        public ActionResult LocationInsert(FormCollection frmLoc)
        {
            LocationModel objModel = new LocationModel();
            objModel = BuildLocationData(frmLoc);
            return PartialView("_LocationSearchResults", objBal.LocationInsertUpdate(objModel));
        }

        private LocationModel BuildLocationData(FormCollection frmLoc)
        {
            LocationModel objModel = new LocationModel();
            if (frmLoc["lstLocation[0].LocationId"] != string.Empty)
            { objModel.ActionMode = GlobalEnum.Flag.Update; 
                objModel.LocationId = Convert.ToInt32(frmLoc["lstLocation[0].LocationId"]); }
            else { objModel.ActionMode = GlobalEnum.Flag.Insert; }

            objModel.LocationName = frmLoc["txtLocationName"];
            objModel.LocationCode = frmLoc["txtLocationCode"];
            objModel.ListedInWeb = true;// frmLoc["lstLocation[0].LocationCode"];
            objModel.WorkingHrs = 1;// frmLoc["lstLocation[0].LocationCode"];
            objModel.WorkFrom = DateTime.UtcNow;
            objModel.WorksTill = DateTime.UtcNow;
            objModel.Phone = frmLoc["txtMobile"];// frmLoc["lstLocation[0].Phone"];
            objModel.Fax = frmLoc["txtFax"];// frmLoc["lstLocation[0].Fax"];
            objModel.Email = frmLoc["txtEmail"];// frmLoc["lstLocation[0].Email"];
            objModel.ReciptNoStart = Convert.ToInt32(frmLoc["txtRecNoStart"]);
            objModel.ReceiptNoCurrent = Convert.ToInt32(frmLoc["txtRecNoCurrent"]);
            objModel.RentalAgreementNoStart = Convert.ToInt32(frmLoc["txtRentAgmtNoStart"]);
            objModel.RentalAgreementNoCurrent = Convert.ToInt32(frmLoc["txtRentAgmtNoCurrent"]);
            objModel.LeaseAgreementNoStart = Convert.ToInt32(frmLoc["txtLeaseAgmtNoStart"]);
            objModel.LeaseAgreementNoCurrent = Convert.ToInt32(frmLoc["txtLeaseAgmtNoCurrent"]);
            objModel.IsARevenue = true;// frmLoc["lstLocation[0].LocationCode"];
            objModel.IsACounter = true;// frmLoc["lstLocation[0].LocationCode"];
            objModel.IsAWorkShop = true;// frmLoc["lstLocation[0].LocationCode"];
            objModel.IsAVirtual = true;// frmLoc["lstLocation[0].LocationCode"];
            objModel.LeasingAllowed = true;// frmLoc["lstLocation[0].LocationCode"];
            objModel.RentingAllowed = true;// frmLoc["lstLocation[0].LocationCode"];
            objModel.UserId = 1;// frmLoc["lstLocation[0].LocationCode"];
            objModel.IsActive = true;
            objModel.BuId = 1;
            return objModel;
        }

        public void LocationStatusUpdate(int Id, bool Status)
        {
            LocationModel objModel = new LocationModel();
            objModel.LocationId = Id;
            objModel.IsActive = Status;
            objModel.BuId = 1;
            objModel.UserId = 1;
            objModel.ActionMode = GlobalEnum.Flag.StatusUpdate;
            objBal.LocationInsertUpdate(objModel);

        }
        
        #endregion

        #region "Company Setup"

        // GET: /Company Setup/
        public ActionResult CompanySetup_A003()
        {
            objBal = new MasterData();
            objModel = new LookupCategoryModel();
            objModel.PageMode = GlobalEnum.MasterPages.Lookup;
            objModel.ActionMode = GlobalEnum.Flag.Select;
            return PartialView();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="frmCompany"></param>
        /// <returns></returns>
        public ActionResult CompanyInsert(FormCollection frmCompany)
        {
            BindCompanySetupData(frmCompany);
            return View();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="frmCompany"></param>
        /// <returns></returns>
        private CompanySetup BindCompanySetupData(FormCollection frmCompany)
        {
            CompanySetup objComp = new CompanySetup();
            objComp.BUName = frmCompany["txtCompanyName"];
            //logo
            //city
            //country
            //state
            //contact persons desig
            //mobileno
            objComp.BuAddress1 = frmCompany["txtAddrLine1"];
            objComp.BuAddress2 = frmCompany["txtAddrLine2"];
            objComp.BuAddress3 = frmCompany["txtAddrLine3"];
            //objComp.BuPostBox = frmCompany[""];
            objComp.BuPhoneNo = frmCompany["txtLandline"];
            objComp.BuFax = frmCompany["txtFax"];
            objComp.BuEmailId = frmCompany["txtEmail"];
            //objComp.BuMobile = frmCompany[""];
            objComp.BuZip = frmCompany["txtPinZip"];
            objComp.BuContactPerson = frmCompany["txtContactPerson"];
            objComp.BuBaseCurrency = 1;// Convert.ToDecimal(frmCompany[""]);
            objComp.BuDecimals = Convert.ToDecimal(frmCompany[""]);
            objComp.UserId = 1;
            objComp.CreatedOn = DateTime.Now;
            objComp.UpdatedOn = DateTime.Now;
            objComp.IsActive = true;
            return objComp;
        }

        #endregion

        #region "Employee"
        // GET: /Company Setup/
        public ActionResult Employee_A007()
        {
            objBal = new MasterData();
            objModel = new LookupCategoryModel();
            objModel.PageMode = GlobalEnum.MasterPages.Lookup;
            objModel.ActionMode = GlobalEnum.Flag.Select;
            return PartialView();
        }
        #endregion

        #region "Charge Codes"
        // GET: /Company Setup/
        public ActionResult ChargeCodes_A005()
        {
            objBal = new MasterData();
            objModel = new LookupCategoryModel();
            objModel.PageMode = GlobalEnum.MasterPages.Lookup;
            objModel.ActionMode = GlobalEnum.Flag.Select;
            return PartialView();
        }
        #endregion

        #region "Users"
        // GET: /Company Setup/
        public ActionResult Users_A010()
        {
            objBal = new MasterData();
            objModel = new LookupCategoryModel();
            objModel.PageMode = GlobalEnum.MasterPages.Lookup;
            objModel.ActionMode = GlobalEnum.Flag.Select;
            return PartialView();
        }
        #endregion

        #region "Privileges"
        // GET: /Company Setup/
        public ActionResult Privileges_A009()
        {
            objBal = new MasterData();
            objModel = new LookupCategoryModel();
            objModel.PageMode = GlobalEnum.MasterPages.Lookup;
            objModel.ActionMode = GlobalEnum.Flag.Select;
            return PartialView();
        }
        #endregion

        #region "Roles"
        // GET: /Company Setup/
        public ActionResult Roles_A008()
        {
            objBal = new MasterData();
            objModel = new LookupCategoryModel();
            objModel.PageMode = GlobalEnum.MasterPages.Lookup;
            objModel.ActionMode = GlobalEnum.Flag.Select;
            return PartialView();
        }
        #endregion
    }
} 
