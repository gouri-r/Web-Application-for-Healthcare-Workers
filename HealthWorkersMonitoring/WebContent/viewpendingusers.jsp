<%@page import="com.voidmain.service.SMSSender"%>
<%@page import="com.voidmain.service.AppService"%>
<%@page import="java.util.Date"%>
<%@page import="com.voidmain.pojo.Dose"%>
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
		<h1>View Pending Users</h1>
		<%
			}
		%>
		
		<form action="viewpendingusers.jsp" method="post" name="appform">
	
			<div class="form_settings">
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
						name="contact_submitted" value="View"
						onclick="return validate()" />
				</p>
			</div>
		</form>
		
		<%
			String type=request.getParameter("type");
			
			if(type!=null)
			{
		%>
				<table style="width: 100%; border-spacing: 0;">
					<tr>
						<th>Aadhaar No</th>
						<th>Name</th>
						<th>Mobile</th>
						<th>Send Message</th>
					</tr>
					<%
						for (User user : HibernateDAO.getUsers()) {
							
							if(user.getEmployeeid().equals(username))
							{
								if(!AppService.isUserHadDose(user.getAddarno(),type))
								{
					%>			
								<tr>
									<td><%=user.getAddarno()%></td>
									<td><%=user.getName()%></td>
									<td><%=user.getMobile()%></td>
									<td><a href="viewpendingusers.jsp?mobile=<%=user.getMobile()%>&mtype=<%=type%>">send message</a></td>
								</tr>
					<%
								}
							}
						}
					%>
				</table>
		<%
				} 
		%>
		
		<%
			String mobile=request.getParameter("mobile");
			String mtype=request.getParameter("mtype");
			
			if(mobile!=null && mtype!=null)
			{
				String messsage="Please Take "+mtype+" in this month";
				
				if(SMSSender.sendSms(mobile,messsage))
				{
					response.sendRedirect("viewpendingusers.jsp?status=success");
				}
				else
				{
					response.sendRedirect("viewpendingusers.jsp?status=failed");
				}
			}
		%>
	</div>
</div>
<%@include file="footer.jsp"%>