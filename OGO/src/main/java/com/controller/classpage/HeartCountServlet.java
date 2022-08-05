package com.controller.classpage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.classpage.HeartService;

/**
 * Servlet implementation class HeartCountServlet
 */
@WebServlet("/HeartCountServlet")
public class HeartCountServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int classNum= Integer.parseInt(request.getParameter("classNum"));
		System.out.println("HeartCountServlet=="+classNum);
		
		HeartService hservice= new HeartService();
		int count =hservice.heartCount(classNum);
		System.out.println("class heart count : "+count);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print(count);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
