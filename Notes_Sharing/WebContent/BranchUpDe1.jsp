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
branch b=new branch();
b.setBid(Integer.parseInt(request.getParameter("bid")));
b.setCid(Integer.parseInt(request.getParameter("cid")));
b.setBname(request.getParameter("bnm"));
b.setBdesc(request.getParameter("bdesc"));
b.setBlogo(request.getParameter("blogo"));
String btn=request.getParameter("btn");
if(btn.equals("Update"))
{
String q="update branch set cid="+b.getCid()+",bname='"+b.getBname()+"',blogo='"+b.getBlogo()+"',bdesc='"+b.getBdesc()+"' where bid="+b.getBid()+"";
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
else if(btn.equals("Delete"))
{
	String q="delete from branch where bid="+b.getBid()+"";
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
</body>
</html>