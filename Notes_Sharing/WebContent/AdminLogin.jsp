<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login</title>
<meta name=viewport content=width=device-width, initial-scale=1>
<meta charset=utf-8>
<meta name=keywords content=Green login Form a Responsive Web
	Template, Bootstrap Web Templates, Flat Web Templates, Android
	Compatible Web Template, Smartphone Compatible Web Template, Free
	Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design>
<script>
	addEventListener(load, function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<!-- //Meta-Tags -->
<!-- Stylesheets -->
<link href="adminlogin/css/font-awesome.css" rel=stylesheet>
<link href="adminlogin/css/style.css" rel='stylesheet' type='text/css' />
<!--// Stylesheets -->
<!--fonts-->
<!-- title -->
<link href=//fonts.googleapis.com/css?family=Niconne rel=stylesheet>
<!-- body -->
<link
	href=//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i
	rel=stylesheet>
<!--//fonts-->
</head>
<body>

	<h1>Search Notes</h1>
	<div class=w3ls-login box box--big>
		<!-- form starts here -->
		<form action="AdminCheckLogin.jsp" method="post">
			<img src=adminlogin/images/icon.png alt= />
			<div class=agile-field-txt>
				<br>
				<!--<label>                                                                                                                                                                                                                                                  
					 <i class=fa fa-user aria-hidden=true></i> Admin ID</label> -->
				<input type=text name=lid placeholder='Admin ID' required />
			</div>
			<div class=agile-field-txt>
				<!--<label>                                                                                                                                                                                                                                                  
					 <i class=fa fa-lock aria-hidden=true></i> Password</label> -->
				<input type=password name=pwd placeholder='Password' required
					id=myInput />
				<!-- <div class=agile_label>                                                                                                                                                                                                                                  
<input id=check3 name=check3 type=checkbox value=show password onclick=myFunction()>                                                                                                                                                                 
<label class=check for=check3>Show password</label>                                                                                                                                                                                                  
</div> -->
				<!-- <div class=agile-right>                                                                                                                                                                                                                                  
					<a href=#>forgot password?</a>                                                                                                                                                                                                                       
				</div>      -->
			</div>
			<!-- script for show password -->
			<script>
				function myFunction() {
					var x = document.getElementById(myInput);
					if (x.type === password) {
						x.type = text;
					} else {
						x.type = password;
					}
				}
			</script>
			<!-- //end script -->
			<div class=w3ls-bot>
				<!--<div class=switch-agileits>                                                                                                                                                                                                                          
<label class=switch>                                                                                                                                                                                                                                 
<input type=checkbox>                                                                                                                                                                                                                            
<span class=slider round></span>                                                                                                                                                                                                                 
keep me signed in                                                                                                                                                                                                                                
</label>                                                                                                                                                                                                                                             
</div>-->
				<input type=submit name=login value=LOGIN>
			</div>
		</form>
	</div>
	<!-- //form ends here -->
	<!--copyright-->
	<div class=copy-wthree>
		<p>
			Design By:ASHUTOSH BINDAL</a>
		</p>
	</div>
	-->
	<!--//copyright-->

	<!-- <form action="AdminCheckLogin.jsp" method="post">
<center>
<table border="1">
<caption>Admin Login</caption>
<tr><td>Enter Login ID</td><td><input type="text" name="lid"></td></tr>
<tr><td>Enter Password</td><td><input type="password" name="pwd"></td></tr>
<tr><td><input type="submit" value="Login"></td><td><input type="reset"></td></tr>
</table>
</center>
</form> -->
</body>
</html>