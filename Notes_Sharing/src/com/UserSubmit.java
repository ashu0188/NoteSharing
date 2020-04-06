package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bs.DAO.*;
import bs.Model.*;

/**
 * Servlet implementation class UserSubmit
 */
@WebServlet("/UserSubmit")
public class UserSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserSubmit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try 
		{
			userinfo u=new userinfo();
			u.setName(request.getParameter("unm"));
			u.setEmail(request.getParameter("eid"));
			u.setNumber(request.getParameter("umno"));
			u.setDob(request.getParameter("dob"));
			u.setGender(request.getParameter("gen"));
			u.setAddress(request.getParameter("sadd"));
			u.setCourse(request.getParameter("cid"));
			u.setLoginid(request.getParameter("lid"));
			u.setPassword(request.getParameter("pwd"));
			String rpwd =request.getParameter("rpwd");
			String q="";
			if((u.getName().equals(""))||(u.getEmail().equals(""))||(u.getNumber().equals(""))||(u.getDob().equals(""))||(u.getGender().equals(""))||(u.getAddress().equals(""))||(u.getCourse().equals(""))||(u.getLoginid().equals(""))||(u.getPassword().equals("")))
			{
				out.println("All Field Required...");
			}
			else
			{
				q="select * from users where uemail='"+u.getEmail()+"'";
				ResultSet rs=DAO.displayRecord(q);
				if(rs.next())
				{
					if(rs.getString(3).equals(u.getEmail())||rs.getString(9).equals(u.getLoginid()))
					{
						out.print("<script type=\"text/javascript\">");
						out.print("alert(\"Email-ID Already Exists...\");");
						out.print("window.location= \"UserReg.jsp\";");
						out.print("</script>");
						if(rs.getString(9).equals(u.getLoginid()))
						{
							out.print("<script type=\"text/javascript\">");
							out.print("alert(\"Login-ID Already Exists...\");");
							out.print("window.location= \"UserReg.jsp\";");
							out.print("</script>");
						}
					}
				}
				else if(u.getPassword().equals(rpwd))
				{
					q="insert into users(uname,uemail,unumber,udob,ugender,uaddress,ucourse,uloginid,upass,ustatus) values('"+u.getName()+"','"+u.getEmail()+"',"+u.getNumber()+",'"+u.getDob()+"','"+u.getGender()+"','"+u.getAddress()+"','"+u.getCourse()+"','"+u.getLoginid()+"','"+u.getPassword()+"','no')";
					out.println(q);
					String r = DAO.updateRecord(q);
					if(r.equalsIgnoreCase("yes"))
					{
						String subject="Account Created...";
						String msg="Login-ID: "+u.getLoginid()+"\nPassword: "+u.getPassword();
						out.print("<script type=\"text/javascript\">");
						out.print("alert(\"Record Inserted...\");");
						//out.print("window.location= \"UserLogin.jsp\";");
						out.print("</script>");
						Mailer.send(u.getEmail(), subject, msg);
						out.print("<script type=\"text/javascript\">");
						out.print("alert(\"message has been sent successfully\");");
						out.print("window.location= \"UserLogin.jsp\";");
						out.print("</script>");
						out.close();
					}
					else
					{
						out.print("<script type=\"text/javascript\">");
						out.print("alert(\"Record Not Inserted...\");");
						out.print("window.location= \"UserReg.jsp\";");
						out.print("</script>");
						
					}
				}
				else
				{
					out.print("<script type=\"text/javascript\">");
					out.print("alert(\"Password Not Matched...\");");
					out.print("window.location= \"UserReg.jsp\";");
					out.print("</script>");
					
				}
			}
}
catch(Exception ex)
{
out.println("Error: "+ex);	
}
	}
}
