<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@ page import="bs.DAO.*" %>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
      String country=request.getParameter("did"); 
      out.println("<select name='bid' onChange='showCity(this);'class=\"form-control\" ><option>Select</option>"); 
      try{
            /* Class.forName("com.mysql.jdbc.Driver").newInstance(); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/notes_sharing","root",""); 
            Statement stmt = con.createStatement(); 
             */
             String q="select * from branch where cid='"+country+"'";
             out.println(q);
             ResultSet rs = DAO.displayRecord(q); //stmt.executeQuery("Select * from branch where cid='"+country+"' "); 
            while(rs.next()){
            out.println("<option value='"+rs.getString(1)+"'>"+rs.getString(3)+"</option>"); 
            } 
            out.println("</select>"); 
            //response.getWriter().println(buffer);
      }
      catch(Exception e){
            System.out.println(e);
      }
%>

</body>
</html>