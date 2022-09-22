package com.controller.classpage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.classpage.ClassService;

@WebServlet("/TutorSearchServlet")
public class TutorSearchServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String tutorId=request.getParameter("userId");
		System.out.println("tutorId:"+tutorId);
		ClassService service= new ClassService();
		int result =service.tutorSearch(tutorId); //tutor 등록 여부 확인
		System.out.println("tutor result:"+result);
		if (result == 1) {
			System.out.println("tutor 등록 확인");
			
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
