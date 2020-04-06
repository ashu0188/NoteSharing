<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="userdesign/dreambiz/assets/img/favicon.png">
<link href="userdesign/dreambiz/assets/css/bootstrap.min.css" rel="stylesheet">
<link href="userdesign/dreambiz/assets/css/font-awesome.min.css" rel="stylesheet">
<link href="userdesign/dreambiz/assets/css/normalize.css" rel="stylesheet">
<link href="userdesign/dreambiz/assets/css/owl.carousel.min.css" rel="stylesheet">
<link href="userdesign/dreambiz/assets/css/owl.transitions.css" rel="stylesheet">
<link href="userdesign/dreambiz/assets/css/magnific-popup.css" rel="stylesheet">
<link href="userdesign/dreambiz/assets/css/style.css" rel="stylesheet">
<link href="userdesign/dreambiz/assets/css/responsive.css" rel="stylesheet">
<script type="text/javascript">
   function sizeFrame(frameId) {
       var F = document.getElementById(frameId);
       if (F.contentDocument) {
           F.height = "";
		F.height = F.contentDocument.documentElement.scrollHeight + 0; //FF 3.0.11, Opera 9.63, and Chrome
       } else {
           F.height = F.contentWindow.document.body.scrollHeight + 0; //IE6, IE7 and Chrome
       }
   }
   // window.onload=sizeFrame;
</script>
</head>
<body>

