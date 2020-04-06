<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@ page import="bs.DAO.*" %>
     <%@ page import="bs.DB.*" %>
     <%@ page import="bs.Model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Course Interface</title>
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
<script type="text/javascript">
function AllowAlphabet(){
if (!frm.cnm.value.match(/^[a-z A-Z]+$/) && frm.cnm.value !="")
{
frm.cnm.value="";
frm.cnm.focus();
//alert("Accept Only Alphabet...");
return false;
}
if (!frm.cdur.value.match(/^[0-9]+$/) && frm.cdur.value !="")
{
frm.cdur.value="";
frm.cdur.focus();
return false;
}
}
</script>
</head>
<body>

<%
try
{
session=request.getSession(false);//used to create object for get session values.
String sid = session.getValue("suid").toString();// get value
String ltime = session.getValue("stime").toString();
%>
<form action="CourseSubmit.jsp" name="frm">
<center>
<table border="1" id="customers">
<caption><h3>Course / Degree Interface</h3></caption>
<tr><td>Enter Course Name</td><td><input type="text" name="cnm" onkeyup="AllowAlphabet()" class="form-control" required></td></tr>
<tr><td>Enter Course Logo</td><td><input type="file" name="clogo" class="form-control" required></td></tr>
<tr><td>Enter Course Duration</td><td><input type="text" name="cdur" class="form-control" onkeyup="AllowAlphabet()" required></td></tr>
<tr><td>Enter Course Desc</td><td><textarea name="cdesc" rows="5" class="form-control" cols="30"></textarea></td></tr>
<tr><td><input type="submit" class="btn btn-success"></td><td><input type="reset" class="btn btn-warning"></td></tr>
</table>
<table id="customers">
<caption><h3>Course Display</h3></caption>
<%
try
{
ResultSet rs = DAO.displayRecord("select * from course");
if(rs.next())
{
%>
<tr><th>Course ID</th><th>Course Name</th><th>Course Icon</th><th>Course Duration</th><th>Course Desc</th><th>Update/Delete</th></tr>
<%
do
{
%>
<tr><td><%=rs.getString(1)%></td><td><%=rs.getString(2) %></td><td><img src="myimg/<%=rs.getString(3) %>" height="100" width="100"></td><td><%=rs.getString(4) %></td><td><%=rs.getString(5) %></td><td><a href="CourseUpDe.jsp?cid=<%=rs.getString(1) %>" class="btn btn-primary">Update / Delete</a></td></tr>
<%
}
while(rs.next());
}
else
{	
}
}
catch(Exception ex)
{
out.println("Error: "+ex);	
}
%>

</table>
</center>

<%
}
catch(Exception ex)
{
response.sendRedirect("AdminLogin.jsp");	
}
%>
</form>
</body>
</html>