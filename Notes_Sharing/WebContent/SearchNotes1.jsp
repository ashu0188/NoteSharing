<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@ page import="bs.DAO.*" %>
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
<center>
<table id="customers">
<%
try
{
	String cid = request.getParameter("sid").toString();
	String snm = request.getParameter("snm").toString();
	String q="";
	if(!cid.equalsIgnoreCase("0")&&snm.equalsIgnoreCase(""))
	{
		//out.println("Query: 1<br>");
		q="select sid,bname,sname,ssem,sdesc,snotes from branch b,subject s where b.bid=s.bid and s.bid='"+cid+"'";
	}
	else if(cid.equalsIgnoreCase("0")&&!snm.equalsIgnoreCase(""))
	{
		//out.println("Query: 2<br>");
		q="select sid,bname,sname,ssem,sdesc,snotes from branch b,subject s where b.bid=s.bid and s.sname like '%"+snm+"%'";	
	}
	else if(!cid.equalsIgnoreCase("0")&&!snm.equalsIgnoreCase(""))
	{		
		//out.println("Query: 3<br>");
		q="select sid,bname,sname,ssem,sdesc,snotes from branch b,subject s where b.bid=s.bid and s.bid='"+cid+"' and s.sname like '%"+snm+"%'";	
	}
	else
	{		
		//out.println("Query: 4<br>");
		q="select sid,bname,sname,ssem,sdesc,snotes from branch b,subject s where b.bid=s.bid";	
	}
	
	
	//out.println(q);
	ResultSet rs = DAO.displayRecord(q);
	if(rs.next())
	{
	%>
	<caption>Notes Display</caption>
	<tr><th>Subject ID</th><th>Branch Name</th><th>Subject Name</th><th>Subject Sem</th><th>Notes Download</th><th>Description</th></tr>
	<%
	do
	{
	%>
	<tr><td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td><td><%=rs.getString(4) %></td><td><a href="myimg/<%=rs.getString(6) %>" download >Download</a></td><td><%=rs.getString(5) %></td></tr>
	<%	
	}while(rs.next());
	}
}
catch(Exception ex)
{
out.println("Error: "+ex);	
}
%>
</table></center>
</body>
</html>