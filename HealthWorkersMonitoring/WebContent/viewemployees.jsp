<%@page import="com.voidmain.pojo.Employee"%>
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
		<h1>View Employees</h1>
		<%
			}
		%>

		<table style="width: 100%; border-spacing: 0;">
			<tr>
				<th>Employee ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Mobile</th>
				<th>Area</th>
				<th>Send Message</th>
				<th>Delete</th>
			</tr>

			<%
				for (Employee employee : HibernateDAO.getEmployees()) {
			%>

			<tr>
				<td><%=employee.getEmployeeid()%></td>
				<td><%=employee.getName()%></td>
				<td><%=employee.getEmail()%></td>
				<td><%=employee.getMobile()%></td>
				<td><%=employee.getArea()%></td>
				<td><a
					href="postmessage.jsp?postedto=<%=employee.getEmployeeid()%>">send</a></td>
				<td><a
					href="viewemployees.jsp?employeename=<%=employee.getEmployeeid()%>">delete</a></td>
			</tr>
			<%
				}
			%>
		</table>

		<%
			String employeeid = request.getParameter("employeename");

			if (employeeid != null) {
				if (HibernateTemplate.deleteObject(Employee.class, employeeid) == 1) {
					response.sendRedirect("viewemployees.jsp?status=success");
				} else {
					response.sendRedirect("viewemployees.jsp?status=failed");
				}
			}
		%>

	</div>
</div>
<%@include file="footer.jsp"%>