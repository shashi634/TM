﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PasswordRecovery.aspx.cs" Inherits="ErpNBFC.Login.PasswordRecovery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Password Reset</title>
    <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'/>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/responsive-min.css" rel="stylesheet" />
    <link href="css/preview.css" rel="stylesheet" />
    <link href="css/fontawesome.css" rel="stylesheet" />
</head>
<body>

    <form id="form1" runat="server">
    <div class="divider large visible-desktop"></div>
    <div class="divider  hidden-desktop"></div>

    <div class="container">
        <div class="row-fluid" id="demo-1">
            <div class="span10 offset1">
                <h4>TM Password Recovery System</h4>
                <div class="tabbable custom-tabs tabs-animated  flat flat-all hide-label-980 shadow track-url auto-scroll">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#panel1" data-toggle="tab" class="active "><i class="icon-lock"></i>&nbsp;<span>Reset Panel</span></a></li>
                    </ul>
                    <div class="tab-content ">
                        <div class="tab-pane active" id="panel1">
                            <div class="row-fluid">
                                <div class="span5">
                                    <h4><i class="icon-user"></i>&nbsp;&nbsp; Reset Here</h4>
                                    <label>Unique Code</label>
                                    
                                    <asp:TextBox ID="txtuniquecode"  runat="server" class="input-block-level" ></asp:TextBox>
                                    <label>Password</label>
                                    
                                    <asp:TextBox ID="txtfpassword" TextMode="Password" runat="server" class="input-block-level" ></asp:TextBox>
                                    <label>Again Password<a href="#panel3" class="pull-right"><i class="icon-question-sign"></i>&nbsp;Forgot Password</a> </label>
                                    
                                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" class="input-block-level"></asp:TextBox>
                                    <label>
                                        <%--<button type="button" data-toggle="button" class="btn btn-mini custom-checkbox active"><i class="icon-ok"></i></button>
                                        &nbsp;&nbsp;&nbsp;Remember Me--%>
                                        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                                    </label>
                                    <br />
                                    <asp:Button ID="Button1" CssClass="btn" runat="server" Text="Reset Password" OnClick="Button1_Click"  />
                                </div>
                                <div class="span3">
                                    <h4><i class="icon-expand-alt"></i>&nbsp;&nbsp;Social</h4>
                                    <div class="socials clearfix">
                                        <a class="icon-facebook facebook"></a>
                                        <a class="icon-twitter twitter"></a>
                                        <a class="icon-google-plus google-plus"></a>
                                        <a class="icon-pinterest pinterest"></a>
                                        <a class="icon-linkedin linked-in"></a>
                                        <a class="icon-github github"></a>
                                    </div>
                                </div>
                                <div class="span4">
                                    <h4><i class="icon-question"></i>&nbsp;&nbsp;Registration</h4>
                                    <div class="box">
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit fusce vel.
                                        </p>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit fusce vel sapien elit in.
                                        </p>
                                    </div>
                                    <div class="box">
                                        Don't Have An Account.<br />
                                        Click Here For <a href="#" data-toggle="tab">Free Register</a>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>

                </div>
            </div>
        </div>
        <div id="TabsModal" class="modal hide fade modal-form" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="row-fluid">
                <div class="span10 offset1">

                    <div class="tabbable custom-tabs tabs-animated  flat flat-all hide-label-980 shadow">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#panel6-1" data-toggle="tab" class="active "><i class="icon-lock"></i>&nbsp;<span>Login Panel</span></a></li>
                            <li><a href="#panel6-2" data-toggle="tab"><i class="icon-user"></i>&nbsp;<span>Register Panel</span></a></li>
                            <li><a href="#panel6-3" data-toggle="tab"><i class="icon-key"></i>&nbsp;<span>Forgot Password</span></a></li>
                            <li><a href="#panel6-4" data-toggle="tab"><i class="icon-envelope-alt"></i>&nbsp;<span>Contact Us</span></a></li>

                            <li><a href="#close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i>&nbsp;<span></span></a></li>
                        </ul>
                        <div class="tab-content ">
                            <div class="tab-pane active" id="panel6-1">
                                <div class="row-fluid">
                                    <div class="span5">
                                        <h4><i class="icon-user"></i>&nbsp;&nbsp; Login Here</h4>

                                        <label>Username</label>
                                        <input type="text" class="input-block-level" />
                                        <label>Password<a href="#" class="pull-right"><i class="icon-question-sign"></i>&nbsp;Forgot Password</a> </label>
                                        <input type="password" class="input-block-level" />
                                        <label>
                                            <button type="button" data-toggle="button" class="btn btn-mini custom-checkbox active"><i class="icon-ok"></i></button>
                                            &nbsp;&nbsp;&nbsp;Remember Me
                                        </label>
                                        <br />

                                        <a href="#" class=" btn  ">Sign In&nbsp;&nbsp;&nbsp;<i class="icon-chevron-sign-right"></i></a>
                                    </div>
                                    <div class="span3">
                                        <h4><i class="icon-expand-alt"></i>&nbsp;&nbsp;Social</h4>
                                        <div class="socials clearfix">
                                            <a class="icon-facebook facebook"></a>
                                            <a class="icon-twitter twitter"></a>
                                            <a class="icon-google-plus google-plus"></a>
                                            <a class="icon-pinterest pinterest"></a>
                                            <a class="icon-linkedin linked-in"></a>
                                            <a class="icon-github github"></a>
                                        </div>
                                    </div>
                                    <div class="span4">
                                        <h4><i class="icon-question"></i>&nbsp;&nbsp;Registration</h4>
                                        <div class="box">
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit fusce vel.
                                            </p>
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit fusce vel sapien elit in.
                                            </p>
                                        </div>
                                        <div class="box">
                                            Don't Have An Account.<br />
                                            Click Here For <a href="#panel2" data-toggle="tab">Free Register</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="panel6-2">
                                <div class="row-fluid">
                                    <div class="span5">
                                        <h4><i class="icon-user"></i>&nbsp;&nbsp; Register Here</h4>


                                        <label>Username</label>                                          Again Password
                                        <input type="text" class="input-block-level" />
                                        <label>Password </label>
                                        <input type="password" class="input-block-level" />
                                        <label>Repeat Password</label>
                                        <input type="password" class="input-block-level" />
                                        <label>
                                            <button type="button" data-toggle="button" class="btn btn-mini custom-checkbox active"><i class="icon-ok"></i></button>
                                            &nbsp;&nbsp;&nbsp;I Aggree With <a href="#">Terms &amp; Conditions</a>
                                        </label>
                                        <br />

                                        <a href="#" class=" btn  ">Register Now&nbsp;&nbsp;&nbsp;<i class="icon-chevron-sign-right"></i></a>

                                    </div>
                                    <div class="span3">
                                        <h4><i class="icon-expand-alt"></i>&nbsp;&nbsp;Social</h4>
                                        <div class="socials clearfix">
                                            <a class="icon-facebook facebook"></a>
                                            <a class="icon-twitter twitter"></a>
                                            <a class="icon-google-plus google-plus"></a>
                                            <a class="icon-pinterest pinterest"></a>
                                            <a class="icon-linkedin linked-in"></a>
                                            <a class="icon-github github"></a>
                                        </div>
                                    </div>
                                    <div class="span4">
                                        <h4><i class="icon-question"></i>&nbsp;&nbsp;Login</h4>
                                        <div class="box">
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit fusce vel.
                                            </p>
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit fusce vel sapien elit in.
                                            </p>
                                        </div>
                                        <div class="box">
                                            Already Have An Account.<br />
                                            Click Here For <a href="#panel2" data-toggle="tab">Login</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane" id="panel6-3">
                                <div class="row-fluid">
                                    <div class="span5">
                                        <h4><i class="icon-unlock"></i>&nbsp;&nbsp;Password Recovery</h4>

                                        <label>Email</label>
                                        <input type="text" class="input-block-level" />
                                        <label>Security Question</label>
                                        <select class="input-block-level">
                                            <option disabled="disabled" selected="selected">---Select---</option>
                                            <option>Which Is Your First Mobile</option>
                                            <option>What Is Your Pet Name</option>
                                            <option>What Is Your Mother Name</option>
                                            <option>Which Is Your First Game</option>
                                        </select>
                                        <label>Answer</label>
                                        <input type="text" class="input-block-level" />
                                        <br />
                                        <br />
                                        <a href="#" class=" btn  ">Recover Password&nbsp;&nbsp;&nbsp;<i class="icon-chevron-sign-right"></i></a>
                                    </div>
                                    <div class="span7">
                                        <h4><i class="icon-question"></i>&nbsp;&nbsp;Help</h4>
                                        <div class="box">
                                            <p>Getting Error With Password Recovery Click Here For <a href="#">Support</a></p>
                                            <ul>


                                                <li>Vestibulum pharetra lectus montes lacus!</li>
                                                <li>Iaculis lectus augue pulvinar taciti.</li>
                                            </ul>

                                        </div>
                                        <div class="box">
                                            <ul>
                                                <li>Potenti facilisis felis sociis blandit euismod.</li>
                                                <li>Odio mi hendrerit ad nostra.</li>
                                                <li>Rutrum mi commodo molestie taciti.</li>
                                                <li>Interdum ipsum ad risus conubia, porttitor.</li>
                                                <li>Placerat litora, proin hac hendrerit ac volutpat.</li>
                                                <li>Ornare, aliquam condimentum  habitasse.</li>
                                            </ul>

                                        </div>
                                    </div>
                                </div>


                            </div>
                            <div id="panel6-4" class="tab-pane">
                                <div class="row-fluid">
                                    <div class="span5">
                                        <h4><i class="icon-envelope-alt"></i>&nbsp;&nbsp;Contact Us</h4>
                                        <label>Name</label>
                                        <input type="text" value="" id="Text12" class="input-block-level" />
                                        <label>Email</label>
                                        <input type="text" value="" id="Text13" class="input-block-level" />
                                        <label>Mobile No</label>
                                        <input type="text" value="" id="Text14" class="input-block-level" />
                                        <label>Message</label>
                                        <textarea class="input-block-level" rows="5"></textarea>
                                        <a href="#" class=" btn ">Send Message&nbsp;&nbsp;&nbsp;<i class="icon-chevron-sign-right"></i></a>
                                        <br class="visible-phone" />
                                        <br class="visible-phone" />
                                    </div>
                                    <div class="span7">
                                        <div class="row-fluid">
                                            <div class="span12">
                                                <h4><i class="icon-location-arrow"></i>&nbsp;&nbsp;Locate Us</h4>

                                                <div class="map"></div>

                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="span6">
                                                <h4><i class="icon-envelope-alt"></i>&nbsp;&nbsp;Contact Us</h4>
                                                <address>
                                                    <strong>Full Name</strong><br>
                                                    <a href="mailto:#">first.last@example.com</a>
                                                </address>
                                            </div>
                                            <div class="span6">
                                                <h4><i class="icon-location-arrow"></i>&nbsp;&nbsp;Our Address</h4>

                                                <address>
                                                    <strong>Twitter, Inc.</strong><br>
                                                    795 Folsom Ave, Suite 600<br>
                                                    San Francisco, CA 94107<br>
                                                    <abbr title="Phone">P:</abbr>
                                                    (123) 456-7890
                                                </address>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>
        </form>
    <script src="js/jquert-1.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/tabs.js"></script>
     <script type="text/javascript">
        $(function ()
        {
            $("a[href^='#demo']").click(function (evt)
            {
                evt.preventDefault();
                var scrollTo = $($(this).attr("href")).offset().top;
                $("html,body").animate({ scrollTop: scrollTo - 80 }, 600);
            });
            $("a[href^='#bg']").click(function (evt)
            {
                evt.preventDefault();
                $("body").removeClass("light").removeClass("dark").addClass($(this).data("class")).css("background-image", "url('bgs/" + $(this).data("file") + "')");
                console.log($(this).data("file"));


            });
            $("a[href^='#color']").click(function (evt)
            {
                evt.preventDefault();
                var elm = $(".tabbable");
                elm.removeClass("grey").removeClass("dark").removeClass("dark-input").addClass($(this).data("class"));
                if (elm.hasClass("dark dark-input"))
                {
                    $(".btn", elm).addClass("btn-inverse");
                }
                else
                {
                    $(".btn", elm).removeClass("btn-inverse");

                }

            });
            $(".color-swatch div").each(function ()
            {
                $(this).css("background-color", $(this).data("color"));
            });
            $(".color-swatch div").click(function (evt)
            {
                evt.stopPropagation();
                $("body").removeClass("light").removeClass("dark").addClass($(this).data("class")).css("background-color", $(this).data("color"));
            });
            $("#texture-check").mouseup(function (evt)
            {
                evt.preventDefault();

                if (!$(this).hasClass("active"))
                {
                    $("body").css("background-image", "url(bgs/n1.png)");
                }
                else
                {
                    $("body").css("background-image", "none");
                }
            });

            $("a[href='#']").click(function (evt)
            {
                evt.preventDefault();

            });

            $("a[data-toggle='popover']").popover({
                trigger:"hover",html:true,placement:"top"
            });
        });

    </script>


</body>
</html>
