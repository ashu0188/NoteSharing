<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	session=request.getSession(false);//get session from server
	session.getValue("slid").toString();// we get session id 
	session.getValue("sltime").toString();// we get session time
	session.invalidate();
	response.sendRedirect("AdminLogin.jsp");
}
catch(Exception ex)
{
	response.sendRedirect("AdminLogin.jsp");
}
%>
</body>
</html>