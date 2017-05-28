<%@ Page Title="" Language="C#" MasterPageFile="~/p/admin.Master" AutoEventWireup="true" CodeBehind="TourPackages.aspx.cs" Inherits="ErpNBFC.p.TourPackages" %>

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
                        <h3 class="box-title">Created Packages</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:GridView ID="hotelspackage" AutoGenerateColumns="false" runat="server"
                                 
                                 class="table table-condensed" RowStyle-BorderColor="White" 
                                 >
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate> Sr. No.</HeaderTemplate>
                                         <ItemTemplate>
                                             <%#Container.DataItemIndex+1 %>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                 </Columns>
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate> Hotel</HeaderTemplate>
                                         <ItemTemplate>
                                            <a href="/p/updatepackage.aspx?h=<%#Eval("publicId") %>"> <%#Eval("Name") %></a>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                 </Columns>
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate > Location</HeaderTemplate>
                                         <ItemTemplate>
                                              <%#Eval("location") %>   
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                 </Columns>
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate > Start Date</HeaderTemplate>
                                         <ItemTemplate>
                                              <%# Eval("startdate", "{0:dd/MM/yyyy}") %>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                 </Columns>
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate > End Date</HeaderTemplate>
                                         <ItemTemplate>
                                              <%# Eval("enddate", "{0:dd/MM/yyyy}") %>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                 </Columns>
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate > Duration</HeaderTemplate>
                                         <ItemTemplate>
                                              <%#Eval("noofdays") %>    days and      <%#Eval("noofnight") %> night
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                 </Columns>
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate></HeaderTemplate>
                                         <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2"  runat="server" CommandName="Delete" placeholder="Edit"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                 </Columns>
                             </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
