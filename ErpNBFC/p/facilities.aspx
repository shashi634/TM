<%@ Page Title="Facilities | Travel Management" Language="C#" MasterPageFile="~/p/admin.Master" AutoEventWireup="true" CodeBehind="facilities.aspx.cs" Inherits="ErpNBFC.p.facilities" %>
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
                        <h3 class="box-title">List Facilities</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                            <div class="form-group">
                                <div class="col-xs-8">
                                     <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Facility"></asp:TextBox>
                                </div>
                                
                                <div class="col-xs-4">
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-flat" Text="List Facility" OnClick="Button1_Click" />
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-flat" Text="Update Facility" OnClick="Button2_Click" />
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
                        <h3 class="box-title">Listed Facilities</h3>
                        <span class="label label-danger pull-right"><i class="fa fa-eye"></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                         <div class="form-group">
                             <asp:GridView ID="hotelsTypes" AutoGenerateColumns="false" runat="server"
                                 onrowdeleting="hotelsTypes_RowDeleting"
                                 class="table table-condensed" RowStyle-BorderColor="White" 
                                 >
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate> Sr. No.</HeaderTemplate>
                                         <ItemTemplate>
                                             <%#Container.DataItemIndex+1 %>
                                             <asp:Label ID="h" runat="server" Visible="false" Text='<%#Eval("Id") %>'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                 </Columns>
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate> Facility</HeaderTemplate>
                                         <ItemTemplate>
                                             <%#Eval("Facility") %>
                                         </ItemTemplate>
                                         
                                     </asp:TemplateField>
                                 </Columns>
                                 
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate> </HeaderTemplate>
                                         <ItemTemplate>
                                            <a href='<%#"facilities.aspx?C="+DataBinder.Eval(Container.DataItem,"id") %>'><span class="glyphicon glyphicon-edit"></span></a>
                                            <asp:LinkButton ID="LinkButton2"   runat="server" CommandName="Delete" placeholder="Edit" OnClientClick="if (!confirm('Are you sure you want delete?')) return false;"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                             
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
