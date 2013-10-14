using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SteerRentMVC.Controllers
{
    public class MasterController : Controller
    {
        //
        // GET: /Master/
        public ActionResult GeneralLookups_A001()
        {

            return PartialView();
        }


        public ActionResult GeneralLookupSubmit()
        {

            return PartialView("GeneralLookups_A001");
                       
        }

        public ActionResult HierarchicalLookup_A002()
        {
            return PartialView();
        }

        // [HttpPost]
        //public ActionResult HierarchicalLookup_A002(int id)
        //{
        //    return PartialView();
        //}

    }
} 
