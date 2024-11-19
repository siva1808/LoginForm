package com.demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String a = request.getParameter("em");
		String b = request.getParameter("pwd");
		
		try {
			PrintWriter out = response.getWriter();
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
			String qry = "SELECT * FROM reg WHERE email='"+a+"' and password='"+b+"' ";
			PreparedStatement ps = con.prepareStatement(qry);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				out.print("<html><body><script>alert('Login Successful')</script></body></html>");
				RequestDispatcher r = request.getRequestDispatcher("index.html");
				r.include(request, response);
			}else {
				out.print("<html><body><script>alert('Login Unsuccessful')</script></body></html>");
				RequestDispatcher r = request.getRequestDispatcher("login.html");
				r.include(request, response);
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
