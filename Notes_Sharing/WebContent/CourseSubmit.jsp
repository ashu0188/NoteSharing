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
course c=new course();
c.setCname(request.getParameter("cname"));
c.setClogo(request.getParameter("clogo"));
c.setCdur(Integer.parseInt(request.getParameter("cdur")));
c.setCdesc(request.getParameter("cdesc"));
String q="insert into course(cname,clogo,cdur,cdesc) values('"+c.getCname()+"','"+c.getClogo()+"','"+c.getCdur()+"','"+c.getCdesc()+"')";
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