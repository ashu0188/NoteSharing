<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMINCHECKLOGIN</title>
</head>
<body>
<%
String lid=request.getParameter("lid");
String pwd=request.getParameter("pwd");
if(lid.equals("admin")&&pwd.equals("admin"))
{
		session=request.getSession(true);//create session. create on server
		session.putValue("suid",lid);// here lid is a local variable and suid is a session vari.
		session.putValue("stime",new java.util.Date().toString());
		response.sendRedirect("AdminHome.jsp");
}
else
{
out.println("ID / Password Not Matched...");	
}
%>

</body>
</html>