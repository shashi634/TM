<%@ Page Title="" Language="C#" MasterPageFile="~/p/admin.Master" AutoEventWireup="true" CodeBehind="Hotels.aspx.cs" Inherits="ErpNBFC.p.Hotels" %>

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
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Hotels Entry</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                         <div class="form-group">
                             <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" placeholder="Package name"></asp:TextBox>
                         </div>
                        <div class="form-group"><span>Hotel Name</span>
                            <asp:DropDownList class="form-control" ID="DropDownList5" runat="server">
                                
                            </asp:DropDownList>
                        </div>

                       
                        <div class="form-group">
                            <span>Meal Plan</span>
                            <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                                
                            </asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <span>Room Type</span>
                            <asp:DropDownList class="form-control" ID="DropDownList3" runat="server">
                               
                            </asp:DropDownList>
                        </div>
                        <%-- <div class="form-group">
                            <asp:TextBox ID="TextBox6" runat="server" TextMode="MultiLine" class="form-control" placeholder="Hotel Address"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox9" runat="server" class="form-control" placeholder="City"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList class="form-control" ID="DropDownList4" runat="server">
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
                            <asp:TextBox ID="TextBox12" runat="server" class="form-control" placeholder="PIN Code"></asp:TextBox>
                        </div>--%>
                        <div class="form-group"><span>Description</span>
                       <asp:TextBox ID="TextBox10" Height="200px" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                             </div>
                    </div>
                </div>
            </div>
            
            
            <div class="col-sm-6">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Hotel Rate</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group">
                            <div class="col-xs-4">
                                <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" placeholder="Rate"></asp:TextBox>
                            </div>
                            <div class="col-xs-4">
                                <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server" TextMode="Number" placeholder="No. of Nights"></asp:TextBox>
                            </div>
                            <div class="col-xs-4">
                                <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server"  TextMode="Number" placeholder="No. of Days"></asp:TextBox>
                            </div>
                        </div>
                        <br /><br />
                        <div class="form-group">
                            <div class="col-xs-4">
                               <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server" placeholder="Rate for Extra Adult"></asp:TextBox>
                            </div>
                             <div class="col-xs-4">
                                <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server" placeholder="Rate for Extra Child"></asp:TextBox>
                             </div>
                            <div class="col-xs-4">
                                <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" placeholder="TDS"></asp:TextBox>
                            </div>
                        </div>
                       
                        
                    </div>
                </div>
            </div>

            <div class="col-sm-6">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Hotels Validity</h3>
                        <span class="label label-primary pull-right"><i class="fa fa-bell "></i></span>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group">
                            <div class="col-xs-6">
                                
                                    <asp:TextBox ID="TextBox11" runat="server" class="form-control" TextMode="Date" placeholder="Valid From"></asp:TextBox>
                                    
                                
                            </div>
                            <div class="col-xs-6">
                                
                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" TextMode="Date" placeholder="Valid To"></asp:TextBox>
                                    
                               
                            </div>
                        </div>

                        <div class="form-group">
                            <br /><br />
                             <div class="col-xs-4">
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-flat pull-left" OnClick="Button1_Click" Text="Create Package" />
                                 </div>
                            <div class="col-xs-8">
                                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
         </div>
    </section>
</asp:Content>
