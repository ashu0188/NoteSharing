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
<title>BranchSubmit</title>
</head>
<body>
<%
branch b=new branch();
b.setCid(Integer.parseInt(request.getParameter("cid")));
b.setBname(request.getParameter("bname"));
b.setBdesc(request.getParameter("bdesc"));
b.setBlogo(request.getParameter("blogo"));
String q="insert into branch(cid,bname,blogo,bdesc) values('"+b.getCid()+"','"+b.getBname()+"','"+b.getBlogo()+"','"+b.getBdesc()+"')";
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
</body>
</html>