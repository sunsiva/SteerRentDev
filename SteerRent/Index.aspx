<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Index.aspx.cs" Inherits="SteerRent.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPageHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPage" runat="server">
    <div>
     <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
            </Services>
        </asp:ScriptManager>
        <asp:UpdatePanel runat="server" ID="up">
            <ContentTemplate>
                <div>
                    <h1>My webform page added</h1>
                    <input name="txtMarkSale" id="txtMarkSale" runat="server" type="text" placeholder="Marked For Sale for3" />
                    <asp:RequiredFieldValidator ControlToValidate="txtMarkSale" ID="reqTxtMarkSale" runat="server" Display="Dynamic" ErrorMessage="Please provide value"></asp:RequiredFieldValidator>
                    <input name="" id="Text1" runat="server" type="text" />
                </div>
                <label id="lblMsg" runat="server" visible="false">You are here!!!</label>

                <input name="" id="Text2" runat="server" type="text" />
                <asp:Button runat="server" Text="AspBtn" ID="aspbtn" OnClick="aspbtn_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>

         
    </div>
</asp:Content>