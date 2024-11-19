<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	PrintWriter o = response.getWriter();
	String a = request.getParameter("em");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
	String qry = "delete from reg where email='"+a+"'";
	PreparedStatement ps = con.prepareStatement(qry);
	int rs = ps.executeUpdate();
	
	if(rs>0){
		o.print("<html><body><script>alert('Delete Successful')</script></body></html>");
		RequestDispatcher r = request.getRequestDispatcher("table.jsp");
		r.include(request, response);
	}else{
		o.print("<html><body><script>alert('Delete Unsuccessful')</script></body></html>");
		RequestDispatcher r = request.getRequestDispatcher("table.jsp");
		r.include(request, response);
	}
	
%>

</body>
</html>