<!DOCTYPE HTML>
<%@page import="com.voidmain.pojo.Employee"%>
<%@page import="com.voidmain.service.MailService"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<html>

<head>
<title>Voidmain</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="style/style.css"
	title="style" />
</head>

<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<div id="logo_text">
					<!-- class="logo_colour", allows you to change the colour of the text -->
					<h2>
						<a href="#">WEB APPLICATION FOR HEALTH WORKERS TO MONITOR NUTRITION AMONG WOMEN AND CHILDREN</a>
					</h2>
				</div>
			</div>
			<div id="menubar">
				<ul id="menu">

					<li><a href="index.jsp">Login</a></li>
			
				</ul>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">
			<div id="content">
				<!-- insert the page content here -->
				<%
					String status = request.getParameter("status");

					if (status != null) {
				%>
				<h1><%=status%></h1>
				<%
					} else {
				%>
				<h1>Get Your Password</h1>
				<%
					}
				%>

				<form action="forgotpassword.jsp">
					<div class="form_settings">

						<p>
							<span>Employee Name :</span><input class="contact" type="text"
								name="employeename" value="" />
						</p>
						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="submit" type="submit"
								name="contact_submitted" value="Get Password" />
						</p>
					</div>
				</form>

				<%
					String employeename = request.getParameter("employeename");

					if (employeename != null) {
						Employee employee = HibernateDAO.getEmployeeById(employeename);

						MailService.mailsend("Your Account Passwrod is :", employee.getPassword(), employee.getEmail());

						response.sendRedirect("login.jsp");
					}
				%>
			</div>
		</div>
	</div>
</body>
</html>
