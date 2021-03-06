﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SteerRent.Model;
using SteerRent.BAL;
using System.Collections;
using System.Web.Security;
using System.IO;

namespace SteerRentMVC.Controllers
{
    public class MasterController : Controller
    {
        MasterData objBal = new MasterData();
        LookupCategoryModel objModel;
        List<LookupCategoryModel> lstObjModel; //tessts

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
                else if (status == "Empty")
                {
                    return PartialView("_SearchResults", objModel);
                }
                else
                {
                    objModel.PageMode = GlobalEnum.MasterPages.GLookup;
                    objModel.ActionMode = GlobalEnum.Flag.Insert;
                    objModel.UserId = 1; //TODO
                    objModel.IsActive = true;
                    objModel.LookupCategoryCode = value; //To be inserted in Glookup value column
                }

                objModel.LookupCategoryID = id;
                objModel = objBal.GetLookupData(objModel);
                if (objModel != null && status != "Select")
                {
                    if (objModel.GLookupList[0].isGlookExist)
                        return Json(objModel);
                }
       
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
            objModel.UserId = 1; // TODO
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

        public ActionResult HierarchicalLookupSubmit(int id, string catValue, string catId, string subCatValue, string status)
        {
            objBal = new MasterData();
            objModel = new LookupCategoryModel();
            lstObjModel = new List<LookupCategoryModel>();
            if (status == "Select")
            {
                objModel.ActionMode = GlobalEnum.Flag.Select;
                objModel.PageMode = GlobalEnum.MasterPages.HLookup;
            }
            else if (status == "Empty")
            {
                return PartialView("_HLookupSearchResults", objModel);
            }
            else
            {
                HLookupDataModel objHLData = new HLookupDataModel();
                List<HLookupDataModel> lstobjHLData = new List<HLookupDataModel>();
                objModel.PageMode = GlobalEnum.MasterPages.HLookup;
                objModel.ActionMode = GlobalEnum.Flag.Insert;
                objModel.UserId = 1; //TODO
                objModel.IsActive = true;
                objHLData.GLookupDesc = catValue;
                objHLData.HLookupDesc = subCatValue;
                objHLData.GLookupID = catId==""?0:Convert.ToInt32(catId);//TODO value to be set
                objHLData.LookupCategoryID = id;
                lstobjHLData.Add(objHLData);
                objModel.HLookupList = lstobjHLData;
            }
            objModel.LookupCategoryID = id;
            objModel = objBal.GetLookupData(objModel);
            if (objModel != null && status != "Select")
            {
                if (objModel.HLookupList[0].isHLookExist)
                    return Json(objModel);
               
            }
            return PartialView("_HLookupSearchResults", objModel);
        }

        public void HLookupStatusUpdate(int Id, bool Status)
        {
            LookupCategoryModel objModel = new LookupCategoryModel();
            objModel.LookupCategoryID = Id;
            objModel.LookupCategoryDesc = string.Empty;
            objModel.IsActive = Status;
            objModel.UserId = 1; //TODO
            objModel.ActionMode = GlobalEnum.Flag.StatusUpdate;
            objModel.PageMode = GlobalEnum.MasterPages.HLookup;
            objBal.GetLookupData(objModel);

        }

        public JsonResult getHLookupExistCategory(int id)
        {
            return Json(getExistingCategory(id));
        }   

