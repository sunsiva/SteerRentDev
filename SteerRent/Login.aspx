<%@ Page Title="Login" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SteerRent.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link type="text/css" rel="stylesheet" href="Content/CSS/style.css" />
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
<div id="login_mn">
            <div id="login_main-cntr">
                <h1>Login to SteerRent</h1>
                <div class="lgn-innr">
                    <br />
                    <div class="error_message" style="display: none;">
                        <ul>
                            <br />
                            <li>Display error message here</li>
                        </ul>
                    </div>

                    <div class="lgn-frm">
                        <p>
                            <input placeholder="Username" id="txtUserName" type="text" runat="server" />    
                        </p>
                        <p>
                            <input id="txtPassword" placeholder="Password" name="password" runat="server" value="Password" type="password" /></p>

                        <div class="frgt">
                            <span class="left padd5">
                                <input  id="chkRememberMe" type="checkbox" value="checkbox" /><label>Remember me</label></span>
                            <a class="right padd10" href="Account/ForgotPassword.aspx" target="_parent">Forgot Password</a>
                           
                        </div>
                        <div class="clear"></div>
                        <p class="button">
                            <asp:Button CssClass="btn_login" name="login" ID="btnLogin" Text="Submit" type="button" runat="server" value="Login" OnClick="btnLogin_Click" /></p>

                        <asp:ValidationSummary ID="ValidationSummary1" ShowModelStateErrors="true" runat="server" />
                    </div>  
                </div>

            </div>

            <div class="copyright">&copy;&nbsp;2013&nbsp;SteerRent.&nbsp;All rights reserved.</div>
        </div>
    </form>
</body>
</html>
