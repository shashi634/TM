<%@ Page Title="" Language="C#" MasterPageFile="~/p/admin.Master" AutoEventWireup="true" CodeBehind="organization.aspx.cs" Inherits="ErpNBFC.p.Organization" %>

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
                <asp:Panel ID="Panel2" runat="server">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Organization Settings</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">

                            <div class="form-group">
                                <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Organization Name"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Organization Head name"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="Organization PAN"></asp:TextBox>
                            </div>
                        <div class="form-group">
                                <asp:TextBox ID="TextBox4" runat="server" class="form-control" placeholder="Organization Registration No."></asp:TextBox>
                            </div>
                        <div class="form-group">
                                <asp:TextBox ID="TextBox5" runat="server" class="form-control" placeholder="Organization TAN"></asp:TextBox>
                            </div>
                        <div class="form-group">
                                <asp:TextBox ID="TextBox6" runat="server" class="form-control" placeholder="Organization Service Tax No."></asp:TextBox>
                            </div>
                        <div class="form-group">
                                <asp:TextBox ID="TextBox7" runat="server" TextMode="MultiLine" class="form-control" placeholder="Organization Address"></asp:TextBox>
                            </div>
                        <div class="form-group">
                                <asp:TextBox ID="TextBox8" runat="server" class="form-control" placeholder="City"></asp:TextBox>
                            </div>
                         <div class="form-group">
                                <asp:DropDownList class="form-control"  ID="State" runat="server">
                                        <asp:ListItem>Andaman and Nicobar Islands</asp:ListItem>
                                        <asp:ListItem>Andhra Pradesh</asp:ListItem>
                                        <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                                        <asp:ListItem>Assam</asp:ListItem>
                                        <asp:ListItem>Bihar</asp:ListItem>
                                        <asp:ListItem>Chandigarh</asp:ListItem>
                                        <asp:ListItem>Chattisgarh</asp:ListItem>
                                        <asp:ListItem>Dadra and Nagar Haveli</asp:ListItem>
                                        <asp:ListItem>Daman and Diu</asp:ListItem>
                                        <asp:ListItem>Delhi</asp:ListItem>
                                        <asp:ListItem>Goa</asp:ListItem>
                                        <asp:ListItem>Gujarat</asp:ListItem>
                                        <asp:ListItem>Haryana</asp:ListItem>
                                        <asp:ListItem>Himachal Pradesh</asp:ListItem>
                                        <asp:ListItem>Jammu and Kashmir</asp:ListItem>
                                        <asp:ListItem>Jharkhand</asp:ListItem>
                                        <asp:ListItem>Karnataka</asp:ListItem>
                                        <asp:ListItem>Kerala</asp:ListItem>
                                        <asp:ListItem>Lakshadweep</asp:ListItem>
                                        <asp:ListItem>Madhya Pradesh</asp:ListItem>
                                        <asp:ListItem>Maharashtra</asp:ListItem>
                                        <asp:ListItem>Manipur</asp:ListItem>
                                        <asp:ListItem>Meghalaya</asp:ListItem>
                                        <asp:ListItem>Mizoram</asp:ListItem>
                                        <asp:ListItem>Nagaland</asp:ListItem>
                                        <asp:ListItem>Orissa</asp:ListItem>
                                        <asp:ListItem>Pondicherry</asp:ListItem>
                                        <asp:ListItem>Punjab</asp:ListItem>
                                        <asp:ListItem>Rajasthan</asp:ListItem>
                                        <asp:ListItem>Sikkim</asp:ListItem>
                                        <asp:ListItem>Tamil Nadu</asp:ListItem>
                                        <asp:ListItem>Tripura</asp:ListItem>
                                        <asp:ListItem>Uttarakhand</asp:ListItem>
                                        <asp:ListItem>Uttaranchal</asp:ListItem>
                                        <asp:ListItem>Uttar Pradesh</asp:ListItem>
                                        <asp:ListItem>West Bengal</asp:ListItem>
                                    </asp:DropDownList>
                            </div>
                         <div class="form-group">
                             <asp:Button ID="Button1" CssClass="btn-default" OnClick="Button1_Click" runat="server" Text="Add Information" />
                            </div>
                        
                    </div>
                    </div>
                    </asp:Panel>
        </div>

        
            <div class="col-sm-6">
                <asp:Panel ID="Panel1" runat="server">
                <div class="box box-danger">
                    <div class="box-header with-border">
                        <h3 class="box-title">Organization Details</h3>
                        <span class="label label-danger pull-right"><i class="fa fa-eye"></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                         <div class="form-group">
                             <div class="col-xs-6">Organnization Name:</div>
                              <div class="col-xs-6"><asp:Label ID="Label1" runat="server" Text="Not Set"></asp:Label></div>
                             
                            </div>
                        <div class="form-group">
                            <div class="col-xs-6">Organnization Head:</div>
                            <div class="col-xs-6">
                                 <asp:Label ID="Label2" runat="server" Text="Not Set"></asp:Label>
                            </div>
                            
                            </div>
                        <div class="form-group">
                            <div class="col-xs-6">Organnization PAN:</div>
                            <div class="col-xs-6">
                                 <asp:Label ID="Label3" runat="server" Text="Not Set"></asp:Label>
                            </div>
                             
                            </div>
                        <div class="form-group">
                             <div class="col-xs-6">Organization Registration No.:</div>
                            <div class="col-xs-6">
                                 <asp:Label ID="Label4" runat="server" Text="Not Set"></asp:Label>
                            </div>
                             
                            </div>
                        <div class="form-group">
                             <div class="col-xs-6">Organization TAN :</div>
                            <div class="col-xs-6">
                                 <asp:Label ID="Label5" runat="server" Text="Not set"></asp:Label>
                            </div>
                             
                            </div>
                        <div class="form-group">
                            <div class="col-xs-6">Organization Service Tax No.: </div>
                            <div class="col-xs-6">
                                 <asp:Label ID="Label6" runat="server" Text="Not Set"></asp:Label>
                            </div>
                             
                            </div>
                        <div class="form-group">
                            <div class="col-xs-6">Organization Address : </div>
                            <div class="col-xs-6">
                                 <asp:Label ID="Label7" runat="server" Text="Not Set"></asp:Label>
                            </div>
                             
                            </div>
                        <div class="form-group">
                            <div class="col-xs-6">Organization City : </div>
                            <div class="col-xs-6">
                                 <asp:Label ID="Label8" runat="server" Text="Not set"></asp:Label>
                            </div>
                             
                            </div>
                        <div class="form-group">
                            <div class="col-xs-6">Organization State : </div>
                            <div class="col-xs-6">
                                 <asp:Label ID="Label9" runat="server" Text="Not Set"></asp:Label>
                            </div>
                             
                            </div>
                        <div class="form-group">
                            <div class="col-xs-6">Organization Id : </div>
                            <div class="col-xs-6">
                                 <asp:Label ID="Label10" runat="server" Text="Not Set"></asp:Label>
                            </div>
                             
                            </div>
                        
                        <div class="form-group">
                            <div class="col-xs-12">
                            <asp:Button ID="btnUpdate" CssClass="btn btn-group" OnClientClick="overlay" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                            </div>
                            </div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
                    </asp:Panel>
            </div>
        </div>
    </section>
</asp:Content>