        private SelectList getExistingCategory(int id)
        {
            IEnumerable<SelectListItem> getGlookupdata = new List<SelectListItem>();
                objBal = new MasterData();
                objModel = new LookupCategoryModel();
                lstObjModel = new List<LookupCategoryModel>();
                objModel.ActionMode = GlobalEnum.Flag.Select;
                objModel.PageMode = GlobalEnum.MasterPages.GLookup;
                objModel.UserId = 1; //To do
                objModel.IsActive = true;
                objModel.LookupCategoryID = id;
                objModel = objBal.GetLookupData(objModel);

                getGlookupdata = (from m in objModel.GLookupList where m.LookupCategoryID == id select m).AsEnumerable().Select(m => new SelectListItem() { Text = m.GLookupDesc, Value = m.GLookupID.ToString() });
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

        public JsonResult getMasterData(string str, bool isGlookup,int gLookupId)
        {
            IEnumerable<SelectListItem> getGlookupdata = new List<SelectListItem>();
            objBal = new MasterData();
            List<GLookupDataModel> lstObjModel = new List<GLookupDataModel>();
            lstObjModel = objBal.GetGLookupDataByLookup(str, isGlookup == true ? 1 : 0, gLookupId);
            getGlookupdata = lstObjModel.AsEnumerable().Select(m => new SelectListItem() { Text = m.GLookupDesc, Value = m.GLookupID.ToString() });
            return Json(new SelectList(getGlookupdata, "Value", "Text", null));
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
            objModel=objBal.LocationInsertUpdate(objModel);
            return PartialView("_LocationAddUpdate", objModel);
            }else{
            return PartialView("_LocationAddUpdate", objModel);
            }
        }

        public ActionResult LocationInsert(FormCollection frmLoc)
        {
            LocationModel objModel = new LocationModel();
            if (frmLoc.Count > 0)
            {
                objModel = BuildLocationData(frmLoc,true );
                objModel = objBal.LocationInsertUpdate(objModel);
                if(objModel.isLocExist)
                    return Json(objModel);
            }
            return PartialView("_LocationSearchResults", objModel);
        }

        private LocationModel BuildLocationData(FormCollection frmLoc, bool chkRevnue)
        {
            LocationModel objModel = new LocationModel();
            if (frmLoc["txtLocationID"] != "0")
            { objModel.ActionMode = GlobalEnum.Flag.Update;
            objModel.LocationId = Convert.ToInt32(frmLoc["txtLocationID"]);
                objModel.IsActive = frmLoc["chkLocActivate"] == null ? false : true;
            }
            else { objModel.ActionMode = GlobalEnum.Flag.Insert; objModel.IsActive = true; }

            objModel.LocationName = frmLoc["txtLocationName"];
            objModel.LocationCode = frmLoc["txtLocationCode"];
            objModel.ListedInWeb = true;// frmLoc["lstLocation[0].LocationCode"];
            objModel.WorkingHrs = 1;// frmLoc["lstLocation[0].LocationCode"];
            objModel.WorkFrom = frmLoc["txtWorkingTimeFrom"];// DateTime.UtcNow;
            objModel.WorksTill = frmLoc["txtWorkingTimeTo"];
            objModel.Phone = frmLoc["txtLocMobile"];// frmLoc["lstLocation[0].Phone"];
            objModel.Fax = frmLoc["txtLocFax"];// frmLoc["lstLocation[0].Fax"];
            objModel.Email = frmLoc["txtLocEmail"];// frmLoc["lstLocation[0].Email"];
            objModel.AddressLine1 = frmLoc["txtLocAddressLine1"].ToString();
            objModel.AddressLine2 = frmLoc["txtLocAddressLine2"].ToString();
            //objModel.AddressLine3 = frmLoc["txtLocAddressLine3"].ToString();
            objModel.Designation = frmLoc["txtLocDesignation"].ToString();
            objModel.City = frmLoc["txtLocCity"].ToString();
            objModel.CountryId = Convert.ToInt32(frmLoc["ddlLocCountry"]);
            objModel.EmirateId = Convert.ToInt32(frmLoc["ddlLocStateEmirate"]);
            objModel.Zip = frmLoc["txtLocZip"].ToString();
            objModel.LocationInChargeId = Convert.ToInt32(frmLoc["ddlLocationIncharge"]);
            objModel.ReciptNoStart = Convert.ToInt32(frmLoc["txtRecNoStart"]);
            objModel.ReceiptNoCurrent = Convert.ToInt32(frmLoc["txtRecNoCurrent"]);
            objModel.RentalAgreementNoStart = Convert.ToInt32(frmLoc["txtRentAgmtNoStart"]);
            objModel.RentalAgreementNoCurrent = Convert.ToInt32(frmLoc["txtRentAgmtNoCurrent"]);
            objModel.LeaseAgreementNoStart = Convert.ToInt32(frmLoc["txtLeaseAgmtNoStart"]);
            objModel.LeaseAgreementNoCurrent = Convert.ToInt32(frmLoc["txtLeaseAgmtNoCurrent"]);
            objModel.IsARevenue = frmLoc["chkLocType"].Contains("Revenue");
            objModel.IsACounter = frmLoc["chkLocType"].Contains("Counter");
            objModel.IsAWorkShop = frmLoc["chkLocType"].Contains("Workshop");
            objModel.IsAVirtual = frmLoc["chkLocType"].Contains("Virtual");
            objModel.LeasingAllowed = frmLoc["chkOperation"].Contains("Renting");
            objModel.RentingAllowed = frmLoc["chkOperation"].Contains("Leasing");
            objModel.UserId = 1;//TODO
            
            objModel.BuId = 1;
            return objModel;
        }

