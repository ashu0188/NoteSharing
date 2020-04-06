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
<center>
<table id="customers">
<caption><h3>Branch Display</h3></caption>
<%
try
{
	branch b=new branch();
b.setCid(Integer.parseInt(request.getParameter("cid")));
ResultSet rs = DAO.displayRecord("select bid,cname,bname,blogo,bdesc from course c,branch b where c.cid=b.cid and b.cid="+b.getCid()+"");
if(rs.next())
{
%>
<tr><th>Branch ID</th><th>Course Name</th><th>Branch Name</th><th>Branch Logo</th><th>Branch Desc</th><th>Show Subject</th></tr>
<%
do
{
%>
<tr><td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td><td><img src="myimg/<%=rs.getString(4) %>" height="70" width="70"></td><td><%=rs.getString(5) %></td><td><a href="Branch_Wise_Subject.jsp?bid=<%=rs.getString(1) %>" class="btn btn-danger">Subject</a></td></tr>
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
response.sendRedirect("UserLogin.jsp");	
}
%>
</body>
</html>