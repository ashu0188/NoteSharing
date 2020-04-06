<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
body {
margin-top: 2%
}
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 98%;
}

#customers td{
  border: 1px solid #ddd;
  padding-top: 7px;
  padding-bottom: 7px;
  padding-left: 7px;
font-size:13px;font-weight:bold;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-left: 7px;
  padding-top: 7px;
  padding-bottom: 7px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
font-size:16px;font-weight:bold;
}
</style>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="pwdmatch/passtest.js"></script>
</head>
<body>
<form action="ChangePassword1.jsp">
<center>
<caption><h3>Change User's Password</h3></caption>
<table id="customers">
<%
try
{
session=request.getSession(false);//used to create object for get session values.
String sid = session.getValue("sid").toString();// get value
String ltime = session.getValue("sltime").toString();
%>
<tr><td>Enter Old Password</td><td><input type="password" name="opwd" class="form-control"></td></tr>
<tr><td>Enter New Password</td><td><input type="password" name="npwd" id="pass1" class="form-control"></td></tr>
<tr><td>Re-enter New Password</td><td><input type="password" name="rnpwd" id="pass2" onkeyup="checkPass(); return false;" class="form-control" required><br><span id="confirmMessage" class="confirmMessage"></span></td></tr>
<tr><td><input type="submit" value="Change Password" class="btn btn-primary"></td><td><input type="reset" value="Clear" class="btn btn-warning"></td></tr>
<%
}

catch(Exception ex)
{
response.sendRedirect("UserLogin.jsp");	
}
%>
</table>
</center>
</form>
</body>
</html>