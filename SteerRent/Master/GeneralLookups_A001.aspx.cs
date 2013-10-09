using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SteerRent.BAL;
using SteerRent.Model;

namespace SteerRent.Master
{
    public partial class GeneralLookups_A001 : System.Web.UI.Page
    {
        MasterData objBal;
        MasterDataModel objModel;
        List<MasterDataModel> lstObjModel;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            objBal = new MasterData();
            objModel = new MasterDataModel();
            lstObjModel = new List<MasterDataModel>();
            lstObjModel = new List<MasterDataModel>(objBal.GetMasterData());
            ddlCategory.DataSource = lstObjModel;
            ddlCategory.DataTextField = "LookupCategoryDesc";
            ddlCategory.DataValueField = "LookupCategoryID";
            ddlCategory.DataBind();

            gvCategory.DataSource = lstObjModel;
            gvCategory.DataBind();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            objBal = new MasterData();
            objModel = new MasterDataModel();
            lstObjModel = new List<MasterDataModel>();
            lstObjModel = new List<MasterDataModel>(objBal.GetMasterData());
            ddlSubCategory.DataSource = lstObjModel;
            ddlSubCategory.DataTextField = "LookupCategoryDesc";
            ddlSubCategory.DataValueField = "LookupCategoryID";
            ddlSubCategory.DataBind();
        }
    }
}