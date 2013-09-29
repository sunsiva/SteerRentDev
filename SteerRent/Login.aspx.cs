using Microsoft.AspNet.Membership.OpenAuth;
using System;
using System.Collections.Generic;
using System.Configuration.Provider;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SteerRent
{
    public partial class Login : System.Web.UI.Page
    {
        protected string ProviderName
        {
            get { return (string)ViewState["ProviderName"] ?? String.Empty; }
            private set { ViewState["ProviderName"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //foreach (ProviderBase p in Membership.Providers)
            //    Response.Write(p.Name + ", " + p.GetType() + "<br />");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx",true);

            // Does there exist a User account for this user?
            //MembershipUser usrInfo = Membership.GetUser(txtUserName.Value);

            //ProviderName = OpenAuth.GetProviderNameFromCurrentRequest();

            //// User created & associated OK
            //if (OpenAuth.Login("SqlMembershipProvider", txtUserName.Value, createPersistentCookie: false))
            //{
            //    Response.Redirect("Account/ForgotPassword.aspx");
            //}

            //if (Membership.ValidateUser(txtUserName.Value, txtPassword.Value))
            //{
            //    FormsAuthentication.SetAuthCookie(txtUserName.Value, false);
               
            //    Response.Redirect("Account/ForgotPassword.aspx");
            //}
            //else
            //{
            //    ModelState.AddModelError("", "The user name or password provided is incorrect.");
            //}
        }
    }
}