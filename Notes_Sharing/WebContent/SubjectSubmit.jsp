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
subject s=new subject();
s.setBid(Integer.parseInt(request.getParameter("bid")));
s.setSname(request.getParameter("snm"));
s.setSsem(request.getParameter("ssem"));
s.setSdesc(request.getParameter("sdesc"));
s.setSnotes(request.getParameter("sfile"));
String q="insert into subject(bid,sname,ssem,sdesc,snotes) values('"+s.getBid()+"','"+s.getSname()+"','"+s.getSsem()+"','"+s.getSdesc()+"','"+s.getSnotes()+"')";
String rs = DAO.updateRecord(q);
if(rs.equalsIgnoreCase("yes"))
{
out.println("Record Inserted...");	
}
else
{
	out.println("Record Not Inserted...");	
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