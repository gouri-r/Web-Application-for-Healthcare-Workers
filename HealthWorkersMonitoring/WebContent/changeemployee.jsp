<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.pojo.Employee"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="org.hibernate.Hibernate"%>
<%@page import="com.voidmain.pojo.User"%>
<%@page import="java.util.Date"%>
<%@include file="header.jsp"%>

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
	<h1>Change Employee</h1>
	<%
		}
	%>

	<form action="changeemployee.jsp" method="post" name="appform">
	
		<div class="form_settings">

			<p>
				<span>Select Aadhaar No</span> 
				<select name="user" required="required">
					<option value="">--select--</option>
					<%
						for(User user : HibernateDAO.getUsers())
						{
					%>
							<option value="<%=user.getAddarno()%>"><%=user.getAddarno()%> -- <%=user.getEmployeeid()%> </option>
					<%		
						}
					%>
				</select>
			</p>
			<p>
				<span>Select Employee</span> 
				<select name="employee" required="required">
					<option value="">--select--</option>
					<%
						for(Employee employee : HibernateDAO.getEmployees())
						{
					%>
							<option value="<%=employee.getEmployeeid()%>"><%=employee.getEmployeeid()%></option>
					<%		
						}
					%>
				</select>
			</p>
			<p style="padding-top: 15px">
				<span>&nbsp;</span><input class="submit" type="submit"
					name="contact_submitted" value="Change Employee"
					onclick="return validate()" />
			</p>
		</div>
	</form>
	
	<%
		String user=request.getParameter("user");
		String emp=request.getParameter("employee");
		
		if(user!=null && emp!=null)
		{
			User obj=HibernateDAO.getUserById(user);
			obj.setEmployeeid(emp);
			
			if (HibernateTemplate.updateObject(obj) == 1) {
				response.sendRedirect("changeemployee.jsp?status=success");
			} else {
				response.sendRedirect("changeemployee.jsp?status=failed");
			}
		}
	%>
</div>
<%@include file="footer.jsp"%>