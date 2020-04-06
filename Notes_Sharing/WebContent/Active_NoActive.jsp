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
try
{
	userinfo u=new userinfo();
	u.setUid(Integer.parseInt(request.getParameter("uid")));
	u.setStatus(request.getParameter("st"));
	if(u.getStatus().equals("yes"))
	{
		String q="update `users` set `ustatus`='yes' where uid='"+u.getUid()+"'";
		out.println(q);
		String r = DAO.updateRecord(q);
		if(r.equalsIgnoreCase("yes"))
		{
			out.println("Active...");	
		}
		else
		{
			out.println("No Active...");	
		}
	}
	else if(u.getStatus().equals("no"))
	{
		String q="update `users` set `ustatus`='no' where uid='"+u.getUid()+"'";
		out.println(q);
		String r = DAO.updateRecord(q);
		if(r.equalsIgnoreCase("yes"))
		{
			out.println("Active...");	
		}
		else
		{
			out.println("No Active...");	
		}
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