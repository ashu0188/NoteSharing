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
c.setCid(Integer.parseInt(request.getParameter("cid")));
c.setCname(request.getParameter("cnm"));
c.setClogo(request.getParameter("clogo"));
c.setCdur(Integer.parseInt(request.getParameter("cdur")));
c.setCdesc(request.getParameter("cdesc"));
String btn=request.getParameter("btn");
if(btn.equals("Update"))
{
String q="update course set cid="+c.getCid()+",cname='"+c.getCname()+"',clogo='"+c.getClogo()+"',cduration='"+c.getCdur()+"',cdesc='"+c.getCdesc()+"' where cid="+c.getCid()+"";
String rs = DAO.updateRecord(q);
if(rs.equalsIgnoreCase("yes"))
{
out.println("Record Updated...");	
}
else
{
	out.println("Record Not Updated...");	
	}
}
else if(btn.equals("Delete"))
{
	String q="delete from course where cid="+c.getCid()+"";
	String rs = DAO.updateRecord(q);
	if(rs.equalsIgnoreCase("yes"))
	{
	out.println("Record Deleted...");	
	}
	else
	{
		out.println("Record Not Deleted...");	
		}
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