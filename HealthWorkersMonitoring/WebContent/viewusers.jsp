<%@page import="com.voidmain.pojo.User"%>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="java.util.List"%>
<%@include file="header.jsp"%>

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
		<h1>View Users</h1>
		<%
			}
		%>
		
		<table style="width: 100%; border-spacing: 0;">
			<tr>
				<th>Aadhaar No</th>
				<th>Name</th>
				<th>Mobile</th>
				<th>Age</th>
				<th>Weight</th>
				<th>Height</th>
				<th>Address</th>
				<th>Type</th>
				<th>Update</th>
				<th>Add Dose</th>
				<th>Delete</th>
			</tr>

			<%
				for (User user : HibernateDAO.getUsers()) {
					
					if(user.getEmployeeid().equals(username))
					{
			%>
						<tr>
							<td><%=user.getAddarno()%></td>
							<td><%=user.getName()%></td>
							<td><%=user.getMobile()%></td>
							<td><%=user.getAge()%></td>
							<td><%=user.getWeight()%></td>
							<td><%=user.getHeight()%></td>
							<td><%=user.getAddress()%></td>
							<td><%=user.getUsertype()%></td>
							<td><a
								href="updateuser.jsp?username=<%=user.getAddarno()%>">update</a></td>
							<td><a
								href="adddose.jsp?username=<%=user.getAddarno()%>">add dose</a></td>
							<td><a
								href="viewusers.jsp?username=<%=user.getAddarno()%>">delete</a></td>
						</tr>
			<%
					}
				}
			%>
		</table>

		<%
			String userid = request.getParameter("username");

			if (userid != null) {
				if (HibernateTemplate.deleteObject(User.class, userid) == 1) {
					response.sendRedirect("viewusers.jsp?status=success");
				} else {
					response.sendRedirect("viewusers.jsp?status=failed");
				}
			}
		%>

	</div>
</div>
<%@include file="footer.jsp"%>