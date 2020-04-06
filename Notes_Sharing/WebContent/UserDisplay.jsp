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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
body {
margin-top: 2%
}
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td{
  border: 1px solid #ddd;
  padding-top: 7px;
  padding-bottom: 7px;
font-size:13px;font-weight:bold;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
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
String sid = session.getValue("suid").toString();// get value
String ltime = session.getValue("stime").toString();
%>
<center>
<div class="container">
<div class="row">
<div class="col-md-12">
<form action="#" method="get">
<div class="input-group">
<!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->
<input class="form-control" id="system-search" name="q" placeholder="Search for" required>
<span class="input-group-btn">
<button type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button>
</span>
</div>
</form>
</div>
<div class="col-md-12">
<table class="table table-list-search" id="customers">
<caption><h3>Show Users</h3></caption>
<%
try
{
ResultSet rs = DAO.displayRecord("select uid,uname,uemail,unumber,udob,ugender,uaddress,cname,uloginid,upass,ustatus from course c,users u where c.cid=u.ucourse");
if(rs.next())
{
%>
<tr><th>ID</th><th>Name</th><th>Email</th><th>Number</th><th>DOB</th><th>Gender</th><th>Address</th><th>Course</th><th>Status</th><th>Enhable / Disable</td></tr>
<%
do
{
	if(rs.getString(11).equals("no"))
	{
	%>
		<tr><td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td><td><%=rs.getString(4) %></td><td><%=rs.getString(5) %></td><td><%=rs.getString(6) %></td><td><%=rs.getString(7) %></td><td><%=rs.getString(8) %></td><td><%=rs.getString(11) %></td><td><a href="Active_NoActive.jsp?uid=<%=rs.getString(1)%>&st=yes" class="btn btn-primary">Enable</a></td></tr>
	<%
	}
	if(rs.getString(11).equals("yes"))
	{
	%>
		<tr><td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td><td><%=rs.getString(4) %></td><td><%=rs.getString(5) %></td><td><%=rs.getString(6) %></td><td><%=rs.getString(7) %></td><td><%=rs.getString(8) %></td><td><%=rs.getString(11) %></td><td><a href="Active_NoActive.jsp?uid=<%=rs.getString(1)%>&st=no" class="btn btn-primary">Disable</a></td></tr>
	<%
	}
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

<%
}
catch(Exception ex)
{
response.sendRedirect("AdminLogin.jsp");	
}
%>
</table>

</div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
var activeSystemClass = $('.list-group-item.active');

//something is entered in search form
$('#system-search').keyup( function() {
var that = this;
// affect all table rows on in systems table
var tableBody = $('.table-list-search tbody');
var tableRowsClass = $('.table-list-search tbody tr');
$('.search-sf').remove();
tableRowsClass.each( function(i, val) {

//Lower text for case insensitive
var rowText = $(val).text().toLowerCase();
var inputText = $(that).val().toLowerCase();
if(inputText != '')
{
$('.search-query-sf').remove();
tableBody.prepend('<tr class="search-query-sf"><td colspan="6"><strong>Searching for: "'
+ $(that).val()
+ '"</strong></td></tr>');
}
else
{
$('.search-query-sf').remove();
}

if( rowText.indexOf( inputText ) == -1 )
{
//hide rows
tableRowsClass.eq(i).hide();

}
else
{
$('.search-sf').remove();
tableRowsClass.eq(i).show();
}
});
//all tr elements are hidden
if(tableRowsClass.children(':visible').length == 0)
{
tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>');
}
});
});
</script>
</center>
</body>
</html>