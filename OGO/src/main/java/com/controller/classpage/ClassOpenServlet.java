package com.controller.classpage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ClassOpenServlet
 */
@WebServlet("/ClassOpenServlet")
public class ClassOpenServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String tutorId =request.getParameter("tutorId");
		String className =request.getParameter("className");
		String category =request.getParameter("category");
		String subCategory =request.getParameter("subCategory");
		String schedule =request.getParameter("classDate");
		String price =request.getParameter("classPrice");
		String place =request.getParameter("classPlace"); //classPlace는 나중에 수정
		String classStartTime =request.getParameter("classStartTime"); 
		String classEndTime =request.getParameter("classEndTime"); 
		String post =request.getParameter("post"); 
		String address1 =request.getParameter("address1"); 
		String address2 =request.getParameter("address2"); 
		
		String textClassInfo =request.getParameter("textClassInfo");
		String textTutorInfo =request.getParameter("textTutorInfo");
		String textNotice =request.getParameter("textNotice");
		String textAttention =request.getParameter("textAttention");
		
		System.out.println(tutorId+"\t"+className+"\t"+category+"\t"+subCategory+"\t"+schedule+"\t"+schedule);
		System.out.println(classStartTime+"\t"+classEndTime+"\t"+post+"\t"+address1+"\t"+address2);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
