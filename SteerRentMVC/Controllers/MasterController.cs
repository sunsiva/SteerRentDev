using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SteerRent.Model;
using SteerRent.BAL;

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
            objModel = objBal.GetLookupData(objModel);
            //if (objModel.LookupCategoryList.Count>0)
            //{
            //    ViewBag["CategoryDataList"] = from item in objModel.LookupCategoryList
            //                                  select new SelectListItem() { Text = item.LookupCategoryDesc, Value = item.LookupCategoryID.ToString() };
            //}
            return PartialView(objModel);
        }

        public ActionResult GeneralLookupSubmit(int id)
        {
            objBal = new MasterData();
            objModel = new LookupCategoryModel();
            lstObjModel = new List<LookupCategoryModel>();
            objModel.PageMode = GlobalEnum.MasterPages.GLookup;
            objModel = objBal.GetLookupData(objModel);
            //objModel = (from item in lstObjModel where (item.LookupCategoryID == id) select item).SingleOrDefault();
            //objModel.LookupCategoryList = objModel.GLookupList;

            //IEnumerable<SelectListItem> stateList = (from m in lstObjModel where m.LookupCategoryID == id select m).AsEnumerable().Select(m => new SelectListItem() { Text = m.LookupCategoryCode, Value = m.LookupCategoryID.ToString() });
            //SelectList obj = new SelectList(stateList, "Value", "Text", id);
            //ViewBag.SubCategory = obj;
            return PartialView("_SearchResults", objModel);
        }

        public ActionResult HierarchicalLookup_A002()
        {
            return PartialView();
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
            if (id > 0)
            {LocationModel objModel = new LocationModel();
            objModel.LocationId = id;
            objModel.BuId = 1;
            objModel.ActionMode = GlobalEnum.Flag.Select;
                return PartialView("_LocationAddUpdate", objBal.LocationInsertUpdate(objModel));
            }
            else
            {
            } return PartialView("_LocationAddUpdate");
        }

        public ActionResult LocationInsert(string LocName, string LocCode)
        {
            LocationModel objModel = new LocationModel();
            objModel.LocationName = LocName;
            objModel.LocationCode = LocCode;
            objModel.IsActive = true;
            objModel.BuId = 1;
            objModel.ActionMode = GlobalEnum.Flag.Insert;
            return PartialView("_LocationSearchResults", objBal.LocationInsertUpdate(objModel));
        }

        public void LocationUpdate(int Id, bool Status)
        {
            LocationModel objModel = new LocationModel();
            objModel.LocationId = Id;
            objModel.IsActive = Status;
            objModel.BuId = 1;
            objModel.ActionMode = GlobalEnum.Flag.Update;
            objModel.WorkFrom = DateTime.UtcNow;
            objModel.WorksTill = DateTime.UtcNow;
            objBal.LocationInsertUpdate(objModel);
        }
        #endregion

    }
} 