<center>
<%
try
{
session=request.getSession(false);//used to create object for get session values.
String sid = session.getValue("sid").toString();// get value
String ltime = session.getValue("sltime").toString();
%>
	    <!-- Preloader starts-->
    <div id="preloader"></div>
    <!-- Preloader ends -->
	<!-- Top Bar Starts -->
    <div class="top-bar">
        <div class="container">
            <div class="top-contact-info">
                <div class="per-info">
					<span><i class="fa fa-user"></i></span> <a>Welcome: <%=sid %></a>
				</div>
<!-- '''                <div class="per-info">
					<span><i class="fa fa-clock-o"></i></span> <a>Login Time: </a>
				</div>''' -->
            </div>
            <div class="top-social">
                <i class="fa fa-clock-o"></i> Login Time: <%=ltime %>
                <!--<a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-skype"></i></a>
                <a href="#"><i class="fa fa-google-plus"></i></a>
                <a href="#"><i class="fa fa-pinterest"></i></a>-->
            </div>
        </div>
    </div><!-- Top Bar Ends -->
    <!-- Navigation area starts -->
    <div class="menu-area navbar-fixed-top">
        <div class="container">
            <div class="row">
                <!-- Navigation starts -->
                <div class="col-md-12">
                    <div class="mainmenu">
                        <div class="navbar navbar-nobg">
                            <div class="navbar-header">
                                <a class="navbar-brand"><img src="userdesign/dreambiz/assets/img/logo.png" alt=""></a>
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="navbar-collapse collapse">
                                <nav>
                                    <ul class="nav navbar-nav navbar-right">
                                        <li class="active"><a>Home</a></li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Display <b class="caret"></b></a>
                                            <ul class="dropdown-menu">
												<li><a href="CourseDisplay.jsp" target="abc">Course Display</a></li>
												<li><a href="BranchDisplay.jsp" target="abc">Branch Display</a></li>
												<li><a href="SubjectDisplay.jsp" target="abc">Subject Display</a></li>
											</ul>
										</li>
										<li><a href="SearchNotes.jsp" target="abc">Search Notes</a></li>
										<li><a href="UserProfile_Show&Update.jsp" target="abc">Profile Show & Update</a></li>
										<li><a href="ChangePassword.jsp" target="abc">Change Password</a></li>
										<li><a href="UserLogout.jsp">Logout</a></li>
									</ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Navigation ends -->
            </div>
        </div>
    </div>
    <!-- Navigation area ends -->
    <div class="clearfix space"></div>
    <!-- About area ends -->
    <section class="callto-area section-small">
	</section>    
    
    <!-- About area starts -->
    <section id="category_display" class="about-area section-big">
        <div class="container">
            <div class="row">
                <!-- About Text -->
                <div class="col-md-4">
                    <div class="about-text">
                        <h3 class="">Welcome to <span>Search Notes</span></h3>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod incididunt ametfh consectetur dolore magna aliqua. Ut enim ad minim veniam dolor sit amet magnaelit ate consectetur adipisicing elit sed do eiusmod tempor incididunt consectetur dolore magna aliqua. Ut enim ad minim veniam dolor sit amet consectetur adipisicing.. </p>
<!-- #                        <a href="#" class="btn btn-active">Read more</a> -->
                    </div>
                </div>
                <!-- About Image -->
                <div class="col-md-8 about-img">
                    <iframe width="100%" src="UserProfile_Show&Update.jsp" style="border-left:0px #f1b458 solid;box-shadow: 5px 5px 20px #888888;border-top:height:auto;border-radius: 1px;" id="myFrame" name="abc" frameborder="0" onload="sizeFrame('myFrame')"></iframe>
                </div>
            </div>
        </div>
    </section>
    <!-- Call to action ends -->
        <!-- blog area starts -->
    <!-- <section id="news" class="news-area section-big">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center">
                        <h2>Latest News<span></span></h2>
                        <p>Lorem ipsum dolor sit amet, in quodsi vulputate pro. Ius illum vocent mediocritatem an, cule dicta iriure at.phaedrum. </p>
                    </div>
                </div>
            </div>
            <div class="row">
                News item 1
                <div class="col-md-4 col-sm-6">
                    <div class="single-news">
                        <div class="news-image">
                            <a data-toggle="modal">
                                <img src="userdesign/dreambiz/assets/img/news/1.jpg" alt="" >
                            </a>
                             <div class="news-date">
                                <p>09 nov 2017</p>
                            </div>
                        </div>
                        <div class="news-content">
                            <a data-toggle="modal">
                                <h3 class="subtitle">BUSINESS TIPS FOR STARTING</h3>
                            </a>
                            <p class="news-meta text-muted">
                                <span><i class="fa fa-user"></i>Posted by admin </span>
                                <span><i class="fa fa-calendar"></i> 01 Comments </span>
                            </p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipi sicing elit. Minus obcaecati pariatur officiis molestias eveniet harum laudantium.</p>
#                           <a class="btn" href="single-post.html">ReadMore</a>
                        </div>
                    </div>
                </div>
                News item 2
                <div class="col-md-4 col-sm-6">
                    <div class="single-news">
                        <div class="news-image">
                            <a data-toggle="modal">
                                <img src="userdesign/dreambiz/assets/img/news/2.jpg" alt="" >
                            </a>
                             <div class="news-date">
                                <p>09 nov 2017</p>
                            </div>
                        </div>
                        <div class="news-content">
                            <a data-toggle="modal">
                                <h3 class="subtitle">BUSINESS TIPS FOR STARTING</h3>
                            </a>
                            <p class="news-meta text-muted">
                                <span><i class="fa fa-user"></i>Posted by admin </span>
                                <span><i class="fa fa-calendar"></i> 01 Comments </span>
                            </p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipi sicing elit. Minus obcaecati pariatur officiis molestias eveniet harum laudantium.</p>
#                           <a class="btn" href="single-post.html">ReadMore</a>
                        </div>
                    </div>
                </div>
                News item 3
                <div class="col-md-4 col-sm-6">
                    <div class="single-news">
                        <div class="news-image">
                            <a data-toggle="modal">
                                <img src="userdesign/dreambiz/assets/img/news/3.jpg" alt="" >
                            </a>
                            <div class="news-date">
                                <p>09 nov 2017</p>
                            </div>
                            
                        </div>
                        <div class="news-content">
                            <a data-toggle="modal">
                                <h3 class="subtitle">BUSINESS TIPS FOR STARTING</h3>
                            </a>
                            <p class="news-meta text-muted">
                                <span><i class="fa fa-user"></i>Posted by admin </span>
                                <span><i class="fa fa-calendar"></i> 01 Comments </span>
                            </p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipi sicing elit. Minus obcaecati pariatur officiis molestias eveniet harum laudantium.</p>
#                           <a class="btn" href="single-post.html">ReadMore</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section> -->
    <!-- News area ends -->
<!-- Footer area starts -->
    <footer class="footer-area section-small">
        <div class="container">
            <!-- client carousel -->
            <div class="owl-client">
                <!-- item 1 -->
                <div class="item text-center">
                    <img src="assets/img/clients/1.png" alt="">
                </div>
                <!-- item 2 -->
                <div class="item text-center">
                    <img src="assets/img/clients/2.png" alt="">
                </div>
                <!-- item 3 -->
                <div class="item text-center">
                    <img src="assets/img/clients/3.png" alt="">
                </div>
                <!-- item 4 -->
                <div class="item text-center">
                    <img src="assets/img/clients/4.png" alt="">
                </div>
                <!-- item 5 -->
                <div class="item text-center">
                    <img src="assets/img/clients/5.png" alt="">
                </div>
                <!-- item 6 -->
                <div class="item text-center">
                    <img src="assets/img/clients/3.png" alt="">
                </div>
            </div>
            <!-- / client carousel -->
        </div>
    </footer>
    <!-- Footer area ends -->
<!--CONTACT Us starts-->
    <!-- <section id="contact" class="contact-area section-big">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center">
                        <h2>contact <span>us</span></h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="contact-form">
                        Submition status
                        <div id="form-messages"></div>
                        <form id="ajax-contact" action="http://html.themehovel.com/dreambiz/assets/mailer.php" method="post">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group in_name">
                                        <input type="text" name="name" class="form-control" id="name" placeholder="Full Name" required="required">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group in_email">
                                        <input type="email" name="email" class="form-control" id="email" placeholder="Email Address" required="required">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group in_email">
                                        <input type="text" name="subject" class="form-control" id="subject" placeholder="Subject" required="required">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group in_email">
                                        <input type="text" name="phone" class="form-control" id="phone" placeholder="Phone" required="required">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group in_message"> 
                                        <textarea name="message" class="form-control" id="message" placeholder="Your Message" required="required"></textarea>
                                    </div>
                                    <div class="actions">
                                        <input type="submit" value="SEND MESSAGE" name="submit" id="submitButton" class="btn" title="Submit Your Message!">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="contact-info">
                        <h3 class="subtitle">Contact Info</h3>
                        <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod invidunt ut labore etiops dolore magna aliquyam erat.</p>
                        <h4>Head Office</h4>
                        <div class="contact-list">
                            <ul>
                                <li><i class="fa fa-map-marker"></i> <span>aaaaaaaaaaaaaaaa</span></li>
                                <li><i class="fa fa-phone"></i> <span>000000000000</span></li>
                                <li><i class="fa fa-envelope"></i> <span>email@yourdomain.com</span></li>
                                <li><i class="fa fa-globe"></i> <span>www.yourdomain.com</span></li>   
                            </ul>
                        </div>
                    </div>    
                </div>
            </div>
        </div>
    </section> -->
    <!-- CONTACT Us ends-->
    <!-- Google Map starts-->
<!--     <div id="contactgoogleMap"></div> -->
    <!-- Google Map ends -->
    <!-- copyright area starts -->
    <footer class="copyright-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-xs-12">
                    <div class="copyright-text">
                        <p>Designed By: </p>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-12">
                    <div class="copyright-text pull-right">
                        <div class="footer-social">
                            <!--<a href="#"><i class="fa fa-rss"></i></a>
                            <a href="#"><i class="fa fa-skype"></i></a>
                            <a href="#"><i class="fa fa-google-plus"></i></a>
#                            <a href="#"><i class="fa fa-twitter"></i></a>
#                            <a href="#"><i class="fa fa-facebook"></i></a>-->
                        </div>
                    </div>
                </div>
                <a class="smooth_scroll" href="#slider" id="scroll-to-top"><i class="fa fa-long-arrow-up"></i></a>
            </div>
        </div>
    </footer>
    <!-- copyright area ends -->
    <!-- Latest jQuery -->
    <script src="userdesign/dreambiz/assets/js/jquery.min.js"></script>
    <!-- Bootstrap js-->
    <script src="userdesign/dreambiz/assets/js/bootstrap.min.js"></script>
    <!-- Owl Carousel js -->
    <script src="userdesign/dreambiz/assets/js/owl.carousel.min.js"></script>
    <!-- Mixitup js -->
    <script src="userdesign/dreambiz/assets/js/jquery.mixitup.js"></script>
    <!-- Magnific popup js -->
    <script src="userdesign/dreambiz/assets/js/jquery.magnific-popup.min.js"></script>
    <!-- Waypoint js -->
    <script src="userdesign/dreambiz/assets/js/jquery.waypoints.min.js"></script>
    <!-- Ajax Mailchimp js -->
    <script src="userdesign/dreambiz/assets/js/jquery.ajaxchimp.min.js"></script>
     <!-- GOOGLE MAP JS -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWGUaG5S3B5VikF8UtVCgjki1Pv_HKGgo"></script>
    <!-- Main js-->
    <script src="userdesign/dreambiz/assets/js/main_script.js"></script>

<%-- <table border="1">
<caption>User Home Page</caption>
<tr><td>Welcome: <%=sid %></td><td>Login Time: <%=ltime %></td></tr>
<tr><td><a href="CourseDisplay.jsp" target="aa">Course Display</a><br>
<a href="BranchDisplay.jsp" target="aa">Branch Display</a><br>
<a href="SubjectDisplay.jsp" target="aa">Subject Display</a><br>
<a href="SearchNotes.jsp" target="aa">Search Notes</a><br>
<a href="UserProfile_Show&Update.jsp" target="aa">Profile Show & Update</a><br>
<a href="ChangePassword.jsp" target="aa">Change Password</a><br>
<a href="UserLogout.jsp">Logout</a><br>
</td><td><iframe name="aa" height="500" width="800" frameborder="0"></iframe></td></tr>
<tr><td>Footer</td><td>Footer</td></tr>
</table>
 --%>
 <%
}

catch(Exception ex)
{
response.sendRedirect("UserLogin.jsp");	
}
%>
</center>
</body>
</html>