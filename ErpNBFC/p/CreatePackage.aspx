<%@ Page Title="" Language="C#" MasterPageFile="~/p/admin.Master" AutoEventWireup="true" CodeBehind="CreatePackage.aspx.cs" Inherits="ErpNBFC.p.CreatePackage" %>
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
                                    <span>Select Hotel</span>
                                    <asp:dropdownlist ID="ddl_hotel" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddl_hotel_SelectedIndexChanged">
                                                               
                                    </asp:dropdownlist>
                                </div>
                                
                                <div class="col-xs-4">
                                <span>Start Date</span>
                                    <asp:TextBox ID="txt_startDate" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-xs-4">
                                <span>End Date</span>
                                <asp:TextBox ID="txt_endDate" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                </div>
                                <br />      <br />
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
                                    <span>Extra Adult</span>
                                    <asp:TextBox ID="txt_extraadult" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
                                </div>
                            </div>  
                            <div class="form-group">
                                           <div class="col-xs-4">
                                                      <span>Extra Child</span>
                                               <asp:TextBox ID="txt_extrachild" CssClass="form-control"  TextMode="Number" runat="server"></asp:TextBox>
                                           </div>
                                           <div class="col-xs-4">
                                           <span>TAC</span>
                                               <asp:TextBox ID="txt_tac" CssClass="form-control" runat="server"></asp:TextBox>
                                           </div>
                                        <div class="col-xs-4">
                                        <span>Default No of Member </span>
                                           <asp:TextBox ID="txt_noofperson" CssClass="form-control" runat="server"></asp:TextBox>
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
                                    <asp:Repeater ID="Repeater1" runat="server">
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
                                                <asp:TextBox ID="txtRoomPrice" CssClass="form-control" TextMode="Number" placeholder="Room Rate" runat="server" Text='<%#Bind("rate") %>'/>
                                                </div>   
                                                 <div class="col-xs-4">
                                                <asp:TextBox ID="txt_room_available" CssClass="form-control" TextMode="Number" placeholder="No of Room Available" Text='<%#Bind("roomnoavailable") %>' runat="server" />
                                                 </div>   
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                                
                                <div class="col-xs-3">
                                
                                </div>
                                           <div class="col-xs-3">
                                           <div class="text-right">
                                                <asp:Button ID="btn_create_page" CssClass="btn btn-default" runat="server" Text="Create Package" OnClick="btn_create_page_Click" />
                                            </div>
                                           </div>
                            </div>     
                            
                    </div>
                    </div>
        </div>
        
            
        </div>
    </section>
</asp:Content>
