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
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
body {
margin-top: 2%
}
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 98%;
}

#customers td{
  border: 1px solid #ddd;
  padding-top: 7px;
  padding-bottom: 7px;
  padding-left: 7px;
font-size:13px;font-weight:bold;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-left: 7px;
  padding-top: 7px;
  padding-bottom: 7px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
font-size:16px;font-weight:bold;
}
</style>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
</head>
<body>
<%
try
{
course c=new course();
c.setCid(Integer.parseInt(request.getParameter("cid")));
ResultSet rs = DAO.displayRecord("select * from course where cid="+c.getCid());
if(rs.next())
{
%>
<form action="CourseUpDe1.jsp">
<center>
<table border="1" id="customers">
<caption><h3>Course Update / Delete</h3></caption>
<tr><td>Course ID</td><td><input type="number" name="cid" value="<%=rs.getString(1) %>" class="form-control" readonly="true"></td></tr>
<tr><td>Course Name</td><td><input type="text" name="cnm" value="<%=rs.getString(2) %>" class="form-control"></td></tr>
<tr><td>Course Icon</td><td><img src="<%=rs.getString(3) %>" height="100" width="100"><input type="file" name="clogo" class="form-control"></td></tr>
<tr><td>Course Duration</td><td><input type="number" name="cdur" value="<%=rs.getString(4) %>" class="form-control"></td></tr>
<tr><td>Course Desc</td><td><textarea rows="5" cols="30" name="cdesc" class="form-control"><%=rs.getString(5) %></textarea></td></tr>
<tr><td><input type="submit" value="Update" name="btn" class="btn btn-success"></td><td><input type="submit" value="Delete" name="btn" class="btn btn-danger"></td></tr>
</table>
</center>
</form>
<%	
}
else
{
}
}
catch(Exception ex)
{
out.println("Error: "+ex);	
}
%>
</body>
</html>