        public ActionResult LocationStatusUpdate(int Id, bool Status)
        {
            LocationModel objModel = new LocationModel();
            objModel.LocationId = Id;
            objModel.IsActive = Status;
            objModel.BuId = 1; //TODO
            objModel.UserId = 1;//TODO
            objModel.ActionMode = GlobalEnum.Flag.StatusUpdate;
            LocationModel objGetData = new LocationModel();
            objGetData = objBal.LocationInsertUpdate(objModel);
            return PartialView("_LocationSearchResults", objGetData);
        }
        
        #endregion

        #region "Company Setup"

        public string FileUpload()
        {
             string fileHostedPath = string.Empty;
            for (int i = 0; i < Request.Files.Count; i++)
            {
                HttpPostedFileBase file = Request.Files[i]; //Uploaded file
                //Use the following properties to get file's name, size and MIMEType
                int fileSize = file.ContentLength;
                string fileName = file.FileName;
                string mimeType = file.ContentType;
                System.IO.Stream fileContent = file.InputStream;
                //To save file, use SaveAs method
                fileHostedPath = Server.MapPath("~/Content/") + fileName;
                file.SaveAs(fileHostedPath); //File will be saved in application root
            }

            //HttpPostedFileBase obj=Request.Files[fleUpload];
            //obj.SaveAs(fleUpload);
            return fileHostedPath;
        }

