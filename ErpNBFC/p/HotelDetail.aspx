<%@ Page Title="" Language="C#" MasterPageFile="~/p/admin.Master" AutoEventWireup="true" CodeBehind="HotelDetail.aspx.cs" Inherits="ErpNBFC.p.HotelDetail" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

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
                        <h3 class="box-title">Hotel Details</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                    <div class="form-group">
                    <div class="col-xs-12">
                        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                    </div>
                    </div>
                        <div class="form-group">
                            <div class="col-xs-8">
                                <asp:TextBox ID="txt_hotel_name" runat="server" class="form-control" placeholder="Hotel Name"></asp:TextBox>

                            </div>

                            <div class="col-xs-4">
                                <asp:DropDownList ID="hotel_type" class="form-control" runat="server"></asp:DropDownList>
                            </div>
                            <br />
                            <br />
                            <div class="col-xs-3">
                                <h4>Room Type</h4>
                                <asp:CheckBoxList ID="room_type" runat="server"></asp:CheckBoxList>
                            </div>
                            <div class="col-xs-3">
                                <h4>Meal Type</h4>
                                <asp:CheckBoxList ID="meal_type" runat="server"></asp:CheckBoxList>
                            </div>
                            <div class="col-xs-2">
                                <h4>Facilities</h4>
                                <asp:CheckBoxList class="custom-control custom-checkbox" ID="facilities" runat="server"></asp:CheckBoxList>
                            </div>
                            <div class="col-xs-4">
                                <asp:DropDownList ID="ddl_contact_person" class="form-control"  runat="server"></asp:DropDownList><br />
                                <asp:DropDownList ID="ddl_hotel_city" class="form-control" runat="server"></asp:DropDownList><br />
                                <asp:TextBox ID="txt_address" class="form-control" TextMode="MultiLine" runat="server"></asp:TextBox><br />
                                
                            </div>
                        </div>
                    </div>
                </div>

                </div>

                <div class="col-sm-12">
                    <div class="box box-danger">
                        <div class="box-header with-border">
                            <h3 class="box-title">Hotel Description</h3>
                            <span class="label label-danger pull-right"><i class="fa fa-eye"></i></span>
                        </div>
                        
                        <div class="box-body">
                            <div class="form-group">

                                <div class="col-xs-12">
                                    <CKEditor:CKEditorControl ID="CKEditor1" BasePath="ckeditor" runat="server" UIColor="#BFEE62" Language="eng" EnterMode="BR" Height="400px">

                                    </CKEditor:CKEditorControl>
                                </div>
                            </div>
                        </div>
                      
                    </div>
                  
                </div>
                <div class="col-sm-12">
                    <div class="box box-danger">
                        <div class="box-header with-border">
                            <h3 class="box-title">Images</h3>
                            <span class="label label-danger pull-right"><i class="fa fa-eye"></i></span>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="form-group">

                                <div class="col-xs-4">
                                    <asp:ScriptManager ID="SM" runat="server"></asp:ScriptManager>
                                    <asp:UpdatePanel ID="UpdFileUpload" runat="server">
                                        <ContentTemplate>
                                            <asp:FileUpload ID="FuImage" CssClass="form-control" multiple="multiple" runat="server" />
                                            <asp:Button ID="btnSaveFile" CssClass="form-control" Text="Upload Images" runat="server" OnClick="btnSaveFile_Click" />
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="btnSaveFile" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="col-sm-8">
                                    <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" CellPadding="4">
                                        <ItemTemplate>
                                            <table border="0" cellpadding="0" cellspacing="0" width="210px">
                                                <tr>
                                                    <td align="center">
                                                        <asp:Image ID="Image1" ImageUrl='<%#"images/"+ Eval("imagename") %>' runat="server" Height="200"
                                                          Width="200" />
                                                      </td>
                                                </tr>
                                                
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>

                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
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
                                            <asp:Button ID="btn_update" OnClick="btn_update_Click" runat="server" CssClass="btn btn-flat" Text="Update" />    
                                            </div>
                                           </div>
                            </div>     
                            
                    </div>
                    </div>
        </div>
                
            </div>
    </section>
</asp:Content>
