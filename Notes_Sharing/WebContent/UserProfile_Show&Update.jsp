<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>
    <%@ page import="bs.DAO.*" %>
     <%@ page import="bs.DB.*" %>
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

	session=request.getSession(false);//used to create object for get session values.
	String sid = session.getValue("sid").toString();// get value
	String ltime = session.getValue("sltime").toString();
	ResultSet r = DAO.displayRecord("select * from users where uloginid='"+sid+"'");
	if(r.next())
	{
%>
<form action="UserProfileUpdate.jsp">
<center>
<caption><h3>User Show & Update</h3></caption>
<table id="customers">
<tr><td>ID</td><td><input type="text" name="lid" value="<%=r.getString(1)%>" class="form-control" readonly></td></tr>
<tr><td>Name</td><td><input type="text" name="unm" value="<%=r.getString(2)%>" class="form-control"></td></tr>
<tr><td>Email ID</td><td><input type="email" name="eid" value="<%=r.getString(3)%>" class="form-control"></td></tr>
<tr><td>Mobile Number</td><td><input type="number" name="umno" value="<%=r.getString(4)%>" class="form-control"></td></tr>
<tr><td>DOB</td><td><input type="date" name="dob" value="<%=r.getString(5)%>" class="form-control"></td></tr>
<% if(r.getString(6).equals("Male")){ %>
<tr><td>Gender</td><td><input type="radio" name="gen" value="Male" checked >Male<input type="radio" name="gen" value="Female">Female</td></tr>
<% } 
else if(r.getString(6).equals("Female")){ %>
<tr><td>Gender</td><td><input type="radio" name="gen" value="Male" >Male<input type="radio" name="gen" value="Female" checked>Female</td></tr>
<% } %>
<tr><td>Address</td><td><textarea name="sadd" rows="3" cols="30" class="form-control"><%=r.getString(7)%></textarea></td></tr>
<tr><td>Course</td><td><select name="cid" class="form-control"><option>--Select Course--</option>
<%
try
{
ResultSet rs = DAO.displayRecord("select * from course");
if(rs.next())
{
do
{
	 %>
	 	<option value="<%=rs.getString(1) %>"><%=rs.getString(2) %></option>
	 <%
}
while(rs.next());
}
}
catch(Exception ex)
{
out.println("Error: "+ex);	
}
%>
</select></td></tr>
<tr><td><input type="submit" value="Update" class="btn btn-primary"></td></tr>
</table>
</center>
</form>

<%
	}
%>
</body>
</html>