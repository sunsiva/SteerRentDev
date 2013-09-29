<%@ Page Title="" Language="C#" MasterPageFile="~/SteerRent.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SteerRent.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
            <!-- Start Contain Part
		==================================================-->
      
        <div class="contain_part">
        	<div class="contain_inner" id="demo_container">
            
                <div id="slidetabs" class="clean_rounded-horizontal">
                    <div class="st_tabs">
                        <div class="st_tabs_wrap">
                            <ul>
                                <li><a href="#view_1">Dashboard</a></li>
                               <%-- <li><a href="#view_2">Tab 1</a><button class="cancel_btn">X</button></li>--%>
                            </ul>
                        </div>
                    </div>
                    <div class="st_views">
                        <div class="view_1 st_view">
                            <div class="st_view_inner">
                            	<div class="tab_contant_inner">
                           			<div class="contain_row" style="display:none">
                                    	<p class="error_msg_bg">Error(s)</p>
                                        <p class="error_msg_sm">Error message here....</p>
                                        <p class="error_msg_sm">Another error message here....</p>
                                        <p class="error_msg_sm">Yet another error message here....</p>

                                           
                                    </div>
                                    <h1><a href="#add-product-popup" class="popup-link">Click to open popup</a></h1>
                                    <%--<form name="frmDash" method="post">--%>
                                           
                                        <div class="contain_row">
                                        	<h5 class="contain_title">Form Sub Section</h5>
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                	<p class="label_part">Label <span>*</span></p>
                                                    <div class="label_combo_part">
                                                    	<select>
                                                        	<option>Vehicle</option>
                                                        	<option>Car</option>
                                                        	<option>Bus</option>
                                                        	<option>Train</option>                                                                                                                                                                                    
                                                        </select>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                	<p class="label_part">Label <span>*</span></p>
                                                    <div class="label_combo_part">
                                                    	<select>
                                                        	<option>Status</option>
                                                        	<option>Location</option>
                                                        	<option>Year/Model</option>
                                                        	<option>Emgine Capacity</option>                                                                                                                                                                                    
                                                        </select>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="clear"></div>                                                                                                
                                            </div>
                                        </div>
                                        
                                        <div class="contain_row">
                                        	<h5 class="contain_title">Form Sub Section</h5>
                                            <div class="contain_sub_row">
                                            	<p class="label_part exlabel">Label</p>
                                                <div class="label_textarea_part">
                                                	<textarea name="" cols="" rows=""></textarea>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                        
                                        <div class="contain_row">
                                        	<h5 class="contain_title">Form Sub Section</h5>
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                	<p class="label_part">Label <span>*</span></p>
                                                    <div class="label_input_part">
                                                    	<input name="" type="text" placeholder="Marked For Sale" />
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                	<p class="label_part">Label <span>*</span></p>
                                                    <div class="label_radio_part">
                                                    	<label class="label_radio"><input name="option" type="radio" value="1"> Option1</label>
                                                        <label class="label_radio last"><input name="option" type="radio" value="2"> Option2</label>
                                                        <div class="clear"></div>
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
                                        	
                                   <%-- </form>--%>
                                </div>
                            </div>
                        </div>
                        <%--<div class="view_2 st_view">
                            <div class="st_view_inner">
                            	<div class="tab_contant_inner">
                           			<div class="contain_row">
                                    	<p class="error_msg_bg">Error(s)</p>
                                        <p class="error_msg_sm">Error message here....</p>
                                        <p class="error_msg_sm">Another error message here....</p>
                                        <p class="error_msg_sm">Yet another error message here....</p>
                                    </div>
                                    <form name="for" method="post">
                                    
                                        <div class="contain_row">
                                        	<h5 class="contain_title">Form Sub Section</h5>
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                	<p class="label_part">Label <span>*</span></p>
                                                    <div class="label_combo_part">
                                                    	<select>
                                                        	<option>Vehicle</option>
                                                        	<option>Car</option>
                                                        	<option>Bus</option>
                                                        	<option>Train</option>                                                                                                                                                                                    
                                                        </select>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                	<p class="label_part">Label <span>*</span></p>
                                                    <div class="label_combo_part">
                                                    	<select>
                                                        	<option>Status</option>
                                                        	<option>Location</option>
                                                        	<option>Year/Model</option>
                                                        	<option>Emgine Capacity</option>                                                                                                                                                                                    
                                                        </select>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="clear"></div>                                                                                                
                                            </div>
                                        </div>
                                        
                                        <div class="contain_row">
                                        	<h5 class="contain_title">Form Sub Section</h5>
                                            <div class="contain_sub_row">
                                            	<p class="label_part exlabel">Label</p>
                                                <div class="label_textarea_part">
                                                	<textarea name="" cols="" rows=""></textarea>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                        
                                        <div class="contain_row">
                                        	<h5 class="contain_title">Form Sub Section</h5>
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                	<p class="label_part">Label <span>*</span></p>
                                                    <div class="label_input_part">
                                                    	<input name="" type="text" placeholder="Marked For Sale" />
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                	<p class="label_part">Label <span>*</span></p>
                                                    <div class="label_radio_part">
                                                    	<label class="label_radio"><input name="option" type="radio" value="1"> Option1</label>
                                                        <label class="label_radio last"><input name="option" type="radio" value="2"> Option2</label>
                                                        <div class="clear"></div>
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
                                        	
                                    </form>
                                </div>
                            </div>    
                        </div>--%>
                    </div>
                </div>            
    
            </div>
        </div>
               
        <!-- End Contain Part
		==================================================-->

    <!--start[popup]-->
<div id="add-product-popup" class="add-timeline-popup zoom-anim-dialog mfp-hide">
    
    <p class="error_popup_bg">Please Enter Valid Value</p>
    <p class="success_msg_bg">Accout Success</p>
    
    <div class="popup-form-outter">
    	<h5 class="popup-title">Popup Title</h5>
    	<p class="popup-detail">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
        <p class="popup-detail">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. </p>
    </div>
    
    <%--<form name="add-product-form" method="post">--%>
        <!--start[popup-inner-part]-->
        <div class="popup-form-outter">
        	<p class="label_popup">Username</p>
            <input name="" type="text" class="popup_input" />
            <p class="label_popup">Select Date</p>
            <input name="" type="text" id="datepicker" class="popup_input date" />
            <p class="label_popup">Email</p>
            <input name="" type="text" class="popup_input" />
            <p class="label_popup">Detail</p>
            <textarea name="" cols="" rows="" class="popup_textarea"></textarea>
            <input name="" type="submit" class="popup_submit" value="Submit" />
        </div>
        <!--end[popup-inner-part]-->
        
    <%--</form>--%>
   
</div>
<!--end[popup]-->
</asp:Content>
