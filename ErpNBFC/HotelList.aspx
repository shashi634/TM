<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="HotelList.aspx.cs" Inherits="ErpNBFC.HotelList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
    	<div class="content"><!-- Content Section -->
		<div class="container margint60">
			<div class="row">
				<div class="col-lg-12 marginb20"><!-- Room Sort -->
					<div class="sortby clearfix">
						<div class="pull-left">
							<select>
								<option selected="selected">ASCENDING</option>
								<option>DESCENDING</option>
							</select>
						</div>
						<div class="pull-right sort-icon">
							<a class="fright" href="category-grid.html"><img src="temp/grid-icon.png" alt=""></a> 
							<a class="fright" href="category-list.html"><img src="temp/list-icon.png" alt=""></a>
						</div>
					</div>	
				</div>
				<div class="col-lg-9"><!-- Explore Rooms -->
					<table>
						<tr class="products-title">
							<td class="table-products-image pos-center"><h6>IMAGE</h6></td>
							<td class="table-products-name pos-center"><h6>ROOM NAME</h6></td>
							<td class="table-products-price pos-center"><h6>PRICE</h6></td>
							<td class="table-products-total pos-center"><h6>PURCHASE</h6></td>
						</tr>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            
                            <tr class="table-products-list pos-center">
							<td class="products-image-table"><img alt="Products Image 1" src="temp/room-image-1.jpg" class="img-responsive"></td>
							<td class="title-table">
								<div class="room-details-list clearfix">
									<div class="pull-left">
										<h5><%#Eval("name") %></h5>
									</div>
									<div class="pull-left room-rating">
										<ul>
											<li><i class="fa fa-star"></i></li>
											<li><i class="fa fa-star"></i></li>
											<li><i class="fa fa-star"></i></li>
											<li><i class="fa fa-star"></i></li>
											<li><i class="fa fa-star inactive"></i></li>
										</ul>
									</div>
								</div>
								<div class="list-room-icons clearfix">
									<ul>
										<li><i class="fa fa-calendar"></i></li>
										<li><i class="fa fa-flask"></i></li>
										<li><i class="fa fa-umbrella"></i></li>
										<li><i class="fa fa-laptop"></i></li>
									</ul>
								</div>
								<p><%#Eval("description") %> <a class="active-color" href="#">[...]</a> </p>
							</td>
							<td><h3><%#Eval("rate") %></h3></td>
							<td><div class="button-style-1"><a href="<%#Eval("Id") %>"><i class="fa fa-calendar"></i><span class="mobile-visibility">BOOK NOW</span></a></div></td>
						</tr>
                        </ItemTemplate>
                    </asp:Repeater>
						
						
						
						
						
						
					</table>
				</div>
				<div class="col-lg-3"><!-- Sidebar -->
					<div class="quick-reservation-container">
						<div class="quick-reservation clearfix">
							<div class="title-quick pos-center margint30">
								<h5>QUICK RESERVATIONS</h5>
								<div class="line"></div>
							</div>
							<div class="reserve-form-area">

									<label>ARRIVAL</label>
									<input type="text" id="dpd1" name="dpd1" class="date-selector" placeholder="&#xf073;" />
									<label>RETURN</label>
									<input type="text" id="dpd2" name="dpd2" class="date-selector" placeholder="&#xf073;" />
									<div class="pull-left children clearfix">
										<label>ROOMS</label>
										<select name="rooms" class="pretty-select">
											<option selected="selected" value="1" >1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
									</div>
									<div class="pull-left type clearfix">
										<label>ADULT</label>
										<select name="adult" class="pretty-select">
											<option selected="selected" value="1" >1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
									</select>
									</div>
									<div class="pull-left rooms clearfix">
										<label>CHILDREN</label>
										<select name="children" class="pretty-select">
											<option selected="selected" value="0" >0</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
									</div>
									<div class="pull-left search-button clearfix">
										<div class="button-style-1">
											<a id="res-submit" href="#">SEARCH</a>
										</div>
									</div>

							</div>
						</div>
					</div>
					<div class="luxen-widget news-widget">
						<div class="title-quick marginb20">
							<h5>HOTEL INFORMATION</h5>
						</div>
						<p>Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Lorem ipsumero, a pharetra augue. Lorem ipsum dolor sit amet, consectedui.</p>
					</div>
					<div class="luxen-widget news-widget">
						<div class="title">
							<h5>CONTACT</h5>
						</div>
						<ul class="footer-links">
							<li><p><i class="fa fa-map-marker"></i> Lorem ipsum dolor sit amet lorem Victoria 8011 Australia </p></li>
							<li><p><i class="fa fa-phone"></i> +61 3 8376 6284 </p></li>
							<li><p><i class="fa fa-envelope"></i> info@2035themes.com</p></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
        </div>
</asp:Content>
