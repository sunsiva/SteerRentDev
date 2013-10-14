<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Location_A004.aspx.cs" Inherits="SteerRent.Master.Location_A004" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPageHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPage" runat="server">
        <asp:UpdatePanel runat="server" ID="up"  UpdateMode="Conditional">
             <ContentTemplate>
    <!--- START A004 - Locations -->
                        <div class="A004 st_view">
                            <div class="st_view_inner">
                            	<div class="tab_contant_inner">
                           			<div class="contain_row" style="display:none">
                                    	<p class="error_msg_bg">&nbsp;</p>
                                        <p class="error_msg_sm">Please enter all required fields.</p>
                                        <p class="error_msg_sm">The chosen value already exists in the system.</p>
                                        <p class="error_msg_sm">Special characters are not allowed.</p>
                                        <p class="error_msg_sm">Error(s) while processing your request. Please try again. Contact your administrator if the issue persists.</p>
                                    </div>
                                   <%-- <form name="" method="post">
                                                                  --%>       
                                        <div class="contain_row">
                                        	<h5 class="contain_title">Locations</h5>
                                            <div class="contain_sub_row">
                                            	<p class="label_part">Current Locations</p>
                                                <div class="label_textarea_part">
                                                	Display grid here as per prototype. (this Div is designed to include both columns).</br>
<h5>xx records found. xx - Active, xx - Inactive.</h5>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                        <div class="contain_row">
                                        	<h5 class="contain_title">Add New Locations</h5>
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                <p class="label_part">Location Name <span>*</span></p>
                                                    <div class="label_input_part">
                                                        <input name="txtLocationName" type="text" placeholder="" />
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                	<p class="label_part">Location Code <span>*</span></p>
                                                    <div class="label_input_part">
                                                        <input name="txtLocationCode" type="text" placeholder="" />
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="clear"></div>                                                                                                
                                            </div>
                                        </div>                                                                          
                                        
                                        <div class="submit_part">
                                            <div class="contain_submit_row">
                                            	<button type="submit" class="submit_btn" value="Submit">Submit</button>
                                            </div>
                                        </div>
                                        	
                                    <%--</form>--%>
                                </div>
                            </div>    
                        </div>
<!-- END A004 -->
                                  </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
