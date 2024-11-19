package com.demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String a = request.getParameter("userName");
		String b = request.getParameter("em");
		String c = request.getParameter("pwd");

		try {
			PrintWriter out = response.getWriter();
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
			String qry = "INSERT INTO reg(id, name, email, password) VALUES(?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(qry);
			ps.setInt(1, 0); // You need to provide this logic
			ps.setString(2, a); // For username
			ps.setString(3, b); // For email
			ps.setString(4, c); // For password

			int rs = ps.executeUpdate();
			if (rs > 0) {
				out.print("<html><body><script>alert('Registration Successful')</script></body></html>");
				RequestDispatcher r = request.getRequestDispatcher("table.jsp");
				r.include(request, response);
			} else {
				out.print("<html><body><script>alert('Registration Unsuccessful')</script></body></html>");
				RequestDispatcher r = request.getRequestDispatcher("index.html");
				r.include(request, response);
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
