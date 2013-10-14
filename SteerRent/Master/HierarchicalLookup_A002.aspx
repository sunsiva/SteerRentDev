<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HierarchicalLookup_A002.aspx.cs" Inherits="SteerRent.Master.HierarchicalLookup_A002" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPageHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPage" runat="server">
    <asp:ScriptManagerProxy runat="server"></asp:ScriptManagerProxy>
    <asp:UpdatePanel runat="server" ID="up"  UpdateMode="Conditional">
             <ContentTemplate>

    <!--- START A002 - Hierarchical Lookups -->
                        <div class="A002 st_view">
                            <div class="st_view_inner">
                            	<div class="tab_contant_inner">
                           			<div class="contain_row" style="display:none">
                                    	<p class="error_msg_bg">&nbsp;</p>
                                        <p class="error_msg_sm">Please enter all required fields.</p>
                                        <p class="error_msg_sm">The chosen value already exists in the system.</p>
                                        <p class="error_msg_sm">Special characters are not allowed.</p>
                            <p class="error_msg_sm">Error(s) while processing your request. Please try again. Contact your administrator if the issue persists.</p>
                                    </div>
                                    <form name="HierarchicalForm" method="post">
                                    
                                        <div class="contain_row">
                                        	<h5 class="contain_title">General Lookups</h5>
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                <p class="label_part">Category<span></span></p>
                                                    <div class="label_combo_part">
                                                    	<select name="ddlCategory">
                                                        	<option></option>
                                                        </select>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                	<p class="label_part">Sub-Category<span></span></p>
                                                    <div class="label_combo_part">
                                                    	<select name="ddlSubCategory">
                                                        	<option></option>
                                                                                                                                                                                   
                                                        </select>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="clear"></div>                                                                                                
                                            </div>
                                        </div>
                                        
                                        <div class="contain_row">
                                        	<h5 class="contain_title">Existing Values</h5>
                                            <div class="contain_sub_row">
                                            	<p class="label_part">List of Values</p>
                                                <div class="label_textarea_part">
                                                	Display grid here as per prototype. (this Div is designed to include both columns).<br>
                                             
                                                    <h5>xx records found. xx - Active, xx - Inactive.</h5>
                                         
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                        <div class="contain_row">
                                        	<h5 class="contain_title">Add Lookup Data for "Category - Sub-Category"</h5>
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                <p class="label_part">Enter New Category <span>**</span></p>
                                                    <div class="label_input_part">
                                                        <input name="txtNewCat" type="text" placeholder="" />
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                	<p class="label_part">New Sub-Category <span>*</span></p>
                                                    <div class="label_input_part">
                                                        <input name="txtNewSubCat" type="text" placeholder="" />
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="clear"></div>                                                                                                
                                            </div>
                                            <div>OR</div>
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                <p class="label_part">Existing Category <span>**</span></p>
                                                    
                                                    <div class="label_combo_part">
                                                        <select name="ddlCategory"><option></option></select>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                	<p class="label_part"><span></span></p>
                                                   
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="clear"></div>                                                                                                
                                            </div>
                                        </div>                                                                          
                                        
                                        <div class="submit_part">
                                            <div class="contain_submit_row">
                                            	<asp:button type="submit" ID="btnSubmitA002" class="submit_btn" runat="server" value="Submit" Text="Submit" OnClick="btnSubmitA002_Click"></asp:button>
                                            </div>
                                        </div>
                                        	
                                    </form>
                                </div>
                            </div>    
                        </div>
<!-- END A002 -->
                 </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
