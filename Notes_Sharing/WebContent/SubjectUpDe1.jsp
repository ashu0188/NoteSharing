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
s.setSid(Integer.parseInt(request.getParameter("sid")));
s.setBid(Integer.parseInt(request.getParameter("bid")));
s.setSname(request.getParameter("snm"));
s.setSsem(request.getParameter("ssem"));
s.setSnotes(request.getParameter("sfile"));
s.setSdesc(request.getParameter("sdesc"));
String btn=request.getParameter("btn");
if(btn.equals("Update"))
{
	if(s.getSnotes().equals(""))
	{
		String q="update subject set sname='"+s.getSname()+"',ssem='"+s.getSsem()+"',sdesc='"+s.getSdesc()+"' where sid="+s.getSid()+"";
		out.println(q);
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
	else
	{
		String q="update subject set bid="+s.getBid()+",sname='"+s.getSname()+"',ssem='"+s.getSsem()+"',sdesc='"+s.getSdesc()+"',snotes='"+s.getSnotes()+"' where sid="+s.getSid()+"";
		out.println(q);
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
}
else if(btn.equals("Delete"))
{
	String q="delete from subject where sid="+s.getSid()+"";
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