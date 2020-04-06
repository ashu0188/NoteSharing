<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>
    <%@ page import="bs.DAO.*" %>
     <%@ page import="bs.DB.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Registration</title>
    <style type="text/css">
        
#customers {
  border-collapse: collapse;
  width: 98%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 4px;
}
#customers tr:nth-child(even){background-color: #f2f2f2;}
#customers tr:hover {background-color: #ddd;}
    </style>
		<!-- favicon -->
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
function AllowAlphabet(){
if (!frm.unm.value.match(/^[a-z A-Z]+$/) && frm.unm.value !="")
{
frm.unm.value="";
frm.unm.focus();
//alert("Accept Only Alphabet...");
return false;
}
if (!frm.umno.value.match(/^[0-9]+$/) && frm.umno.value !="")
{
frm.umno.value="";
frm.umno.focus();
//alert("Accept Only Alphabet...");
return false;
}
if (!frm.lid.value.match(/^[0-9a-zA-Z]+$/) && frm.lid.value !="")
{
frm.lid.value="";
frm.lid.focus();
//alert("Accept Only Alphabet...");
return false;
}
}
</script>
<script type="text/javascript" src="pwdmatch/passtest.js"></script>
</head>
<body>
	    <!-- Preloader starts-->
    <div id="preloader"></div>
    <!-- Preloader ends -->
	<!-- Top Bar Starts -->
    <div class="top-bar">
        <div class="container">
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
										<li><a href="UserLogin.jsp">Student Login</a></li>
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
    <section class="callto-area section-small">
	</section>    
    <!-- About area starts -->
    <section id="category_display" class="about-area section-big">
        <div class="container">
            <div class="row">
                <!-- About Text -->
                <div class="col-md-6">
                    <div class="about-text">
                        <h3 class="">Welcome to <span>Search Notes</span></h3>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod incididunt ametfh consectetur dolore magna aliqua. Ut enim ad minim veniam dolor sit amet magnaelit ate consectetur adipisicing elit sed do eiusmod tempor incididunt consectetur dolore magna aliqua. Ut enim ad minim veniam dolor sit amet consectetur adipisicing.. </p>
                    </div>
                </div>
                <!-- About Image -->
                <div class="col-md-6 about-img" style="border-left:0px #f1b458 solid;box-shadow: 5px 5px 20px #888888;border-top:height:auto;border-radius: 1px;">
				<form action="UserSubmit" method="post" name="frm">
				<center>
				<table border="1" id="customers">
				<caption><h3>User Reg Form</h3></caption>
				<tr><td>Name</td><td><input type="text" name="unm" onkeyup="AllowAlphabet()" class="form-control" required></td></tr>
				<tr><td>Email ID</td><td><input type="email" name="eid" required class="form-control"></td></tr>
				<tr><td>Mobile Number</td><td><input type="text" name="umno" minlength="10" maxlength="10" onkeyup="AllowAlphabet()" class="form-control" required></td></tr>
				<tr><td>DOB</td><td><input type="date" name="dob" required class="form-control"></td></tr>
				<tr><td>Gender</td><td><input type="radio" name="gen" value="Male">Male<input type="radio" name="gen" value="Female" required>Female</td></tr>
				<tr><td>Address</td><td><textarea name="sadd" rows="3" cols="30" class="form-control"></textarea></td></tr>
				<tr><td>Course</td><td><select name="cid" required class="form-control"><option>--Select Course--</option>
				<%
				try
				{
				ResultSet rs = DAO.displayRecord("select * from course");
				if(rs.next())
				{
				do
				{
					 %>
					 	<option value="<%=rs.getString(1) %>"><%=rs.getString(2) %></option>
					 <%
				}
				while(rs.next());
				}
				}
				catch(Exception ex)
				{
				out.println("Error: "+ex);	
				}
				%>
				</select></td></tr>
				<tr><td>Login ID</td><td><input type="text" name="lid" onkeyup="AllowAlphabet()" required class="form-control"></td></tr>
				<tr><td>Password</td><td><input type="password" name="pwd" id="pass1" required class="form-control"></td></tr>
				<tr><td>Re-enter Password</td><td><input type="password" name="rpwd" id="pass2" onkeyup="checkPass(); return false;" class="form-control" required><br><span id="confirmMessage" class="confirmMessage"></span></td></tr>
				<tr><td><input type="submit" value="Insert" class="btn btn-primary"></td><td><input type="reset" class="btn btn-warning"></td></tr>
				<!-- <tr><td>If you are register <a href="UserLogin.jsp">Click Here</a></td><td><a href="ForgetPassword.jsp">ForgetPassword</a></td></tr> -->
				</table>
				</center>
				</form>
                </div>
            </div>
        </div>
    </section>
    <!-- About area ends -->
    <!-- Call to action ends -->
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
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-facebook"></i></a>-->
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
</body>
</html>