<%@ Page Title="" Language="C#" MasterPageFile="~/p/admin.Master" AutoEventWireup="true" CodeBehind="UserMessage.aspx.cs" Inherits="ErpNBFC.p.UserMessage" %>
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
                        <h3 class="box-title">List Location</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group">
                            <asp:label runat="server" ID="name" text=""></asp:label>
                        </div>
                        <div class="form-group">
                            <asp:label runat="server" ID="email" text=""></asp:label>
                        </div>
                        <div class="form-group">
                            <asp:label runat="server" ID="usermessage" text=""></asp:label>
                        </div>
                        <div class="form-group">
                            <asp:textbox runat="server" ID="adminmessage" CssClass="form-control" TextMode="MultiLine" placeholder="Your Reply"></asp:textbox>
                        </div>    
                          <div class="form-group">

                              <asp:button runat="server" text="Reply" CssClass="btn-primary" OnClick="OnClick"/>
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
                        <h3 class="box-title">Listed Location</h3>
                        <span class="label label-danger pull-right"><i class="fa fa-eye"></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group">
                            <asp:GridView ID="LocationTable" AutoGenerateColumns="false" runat="server"
                                 onrowdeleting="location_RowDeleting"
                                 class="table table-condensed" RowStyle-BorderColor="White" 
                                 >
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
                                         <HeaderTemplate> Name</HeaderTemplate>
                                         <ItemTemplate>
                                             <%#Eval("Name") %>
                                         </ItemTemplate>
                                         
                                     </asp:TemplateField>
                                 </Columns> 
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate> Email</HeaderTemplate>
                                         <ItemTemplate>
                                             <%#Eval("Email") %>
                                         </ItemTemplate>
                                         
                                     </asp:TemplateField>
                                 </Columns>
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate > MobileNo</HeaderTemplate>
                                         <ItemTemplate>
                                              <%#Eval("Mobile") %>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                 </Columns>
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate> </HeaderTemplate>
                                         <ItemTemplate>
                                             <a href='<%#"UserMessage.aspx?C="+DataBinder.Eval(Container.DataItem,"publicid") %>'><span class="glyphicon glyphicon-edit"></span></a>
                                            <asp:LinkButton ID="LinkButton2"  runat="server" CommandName="Delete" placeholder="Edit"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
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

