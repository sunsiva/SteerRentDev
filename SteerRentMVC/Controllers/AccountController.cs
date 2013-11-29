using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace SteerRentMVC.Controllers
{
    public class AccountController : Controller
    {
        //
        // GET: /Account/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View("Login");
        }

        //
        // POST: /Account/LogOn

        [HttpPost]
        public ActionResult Login(FormCollection frmLogin)
        {
            //if (ModelState.IsValid)
            //{
            //    MembershipUser currentUser = Membership.GetUser("siva", true /* userIsOnline */);

            //    // Attempt to register the user
            //    MembershipCreateStatus createStatus;
            //    Membership.CreateUser("siva1", "siva1", "siva1@gmail.com", null, null, true, null, out createStatus);

            //    if (createStatus == MembershipCreateStatus.Success)
            //    {

            //        if (Membership.ValidateUser("siva", "indian"))
            //        {
            //            //frmLogin["chkRemember"]
            //            FormsAuthentication.SetAuthCookie(frmLogin["txtUserName"], false);
            //            return RedirectToAction("Dashboard", "Home");
            //        }
            //        else
            //        {
            //            ModelState.AddModelError("", "The user name or password provided is incorrect.");
            //        }
            //    }
            //}
            //// If we got this far, something failed, redisplay form
            //return View();
            return RedirectToAction("Dashboard", "Home");
        }
    }
}
