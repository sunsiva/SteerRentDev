using SteerRentMVC.Utilities;
using System;
using System.Threading;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace SteerRentMVC
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Session_Start(Object sender, EventArgs e)
        {
            #region Set Session Variables
           // SetSessionValueFromClaims();
           // AssaignMultipleRoles();
            #endregion
            SessionManager.userName = Thread.CurrentPrincipal.Identity.ToString();
        }
        protected void Session_End(Object sender, EventArgs e)
        {
            Session.Abandon();
        }
    }
}