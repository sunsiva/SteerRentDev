using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SteerRent.BAL;
using SteerRent.Model;
using System.Web.Script.Services;
using System.Web.Services;

namespace SteerRent.Master
{
    public partial class GeneralLookups_A001 : System.Web.UI.Page
    {
        MasterData objBal;
        LookupCategoryModel objModel;
        List<LookupCategoryModel> lstObjModel;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        public void BindData()
        {
            objBal = new MasterData();
            objModel = new LookupCategoryModel();
            lstObjModel = new List<LookupCategoryModel>();
            lstObjModel = new List<LookupCategoryModel>(objBal.GetMasterData());
            ddlCategory.DataSource = lstObjModel;
            ddlCategory.DataTextField = "LookupCategoryDesc";
            ddlCategory.DataValueField = "LookupCategoryID";
            ddlCategory.DataBind();

            gvCategory.DataSource = lstObjModel;
            gvCategory.DataBind();
            if (lstObjModel.Count > 0)
            {
                var spnActCnt = (from item in lstObjModel group item by item.IsActive).Count().ToString();
                var spnInActCnt = (from item in lstObjModel where item.IsActive == false select item).Count().ToString();
                spnTotCnt.InnerText = lstObjModel.Count().ToString() + " records found. " + spnActCnt + " - Active, " + spnInActCnt + " - Inactive.";
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            objBal = new MasterData();
            objModel = new LookupCategoryModel();
            lstObjModel = new List<LookupCategoryModel>();
            lstObjModel = new List<LookupCategoryModel>(objBal.GetMasterData());
            ddlSubCategory.DataSource = lstObjModel;
            ddlSubCategory.DataTextField = "LookupCategoryDesc";
            ddlSubCategory.DataValueField = "LookupCategoryID";
            ddlSubCategory.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }
    }
}