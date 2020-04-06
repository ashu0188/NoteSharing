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
 * Servlet implementation class ForgotPassword1
 */
@WebServlet("/ForgotPassword1")
public class ForgotPassword1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPassword1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try {
			userinfo u=new userinfo();
			u.setEmail(request.getParameter("eid"));
			u.setDob(request.getParameter("dob"));
			String subject="Forgot Password...";
			String q="select * from users where uemail='"+u.getEmail()+"' and udob='"+u.getDob()+"'";
			//out.println(q);
			ResultSet r = DAO.displayRecord(q);
			if(r.next())
			{
				String msg="Password is: "+r.getString(10);
				Mailer.send(u.getEmail(), subject, msg);
				out.println("<script type=\"text/javascript\">");
				out.println("alert(\"message has been sent successfully\");");
				out.println("window.location= \"Userlogin.jsp\";");
				out.println("</script>");
				out.close();
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert(\"Email-ID and DOB Invalid...\");");
				out.println("window.location= \"UserLogin.jsp\";");
				out.println("</script>");
			}
		}
		catch(Exception ex)
		{
			out.println("Error: "+ex);	
		}
	}
}
