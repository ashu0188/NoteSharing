package bs.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import bs.DB.DBHelper;

public class DAO
{
	static String provider="jdbc:mysql://localhost:3306/notes_sharing";
	static String uid="root";
	static String pwd="1234";
	public static String updateRecord(String q)
	{
	 try
	 {
		 Class.forName("com.mysql.jdbc.Driver").newInstance();
		 Connection cn=DriverManager.getConnection(provider,uid,pwd);
		 boolean st=DBHelper.executeUpdate(q,cn);
		 return "yes";
	 }
	 catch(Exception e)
	 {
		 return "Error"+e;
	 }
	 }
	public static ResultSet displayRecord(String q)
	{
	 try
	 {
		 Class.forName("com.mysql.jdbc.Driver").newInstance();
		 Connection cn=DriverManager.getConnection(provider,uid,pwd);
		 Statement smt=cn.createStatement();
		 ResultSet rs=DBHelper.executeQuery(q,cn);
		 return rs;
	 }
	 catch(Exception e)
	 {
		 return null;
	 }
	}	
}