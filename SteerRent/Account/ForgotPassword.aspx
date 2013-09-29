<%@ Page Title="" Language="C#" MasterPageFile="~/SteerRent.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="SteerRent.Account.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="login_mn">
        <div id="login_main-cntr">
            <h1>SteerRent - Password Retrieval</h1>
            <div class="lgn-innr">
                <br />
                <div class="error_message" style="display: none;">
                    <ul>
                        <li>Display error message here</li>
                    </ul>
                </div>
                <div class="frgt-pswd-cont">
                    <div class="lgn-frm">
                        <p>
                            <input name="txtUsername" id="txtEmailId" placeholder="Enter E-Mail ID" type="text" /></p>
                        <div class="clear"></div>
                        <div class="frgt-passmrg">
                            <span class="left ">
                                <input class="btn_cancel" name="btnCancel" onclick="history.go(-1); return false;" type="button" id="btnCancel" value="Cancel" /></span>
                            <span class="right">
                                <input class="btn_submit" id="btnSubmit" name="btnSubmit" type="button" value="Submit" /></span>
                        </div>
                    </div>
                </div>
                <div class="confirm" style="display: none;">
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <p class="confirm">Password was retrieved and sent to E-Mail ID</p>
                    <div class="lgn-frm">
                        <p class="button">
                            <input class="btn_login" name="" type="button" value="Login Now" /></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright">&copy;&nbsp;2013&nbsp;SteerRent.&nbsp;All rights reserved.</div>
    </div>
</asp:Content>
