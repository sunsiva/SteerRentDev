<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee_A007.aspx.cs" Inherits="SteerRent.Master.Employee_A007" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPageHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPage" runat="server">
            <asp:UpdatePanel runat="server" ID="up"  UpdateMode="Conditional">
             <ContentTemplate>
    <!--- START A007 - Employee Master -->
                        <div class="A007 st_view">
                            <div class="st_view_inner">
                            	<div class="tab_contant_inner">
                           			<div class="contain_row" style="display:none">
                                        <p class="error_msg_bg">&nbsp;</p>
                                    	<p class="error_msg_sm">Please enter all required fields.</p>
                                        <p class="error_msg_sm">Date of Birth cannot be equal to or greater than today.</p>
                                        <p class="error_msg_sm">The Employee Id must be unique.</p>
                                        <p class="error_msg_sm">Employee Id is already associated with another record.</p>
                                        <p class="error_msg_sm">Date of Joining cannot be greater than Date of Birth.</p>
                                        <p class="error_msg_sm">The Email-Id format is incorrect.</p>
                                        <p class="error_msg_sm">The Email-Id is already associated with another Employee.</p>
                            <p class="error_msg_sm">Error(s) while processing your request. Please try again. Contact your administrator if the issue persists.</p>
                                    </div>
                                    <form name="" method="post">
                                                                         
                                        <div class="contain_row">
                                        	<h5 class="contain_title">Employee Master</h5>
                                            <div class="contain_sub_row">
                                            	<p class="label_part">List of Employees</p>
                                                <div class="label_textarea_part">
                                                	Display grid here as per prototype. (this Div is designed to include both columns).</br>
<h5>xx records found. xx - Active, xx - Inactive.</h5>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                        <div class="contain_row">
                                        	<h5 class="contain_title">Employee Information</h5>
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                <p class="label_part">First Name <span>*</span></p>
                                                    <div class="label_input_part">
                                                        <input name="txtFirstName" type="text" placeholder="">
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                	<p class="label_part">Last Name <span>*</span></p>
                                                    <div class="label_input_part">
                                                        <input name="txtLastName" type="text" placeholder="">
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="clear"></div>                                                                                                
                                            </div>
                                            <div>&nbsp;</div>
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                <p class="label_part">Middle Initial(s) <span></span></p>
                                                    <div class="label_input_part">
                                                        <input name="txtMiddleInitial" type="text" placeholder="">
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                	<p class="label_part"><span></span></p>
                                                    <div class="label_input_part">
                                                        
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="clear"></div>                                                                                                
                                            </div>
                                            <div>&nbsp;</div>
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                <p class="label_part">Gender <span>*</span></p>
                                                    <div class="label_radio_part">
                                                        <label class="label_radio"><input name="radGender" type="radio" value="M"> Male</label>
                                                        <label class="label_radio last"><input name="radGender" type="radio" value="F"> Female</label>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                <p class="label_part">Date of Birth <span>*</span></p>
                                                    <div class="label_input_part">
                                                        <input name="txtDoB" type="text" placeholder="">
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="clear"></div>                                                                                                
                                            </div>   
                                            <div>&nbsp;</div>
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                <p class="label_part">Employee Id <span>*</span></p>
                                                    <div class="label_input_part">
                                                        <input name="txtEmpId" type="text" placeholder="">
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                <p class="label_part">Designation <span>*</span></p>
                                                    <div class="label_combo_part">
                                                        <select name="ddlDesignation"><option></option></select>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="clear"></div>                                                                                                
                                            </div>
                                            <div>&nbsp;</div>
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                <p class="label_part">Business Unit <span>*</span></p>
                                                    <div class="label_combo_part">
                                                        <select name="ddlBusinessUnit"><option></option></select>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                <p class="label_part">Location <span>*</span></p>
                                                    <div class="label_combo_part">
                                                        <select name="ddlLocation"><option></option></select>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="clear"></div>                                                                                                
                                            </div>  
                                            <div>&nbsp;</div>
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                <p class="label_part">Date of Joining <span>*</span></p>
                                                    <div class="label_input_part">
                                                        <input name="txtDoJ" type="text" placeholder="">
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                <p class="label_part">Leaving Date <span></span></p>
                                                    <div class="label_input_part">
                                                        <input type="text" name="txtDoL" placeholder="">
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="clear"></div>                                                                                                
                                            </div>
                                            </div>
                                            <div class="contain_row">
                                            <h5 class="contain_title">Contact Details</h5>
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                <p class="label_part">Address Line 1 <span>*</span></p>
                                                    <div class="label_input_part">
                                                        <input name="txtAddrLine1" type="text" placeholder="">
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                	<p class="label_part">Address Line 2 <span>*</span></p>
                                                    <div class="label_input_part">
                                                        <input name="txtAddrLine2" type="text" placeholder="">
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="clear"></div>                                                                                                
                                            </div> 
                                            <div>&nbsp;</div>
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                <p class="label_part">Address Line 3 <span></span></p>
                                                    <div class="label_input_part">
                                                        <input name="txtAddrLine3" type="text" placeholder="">
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                	<p class="label_part">City <span>*</span></p>
                                                    <div class="label_input_part">
                                                        <input name="txtCity" type="text" placeholder="">
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="clear"></div>                                                                                                
                                            </div>
                                            <div>&nbsp;</div>
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                <p class="label_part">State/Emirate <span>*</span></p>
                                                    <div class="label_input_part">
                                                        <input type="text" name="txtStateEmirate">
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                	<p class="label_part">Country <span>*</span></p>
                                                    <div class="label_combo_part">
                                                        <select name="txtCountry"><option></option></select>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="clear"></div>                                                                                                
                                            </div>      
                                            <div>&nbsp;</div>
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                <p class="label_part">Emergency Contact <span>*</span></p>
                                                    <div class="label_input_part">
                                                        <input type="text" name="txtEmergencyContact">
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                	<p class="label_part">Emergency Phone <span>*</span></p>
                                                    <div class="label_input_part">
                                                        <input type="text" name="txtEmergencyPhone">
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="clear"></div>                                                                                                
                                            </div>           
                                        </div>                                                                          
                                                     <div class="contain_row">
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                <p class="label_part"> <span></span></p>
                                                    <div class="label_radio_part">
                                                        <label class="label_radio"><input name="radActivation" type="radio" value="A" checked> Active</label>
                                                        <label class="label_radio last"><input name="radActivation" type="radio" value="I"> Inactive</label>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                    <h5>If set as Inactive the employee record will be inactivated and access to the system will be Blocked. However, if the employee record is currently inactive and is being set to Active state the user credentials that were blocked previously must be reactivated manually.
</h5>
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
                                        	
                                    </form>
                                </div>
                            </div>    
                        </div>
<!-- END A007 -->
                                                   </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
