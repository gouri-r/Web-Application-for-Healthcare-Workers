<!DOCTYPE HTML>
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

					 <%
						String role = (String) request.getSession().getAttribute("role");
						String username = (String) request.getSession().getAttribute( "username");
						
						if (role.equals("admin")) {
					%>
						<li><a href="addemployee.jsp">Add Employee</a></li>
						<li><a href="viewemployees.jsp">View Employees</a></li>
						<li><a href="viewmessages.jsp">View Messages</a></li>
						<li><a href="changeemployee.jsp">Change Employee</a></li>
					<%
						}
					%>
					<%
						if (role.equals("user")) {
					%>
						<li><a href="adduser.jsp">Add User</a></li>
						<li><a href="viewusers.jsp">View Users</a></li>
						<li><a href="viewmessages.jsp">View Messages</a></li>
						<li><a href="viewpendingusers.jsp">View Pending Users</a></li>
						<li><a href="postmessage.jsp?postedto=admin">Send Message</a></li>					
					<%
						}
					%>
					
					<li><a href="logout.jsp">Logout</a></li>

				</ul>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">