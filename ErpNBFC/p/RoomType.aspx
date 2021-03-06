﻿<%@ Page Title="Room Type : Travel Management" Language="C#" MasterPageFile="~/p/admin.Master" AutoEventWireup="true" CodeBehind="RoomType.aspx.cs" Inherits="ErpNBFC.p.RoomType" %>

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
                        <h3 class="box-title">List Room Type</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group">
                            <div class="col-xs-8">
                                <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Room Type"></asp:TextBox>
                            </div>

                            <div class="col-xs-4">
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-flat" Text="List Room Type" OnClick="Button1_Click" />
                                <asp:Button ID="Button2" runat="server" CssClass="btn btn-flat" Text="Update Room Type" OnClick="Button2_Click" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-12">
                                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                            </div>

                        </div>
                    </div>
                </div>
            </div>


            <div class="col-sm-6">
                <div class="box box-danger">
                    <div class="box-header with-border">
                        <h3 class="box-title">Listed Room Type</h3>
                        <span class="label label-danger pull-right"><i class="fa fa-eye"></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group">
                            <asp:GridView ID="hotelsTypes" AutoGenerateColumns="false" runat="server"
                                OnRowDeleting="hotelsTypes_RowDeleting"
                                class="table table-condensed" RowStyle-BorderColor="White">
                                <Columns>
                                    <asp:TemplateField HeaderStyle-BorderColor="White">
                                        <HeaderTemplate>Sr. No.</HeaderTemplate>
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                            <asp:Label ID="h" runat="server" Visible="false" Text='<%#Eval("publicId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <Columns>
                                    <asp:TemplateField HeaderStyle-BorderColor="White">
                                        <HeaderTemplate>Type</HeaderTemplate>
                                        <ItemTemplate>
                                            <%#Eval("Type") %>
                                        </ItemTemplate>
                                        
                                    </asp:TemplateField>
                                </Columns>

                                <Columns>
                                    <asp:TemplateField HeaderStyle-BorderColor="White">
                                        <HeaderTemplate></HeaderTemplate>
                                        <ItemTemplate>
                                            <a href='<%#"RoomType.aspx?C="+DataBinder.Eval(Container.DataItem,"publicid") %>'><span class="glyphicon glyphicon-edit"></span></a>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Delete" placeholder="Edit" OnClientClick="if (!confirm('Are you sure you want delete?')) return false;"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
        </div>
    </section>
</asp:Content>
