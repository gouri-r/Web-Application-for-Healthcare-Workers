<%@page import="com.voidmain.pojo.User"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
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
	<h1>Add User</h1>
	<%
		}
	%>

	<form action="VoidmainServlet" name="appform" method="post">

		<input type="hidden" name="type" value="com.voidmain.pojo.User">
		<input type="hidden" name="redirect" value="viewusers.jsp">
		<input type="hidden" name="employeeid" value="<%=username%>">
		<input type="hidden" name="operation" value="update">
		
		<%
			User user=HibernateDAO.getUserById(request.getParameter("username"));
			
			if(user!=null)
			{
		%>
			<input type="hidden" name="usertype" value="<%=user.getUsertype()%>">
			
			<div class="form_settings">
	
				<p>
					<span>Name</span><input class="contact" type="text" name="name"
						value="<%=user.getName()%>" required="required" readonly="readonly"/>
				</p>
				<p>
					<span>Aadhaar No</span><input class="contact" type="text"
						name="addarno" value="<%=user.getAddarno()%>" required="required" readonly="readonly"/>
				</p>
				<p>
					<span>Mobile</span><input class="contact" type="text" name="mobile"
						value="<%=user.getMobile()%>" required="required"/>
				</p>
				<p>
					<span>Age</span><input class="contact" type="text" name="age"
						value="<%=user.getAge()%>" required="required"/>
				</p>
				<p>
					<span>Weight</span><input class="contact" type="text" name="weight"
						required="required" value="<%=user.getWeight()%>"/>
				</p>
				<p>
					<span>Height</span><input class="contact" type="text" name="height"
						value="<%=user.getHeight()%>" required="required"/>
				</p>
				<p>
					<span>Address</span>
					<textarea class="contact" name="address" required="required"><%=user.getAddress()%></textarea>
				</p>
				<p style="padding-top: 15px">
					<span>&nbsp;</span><input class="submit" type="submit"
						name="contact_submitted" value="Update User"
						onclick="return validate()" />
				</p>
			</div>
		<%
			}
		%>
	</form>
</div>
<%@include file="footer.jsp"%>