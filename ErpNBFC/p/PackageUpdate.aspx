<%@ Page Title="" Language="C#" MasterPageFile="~/p/admin.Master" AutoEventWireup="true" CodeBehind="PackageUpdate.aspx.cs" Inherits="ErpNBFC.p.PackageUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>Dashboard
           
            <small>Control panel</small>
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
                                <span>Selected Hotel</span>
                                <h3>
                                    <asp:literal runat="server" id="ltr"></asp:literal>
                                </h3>
                            </div>

                            <div class="col-xs-4">
                                <span>Start Date</span>
                                <asp:textbox id="txt_startDate" cssclass="form-control" textmode="Date" runat="server"></asp:textbox>
                            </div>
                            <div class="col-xs-4">
                                <span>End Date</span>
                                <asp:textbox id="txt_endDate" cssclass="form-control" textmode="Date" runat="server"></asp:textbox>
                            </div>
                            <br />
                            <br />
                        </div>


                        <div class="form-group">
                            <div class="col-xs-4">
                                <span>No of Days</span>
                                <asp:textbox id="txt_day" cssclass="form-control" textmode="Number" runat="server"></asp:textbox>
                            </div>
                            <div class="col-xs-4">
                                <span>No of Nights</span>
                                <asp:textbox id="txt_night" cssclass="form-control" textmode="Number" runat="server"></asp:textbox>
                            </div>
                            <div class="col-xs-4">
                                <span>Extra Adult</span>
                                <asp:textbox id="txt_extraadult" cssclass="form-control" textmode="Number" runat="server"></asp:textbox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-4">
                                <span>Extra Child</span>
                                <asp:textbox id="txt_extrachild" cssclass="form-control" textmode="Number" runat="server"></asp:textbox>
                            </div>
                            <div class="col-xs-4">
                                <span>TAC</span>
                                <asp:textbox id="txt_tac" cssclass="form-control" runat="server"></asp:textbox>
                            </div>
                            <div class="col-xs-4">
                                <span>Default No of Member </span>
                                <asp:textbox id="txt_noofperson" cssclass="form-control" runat="server"></asp:textbox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Room Price</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group">
                            <div class="col-xs-6">
                                <asp:repeater id="Repeater1" runat="server">
                                        <HeaderTemplate>
                                        <table border="0"  class = "table">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                <div class="col-xs-4">
                                                <span><%#Eval("Type") %></span>
                                                    <asp:Label ID="roomtypeid" runat="server" Text='<%#Eval("Id") %>' Visible="false"></asp:Label>
                                                </div>
                                                <div class="col-xs-4">
                                                <asp:TextBox ID="txtRoomPrice" CssClass="form-control" TextMode="Number" placeholder="Room Rate" runat="server" />
                                                </div>   
                                                 <div class="col-xs-4">
                                                <asp:TextBox ID="txt_room_available" CssClass="form-control" TextMode="Number" placeholder="No of Room Available" runat="server" />
                                                 </div>   
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:repeater>
                            </div>

                            <div class="col-xs-3">
                            </div>
                            <div class="col-xs-3">
                                <div class="text-right">
                                    <asp:button id="btn_create_page" cssclass="btn btn-default" runat="server" text="Create Package" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


        </div>
    </section>
</asp:Content>
