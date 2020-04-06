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
</head>
<body>

<%
try
{
session=request.getSession(false);//used to create object for get session values.
String sid = session.getValue("sid").toString();// get value
String ltime = session.getValue("sltime").toString();
String opwd = request.getParameter("opwd");
String npwd = request.getParameter("npwd");
String rpwd = request.getParameter("rnpwd");
String q="";
q="select * from users where uloginid='"+sid+"'";
ResultSet rs=DAO.displayRecord(q);
if(rs.next())
{
	if(rs.getString(10).equals(opwd))
	{
		if(opwd.equals(npwd))
		{
			out.println("old password and new password are the same.");
		}
		else if(npwd.equals(rpwd))
		{
			q="update users set upass='"+npwd+"' where uloginid='"+sid+"' and upass='"+opwd+"'";
			out.println(q);
			String r = DAO.updateRecord(q);
			out.println(r);
			if(r.equals("yes"))
			{
				out.println("Password Changed...");	
				//session.invalidate();
		        //response.sendRedirect("UserLogin.jsp");
			}
			else
			{
				out.println("Password Not Changed...");	
			}
		}
		else
		{
			out.println("Password Not Matched...");	
		}
	}
	else
	{
		out.println("Old Password Incorrect...");	
	}
}
else
{
	out.println(q);		
}
%>
<%
}

catch(Exception ex)
{
response.sendRedirect("UserLogin.jsp");	
}
%>
</body>
</html>