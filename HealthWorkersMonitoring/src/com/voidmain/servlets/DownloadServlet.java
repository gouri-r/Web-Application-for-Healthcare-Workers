package com.voidmain.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DownloadServlet")
public class DownloadServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		// Root Directory.
		String uploadRootPath = request.getServletContext().getRealPath("")+"/documents/";
		System.out.println("uploadRootPath=" + uploadRootPath);

		File uploadRootDir = new File(uploadRootPath);
		// Create directory if it not exists.
		if (!uploadRootDir.exists()) {
			uploadRootDir.mkdirs();
		}

		try {

			response.setContentType("text/html");  

			response.setContentType("APPLICATION/OCTET-STREAM");   

			response.setHeader("Content-Disposition","attachment; filename=\"" + request.getParameter("filename") + "\"");   

			FileInputStream fileInputStream = new FileInputStream(uploadRootPath+request.getParameter("filename"));  

			int i;   

			while ((i=fileInputStream.read()) != -1) {  
				out.write(i);   
			}   

			fileInputStream.close();   

			out.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
