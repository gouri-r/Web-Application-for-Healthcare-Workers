package com.voidmain.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.voidmain.dao.HibernateTemplate;

@WebServlet("/VoidmainServlet")
public class VoidmainServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	HttpServletRequest request;
	HttpServletResponse response;

	Object obj=null;
	String redirect=null;
	String operation=null;
	String type;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.request=request;
		this.response=response;

		try {
			
			type=request.getParameter("type");
			redirect=request.getParameter("redirect");
			operation=request.getParameter("operation");
				
			if(type!=null && redirect!=null)
			{
				if(operation.equals("add"))
				{
					obj=Class.forName(type).newInstance();
					Object object=HttpRequestParser.parseRequest(request, obj);

					if(HibernateTemplate.addObject(object)==1)
					{
						response.sendRedirect(redirect+"?status=success");
					}
					else
					{
						response.sendRedirect(redirect+"?status=failed");
					}					
				}
				else if(operation.equals("update"))
				{
					obj=Class.forName(type).newInstance();
					Object object=HttpRequestParser.parseRequest(request, obj);

					if(HibernateTemplate.updateObject(object)==1)
					{
						response.sendRedirect(redirect+"?status=success");
					}
					else
					{
						response.sendRedirect(redirect+"?status=failed");
					}
				}
			}
			else
			{
				System.out.println("in valid request");
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}
