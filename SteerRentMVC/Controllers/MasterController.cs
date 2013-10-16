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
        MasterData objBal;
        LookupCategoryModel objModel;
        List<LookupCategoryModel> lstObjModel;

        //
        // GET: /Master/
        public ActionResult GeneralLookups_A001()
        {
            objBal = new MasterData();
            objModel = new LookupCategoryModel();
            objModel.LookupCategoryList = objBal.GetMasterData().ToList();
            return PartialView(objModel);
        }

        public ActionResult GeneralLookupSubmit(int id)
        {
            objBal = new MasterData();
            objModel = new LookupCategoryModel();
            lstObjModel = new List<LookupCategoryModel>();
            lstObjModel = objBal.GetMasterData();
            objModel = (from item in lstObjModel where (item.LookupCategoryID == id) select item).SingleOrDefault();
            objModel.LookupCategoryList = lstObjModel;
            return PartialView("_SearchResults", objModel);
        }

        public ActionResult HierarchicalLookup_A002()
        {
            return PartialView();
        }

        public void BindData()
        {
            objBal = new MasterData();
            objModel = new LookupCategoryModel();
            lstObjModel = new List<LookupCategoryModel>();
            lstObjModel = new List<LookupCategoryModel>(objBal.GetMasterData());

            if (lstObjModel.Count > 0)
            {
                var spnActCnt = (from item in lstObjModel group item by item.IsActive).Count().ToString();
                var spnInActCnt = (from item in lstObjModel where item.IsActive == false select item).Count().ToString();
                //spnTotCnt.InnerText = lstObjModel.Count().ToString() + " records found. " + spnActCnt + " - Active, " + spnInActCnt + " - Inactive.";
            }
        }

    }
} 