        // GET: /Company Setup/
        public ActionResult CompanySetup_A003()
        {
            objBal = new MasterData();
            CompanySetup objData = objBal.GetCompanyDetails(0);
            if (objData == null)
                objData = new CompanySetup();
            return PartialView(objData);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="frmCompany"></param>
        /// <returns></returns>
        public ActionResult CompanyInsert(FormCollection frmCompany)
        {
            objBal.CompanyInsertUpdate(BindCompanySetupData(frmCompany));
            return Json(1);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="frmCompany"></param>
        /// <returns></returns>
        private CompanySetup BindCompanySetupData(FormCollection frmCompany)
        {
            CompanySetup objComp = new CompanySetup();
            objComp.OrgName = frmCompany["txtCompanyName"];
            objComp.OrgCode = frmCompany["txtCompanyName"];
            objComp.OrgID = frmCompany["txtOrgID"]==string.Empty?0:Convert.ToInt32(frmCompany["txtOrgID"]);
            objComp.OrgLogoPath = string.Empty; // TODO
            objComp.OrgAddress1 = frmCompany["txtOrgAddrLine1"];
            objComp.OrgAddress2 = frmCompany["txtOrgAddrLine2"];
            objComp.OrgAddress3 = string.Empty;//TODO frmCompany["txtOrgAddrLine3"];
            objComp.OrgCity = frmCompany["txtOrgCity"];
            objComp.OrgCountryId = Convert.ToInt32(frmCompany["ddlOrgCountry"]);//
            objComp.OrgEmirate = Convert.ToInt32(frmCompany["ddlOrgStateEmirate"]);
            objComp.OrgPostBoxNo = string.Empty;//TODO frmCompany["txtOrgPostBox"];
            objComp.OrgPhoneNo = frmCompany["txtOrgLandline"];
            objComp.OrgFaxNo = frmCompany["txtOrgFax"];
            objComp.OrgEmailID = frmCompany["txtOrgEmail"];
            objComp.CMobileNo = frmCompany["txtOrgMobile"];
            objComp.CPersonDesignation = frmCompany["txtOrgDesignation"];
            objComp.OrgZip = frmCompany["txtOrgPinZip"];
            objComp.CPersonName = frmCompany["txtOrgContactPerson"];
            objComp.CEMailID = frmCompany["txtOrgEmail"];//
            objComp.BaseCurrencyId = Convert.ToDecimal(frmCompany["ddlOrgBaseCurrency"]);
            objComp.DateFormat = frmCompany["ddlOrgDateFormat"];
            objComp.UserId = "1"; //TODO
            objComp.IsActive = true;
            return objComp;
        }

        #endregion

        #region "Employee"
        // GET: /Company Setup/
        public ActionResult Employee_A007()
        {
            objBal = new MasterData();
            List<EmployeeModel> objModel = new List<EmployeeModel>();
            objModel = objBal.GetEmployeeMasterData(0);
            return PartialView(objModel);
        }

        public JsonResult GetLocationsForEmployee(string str)
        {
            IEnumerable<SelectListItem> getLocationsdata = new List<SelectListItem>();
            objBal = new MasterData();
            LocationModel lstObjModel = new LocationModel();
            lstObjModel = objBal.GetLocationData(0);
            getLocationsdata = lstObjModel.lstLocation.AsEnumerable().Select(m => new SelectListItem() { Text = m.LocationName, Value = m.LocationId.ToString() });
            return Json(new SelectList(getLocationsdata, "Value", "Text", null));
        }
        public JsonResult GetCompanyForEmp(int id)
        {
            SelectListItem getLocationsdata = new SelectListItem();
            objBal = new MasterData();
            CompanySetup objData = objBal.GetCompanyDetails(0);
            return Json(objData);
        }

        public ActionResult GetEmployeeDetails(decimal id)
        {
            EmployeeModel objEmpModel = new EmployeeModel();
            List<EmployeeModel> lstEmpModel = new List<EmployeeModel>();
            if (id > 0)
            {
                //To bind EmployeeModel data
                lstEmpModel = objBal.GetEmployeeMasterData(id);
                return PartialView("_EmployeeAddUpdate", lstEmpModel.Count>0?lstEmpModel[0]:objEmpModel);
            }
            else
            {
                return PartialView("_EmployeeAddUpdate", objEmpModel);
            }
        }

        public ActionResult EmployeeStatusUpdate(int Id, bool Status)
        {
            EmployeeModel objModel = new EmployeeModel();
            List<EmployeeModel> lstEmpModel = new List<EmployeeModel>();
            objModel.ActionMode = GlobalEnum.Flag.StatusUpdate;
            objModel.EmployeeId = Id;
            objModel.IsActive = Status;
            objModel.CreatedBy = "1";//TODO
            lstEmpModel=objBal.EmployeeInsertUpdate(objModel);
            return PartialView("_EmployeeSearchResults", lstEmpModel);
         }

        public ActionResult EmployeeInsertUpdate(FormCollection frmEmp)
        {
            EmployeeModel objModel = new EmployeeModel();
            List<EmployeeModel> lstEmpModel = new List<EmployeeModel>();
            if (frmEmp.Count > 0)
            {
                objModel = BuildEmployeeData(frmEmp);
                if (objModel.FirstName != null)
                    lstEmpModel=objBal.EmployeeInsertUpdate(objModel);
                else
                    return Json(0);
            }
            return PartialView("_EmployeeSearchResults", lstEmpModel);
        }

        private EmployeeModel BuildEmployeeData(FormCollection frmEmp)
        {
            EmployeeModel objFrmEmp = new EmployeeModel();
            Guid userId = new Guid();
            if (frmEmp["txtEmployeeId"].ToString() == "0" || frmEmp["txtEmployeeId"].ToString() == string.Empty)
            {
                objFrmEmp.ActionMode = GlobalEnum.Flag.Insert;
                objFrmEmp.EmployeeId = 0;
                try
                {
                    MembershipUser newUser = Membership.CreateUser(frmEmp["txtEmployeeCode"], "Admin@123");
                    userId = new Guid(newUser.ProviderUserKey.ToString());
                }
                catch (Exception ex)
                {
                    if (ex.Message.Contains("already"))
                    {
                        return objFrmEmp;
                    }
                }
                
            }
            else
            {
                objFrmEmp.EmployeeId = Convert.ToInt32(frmEmp["txtEmployeeId"]);
                objFrmEmp.ActionMode = GlobalEnum.Flag.Update;
            }
            objFrmEmp.UserId = userId;
            objFrmEmp.FirstName = frmEmp["txtEmpFirstName"];
            objFrmEmp.LastName = frmEmp["txtEmpLastName"];
            objFrmEmp.EmployeeCode = frmEmp["txtEmployeeCode"];
            objFrmEmp.MiddleName = frmEmp["txtEmpMiddleInitial"];
            objFrmEmp.Gender = Convert.ToInt16(frmEmp["ddlEmpGender"]);
            objFrmEmp.DOB = Convert.ToDateTime(frmEmp["txtEmpDoB"]);
            objFrmEmp.DesignationId = Convert.ToInt32(frmEmp["ddlEmpDesignation"]);
            objFrmEmp.BUId = Convert.ToInt32(frmEmp["ddlEmpBusinessUnit"]);
            objFrmEmp.LocationId = Convert.ToInt32(frmEmp["ddlEmpLocation"]);
            objFrmEmp.DOJ = Convert.ToDateTime(frmEmp["txtEmpDoJ"]);
            DateTime? emptydate;
            if (frmEmp["txtEmpDoL"] == "")
            { emptydate = null;
            objFrmEmp.LeavingDate = emptydate;
            }
            else {
            objFrmEmp.LeavingDate = Convert.ToDateTime(frmEmp["txtEmpDoL"]);
            }
            
            objFrmEmp.Address1 = frmEmp["txtEmpAddrLine1"];
            objFrmEmp.Address2 = frmEmp["txtEmpAddrLine2"];
            objFrmEmp.Zip = frmEmp["txtEmpPinZip"];
            objFrmEmp.City = frmEmp["txtEmpCity"];
            objFrmEmp.StateId = Convert.ToInt32(frmEmp["ddlEmpStateEmirate"]);
            objFrmEmp.CountryId = Convert.ToInt32(frmEmp["ddlEmpCountry"]);
            objFrmEmp.EmergencyContactName = frmEmp["txtEmpEmergencyContact"];
            objFrmEmp.EmergencyContactPhone = frmEmp["txtEmpEmergencyPhone"];
            objFrmEmp.IsActive = frmEmp["chkEmpActivate"] == null ? false : true;
            objFrmEmp.CreatedBy= "1"; //TODO session user id should be sent.
            return objFrmEmp;
        }
              
        #endregion

        #region "Charge Codes"
        // GET: /Company Setup/
        public ActionResult ChargeCodes_A005()
        {
            objBal = new MasterData();
            List<ChargeCodeModel> objModel = new List<ChargeCodeModel>();
            objModel=objBal.GetChargeCodes(0);
            return PartialView(objModel);
        }

        /// <summary>
        /// Get Charge code list
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult ChargeCodeSelect(int id)
        {
            ChargeCodeModel objCCModel = new ChargeCodeModel();
            List<ChargeCodeModel> lstOfCCModel = new List<ChargeCodeModel>();
            if (id > 0)
            {
                lstOfCCModel = objBal.GetChargeCodes(id);
                return PartialView("_ChargeCodeAddUpdate", lstOfCCModel.Count > 0 ? lstOfCCModel[0] : objCCModel);
            }
            else
            {
                return PartialView("_ChargeCodeAddUpdate", objCCModel);
            }
        }

        private ChargeCodeModel BindChargeCodeData(FormCollection frmCC)
        {
            ChargeCodeModel objCC = new ChargeCodeModel();
            objCC.ChargeCode = frmCC["txtChargeCode"];
            objCC.ChargeCodeDesc = frmCC["txtChargeCodeDesc"];
            objCC.BuId = 1; //TODO
            objCC.GroupDriven = frmCC["chkGroupDriven"] == null ? false : true;
            objCC.UnitDriven = frmCC["chkUnitDriven"] == null ? false : true;
            objCC.AdhocValue = frmCC["chkAdhoc"] == null ? false : true;
            var otype = frmCC["ddlCCType"].ToString();
            objCC.IsDeductible = otype == "1" ? true : false;
            objCC.IsInsurance = otype == "2" ? true : false;
            objCC.IsRental = otype == "3" ? true : false;
            objCC.IsNonRental = otype == "4" ? true : false;
            objCC.IsTrafficViolation = otype == "5" ? true : false;
            objCC.IsVasWhileRenting = otype == "6" ? true : false;
            objCC.IsVasWhileClosing = otype == "7" ? true : false;
            objCC.IsOtherVas = otype == "8" ? true : false;
            objCC.IsOtherCompliance = otype == "9" ? true : false;
            //objCC.IsDeductible = frmCC["chkDiscount"] == null ? false : true;
            //objCC.IsInsurance = frmCC["chkInsurance"] == null ? false : true;
            //objCC.IsRental = frmCC["chkRental"] == null ? false : true;
            //objCC.IsNonRental = frmCC["chkNonRental"] == null ? false : true;
            //objCC.IsTrafficViolation = frmCC["chkTrafficViolation"] == null ? false : true;
            //objCC.IsOtherVas = frmCC["chkVAS"] == null ? false : true;
            //objCC.IsVasWhileRenting = frmCC["chkVASWhileRenting"] == null ? false : true;
            //objCC.IsVasWhileClosing = frmCC["chkVASWhileClosing"] == null ? false : true;
            //objCC.IsOtherCompliance = frmCC["chkOtherCompliance"] == null ? false : true;

            objCC.ServiceChargeType = frmCC["ddlServiceType"];
            objCC.ServiceCharge = Convert.ToDecimal(frmCC["txtServiceChargeAppl"]);
            objCC.WaivingPercentage = Convert.ToDecimal(frmCC["txtWaiveValue"]);
            objCC.IsSecured = frmCC["chkIsSecured"] == null ? false : true;

            objCC.ServiceChargeApplicable = frmCC["chkServiceChargesApplicable"] == null ? false : true;
            objCC.IsDeductibleWaiver = frmCC["txtDeductibleAccident"] == null ? false : true;

            objCC.IsActive = frmCC["chkCCActivate"] == null ? false : true;
            objCC.UserID = 1;
            return objCC;
        }

        /// <summary>
        /// Insert of charge codes
        /// </summary>
        /// <param name="frmCharge"></param>
        /// <returns></returns>
        public ActionResult ChargeCodeInsert(FormCollection frmCC)
        {
            ChargeCodeModel objCC = new ChargeCodeModel();
            List<ChargeCodeModel> lstCCs = new List<ChargeCodeModel>();
            objCC = BindChargeCodeData(frmCC);
            objCC.ActionMode = GlobalEnum.Flag.Insert;
            lstCCs=objBal.ChargeCodesInsertUpdate(objCC);
            if (lstCCs.Count > 0)
            {
                if (lstCCs[0].isCCExist)
                {
                    return Json(lstCCs);
                }
            }

            return PartialView("_ChargeCodeSearchResults", lstCCs);
        }

        /// <summary>
        /// Update of charge codes
        /// </summary>
        /// <param name="frmCharge"></param>
        /// <returns></returns>
        public ActionResult ChargeCodeUpdate(FormCollection frmCC)
        {
            ChargeCodeModel objCC = new ChargeCodeModel();
            objCC = BindChargeCodeData(frmCC);
            objCC.ActionMode = GlobalEnum.Flag.Update;
            objCC.ChargeCodeID = Convert.ToDecimal(frmCC["txtChargeCodeID"]);
            return PartialView("_ChargeCodeSearchResults", objBal.ChargeCodesInsertUpdate(objCC));
        }

        /// <summary>
        /// Update of charge codes
        /// </summary>
        /// <param name="frmCharge"></param>
        /// <returns></returns>
        public ActionResult ChargeCodeDelete(int id)
        {
            ChargeCodeModel objCC = new ChargeCodeModel();
            objCC.ActionMode = GlobalEnum.Flag.Delete;
            objCC.ChargeCodeID = id;
            return PartialView("_ChargeCodeSearchResults", objBal.ChargeCodesInsertUpdate(objCC));
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
            PrivilegeModel objPrivilege = new PrivilegeModel();
            List<RoleModel> objRole = new List<RoleModel>();
            objRole = objBal.getAllRoles(Guid.Empty);
            objPrivilege.roleList = objRole;
            return PartialView(objPrivilege);
        }

        public ActionResult PrivilegesInsertUpdate(string formCollection, Guid RoleId)
        {
            objBal = new MasterData();
            PrivilegeModel obj = new PrivilegeModel();
            obj.RoleId = RoleId;
            obj.PageIds = formCollection; 
            objBal.PrivilegeInsertUpdate(obj, formCollection);
            return Json(1);
        }

        public ActionResult GetPrivileges(Guid RoleId)
        {
            List < PrivilegeModel> lstObjModel = new List<PrivilegeModel>();
            lstObjModel = objBal.GetPrivileges(RoleId);
            return PartialView("_PrivilegesSearchResults", lstObjModel);
        }

        //public SelectList GetPrivileges()
        //{
        //    IEnumerable<SelectListItem> getGlookupdata = new List<SelectListItem>();
        //    objBal = new MasterData();
        //    List < PrivilegeModel> lstObjModel = new List<PrivilegeModel>();
        //    lstObjModel = objBal.GetPrivileges();

        //    getGlookupdata = (from m in lstObjModel select m).AsEnumerable().Select(m => new SelectListItem() { Text = m.PageName, Value = m.GLookupID.ToString() });

        //    return new SelectList(getGlookupdata, "Value", "Text", null);

        //}
        #endregion

        #region "Roles"
        // GET: /Company Setup/
        public ActionResult Roles_A008()
        {
            objBal = new MasterData();
            List<RoleModel> objRole = new List<RoleModel>();
            objRole = objBal.getAllRoles(Guid.Empty);
            return PartialView(objRole);
        }

        /// <summary>
        /// Inserting role
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        public ActionResult RolesInsertUpdate(string role, string id, string action, bool isActive, bool isDelete)
        {
            objBal = new MasterData();
            List<RoleModel> lstOfRoles = new List<RoleModel>();
            RoleModel objRole = new RoleModel();
            objRole.RoleName = role;
            objRole.UserID = 1;
            
            objRole.IsActive = isActive;
            objRole.LoweredRoleName = role;
            objRole.Description = role;
            if (action == "Insert")
                objRole.ActionMode = GlobalEnum.Flag.Insert;
            else
            {
                objRole.ActionMode = GlobalEnum.Flag.Update;
                objRole.RoleId = new Guid(id);
                objRole.IsActivated = isDelete;
            }
            lstOfRoles = objBal.RolesInsertUpdate(objRole);

            if (lstOfRoles.Count > 0)
            {
                if (lstOfRoles[0].isRoleExist)
                {return Json(1);}
            }

            return PartialView("_RoleSearchResults", lstOfRoles);
        }

        #endregion
    }
} 
