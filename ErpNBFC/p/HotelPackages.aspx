<%@ Page Title="" Language="C#" MasterPageFile="~/p/admin.Master" AutoEventWireup="true" CodeBehind="HotelPackages.aspx.cs" Inherits="ErpNBFC.p.HotelPackages" %>
 <%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">      
<script type="text/javascript">
    $(document).ready(function() {
        document.getElementById("weekdays").style.display = "none";
        document.getElementById("weekdends").style.display = "none";
        document.getElementById("special").style.display = "none";
    });

    function validate() {
        var chkStatus1 = document.getElementById("ContentPlaceHolder1_CheckBox2");
        if (chkStatus1.checked) {
            document.getElementById("weekdays").style.display = "block";
            document.getElementById("weekdends").style.display = "block";
            document.getElementById("special").style.display = "block";
            document.getElementById("normal").style.display = "none";
            
        }
        if (!chkStatus1.checked) {
            document.getElementById("weekdays").style.display = "none";
            document.getElementById("weekdends").style.display = "none";
            document.getElementById("special").style.display = "none";
            document.getElementById("normal").style.display = "block";
        }
    }

    function priceonRequest() {
        var chkStatus1 = document.getElementById("ContentPlaceHolder1_CheckBox1");
        var chkStatus2 = document.getElementById("ContentPlaceHolder1_weekendsCheckBox1");
        var chkStatus3 = document.getElementById("ContentPlaceHolder1_specialDayCheckBox1");
        var chkStatus4 = document.getElementById("ContentPlaceHolder1_normalCheckBox1");

        var chkStatus5 = document.getElementById("ContentPlaceHolder1_normalpriceonrequestchild");
        var chkStatus6 = document.getElementById("ContentPlaceHolder1_normalpriceonrequestadult");
        var chkStatus7 = document.getElementById("ContentPlaceHolder1_weekdayspriceonrequestchild");
        var chkStatus8 = document.getElementById("ContentPlaceHolder1_weekdayspriceonrequestadult");
        var chkStatus9 = document.getElementById("ContentPlaceHolder1_weekendspriceonrequestchild");
        var chkStatus10 = document.getElementById("ContentPlaceHolder1_weekendspriceonrequestadult");
        var chkStatus11 = document.getElementById("ContentPlaceHolder1_specialpriceonrequestchild");
        var chkStatus12 = document.getElementById("ContentPlaceHolder1_specialpriceonrequestadult");
        if (chkStatus1.checked) {
            document.getElementById("ContentPlaceHolder1_weekdaysPrice").disabled = true;
            document.getElementById("ContentPlaceHolder1_weekdaysPriceTax").disabled = true;

        } 
        if (!chkStatus1.checked) {
            document.getElementById("ContentPlaceHolder1_weekdaysPrice").disabled = false;
            document.getElementById("ContentPlaceHolder1_weekdaysPriceTax").disabled = false;
        }
        if (chkStatus7.checked) {
            document.getElementById("ContentPlaceHolder1_weekdaysExtraChildPrice").disabled = true;
            document.getElementById("ContentPlaceHolder1_weekdaysExtraChildPricePercentage").disabled = true;
            document.getElementById("ContentPlaceHolder1_ddl_weekdaysxtraChildMealType").disabled = true;
        }
        if (!chkStatus7.checked) {
            document.getElementById("ContentPlaceHolder1_weekdaysExtraChildPrice").disabled = false;
            document.getElementById("ContentPlaceHolder1_weekdaysExtraChildPricePercentage").disabled = false;
            document.getElementById("ContentPlaceHolder1_ddl_weekdaysxtraChildMealType").disabled = false;
        }
        if (chkStatus8.checked) {
            document.getElementById("ContentPlaceHolder1_weekdaysExtraAdultPrice").disabled = true;
            document.getElementById("ContentPlaceHolder1_weekdaysExtraAdultTax").disabled = true;
            document.getElementById("ContentPlaceHolder1_ddl_weekdaysxtraAdultMealType").disabled = true;
        }
        if (!chkStatus8.checked) {
            document.getElementById("ContentPlaceHolder1_weekdaysExtraAdultPrice").disabled = false;
            document.getElementById("ContentPlaceHolder1_weekdaysExtraAdultTax").disabled = false;
            document.getElementById("ContentPlaceHolder1_ddl_weekdaysxtraAdultMealType").disabled = false;
        }

        if (chkStatus2.checked) {
            document.getElementById("ContentPlaceHolder1_weekendsPrice").disabled = true;
            document.getElementById("ContentPlaceHolder1_weekendsPriceTax").disabled = true;
            
        }
        if (!chkStatus2.checked) {
            document.getElementById("ContentPlaceHolder1_weekendsPrice").disabled = false;
            document.getElementById("ContentPlaceHolder1_weekendsPriceTax").disabled = false;
            
        }
        if (chkStatus9.checked) {
            document.getElementById("ContentPlaceHolder1_weekendsExtraChildPrice").disabled = true;
            document.getElementById("ContentPlaceHolder1_weekendsExtraChildPricePercentage").disabled = true;
            document.getElementById("ContentPlaceHolder1_ddl_weekendsxtraChildMealType").disabled = true;
        }
        if (!chkStatus9.checked) {
            document.getElementById("ContentPlaceHolder1_weekendsExtraChildPrice").disabled = false;
            document.getElementById("ContentPlaceHolder1_weekendsExtraChildPricePercentage").disabled = false;
            document.getElementById("ContentPlaceHolder1_ddl_weekendsxtraChildMealType").disabled = false;

        }
        if (chkStatus10.checked) {
            document.getElementById("ContentPlaceHolder1_weekendsExtraAdultPrice").disabled = true;
            document.getElementById("ContentPlaceHolder1_weekendsExtraAdultTax").disabled = true;
            document.getElementById("ContentPlaceHolder1_ddl_weekendsxtraAdultMealType").disabled = true;
        }
        if (!chkStatus10.checked) {
            document.getElementById("ContentPlaceHolder1_weekendsExtraAdultPrice").disabled = false;
            document.getElementById("ContentPlaceHolder1_weekendsExtraAdultTax").disabled = false;
            document.getElementById("ContentPlaceHolder1_ddl_weekendsxtraAdultMealType").disabled = false;
        }
        if (chkStatus3.checked) {
            document.getElementById("ContentPlaceHolder1_specialDayPrice").disabled = true;
            document.getElementById("ContentPlaceHolder1_specialDayPriceTax").disabled = true;

        }
        if (!chkStatus3.checked) {
            document.getElementById("ContentPlaceHolder1_specialDayPrice").disabled = false;
            document.getElementById("ContentPlaceHolder1_specialDayPriceTax").disabled = false;

        }
        if (chkStatus11.checked) {

            document.getElementById("ContentPlaceHolder1_specialDayExtraChildPrice").disabled = true;
            document.getElementById("ContentPlaceHolder1_specialDayExtraChildPricePercentage").disabled = true;
            document.getElementById("ContentPlaceHolder1_ddl_specialDayxtraChildMealType").disabled = true;

        }
        if (!chkStatus11.checked) {

            document.getElementById("ContentPlaceHolder1_specialDayExtraChildPrice").disabled = false;
            document.getElementById("ContentPlaceHolder1_specialDayExtraChildPricePercentage").disabled = false;
            document.getElementById("ContentPlaceHolder1_ddl_specialDayxtraChildMealType").disabled = false;

        }
        if (chkStatus12.checked) {
            document.getElementById("ContentPlaceHolder1_specialDayExtraAdultPrice").disabled = true;
            document.getElementById("ContentPlaceHolder1_specialDayExtraAdultTax").disabled = true;
            document.getElementById("ContentPlaceHolder1_ddl_specialDayxtraAdultMealType").disabled = true;
        }
        if (!chkStatus12.checked) {
            document.getElementById("ContentPlaceHolder1_specialDayExtraAdultPrice").disabled = false;
            document.getElementById("ContentPlaceHolder1_specialDayExtraAdultTax").disabled = false;
            document.getElementById("ContentPlaceHolder1_ddl_specialDayxtraAdultMealType").disabled = false;
        }
        if (chkStatus4.checked) {
            document.getElementById("ContentPlaceHolder1_normalPrice").disabled = true;
            document.getElementById("ContentPlaceHolder1_normalPriceTax").disabled = true;
            //document.getElementById("ContentPlaceHolder1_normalExtraChildPrice").disabled = true;
            //document.getElementById("ContentPlaceHolder1_normalExtraChildPricePercentage").disabled = true;
            //document.getElementById("ContentPlaceHolder1_ddl_normalxtraChildMealType").disabled = true;
            //document.getElementById("ContentPlaceHolder1_normalExtraAdultPrice").disabled = true;
            //document.getElementById("ContentPlaceHolder1_normalExtraAdultTax").disabled = true;
            //document.getElementById("ContentPlaceHolder1_ddl_normalxtraAdultMealType").disabled = true;
        }
        if (!chkStatus4.checked) {
            document.getElementById("ContentPlaceHolder1_normalPrice").disabled = false;
            document.getElementById("ContentPlaceHolder1_normalPriceTax").disabled = false;
            //document.getElementById("ContentPlaceHolder1_normalExtraChildPrice").disabled = false;
            //document.getElementById("ContentPlaceHolder1_normalExtraChildPricePercentage").disabled = false;
            //document.getElementById("ContentPlaceHolder1_ddl_normalxtraChildMealType").disabled = false;
            //document.getElementById("ContentPlaceHolder1_normalExtraAdultPrice").disabled = false;
            //document.getElementById("ContentPlaceHolder1_normalExtraAdultTax").disabled = false;
            //document.getElementById("ContentPlaceHolder1_ddl_normalxtraAdultMealType").disabled = false;
        }
        if (chkStatus5.checked) {
            document.getElementById("ContentPlaceHolder1_normalExtraChildPrice").disabled = true;
            document.getElementById("ContentPlaceHolder1_normalExtraChildPricePercentage").disabled = true;
            document.getElementById("ContentPlaceHolder1_ddl_normalxtraChildMealType").disabled = true;
            
        }
        if (!chkStatus5.checked) {
            document.getElementById("ContentPlaceHolder1_normalExtraChildPrice").disabled = false;
            document.getElementById("ContentPlaceHolder1_normalExtraChildPricePercentage").disabled = false;
            document.getElementById("ContentPlaceHolder1_ddl_normalxtraChildMealType").disabled = false;
           
        }
        if (chkStatus6.checked) {
            document.getElementById("ContentPlaceHolder1_normalExtraAdultPrice").disabled = true;
            document.getElementById("ContentPlaceHolder1_normalExtraAdultTax").disabled = true;
            document.getElementById("ContentPlaceHolder1_ddl_normalxtraAdultMealType").disabled = true;
        }
        if (!chkStatus6.checked) {
            document.getElementById("ContentPlaceHolder1_normalExtraAdultPrice").disabled = false;
            document.getElementById("ContentPlaceHolder1_normalExtraAdultTax").disabled = false;
            document.getElementById("ContentPlaceHolder1_ddl_normalxtraAdultMealType").disabled = false;
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>Dashboard
           
            <small>Control panel</small>        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Dashboard</li>
        </ol>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-sm-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Create Package</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group">
                            <div class="col-xs-4">
                                <span>Select Hotel</span>
                                <asp:DropDownList ID="ddl_hotel" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            <div class="col-xs-4">
                                <span>Select Hotel Room</span>
                                <asp:DropDownList ID="ddl_roomType" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            <div class="col-xs-4">
                                <span>Select Hotel Meal Plan</span>
                                <asp:DropDownList ID="ddl_mealType" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            <br />
                            <br />
                        </div>
                        <div class="form-group">
                            <div class="col-xs-4">
                                <span>Start Date</span>
                                <asp:TextBox ID="txt_startDate" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-xs-4">
                                <span>End Date</span>
                                <asp:TextBox ID="txt_endDate" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-xs-4">
                                <span>Default No of Member </span>
                                <asp:TextBox ID="txt_noofperson" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
                            </div>
                            <br />
                            <br />
                        </div>

                        <div class="form-group">
                            <div class="col-xs-4">
                                <span>No of Days</span>
                                <asp:TextBox ID="txt_day" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-xs-4">
                                <span>No of Nights</span>
                                <asp:TextBox ID="txt_night" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-xs-4">    
                            <span>   </span>
                                <asp:CheckBox ID="CheckBox2" runat="server" Text="Split Price according to days"  onchange="validate();"/> 
                                <br />
                                
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            
            
              <div class="col-sm-12" id="weekdays">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Family Price (Weekdays)</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group">  <div class="row">
                            <div class="col-xs-2">
                            <span>Price for Couple</span>
                            </div>
                            <div class="col-xs-2">
                                <asp:CheckBox ID="CheckBox1" runat="server" Text="Price On Request" onchange="priceonRequest();" />
                            </div>

                            <div class="col-xs-3">
                                <asp:TextBox ID="weekdaysPrice" Text="0" CssClass="form-control" min="0" runat="server" placeholder="price"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator25" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="weekdaysPrice" />
                            </div>
                            <div class="col-xs-2">
                                <asp:TextBox ID="weekdaysPriceTax" Text="0" CssClass="form-control" min="0" runat="server"  placeholder="Extra Percentage Tax"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator24" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="weekdaysPriceTax" />
                            </div>
                            <div class="col-xs-3">
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                            
                           </div> 
                        </div>
                        
                        <div class="form-group">   <div class="row">
                             <div class="col-xs-2">
                            <span>Extra Price for Child</span>
                            </div>
                             <div class="col-xs-2">
                                <asp:CheckBox ID="weekdayspriceonrequestchild" runat="server" Text="Price On Request" onchange="priceonRequest();" />
                            </div>
                            <div class="col-xs-3">
                                <asp:TextBox ID="weekdaysExtraChildPrice" Text="0" CssClass="form-control" min="0" runat="server" placeholder="Extra Child"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator23" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="weekdaysExtraChildPrice" />
                            </div>
                            <div class="col-xs-2">
                               <asp:TextBox ID="weekdaysExtraChildPricePercentage" Text="0" CssClass="form-control" min="0" runat="server" placeholder="Extra percentage"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator22" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="weekdaysExtraChildPricePercentage" />
                            </div>
                            <div class="col-xs-3">
                                <asp:DropDownList ID="ddl_weekdaysxtraChildMealType" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>    </div>
                        </div>   
                        
                        <div class="form-group">     <div class="row">
                            <div class="col-xs-2">
                                <span>Extra Adult Price</span>
                            </div>
                             <div class="col-xs-2">
                                <asp:CheckBox ID="weekdayspriceonrequestadult" runat="server" Text="Price On Request" onchange="priceonRequest();" />
                            </div>
                            <div class="col-xs-3">
                                <asp:TextBox ID="weekdaysExtraAdultPrice" Text="0" CssClass="form-control" min="0" runat="server" placeholder="price"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator21" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="weekdaysExtraAdultPrice" />
                            </div>
                            <div class="col-xs-2">
                               <asp:TextBox ID="weekdaysExtraAdultTax" Text="0" CssClass="form-control" min="0" runat="server"  placeholder="Extra Percentage Tax"></asp:TextBox>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator20" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="weekdaysExtraAdultTax" />
                            </div>
                            <div class="col-xs-3">
                                <asp:DropDownList ID="ddl_weekdaysxtraAdultMealType" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                                </div>
                            
                        </div>
                        

                    </div>
                </div>
            </div>       
            
                <div class="col-sm-12" id="weekdends">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Family Price (Weekends)</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group"> <div class="row">
                            <div class="col-xs-2">
                        <span>Price for Couple</span>
                        </div>
                            <div class="col-xs-2">
                                <asp:CheckBox ID="weekendsCheckBox1" runat="server" Text="Price On Request" onchange="priceonRequest();" />
                            </div>

                            <div class="col-xs-3">
                                <asp:TextBox ID="weekendsPrice" Text="0" min="0" CssClass="form-control" runat="server"  placeholder="price"></asp:TextBox>
                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator19" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="weekendsPrice" />
                            </div>
                            <div class="col-xs-2">
                                <asp:TextBox min="0" Text="0" ID="weekendsPriceTax" CssClass="form-control" runat="server"  placeholder="Extra Percentage Tax"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator18" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="weekendsPriceTax" />
                            </div>
                            <div class="col-xs-3">
                                
                            </div>
                            </div>
                            
                        </div>
                        
                        <div class="form-group">   <div class="row">
                             <div class="col-xs-2">
                            <span>Extra Price for Child</span>
                            </div>
                             <div class="col-xs-2">
                                <asp:CheckBox ID="weekendspriceonrequestchild" runat="server" Text="Price On Request" onchange="priceonRequest();" />
                            </div>
                            <div class="col-xs-3">
                               <asp:TextBox min="0" Text="0" ID="weekendsExtraChildPrice" CssClass="form-control" runat="server"  placeholder="Extra Child"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="weekendsExtraChildPrice" />
                            </div>
                            <div class="col-xs-2">
                               <asp:TextBox  min="0" Text="0" ID="weekendsExtraChildPricePercentage" CssClass="form-control" runat="server" placeholder="Extra percentage"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator16" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="weekendsExtraChildPricePercentage" />
                            </div>
                            <div class="col-xs-3">
                                <asp:DropDownList ID="ddl_weekendsxtraChildMealType" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            </div>
                        </div>   
                       
                        <div class="form-group">   <div class="row">
                            <div class="col-xs-2">
                                <span>Extra Adult Price</span>
                            </div>
                             <div class="col-xs-2">
                                <asp:CheckBox ID="weekendspriceonrequestadult" runat="server" Text="Price On Request" onchange="priceonRequest();" />
                            </div>
                            <div class="col-xs-3">
                                <asp:TextBox min="0" Text="0" ID="weekendsExtraAdultPrice" CssClass="form-control" runat="server"  placeholder="price"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="weekendsExtraAdultPrice" />
                            </div>
                            <div class="col-xs-2">
                               <asp:TextBox min="0" Text="0" ID="weekendsExtraAdultTax" CssClass="form-control" runat="server"  placeholder="Extra Percentage Tax"></asp:TextBox>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="weekendsExtraAdultTax" />
                            </div>
                            <div class="col-xs-3">
                                <asp:DropDownList ID="ddl_weekendsxtraAdultMealType" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            
                            </div>
                        </div>
                        

                    </div>
                </div>
            </div>       
                <div class="col-sm-12" id="special">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Family Price (Special Days)</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body"> 
                        <div class="form-group">
                         <div class="row">
                            <div class="col-xs-2">
                        <span>Price for Couple</span>
                        </div>
                            <div class="col-xs-2">
                                <asp:CheckBox ID="specialDayCheckBox1" runat="server" Text="Price On Request" onchange="priceonRequest();" />
                            </div>

                            <div class="col-xs-3">
                                <asp:TextBox  min="0" Text="0" ID="specialDayPrice" CssClass="form-control" runat="server"  placeholder="price"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="specialDayPrice" />
                            </div>
                            <div class="col-xs-2">
                                <asp:TextBox min="0" Text="0" ID="specialDayPriceTax" CssClass="form-control" runat="server"  placeholder="Extra Percentage Tax"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="specialDayPriceTax" />
                            </div>
                            <div class="col-xs-3">
                                
                            </div>
                        </div>
                        </div>
                        <div class="form-group">   <div class="row">
                             <div class="col-xs-2">
                            <span>Extra Price for Child</span>
                            </div>
                             <div class="col-xs-2">
                                <asp:CheckBox ID="specialpriceonrequestchild" runat="server" Text="Price On Request" onchange="priceonRequest();" />
                            </div>
                            <div class="col-xs-3">
                               <asp:TextBox min="0" Text="0" ID="specialDayExtraChildPrice" CssClass="form-control" runat="server"  placeholder="Extra Child"></asp:TextBox>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="specialDayExtraChildPrice" />
                            </div>
                            <div class="col-xs-2">
                                <asp:TextBox min="0" Text="0" ID="specialDayExtraChildPricePercentage" CssClass="form-control" runat="server"  placeholder="Extra percentage"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="specialDayExtraChildPricePercentage" />
                            </div>
                            <div class="col-xs-3">
                                <asp:DropDownList ID="ddl_specialDayxtraChildMealType" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            </div>
                        </div>   
                        
                        <div class="form-group">    <div class="row">
                            <div class="col-xs-2">
                                <span>Extra Adult Price</span>
                            </div>
                             <div class="col-xs-2">
                                <asp:CheckBox ID="specialpriceonrequestadult" runat="server" Text="Price On Request" onchange="priceonRequest();" />
                            </div>
                            <div class="col-xs-3">
                                <asp:TextBox min="0" Text="0" ID="specialDayExtraAdultPrice" CssClass="form-control" runat="server"  placeholder="price"></asp:TextBox>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="specialDayExtraAdultPrice" />
                            </div>
                            <div class="col-xs-2">
                               <asp:TextBox min="0" Text="0" ID="specialDayExtraAdultTax" CssClass="form-control" runat="server" placeholder="Extra Percentage Tax"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="specialDayExtraAdultTax" />
                            </div>
                            <div class="col-xs-3">
                                 <asp:DropDownList ID="ddl_specialDayxtraAdultMealType" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            
                            
                        </div>
                         </div>

                   </div>
                </div>
            </div>          
                <div class="col-sm-12" id="normal">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Family Price</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group">    <div class="row">
                            <div class="col-xs-2">
                        <span>Price for Couple</span>
                        </div>
                            <div class="col-xs-2">
                                <asp:CheckBox ID="normalCheckBox1" runat="server" Text="Price On Request" onchange="priceonRequest();" />
                            </div>

                            <div class="col-xs-3">
                                <asp:TextBox min="0" Text="0" ID="normalPrice" CssClass="form-control" runat="server" placeholder="price"></asp:TextBox>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="normalPrice" />
                            </div>
                            <div class="col-xs-2">
                                <asp:TextBox min="0" Text="0" ID="normalPriceTax" CssClass="form-control" runat="server"  placeholder="Extra Percentage Tax"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="normalPriceTax" />
                            </div>
                            <div class="col-xs-3">
                                  
                            </div>
                            
                           </div> 
                        </div>
                        
                        <div class="form-group">
                        <div class="row">
                             <div class="col-xs-2">
                            <span>Extra Price for Child</span>
                            </div>
                             <div class="col-xs-2">
                                <asp:CheckBox ID="normalpriceonrequestchild" runat="server" Text="Price On Request" onchange="priceonRequest();" />
                            </div>
                            <div class="col-xs-3">
                                <asp:TextBox min="0" Text="0" ID="normalExtraChildPrice" CssClass="form-control" runat="server"  placeholder="Extra Child"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="normalExtraChildPrice" />
                            </div>
                            <div class="col-xs-2">
                                <asp:TextBox min="0" Text="0" ID="normalExtraChildPricePercentage" CssClass="form-control" runat="server"  placeholder="Extra percentage"></asp:TextBox>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="normalExtraChildPricePercentage" />
                            </div>
                            <div class="col-xs-3">
                                <asp:DropDownList ID="ddl_normalxtraChildMealType" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            </div>
                        </div>   
                       
                        <div class="form-group">    <div class="row">
                            <div class="col-xs-2">
                                <span>Extra Adult Price</span>
                            </div>
                             <div class="col-xs-2">
                                <asp:CheckBox ID="normalpriceonrequestadult" runat="server" Text="Price On Request" onchange="priceonRequest();" />
                            </div>
                            <div class="col-xs-3">
                                <asp:TextBox min="0" Text="0" ID="normalExtraAdultPrice" CssClass="form-control" runat="server"  placeholder="price"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="normalExtraAdultPrice" />
                            </div>
                            <div class="col-xs-2">
                                <asp:TextBox min="0" Text="0" ID="normalExtraAdultTax" CssClass="form-control" runat="server" placeholder="Extra Percentage Tax"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Incorrect Numer."
                                          ControlToValidate="normalExtraAdultTax" />
                            </div>
                            <div class="col-xs-3">
                                <asp:DropDownList ID="ddl_normalxtraAdultMealType" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            
                             </div>
                        </div>
                       
                    </div>
                </div>
            </div>       
            
            <div class="col-sm-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Single Person Person</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group">
                            <div class="col-xs-2">
                                <asp:CheckBox ID="CheckBox3" runat="server" Text="Price On Request" />
                            </div>

                            <div class="col-xs-2">
                                <asp:TextBox min="0" Text="0" ID="spPrice" CssClass="form-control" runat="server" placeholder="price"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="Regex1" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Please enter valid integer or decimal number with 2 decimal places."
                                          ControlToValidate="spPrice" />
                            </div>
                            <div class="col-xs-2">
                                <asp:TextBox min="0" Text="0" ID="spPriceTax" CssClass="form-control" runat="server" placeholder="Extra Percentage Tax"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Please enter valid integer or decimal number with 2 decimal places."
                                          ControlToValidate="spPriceTax" />
                            </div>
                           
                           
                            <div class="col-xs-2">
                                <asp:DropDownList ID="ddl_spMealType" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <br />
                        <br />
                        

                    </div>
                </div>
            </div>
             <div class="col-sm-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Inclusion</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group">                                        
                            
                            <div class="col-xs-12">
                                <asp:TextBox ID="txt_inclusion" CssClass="form-control" runat="server" TextMode="MultiLine" placeholder="Extra Percentage Tax"></asp:TextBox>
                            </div>
                             
                             <div class="col-xs-12">
                             <h2>Description</h2>
                             <br />
                              <CKEditor:CKEditorControl ID="CKEditor1" BasePath="ckeditor" runat="server" UIColor="#BFEE62" Language="eng" EnterMode="BR" Height="400px">

                              </CKEditor:CKEditorControl>
                             </div>
                            <div class="col-xs-4">
                            <br />
                            <br />
                                <asp:Button ID="Button1" runat="server" Text="Create Package" OnClick="Button1_OnClick" />
                            </div>
                        </div>
                        <br />
                        <br />
                        

                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
