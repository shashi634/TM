<%@ Page Title="" Language="C#" MasterPageFile="~/p/admin.Master" AutoEventWireup="true" CodeBehind="AgentRegistration.aspx.cs" Inherits="ErpNBFC.p.AgentRegistration" %>
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
                        <h3 class="box-title">Agent Registration</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">

                            <div class="form-group">
                                <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Agent Name"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Agent Agency name"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="Agent PAN"></asp:TextBox>
                            </div>
                        <div class="form-group">
                                <asp:TextBox ID="TextBox4" runat="server" class="form-control" placeholder="Agent Registration No."></asp:TextBox>
                            </div>
                        <div class="form-group">
                                <asp:TextBox ID="TextBox5" runat="server" class="form-control" placeholder="Agent TAN"></asp:TextBox>
                            </div>
                        <div class="form-group">
                                <asp:TextBox ID="TextBox6" runat="server" class="form-control" placeholder="Agent Service Tax No."></asp:TextBox>
                            </div>
                        <div class="form-group">
                                <asp:TextBox ID="TextBox7" runat="server" TextMode="MultiLine" class="form-control" placeholder="Agent Address"></asp:TextBox>
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
                                <asp:TextBox ID="TextBox10" runat="server" class="form-control" placeholder="PIN Code"></asp:TextBox>
                            </div>
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                
                            </div>
                         <div class="form-group">
                             <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
                                
                            </div>
                    </div>
                    </div>
        </div>

        
            <div class="col-sm-6">
                <div class="box box-danger">
                    <div class="box-header with-border">
                        <h3 class="box-title">Agent List</h3>
                        <span class="label label-danger pull-right"><i class="fa fa-eye"></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                         <div class="form-group">
                             <h2>Agent List will go here...</h2>
                            </div>
                       

                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
        </div>
    </section>
        <script type="text/javascript">
         $(document).ready(function () {
                 
             $('#TextBox11').datetimepicker({ format: 'DD-MM-YYYY' });
             
         });
       
    </script>
</asp:Content>
