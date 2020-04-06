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
	session=request.getSession(false);//used to create object for get session values.
	String sid = session.getValue("sid").toString();// get value
	String ltime = session.getValue("sltime").toString();
	if(session.equals(sid))
	{
		session.invalidate();
		response.sendRedirect("UserLogin.jsp");
	}
	else
	{
		session.invalidate();
		response.sendRedirect("UserLogin.jsp");
	}
}
catch(Exception ex)
{
	session.invalidate();
	response.sendRedirect("UserLogin.jsp");
}
%>
</body>
</html>