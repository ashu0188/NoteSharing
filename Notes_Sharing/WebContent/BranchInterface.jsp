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
<title>BRANCH INTERFACE</title>
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
if (!frm.bnm.value.match(/^[a-z A-Z]+$/) && frm.bnm.value !="")
{
frm.bnm.value="";
frm.bnm.focus();
//alert("Accept Only Alphabet...");
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
<form action="BranchSubmit.jsp" name="frm">
<center>
<table border="1" id="customers">
<caption><h3>Branch Interface</h3></caption>
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
<tr><td>Enter Branch Name</td><td><input type="text" name="bnm" onkeyup="AllowAlphabet()" class="form-control" required></td></tr>
<tr><td>Enter Branch Logo</td><td><input type="file" name="blogo" class="form-control" required></td></tr>
<tr><td>Enter Branch Desc</td><td><textarea name="bdesc" rows="5" class="form-control" cols="30"></textarea></td></tr>
<tr><td><input type="submit" class="btn btn-success"></td><td><input type="reset" class="btn btn-warning"></td></tr>
</table>
<table id="customers">
<caption><h3>Branch Display</h3></caption>
<%
try
{
ResultSet rs = DAO.displayRecord("select bid,cname,bname,blogo,bdesc from course c,branch b where c.cid=b.bid");
if(rs.next())
{
%>
<tr><th>Branch ID</th><th>Course Name</th><th>Branch Name</th><th>Branch Logo</th><th>Branch Desc</th><th>Update/Delete</th></tr>
<%
do
{
%>
<tr><td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td><td><img src="myimg/<%=rs.getString(4) %>" height="100" width="100"></td><td><%=rs.getString(5) %></td><td><a href="BranchUpDe.jsp?bid=<%=rs.getString(1) %>" class="btn btn-primary">Update / Delete</a></td></tr>
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