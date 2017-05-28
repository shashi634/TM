<%@ Page Title="Contact Person : Travel Management" Language="C#" MasterPageFile="~/p/admin.Master" AutoEventWireup="true" CodeBehind="ContactPerson.aspx.cs" Inherits="ErpNBFC.p.ContactPerson" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css" >
/*gridview*/
.table table  tbody  tr  td a ,
.table table  tbody  tr  td  span {
position: relative;
float: left;
padding: 6px 12px;
margin-left: -1px;
line-height: 1.42857143;
color: #337ab7;
text-decoration: none;
background-color: #fff;
border: 1px solid #ddd;
}

.table table > tbody > tr > td > span {
z-index: 3;
color: #fff;
cursor: default;
background-color: #337ab7;
border-color: #337ab7;
}

.table table > tbody > tr > td:first-child > a,
.table table > tbody > tr > td:first-child > span {
margin-left: 0;
border-top-left-radius: 4px;
border-bottom-left-radius: 4px;
}

.table table > tbody > tr > td:last-child > a,
.table table > tbody > tr > td:last-child > span {
border-top-right-radius: 4px;
border-bottom-right-radius: 4px;
}

.table table > tbody > tr > td > a:hover,
.table   table > tbody > tr > td > span:hover,
.table table > tbody > tr > td > a:focus,
.table table > tbody > tr > td > span:focus {
z-index: 2;
color: #23527c;
background-color: #eee;
border-color: #ddd;
}
</style>
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
            <div class="col-sm-4">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Create Contact Person</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                            <div class="form-group">
                                <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Contact Person Name"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Email Id"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="Mobile No."></asp:TextBox>
                            </div>
                        <div class="form-group">
                                <asp:TextBox ID="TextBox7" runat="server" TextMode="MultiLine" class="form-control" placeholder="Address"></asp:TextBox>
                            </div>

                        <div class="form-group">
                            <asp:Button ID="Button1" CssClass="btn btn-group" OnClientClick="overlay" OnClick="Button1_OnClick" runat="server" Text="Register"  />
                            <asp:Button ID="Button2" CssClass="btn btn-group" OnClientClick="overlay" OnClick="Button2_OnClick" runat="server" Text="Update"  />
                            </div>
                        <div class="form-group">
                            <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    </div>
        </div>

        
            <div class="col-sm-8">
                <div class="box box-danger">
                    <div class="box-header with-border">
                        <h3 class="box-title">Contact Person Details</h3>
                        <span class="label label-danger pull-right"><i class="fa fa-eye"></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group">
                            <asp:GridView ID="SubAdminTable" AutoGenerateColumns="false" runat="server"
                                 onrowdeleting="subAdmin_RowDeleting"
                                 CssClass="table table-striped table-bordered table-hover" RowStyle-BorderColor="White" PageSize="10"
                                 OnPageIndexChanging="postList_PageIndexChanging" 
                                 AllowPaging="true" 
                                 >
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate> Sr. No.</HeaderTemplate>
                                         <ItemTemplate>
                                             <%#Container.DataItemIndex+1 %>
                                             <asp:Label ID="h" runat="server" Visible="false" Text='<%#Eval("id") %>'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                 </Columns>
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate> Name</HeaderTemplate>
                                         <ItemTemplate>
                                             <%#Eval("PresonName") %>
                                         </ItemTemplate>
                                         
                                     </asp:TemplateField>
                                 </Columns>
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate > Mobile No.</HeaderTemplate>
                                         <ItemTemplate>
                                              <%#Eval("MobileNo") %>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                 </Columns>
                                <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate > EmailId.</HeaderTemplate>
                                         <ItemTemplate>
                                              <%#Eval("EmailId") %>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                 </Columns>
                                 <Columns>
                                     <asp:TemplateField HeaderStyle-BorderColor="White">
                                         <HeaderTemplate> </HeaderTemplate>
                                         <ItemTemplate>
                                         <a href='<%#"ContactPerson.aspx?C="+DataBinder.Eval(Container.DataItem,"id") %>'><span class="glyphicon glyphicon-edit"></span></a>
                                            <asp:LinkButton ID="LinkButton2"  runat="server" CommandName="Delete" placeholder="Delete"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
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
