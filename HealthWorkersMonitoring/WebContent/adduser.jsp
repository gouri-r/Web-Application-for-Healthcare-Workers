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

	<form action="VoidmainServlet" method="post" name="appform">

		<input type="hidden" name="type" value="com.voidmain.pojo.User">
		<input type="hidden" name="redirect" value="adduser.jsp">
		<input type="hidden" name="operation" value="add">
		<input type="hidden" name="employeeid" value="<%=username%>">

		<div class="form_settings">

			<p>
				<span>Name*</span><input class="contact" type="text" name="name"
					value="" required="required" pattern="[A-Za-z]"/>
			</p>
			<p>
				<span>Aadhaar No*</span><input class="contact" type="text"
					name="addarno" value="" required="required" pattern="[0-9]{12}"/>
			</p>
			<p>
				<span>Mobile*</span><input class="contact" type="text" name="mobile"
					value="" required="required" pattern="[789][0-9]{9}"/>
			</p>
			<p>
				<span>Age*</span><input class="contact" type="number" name="age"
					value="" required="required"/>
			</p>
			<p>
				<span>Weight*</span><input class="contact" type="text" name="weight"
					value="" required="required"/>
			</p>
			<p>
				<span>Height*</span><input class="contact" type="text" name="height"
					value="" required="required"/>
			</p>
			<p>
				<span>Address*</span>
				<textarea class="contact" name="address" required="required"></textarea>
			</p>
			<p>
				<span>Select Type*</span> <select name="usertype" required="required">
					<option value="">--select--</option>
					<option value="women">Women</option>
					<option value="child">child</option>
				</select>
			</p>
			<p style="padding-top: 15px">
				<span>&nbsp;</span><input class="submit" type="submit"
					name="contact_submitted" value="Add User"
					onclick="return validate()" />
			</p>
		</div>
	</form>
</div>
<%@include file="footer.jsp"%>