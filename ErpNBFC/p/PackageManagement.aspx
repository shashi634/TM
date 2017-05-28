<%@ Page Title="" Language="C#" MasterPageFile="~/p/admin.Master" AutoEventWireup="true" CodeBehind="PackageManagement.aspx.cs" Inherits="ErpNBFC.p.PackageManagement" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <style>
        [ng\:cloak], [ng-cloak], [data-ng-cloak], [x-ng-cloak], .ng-cloak, .x- ng-cloak {
            display: none !important;
        }
    </style>   
    <link href="../static/plugins/angular-block-ui.css" rel="stylesheet" />
    <script src="../angularjs/adminapp.js"></script>
    <script src="../angularjs/XSS.js"></script>
    <script src="../angularjs/block-ui.js"></script>
    <script src="../angularjs/controller/AdminController.js"></script>
    <script src="//cdn.ckeditor.com/4.5.6/standard/ckeditor.js"></script>
    <script src="../angularjs/directive/ckeditor.js"></script>
   
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div ng-app="app">
        <div ng-controller="AdminController" ng-cloak flow-prevent-drop>
            <section class="content-header">
                <h1>Dashboard
           
            <small>Control panel</small>
                    <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                    <li class="active">Dashboard</li>
                </ol>
            </section>
            <div ng-if="false">
                <div class="block-ui-overlay"></div>
                <div class="block-ui-message-container">
                    <div class="block-ui-message"><i class="fa fa-cog fa-spin fa-5x"></i></div>
                </div>
            </div>
            <section class="content">
                <div class="row">  
                <%--<div class="col-sm-12">
                    <div  class="box box-danger">
                        <div class="box-header with-border">
                           <h3 class="box-title">{{Error}}</h3>
                                <span class="label label-primary pull-right"><i class="fa fa-ambulance"></i></span> 
                        </div>
                    </div>
                </div>--%>
                <%--<div class="col-sm-12">
                    <div  class="box box-success">
                        <div class="box-header with-border">
                           <h3 class="box-title">{{Success}}</h3>
                                <span class="label label-primary pull-right"><i class="fa fa-eyedropper "></i></span> 
                        </div>
                    </div>
                </div>--%>
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
                                        <asp:DropDownList ID="ddl_hotel" ng-model="selectedHotel" runat="server" CssClass="form-control">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-xs-4">
                                          <span>Start Date</span>
                                        <asp:TextBox ID="txt_startDate" ng-model="StartDate" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-4">
                                        <span>End Date</span>
                                        <asp:TextBox ID="txt_endDate" ng-model="EndDate" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                    </div>
                                    <br />
                                    <br />
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-4">
                                        <span>No of Days</span>
                                        <asp:TextBox ID="txt_day" CssClass="form-control" ng-model="NoOfDays" TextMode="Number" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-4">
                                         <span>No of Nights</span>
                                        <asp:TextBox ID="txt_night" CssClass="form-control" ng-model="NoOfNights" TextMode="Number" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-4">
                                        <span>Default No of Member </span>
                                        <asp:TextBox ID="txt_noofperson" ng-model="DefaultMember" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
                                    </div>
                                    <br />
                                    <br />
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-4">
                                        
                                    </div>
                                    <div class="col-xs-4">
                                       
                                    </div>
                                    <div class="col-xs-4">
                                       

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
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-xs-2">
                                            <span>Select Meal Type</span>
                                            <div>
                                                <select ng-model="MealType" id="hotelMealTypeDropdown" class="form-control">
                                                   
                                                    <option ng-repeat="x in Meals" value="{{x}}"
                                                        >{{x.MealType}}
                                                    </option>
                                                </select>
                                               
                                            </div>
                                        </div>
                                        <div class="col-xs-2">
                                            <span>Select Room Type</span>
                                            <div>
                                                 <select ng-model="RoomType" id="hotelRoomTypeDropdown"  class="form-control">
                                                   
                                                    <option ng-repeat="x in Rooms" value="{{x}}"
                                                        >{{x.RoomType}}
                                                    </option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-xs-2">
                                            <span>Room Price</span>
                                            <div>
                                                <asp:TextBox min="0" Text="0" ID="normalPrice" ng-model="NormalPrice" CssClass="form-control" runat="server" placeholder="price"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                                    ErrorMessage="Incorrect Numer."
                                                    ControlToValidate="normalPrice" />
                                            </div>
                                        </div>
                                        <div class="col-xs-2">
                                            <span>Price Type</span>
                                            <select ng-model="NormalPriceType" id="PriceTypeDropdown"  class="form-control">
                                                    <option ng-repeat="x in PriceTypes" value="{{x}}"
                                                        >{{x}}
                                                    </option>
                                                </select>
                                        </div>
                                        <div class="col-xs-2">
                                            <span>Extra Child Price</span>
                                            <div>
                                                <asp:TextBox min="0" Text="0" ng-model="ExtraChildPrice" ID="normalECP" CssClass="form-control" runat="server" placeholder="Extra Percentage Tax"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                                    ErrorMessage="Incorrect Numer."
                                                    ControlToValidate="normalECP" />
                                            </div>
                                        </div>
                                        <div class="col-xs-2">
                                            <span>Price Type of Extra Child</span>
                                            <div>
                                                 <select ng-model="ExtraChildPriceType" id="PriceTypeExtraChildDropdown"  class="form-control">
                                                    <option ng-repeat="x in PriceTypeForExtraChild" value="{{x}}"
                                                        >{{x}}
                                                    </option>
                                                </select>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-xs-2">
                                        </div>

                                        <div class="col-xs-2">
                                            <span>Extra Price for Adult</span><div>
                                                <asp:TextBox min="0" Text="0" ng-model="ExtraAdultPrice" ID="normalExtraChildPrice" CssClass="form-control" runat="server" placeholder="Extra Child"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                                    ErrorMessage="Incorrect Numer."
                                                    ControlToValidate="normalExtraChildPrice" />
                                            </div>
                                        </div>
                                        <div class="col-xs-2">
                                            <span>Price Type of Extra Adult</span>
                                            <div>
                                               <select ng-model="ExtraAdultPriceType" id="PriceTypeExtraAdultDropdown"  class="form-control">
                                                    <option ng-repeat="x in PriceTypeForExtraAdult" value="{{x}}"
                                                        >{{x}}
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-2">
                                            <span>TAC</span>
                                            <div>
                                                <asp:TextBox min="0" ng-model="Tac" Text="0" ID="TextBox1" CssClass="form-control" runat="server" placeholder="Extra Child"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                                    ErrorMessage="Incorrect Numer."
                                                    ControlToValidate="normalExtraChildPrice" />
                                            </div>
                                        </div>
                                        <div class="col-xs-2">
                                            <span>TAC Type</span>
                                            <div>
                                               <select ng-model="TacType" id="PriceTypeTac"  class="form-control">
                                                    <option ng-repeat="x in PriceTypeForTac" value="{{x}}"
                                                        >{{x}}
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-2">
                                            <span>Add Plan</span>
                                            <div>
                                                <input id="mealAdd" type="button" value="Click To Add" class="btn btn-flat" ng-click="SetValue()" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="row">
                                    <div class="col-xs-12">
                                        <table class="table">
                                            <tr>
                                                <th>Meal Type</th>
                                                <th>Room Type</th>
                                                <th>Price</th>
                                                <th>Extra Child Price</th>
                                                <th>Extra Adult Price</th>
                                                <th>TAC</th>
                                                <th></th>
                                            </tr>

                                            <tr ng-repeat="x in HotelPackageRoom">
                                             <td>{{x.MealType}}</td>
                                             <td>{{x.RoomType}}</td>
                                             <td>{{x.RoomPriceNormal}} {{x.RoomPriceNormalType}}</td>
                                             <td ng-if="x.ExtraChildPriceType=='Percentage'">{{x.ExtraChildPrice}}%</td>  
                                             <td ng-if="x.ExtraChildPriceType=='NETT'">{{x.ExtraChildPrice}} {{x.ExtraChildPriceType}}</td>    
                                             <td ng-if="x.ExtraChildPriceType=='2 Children Complementry'">{{x.ExtraChildPriceType}}</td>
                                             <td ng-if="x.ExtraAdultPriceType=='NETT'">{{x.ExtraAdultPrice}} {{x.ExtraAdultPriceType}}</td> 
                                             <td ng-if="x.ExtraAdultPriceType=='Percentage'">{{x.ExtraAdultPrice}}%</td>
                                             <td ng-if="x.TacType=='NETT Rate'">{{x.Tac}} {{x.TacType}}</td>  
                                             <td ng-if="x.TacType=='Percentage'">{{x.Tac}}%</td>
                                             <td><a ng-click="deleteData(x)"><span class="glyphicon glyphicon-trash"></span></a></td>
                                            </tr>
                                        </table>
                                        </div>
                                    </div>
                                </div>

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
                                        <asp:TextBox ID="txt_inclusion" ng-model="inclusion" CssClass="form-control" runat="server" TextMode="MultiLine" placeholder="Extra Percentage Tax"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-4">
                                        <br />
                                        <br />
                                        <input id="Button1" type="button" value="Create Package"  ng-click="addPackage()" />
                                    </div>
                                </div>
                                <br />
                                <br />


                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</asp:Content>
