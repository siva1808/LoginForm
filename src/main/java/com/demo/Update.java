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
 * Servlet implementation class Update
 */
@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String a = request.getParameter("id");
		String b = request.getParameter("userName");
		String c = request.getParameter("em");
		String d = request.getParameter("pwd");
		
		try {
			PrintWriter out = response.getWriter();
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/student", "root", "root");
			String qry = "update reg set name='"+b+"', email='"+c+"', password='"+d+"' where id='"+a+"' ";
			PreparedStatement ps = con.prepareStatement(qry);
			
			int rs = ps.executeUpdate();
			
			if(rs>0) {
				out.print("<html><body><script>alert('Updated Successful')</script></body></html>");
				RequestDispatcher r = request.getRequestDispatcher("table.jsp");
				r.include(request, response);
			}else {
				out.print("<html><body><script>alert('Updated Unsuccessful')</script></body></html>");
				RequestDispatcher r = request.getRequestDispatcher("table.jsp");
				r.include(request, response);
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
