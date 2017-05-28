<%@ Page Title="" Language="C#" MasterPageFile="~/p/admin.Master" AutoEventWireup="true" CodeBehind="PageCreator.aspx.cs" Inherits="ErpNBFC.p.PageCreator" %>
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
            <div class="col-sm-8">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Create Your Page</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                            <div class="form-group">
                                <div class="col-xs-4">
                                    <asp:dropdownlist ID="ddl_location" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddl_location_SelectedIndexChanged">

                                    </asp:dropdownlist>
                                </div>
                                
                                <div class="col-xs-8">
                                    <asp:textbox runat="server" ID="location_title" CssClass="form-control" placeholder="Enter Title of Page"></asp:textbox>
                                </div>
                            </div>     
                            <div class="form-group"><div class="col-xs-12"><h3><asp:Label ID="lblmsg" runat="server" Text=""></asp:Label> </h3></div></div>
                            
                            <br />
                            <div class="form-group">
                                <div class="col-xs-12">
                                     <CKEditor:CKEditorControl ID="CKEditor1" BasePath="ckeditor" runat="server" UIColor="#BFEE62" Language="eng" EnterMode="BR" Height="400px">

                                    </CKEditor:CKEditorControl>
                                </div>

                            </div>  
                            <div class="form-group">
                             
                                        <div class="col-xs-12">
                                        <br />
                                            <div class="text-right">
                                                <asp:Button ID="btn_create_page" CssClass="btn btn-default" runat="server" Text="Create Page" OnClick="btn_create_page_Click" />
                                            </div>
                                            <div class="text-left">
                                                <asp:Button ID="Button1" CssClass="btn btn-twitter" runat="server" Text="Reset Page" OnClick="Button1_Click" />
                                            </div>
                                        </div>
                            </div>
                    </div>
                    </div>
        </div>

        
            <div class="col-sm-4">
                    <div class="box box-danger">
                        <div class="box-header with-border">
                            <h3 class="box-title">Upload Banner Images</h3>
                            <span class="label label-danger pull-right"><i class="fa fa-eye"></i></span>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="form-group">
                               <div class="col-xs-12">
                                            <asp:FileUpload ID="FuImage" CssClass="form-control" multiple="multiple" runat="server" />    <br />
                                            <asp:Button ID="btnSaveFile" CssClass="form-control" Text="Upload Images" runat="server" OnClick="btnSaveFile_Click" />
                                </div>                <br /><br />
                                <div class="col-sm-12">
                                <br /><br />
                                    <asp:DataList ID="DataList1" runat="server" RepeatColumns="2" CellPadding="4">
                                        <ItemTemplate>
                                            <table class="table table-striped">
                                                <tr>
                                                    <td>
                                                        <asp:Image class="img-thumbnail" Height="150px" Width="300px" ID="Image1" ImageUrl='<%#"images/"+ Eval("imagename") %>' runat="server"
                                                          />
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
        </div>
    </section>
</asp:Content>
