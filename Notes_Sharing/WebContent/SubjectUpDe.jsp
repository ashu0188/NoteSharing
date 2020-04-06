<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*" %>
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
String sid = session.getValue("suid").toString();// get value
String ltime = session.getValue("stime").toString();
%>
<%
try
{
subject s=new subject();
s.setSid(Integer.parseInt(request.getParameter("sid")));
ResultSet rs = DAO.displayRecord("select * from subject where sid="+s.getSid());
if(rs.next())
{
%>
<form action="SubjectUpDe1.jsp">
<center>
<table border="1" id="customers">
<caption><h3>Subject Update / Delete</h3></caption>
<tr><td>Subject ID</td><td><input type="number" name="sid" value=<%=rs.getString(1) %> class="form-control" readonly="true"></td></tr>
<tr><td>Branch</td><td><select name="bid" value="<%=rs.getString(2) %>" class="form-control"><option value="<%=rs.getString(2) %>">--Select Branch--</option>
<%
try
{
ResultSet r = DAO.displayRecord("select * from branch");
if(r.next())
{
do
{
	 %>
	 	<option value="<%=r.getString(1) %>"><%=r.getString(3) %></option>
	 <%
}
while(r.next());
}
}
catch(Exception ex)
{
out.println("Error: "+ex);	
}
%>
</select></td></tr>
<tr><td>Enter Subject Name</td><td><input type="text" name="snm" class="form-control" value="<%=rs.getString(3) %>"></td></tr>
<tr><td>Enter Subject Sem</td><td><input type="number" name="ssem" class="form-control" value="<%=rs.getString(4) %>"></td></tr>
<tr><td>Enter Subject File</td><td><input type="file" name="sfile" class="form-control" value="<%=rs.getString(6) %>"></td></tr>
<tr><td>Enter Subject Desc</td><td><textarea name="sdesc" rows="5" class="form-control" cols="30"><%=rs.getString(5) %></textarea></td></tr>
<tr><td><input type="submit" value="Update" name="btn" class="btn btn-success"></td><td><input type="submit" value="Delete" name="btn" class="btn btn-danger"></td></tr>
</table>
</center>
</form>
<%	
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
</body>
</html>