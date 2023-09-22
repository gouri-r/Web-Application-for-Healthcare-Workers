<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.pojo.Dose"%>
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
	<h1>Add Dose</h1>
	<%
		}
	%>

	<form action="adddose.jsp" name="appform">
	
		<input type="hidden" name="username" value="<%=request.getParameter("username")%>">

		<div class="form_settings">
			
			<p>
				<span>Aadhaar No</span>
				<input type="text" class="contact" name="aadhaarno" value="<%=request.getParameter("username")%>">
			</p>
				
			<p>
				<span>Select Type</span> 
				<select name="type" required="required">
					<option value="">--select--</option>
					<option value="medicine">medicine</option>
					<option value="food">food</option>
				</select>
			</p>
			<p style="padding-top: 15px">
				<span>&nbsp;</span><input class="submit" type="submit"
					name="contact_submitted" value="Issue"
					onclick="return validate()" />
			</p>
		</div>
	</form>
	
	<%
		String aadhaarno=request.getParameter("aadhaarno");
		String type=request.getParameter("type");
		
		if(aadhaarno!=null && type!=null)
		{
			Dose dose=new Dose();
			dose.setDate(new Date());
			dose.setType(type);
			dose.setUserid(aadhaarno);
			
			if (HibernateTemplate.addObject(dose) == 1) {
				response.sendRedirect("viewusers.jsp?status=success");
			} else {
				response.sendRedirect("viewusers.jsp?status=failed");
			}
		}
	%>
</div>
<%@include file="footer.jsp"%>