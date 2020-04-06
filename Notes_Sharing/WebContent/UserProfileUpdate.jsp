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
	u.setUid(Integer.parseInt(request.getParameter("lid")));
	u.setName(request.getParameter("unm"));
	u.setEmail(request.getParameter("eid"));
	u.setNumber(request.getParameter("umno"));
	u.setDob(request.getParameter("dob"));
	u.setGender(request.getParameter("gen"));
	u.setAddress(request.getParameter("sadd"));
	u.setCourse(request.getParameter("cid"));
	String q="";
	if(u.getCourse().equals("--Select Course--")){
		q="update `users` set `uname`='"+u.getName()+"', `uemail`='"+u.getEmail()+"', `unumber`="+u.getNumber()+", `udob`='"+u.getDob()+"', `ugender`='"+u.getGender()+"', `uaddress`='"+u.getAddress()+"' where uid="+u.getUid()+"";
	}
	else{
		q="update `users` set `uname`='"+u.getName()+"', `uemail`='"+u.getEmail()+"', `unumber`="+u.getNumber()+", `udob`='"+u.getDob()+"', `ugender`='"+u.getGender()+"', `uaddress`='"+u.getAddress()+"',`ucourse`='"+u.getCourse()+"' where uid="+u.getUid()+"";
	}
	out.println(q);
	String r = DAO.updateRecord(q);
	if(r.equalsIgnoreCase("yes"))
	{
		out.println("Record Update...");	
	}
	else
	{
	out.println("Record Not Update...");	
	}
%>
</body>
</html>