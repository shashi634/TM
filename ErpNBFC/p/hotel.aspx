<%@ Page Title="" Language="C#" MasterPageFile="~/p/admin.Master" AutoEventWireup="true" CodeBehind="hotel.aspx.cs" Inherits="ErpNBFC.p.Hotel" %>
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
                        <h3 class="box-title">List Hotel</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                            <div class="form-group">
                                <div class="col-xs-12">
                                     <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Hotel Name only"></asp:TextBox>

                                     </div>
                                
                                <div class="col-xs-6">
                                    <span>Hotel Type</span>
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col-xs-6">
                                     <span>Hotel City</span>
                                    <asp:DropDownList class="form-control" ID="DropDownList2" runat="server"></asp:DropDownList>
                                </div>
                               <div class="col-xs-12">
                                    <span>Address</span>
                                    <asp:TextBox ID="TextBox6" runat="server" TextMode="MultiLine" class="form-control" placeholder="Hotel Address"></asp:TextBox>
                               </div>
                            </div>
                            <div class="form-group">
                           
                                 <div class="col-xs-12">
                                    <br />
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-flat pull-right" Text="List Hotel" OnClick="Button1_Click" />
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
                        <h3 class="box-title">Listed Hotels</h3>
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
                                         <HeaderTemplate> Type</HeaderTemplate>
                                         <ItemTemplate>
                                            <a href="/p/hoteldetail.aspx?h=<%#Eval("publicId") %>"> <%#Eval("hotelName") %></a>
                                         </ItemTemplate>
                                        <%-- <EditItemTemplate>
                                             <asp:TextBox ID="txt_type" runat="server" Text='<%#Eval("HotelName") %>'></asp:TextBox>
                                         </EditItemTemplate>--%>
                                     </asp:TemplateField>
                                 </Columns>
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate > Created By</HeaderTemplate>
                                         <ItemTemplate>
                                              <%#Eval("Name") %>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                 </Columns>
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate> </HeaderTemplate>
                                         <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2"  runat="server" CommandName="Delete" placeholder="Edit"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                         </ItemTemplate>
                                         <%--<EditItemTemplate>
                                             <asp:LinkButton ID="btn_Update" runat="server" CommandName="Update" placeholder="Update"><span class="glyphicon glyphicon-ok"></span></asp:LinkButton>       
                                             <asp:LinkButton ID="btn_Cancel" runat="server" CommandName="Cancel" placeholder="Cencel"><span class="glyphicon glyphicon-remove"></span></asp:LinkButton>

                                         </EditItemTemplate>--%>
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
