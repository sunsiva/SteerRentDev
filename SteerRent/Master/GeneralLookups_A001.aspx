<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GeneralLookups_A001.aspx.cs" Inherits="SteerRent.Master.GeneralLookups_A001" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPageHead" runat="server">
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPage" runat="server">
    
    <asp:ScriptManagerProxy runat="server">
        <Services>
            <asp:ServiceReference Path="~/Master/GeneralLookups_A001.aspx" />
        </Services>
    </asp:ScriptManagerProxy>
                
<%--<script type="text/javascript">
                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(InIEvent);
    </script>--%>

    <asp:UpdatePanel runat="server" ID="up"  UpdateMode="Conditional">
        
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
        </Triggers>
            <ContentTemplate>
                
                <!--- A001 - General Lookups -->
                        <div class="A001 st_view">
                            <div class="st_view_inner">
                            	<div class="tab_contant_inner">
                           			<div class="contain_row" style="display:none">
                                    	<p class="error_msg_bg">&nbsp;</p>
                                        <p class="error_msg_sm">Please enter all required fields.</p>
                                        <p class="error_msg_sm">The chosen value already exists in the system.</p>
                                        <p class="error_msg_sm">Special characters are not allowed.</p>
                                        <p class="error_msg_sm">Error(s) while processing your request. Please try again. Contact your administrator if the issue persists.</p>
                                    </div>
                                    <%--<form name="" method="post">--%>
                                    
                                        <div class="contain_row">
                                        	<h5 class="contain_title">General Lookups</h5>
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                <p class="label_part">Category<span></span></p>
                                                    <div class="label_combo_part">
                                                        
                                                        <asp:DropDownList  ID="ddlCategory" EnableViewState="false" ClientIDMode="Static" ToolTip="Please select category from the list."  runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                                                            <asp:ListItem Value="0">--Please select--</asp:ListItem>
                                                        </asp:DropDownList>
                                                         <%--DataSourceID="SqlDataSourceDDL" DataTextField="GLookupCode" DataValueField="GLookupCode"--%>
                                                    	<%--<asp:SqlDataSource ID="SqlDataSourceDDL" runat="server" ConnectionString="<%$ ConnectionStrings:SteerRentConnection %>" SelectCommand="SELECT [GLookupCode]+'-'+[GLookupCode] as GLookupCode , [LookupCategoryID], [GLookupID], [GLookupDesc], [IsActive] FROM [GLookup]"></asp:SqlDataSource>--%>
                                                    	<%--<select name="ddlCategory">
                                                        	<option></option>
                                                        </select>--%>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                	<p class="label_part">Sub-Category<span></span></p>
                                                    <div class="label_combo_part">
                                                        
                                                        <asp:DropDownList ID="ddlSubCategory"  ToolTip="Please select sub-category from the list."  runat="server"></asp:DropDownList>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="clear"></div>                                                                                                
                                            </div>
                                        </div>
                                        
                                        <div class="contain_row">
                                        	<h5 class="contain_title">Existing Values</h5>
                                            <div class="contain_sub_row">
                                            	<p class="label_part exlabel">List of Values</p>
                                                <div class="label_textarea_part">
                                                
                                                     <asp:GridView EmptyDataText="No record(s) found." DataKeyNames="LookupCategoryID" ShowHeaderWhenEmpty="true" EmptyDataRowStyle-CssClass="error_msg_bg" 
                                                         ID="gvCategory" ClientIDMode="Static" AutoGenerateColumns="false"  CssClass="gridtable" ForeColor="Black" 
                                                         AllowPaging="true" Width="450px" PageSize="5" AllowSorting="true" runat="server">
                                                         <Columns>
                                                                <asp:BoundField HeaderText="Category" DataField="LookupCategoryCode" 
                                                                   SortExpression="LookupCategoryCode"></asp:BoundField>
                                                                <asp:BoundField HeaderText="Sub-Category" DataField="LookupCategoryDesc" 
                                                                   SortExpression="LookupCategoryDesc"></asp:BoundField>
                                                                <asp:BoundField HeaderText="Value" DataField="LookupCategoryDesc" 
                                                                   SortExpression="LookupCategoryDesc" />
                                                                <asp:BoundField HeaderText="Status" DataField="LookupCategoryDesc" 
                                                                   SortExpression="LookupCategoryDesc" > </asp:BoundField>
                                                              <asp:CheckBoxField DataField="IsActive" ReadOnly="false" HeaderText="Activate"  />
                                                                <asp:TemplateField HeaderText="Activate">
                                                                    <ItemTemplate>
                                                                       <input type="checkbox" class="checkbox-mrg" checked="checked" id="chkAction" onclick="" runat="server"/>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                         
                                                    </asp:GridView>
                                                    <h5><span runat="server" id="spnTotCnt"></span></h5>
                                                  </div>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                        
                                        <div class="contain_row">
                                        	<h5 class="contain_title">Add Lookup Data for "Category - Sub-Category"</h5>
                                            <div class="contain_sub_row">
                                            	<div class="contain_left_part">
                                                	<p class="label_part">Enter New Value <span>*</span></p>
                                                    <div class="label_input_part">
                                                    	<input name="txtNewValue" type="text" placeholder="" />
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="contain_left_part">
                                                    <div class="clear"></div>
                                                </div>
                                            	<div class="clear"></div>   
                                            </div>
                                        </div>
                                        
                                        <div class="submit_part">
                                            <div class="contain_submit_row">
                                            	<asp:Button runat="server" ID="btnSubmit" ClientIDMode="Static" class="submit_btn" value="Submit" OnClick="btnSubmit_Click" Text="Submit"></asp:Button>
                                            </div>
                                        </div>
                                        	
                                    <%--</form>--%>
                                </div>
                            </div>    
                        </div>
                <!-- END A001 -->
            </ContentTemplate>
    </asp:UpdatePanel>
     <script lang="ja" type="text/javascript">
         $("#btnSubmit").click(function () {
             alert();
             $.ajax({
                 type: "POST",
                 url: "Master/GeneralLookups_A001.aspx/BindData",
                 data: "{}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (msg) {
                     alert(msg);
                 },
                 failure: function (error)
                 { alert('error');}
             });
         });
    </script>
</asp:Content>
