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
</head>
<body>

<%
try
{
	session=request.getSession(false);//used to create object for get session values.
	String sid = session.getValue("sid").toString();// get value
	String ltime = session.getValue("sltime").toString();
%>
<form action="SearchNotes1.jsp" target="a">
<center>
<table id="customers">
<caption><h3>Search Notes</h3></caption>
<tr><td><select name="sid" class="form-control"><option value="0">--Select Subject--</option>
<%
try
{
ResultSet rs = DAO.displayRecord("select * from branch");
if(rs.next())
{
do
{
	 %>
	 	<option value="<%=rs.getString(1) %>"><%=rs.getString(3) %></option>
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
</select></td><td><input type="text" name="snm" class="form-control"></td><td><input type="submit" value="Search" class="btn btn-info"></td></tr>
</table>
<iframe width="100%" style="border-left:0px #f1b458 solid;box-shadow: 5px 5px 20px #888888;border-top:height:auto;border-radius: 1px;" id="myFrame" name="a" frameborder="0" onload="sizeFrame('myFrame')"></iframe>
</center>

<%
}
catch(Exception ex)
{
response.sendRedirect("UserLogin.jsp");	
}
%>
</form>
</body>
</html>