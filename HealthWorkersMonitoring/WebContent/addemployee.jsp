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
	<h1>Add Employee</h1>
	<%
		}
	%>

	<form action="VoidmainServlet" method="post" name="appform">

		<input type="hidden" name="type" value="com.voidmain.pojo.Employee">
		<input type="hidden" name="redirect" value="addemployee.jsp">
		<input type="hidden" name="operation" value="add">
		
		<div class="form_settings">

			<p>
				<span>Name</span><input class="contact" type="text" name="name"
					value="" />
			</p>
			<p>
				<span>User Name</span><input class="contact" type="text"
					name="employeeid" value="" />
			</p>
			<p>
				<span>Password</span><input class="contact" type="password"
					name="password" value="" />
			</p>
			<p>
				<span>Mobile</span><input class="contact" type="text" name="mobile"
					value="" />
			</p>
			<p>
				<span>Email Address</span><input class="contact" type="text"
					name="email" value="" />
			</p>
			<p>
				<span>Select Area </span> <select name="area">
					<option value="dilsukhnagar">Dilsukhnagar</option>
					<option value="koti">Koti</option>
				</select>
			</p>
			<p style="padding-top: 15px">
				<span>&nbsp;</span><input class="submit" type="submit"
					name="contact_submitted" value="Add Employee"
					onclick="return validate()" />
			</p>
		</div>
	</form>
</div>
<%@include file="footer.jsp"%>