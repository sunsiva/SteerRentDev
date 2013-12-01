using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using SteerRent.Model;
using SteerRentMVC.Utilities;

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

        public ActionResult LogOut()
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            AccountModel.LogOnModel objLogin = new AccountModel.LogOnModel();
            return View("Login", objLogin);
        }


        public ActionResult Login()
        {
            AccountModel.LogOnModel objLogin = new AccountModel.LogOnModel();
            return View(objLogin);
        }

        //
        // POST: /Account/LogOn

        [HttpPost]
        public ActionResult Login(FormCollection frmItem)
        {
            AccountModel.LogOnModel objLoginModel = new AccountModel.LogOnModel();
            if (ModelState.IsValid)
            {
                if (Membership.ValidateUser(frmItem["txtUserName"], frmItem["txtPassword"]))
                    {
                        FormsAuthentication.SetAuthCookie(frmItem["txtUserName"], false);
                        SessionManager.DisplayName = frmItem["txtUserName"];
                        return RedirectToAction("Dashboard", "Home");
                    }
                    else
                    {
                        ModelState.AddModelError("LoginInvalid", "The user name or password provided is incorrect.");
                    }
            }
            // If we got this far, something failed, redisplay form
            return View(objLoginModel);
        }

        public ActionResult ForgotPassword()
        {
            return View();
        }

        public ActionResult ChangePassword()
        {
            return View();
        }
    }
}
