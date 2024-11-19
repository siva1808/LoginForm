<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Form</title>

<link
	href="//fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500;700;900&display=swap"
	rel="stylesheet">
<!--/Style-CSS -->
<link rel="stylesheet" href="home/css/style.css" type="text/css"
	media="all" />
<link rel="stylesheet" href="home/css/styles.css" type="text/css"
	media="all" />

<!--//Style-CSS -->

<link rel="stylesheet" href="home/css/font-awesome.min.css"
	type="text/css" media="all">

</head>
<body>

	<%
	String a = request.getParameter("em");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
	String qry = "SELECT * FROM reg where email='" + a + "'";
	PreparedStatement ps = con.prepareStatement(qry);
	ResultSet rs = ps.executeQuery();
	%>

	<%
	while (rs.next()) {
	%>

	<div id="block" class="w3lvide-content"
		data-vide-bg="home/images/freelan"
		data-vide-options="position: 0% 50%">
		<!-- /form -->
		<div class="workinghny-form-grid">
			<div class="main-hotair">
				<div class="content-wthree">
					<h1>Update Form</h1>

					<form action="Update" method="post">
						<input type="text" class="text" name="id"
							value="<%=rs.getInt(1)%>" required="" autofocus
							readonly="readonly"> <input type="text" class="text"
							name="userName" value="<%=rs.getString(2)%>" required=""
							autofocus> <input type="email" class="text" name="em"
							value="<%=rs.getString(3)%>" required=""> <input
							type="text" class="password" name="pwd"
							value="<%=rs.getString(4)%>" required="">
						<button class="btn" type="submit">Update</button>
					</form>

					<p class="continue">
						<span>Or create account using social media!</span>
					</p>
					<div class="social-login">
						<a href="#facebook"> <span class="fa fa-facebook"
							aria-hidden="true"></span>


						</a> <a href="#twiter"> <span class="fa fa-twitter"
							aria-hidden="true"></span>

						</a> <a href="#google"> <span class="fa fa-google-plus"
							aria-hidden="true"></span>

						</a> <a href="#insta"> <span class="fa fa-pinterest"
							aria-hidden="true"></span>
						</a>
					</div>
				</div>

			</div>


			<!-- copyright-->
			<div class="copyright text-center">
				<p class="copy-footer-29">
					© 2024 Register Form. All rights reserved | Design by <a
						href="https://w3layouts.com">siva_vk_</a>
				</p>
			</div>
		</div>
		<!-- //copyright-->
	</div>
	<!-- //form section start -->
	<!-- js -->
	<script src="home/js/jquery.min.js"></script>
	<!-- //js -->
	<script src="home/js/jquery.vide.js"></script>
	<script>
		//    $(document).ready(function () {
		//        $("#block").vide("video/ocean"); // Non declarative initialization
		//
		//        var instance = $("#block").data("vide"); // Get instance
		//        var video = instance.getVideoObject(); // Get video object
		//        instance.destroy(); // Destroy instance
		//    });
	</script>

	<%
	}
	%>

</body>
</html>