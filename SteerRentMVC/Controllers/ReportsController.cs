using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using SteerRent.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SteerRentMVC.Controllers
{
    public class ReportsController : Controller
    {
        //
        // GET: /Reports/

        public ActionResult UsersReport()
        {
            return View();
        }

        //Used for showing simple report
        public void ShowSimple()
        {

            using (ReportClass rptH = new ReportClass())
            {

                rptH.FileName = Server.MapPath("~/") + "//Rpts//Simple.rpt";
                rptH.Load();
                rptH.ExportToHttpResponse(ExportFormatType.PortableDocFormat, System.Web.HttpContext.Current.Response, false, "crReport");
            }
        }

        public void ShowReport()
        {
            string strReportName = "UserDetailsReport.rpt";// System.Web.HttpContext.Current.Session["ReportName"].ToString();    // Setting ReportName
            var rptSource = new List<AccountModel.LogOnModel>() { 
                new AccountModel.LogOnModel(){ UserName ="Admin", UserId = 1},
                new AccountModel.LogOnModel(){UserName ="Steer",UserId =2},
            };

            ReportClass rd = new ReportClass();
            string strRptPath = System.Web.HttpContext.Current.Server.MapPath("~/") + "Rpts//" + strReportName;
            rd.FileName = strRptPath;
            rd.Load();
            if (rptSource != null && rptSource.GetType().ToString() != "System.String")
                rd.SetDataSource(rptSource);
            
            rd.ExportToHttpResponse(ExportFormatType.PortableDocFormat, System.Web.HttpContext.Current.Response, false, "crReport");
        }
    }
}
