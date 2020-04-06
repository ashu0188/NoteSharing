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

	userinfo u=new userinfo();
	u.setLoginid(request.getParameter("uid"));
	u.setPassword(request.getParameter("upwd"));
	ResultSet rs = DAO.displayRecord("select * from users where uloginid='"+u.getLoginid()+"' and upass='"+u.getPassword()+"'");
	if(rs.next())
	{
		if(rs.getString(11).equals("yes"))
		{
			session=request.getSession(true);//create session. create on server
			session.putValue("sid",u.getLoginid());// here lid is a local variable and suid is a session vari.
			session.putValue("sltime",new java.util.Date().toString());
			response.sendRedirect("UserHome.jsp");
		}
		else
		{
			out.println("User Not Active....");	
		}
	}
	else
	{
		out.println("ID / Password Not Matched...");	
	}
	
%>

</body>
</html>