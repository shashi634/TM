﻿<%@ Page Title="" Language="C#" MasterPageFile="~/p/admin.Master" AutoEventWireup="true" CodeBehind="Plan.aspx.cs" Inherits="ErpNBFC.p.Plan" %>
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
            <div class="col-sm-8">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Create Your Plan</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                            <div class="form-group">
                                <div class="col-xs-6">
                                     <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Plan Full Name"></asp:TextBox>
                                </div>
                                <div class="col-xs-4">
                                    <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Plan Short Name"></asp:TextBox>
                                </div>
                                <div class="col-xs-2">
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-flat" Text="Create Plan" />
                                </div>
                            </div>

                            <div class="form-group">
                                
                            </div>
                    </div>
                    </div>
        </div>

        
            <div class="col-sm-4">
                <div class="box box-danger">
                    <div class="box-header with-border">
                        <h3 class="box-title">Listed Plans</h3>
                        <span class="label label-danger pull-right"><i class="fa fa-eye"></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                         <div class="form-group">
                             <asp:Label ID="Label1" runat="server" Text="Currently No Plan"></asp:Label>
                         </div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
        </div>
    </section>
</asp:Content>
