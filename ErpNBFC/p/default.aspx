<%@ Page Title="Travel Managament System" Language="C#" MasterPageFile="~/p/admin.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="ErpNBFC.p._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
          <section class="content">
        <div class="row">
            <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>
                  <asp:Literal ID="Literal1" runat="server"></asp:Literal></h3>

              <p>Sub Admins</p>
            </div>
            <div class="icon">
              <i class="ion ion-compose"></i>
            </div>
            <a href="SubAdmin.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3><asp:Literal ID="Literal2" runat="server"></asp:Literal></h3>

              <p>Agents Listed</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="SubAdmin.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3><asp:Literal ID="Literal3" runat="server"></asp:Literal></h3>

              <p>Hotels Listed</p>
            </div>
            <div class="icon">
              <i class="ion ion-ios-location"></i>
            </div>
            <a href="Hotel.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3><asp:Literal ID="Literal4" runat="server"></asp:Literal></h3>

              <p>Contact Person</p>
            </div>
            <div class="icon">
              <i class="ion ion-ios-telephone"></i>
            </div>
            <a href="ContactPerson.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>             
                </div>   
                <div class="row">
            <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>
                  <asp:Literal ID="Literal5" runat="server"></asp:Literal></h3>

              <p>Package</p>
            </div>
            <div class="icon">
              <i class="ion ion-speakerphone"></i>
            </div>
            <a href="tourPackages.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3><asp:Literal ID="Literal6" runat="server"></asp:Literal></h3>

              <p>Location</p>
            </div>
            <div class="icon">
              <i class="ion ion-map"></i>
            </div>
            <a href="country.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        
                     
                </div>
                </section>
</asp:Content>
