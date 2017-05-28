<%@ Page Title="" Language="C#" MasterPageFile="~/p/admin.Master" AutoEventWireup="true" CodeBehind="MealPlan.aspx.cs" Inherits="ErpNBFC.p.MealPlan" %>

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
                        <h3 class="box-title">List Meal Plan</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group">
                            <div class="col-xs-8">
                                <asp:textbox id="TextBox1" runat="server" class="form-control" placeholder="Meal Plan"></asp:textbox>
                            </div>

                            <div class="col-xs-4">
                                <asp:button id="Button1" runat="server" cssclass="btn btn-flat" text="List Meal Plan" onclick="Button1_Click" />
                                <asp:button id="Button2" runat="server" cssclass="btn btn-flat" text="Update Meal Plan" onclick="Button2_Click" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-12">
                                <asp:label id="lblmsg" runat="server" text=""></asp:label>
                            </div>

                        </div>
                    </div>
                </div>
            </div>


            <div class="col-sm-6">
                <div class="box box-danger">
                    <div class="box-header with-border">
                        <h3 class="box-title">Listed Meal Plan</h3>
                        <span class="label label-danger pull-right"><i class="fa fa-eye"></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group">
                            <asp:gridview id="hotelsTypes" autogeneratecolumns="false" runat="server"
                                onrowdeleting="hotelsTypes_RowDeleting"
                                class="table table-condensed" rowstyle-bordercolor="White">
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate> Sr. No.</HeaderTemplate>
                                         <ItemTemplate>
                                             <%#Container.DataItemIndex+1 %>
                                             <asp:Label ID="h" runat="server" Visible="false" Text='<%#Eval("publicId") %>'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                 </Columns>
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate> Type</HeaderTemplate>
                                         <ItemTemplate>
                                             <%#Eval("Type") %>
                                         </ItemTemplate>
                                        
                                     </asp:TemplateField>
                                 </Columns>
                                 
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate> </HeaderTemplate>
                                         <ItemTemplate>
                                            <a href='<%#"MealPlan.aspx?C="+DataBinder.Eval(Container.DataItem,"publicid") %>'><span class="glyphicon glyphicon-edit"></span></a>
                                            <asp:LinkButton ID="LinkButton2"   runat="server" CommandName="Delete" placeholder="Delete" OnClientClick="if (!confirm('Are you sure you want delete?')) return false;"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                             
                                         </ItemTemplate>
                                         
                                     </asp:TemplateField>
                                 </Columns>
                             </asp:gridview>
                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
        </div>
    </section>
</asp:Content>
