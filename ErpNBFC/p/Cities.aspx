<%@ Page Title="" Language="C#" MasterPageFile="~/p/admin.Master" AutoEventWireup="true" CodeBehind="Cities.aspx.cs" Inherits="ErpNBFC.p.Cities" %>
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
            <div class="col-sm-6">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">List City</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                            <div class="form-group">
                                  <div class="col-xs-3">
                                      <asp:DropDownList ID="DropDownList1" runat="server" class="form-control">
                                          <asp:ListItem>India</asp:ListItem>
                                          <asp:ListItem>Signapor</asp:ListItem>
                                          <asp:ListItem>Nepal</asp:ListItem>
                                          <asp:ListItem>Shri Lanka</asp:ListItem>
                                          <asp:ListItem>Pakistan</asp:ListItem>
                                      </asp:DropDownList>
                                  </div>
                                <div class="col-xs-3">
                                     <asp:DropDownList ID="DropDownList2" runat="server" class="form-control">
                                          <asp:ListItem>Varanasi</asp:ListItem>
                                          <asp:ListItem>Delhi</asp:ListItem>
                                          <asp:ListItem>Mumbai</asp:ListItem>
                                          
                                      </asp:DropDownList>
                                </div>
                                
                                <div class="col-xs-3">
                                   <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="City Name"></asp:TextBox>

                                </div>
                                <div  class="col-xs-3">
                                   <asp:Button ID="Button1" runat="server" CssClass="btn btn-flat" Text="List City" />

                                </div>
                            </div>

                            <div class="form-group">
                                
                            </div>
                    </div>
                    </div>
        </div>

        
            <div class="col-sm-6">
                <div class="box box-danger">
                    <div class="box-header with-border">
                        <h3 class="box-title">Listed Cities</h3>
                        <span class="label label-danger pull-right"><i class="fa fa-eye"></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                         <div class="form-group">
                             <h2>Cities list will go here....</h2>
                         </div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
        </div>
    </section>
</asp:Content>
