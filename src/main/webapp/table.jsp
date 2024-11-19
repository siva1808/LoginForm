<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Details</title>

<style type="text/css">

.reg-table{
	display: flex;
	flex-direction: column;
	align-items: center;
    text-align: center;
}
</style>

</head>
<body>

	<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
	String qry = "SELECT * FROM reg";
	PreparedStatement ps = con.prepareStatement(qry);
	ResultSet rs = ps.executeQuery();
	%>

	<div class="reg-table">
		<h1>Registration Details</h1>
		<table style="width: 70%; text-align: center; font-size: 22px;"  border="2px solid black" cellspacing="5px" cellpadding="10px">

			<thead>
				<tr>
					<th>id</th>
					<th>name</th>
					<th>email</th>
					<th>password</th>
					<th>modify</th>
				</tr>
			</thead>
			<tbody>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getInt(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td>
					<a href="update.jsp?em=<%=rs.getString(3) %>">Update</a>
					<a href="delete.jsp?em=<%=rs.getString(3) %>">Delete</a>
					</td>
				</tr>
				
				<%
				}
				%>

			</tbody>
		</table>
	</div>

</body>
</html>