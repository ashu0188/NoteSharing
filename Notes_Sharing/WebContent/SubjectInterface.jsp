<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import="bs.DAO.*"%>
<%@ page import="bs.DB.*"%>
<%@ page import="bs.Model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
body {
	margin-top: 2%
}

#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 98%;
}

#customers td {
	border: 1px solid #ddd;
	padding-top: 7px;
	padding-bottom: 7px;
	padding-left: 7px;
	font-size: 13px;
	font-weight: bold;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-left: 7px;
	padding-top: 7px;
	padding-bottom: 7px;
	text-align: left;
	background-color: #4CAF50;
	color: white;
	font-size: 16px;
	font-weight: bold;
}
</style>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="bootstrap.css" type="text/css" />
<script type="text/javascript">
	function AllowAlphabet() {
		if (!frm.snm.value.match(/^[a-z A-Z]+$/) && frm.snm.value != "") {
			frm.snm.value = "";
			frm.snm.focus();
			//alert("Accept Only Alphabet...");
			return false;
		}
		if (!frm.ssem.value.match(/^[0-9]+$/) && frm.ssem.value != "") {
			frm.ssem.value = "";
			frm.ssem.focus();
			//alert("Accept Only Alphabet...");
			return false;
		}
	}
</script>

</head>
<body>

	<%
		try {
			session = request.getSession(false);//used to create object for get session values.
			String sid = session.getValue("suid").toString();// get value
			String ltime = session.getValue("stime").toString();
	%>
	<form action="SubjectSubmit.jsp" name="frm">
		<center>
			<table border="1" id="customers">
				<caption>Subject Interface</caption>
				<tr>
					<td>Course</td>
					<td><select class="form-control" onChange="showState(this);"><option>--Select
								Course--</option>
							<%
								try {
										ResultSet rs = DAO.displayRecord("select * from course");
										if (rs.next()) {
											do {
							%>
							<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
							<%
								} while (rs.next());
										}
									} catch (Exception ex) {
										out.println("Error: " + ex);
									}
							%>
					</select></td>
				</tr>
				<tr>
					<td>Branch</td>
					<td><select class="form-control" onChange="showState(this);"><option>--Select
								Branch--</option>
							<%
								try {
										ResultSet rs = DAO.displayRecord("select * from branch");
										if (rs.next()) {
											do {
							%>
							<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
							<%
								} while (rs.next());
										}
									} catch (Exception ex) {
										out.println("Error: " + ex);
									}
							%>
					</select></td>
				</tr>
				<tr>
					<td>Enter Subject Name</td>
					<td><input type="text" name="snm" onkeyup="AllowAlphabet()"
						class="form-control" required></td>
				</tr>
				<tr>
					<td>Enter Subject Sem</td>
					<td><input type="text" name="ssem" onkeyup="AllowAlphabet()"
						class="form-control" required></td>
				</tr>
				<tr>
					<td>Enter Subject File</td>
					<td><input type="file" name="sfile" accept="docs/pdf"
						class="form-control" required></td>
				</tr>
				<tr>
					<td>Enter Subject Desc</td>
					<td><textarea name="sdesc" rows="5" cols="30"
							class="form-control"></textarea></td>
				</tr>
				<tr>
					<td><input type="submit" class="btn btn-success"></td>
					<td><input type="reset" class="btn btn-warning"></td>
				</tr>
				<script src="mtb/jquery-1.9.0.min.js"></script>
				<script>
				function showState(sel) {
						var cid = sel.options[sel.selectedIndex].value;
						$("#output1").html("");
						$("#output2").html("");
						if (cid.length > 0) {

							$
									.ajax({
										type : "POST",
										url : "mtb/fetch_state.jsp",
										data : "did=" + cid,
										cache : false,
										beforeSend : function() {
											$('#output1')
													.html(
															'<img src="mtb/loader.gif" alt="" width="24" height="24">');
										},
										success : function(html) {
											$("#output1").html(html);
										}
									});
						}
					}

					function showCity(sel) {
						var cid = sel.options[sel.selectedIndex].value;
						if (cid.length > 0) {
							$
									.ajax({
										type : "POST",
										url : "mtb/fetch_city.php",
										data : "cid=" + cid,
										cache : false,
										beforeSend : function() {
											$('#output2')
													.html(
															'<img src="mtb/loader.gif" alt="" width="24" height="24">');
										},
										success : function(html) {
											$("#output2").html(html);
										}
									});
						} else {
							$("#output2").html("");
						}
					}
				</script>
			</table>
			<table id="customers">
				<caption>
					<h3>Subject Display</h3>
				</caption>
				<%
					try {
							ResultSet rs = DAO.displayRecord(
									"select sid,bname,sname,ssem,sdesc,snotes from branch b,subject s where b.bid=s.sid");
							if (rs.next()) {
				%>
				<tr>
					<th>Subject ID</th>
					<th>Branch Name</th>
					<th>Subject Name</th>
					<th>Subject Sem</th>
					<th>Notes Download</th>
					<th>Subject Desc</th>
					<th>Update/Delete</th>
				</tr>
				<%
					do {
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><a href="myimg/<%=rs.getString(6)%>" download>Download</a></td>
					<td><%=rs.getString(5)%></td>
					<td><a href="SubjectUpDe.jsp?sid=<%=rs.getString(1)%>"
						class="btn btn-primary">Update / Delete</a></td>
				</tr>
				<%
					} while (rs.next());
							} else {
							}
						} catch (Exception ex) {
							out.println("Error: " + ex);
						}
				%>

			</table>
		</center>

		<%
			} catch (Exception ex) {
				response.sendRedirect("AdminLogin.jsp");
			}
		%>
	</form>
</body>
</html>