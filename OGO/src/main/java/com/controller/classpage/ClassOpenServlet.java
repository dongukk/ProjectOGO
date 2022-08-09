package com.controller.classpage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.classpage.ClassDTO;
import com.service.classpage.ClassService;

import oracle.security.pki.ssl.ClassServer;

/**
 * Servlet implementation class ClassOpenServlet
 */
@WebServlet("/ClassOpenServlet")
public class ClassOpenServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String userId =request.getParameter("tutorId"); //나중에 tutorId로 수정
		String className =request.getParameter("className");
		String category =request.getParameter("category");
		String subCategory =request.getParameter("subCategory");
		//String classDate =request.getParameter("classDate");
		String schedule1 =request.getParameter("schedule1").replace("&nbsp;", " "); //1회차 일정 저장
		String schedule2 =request.getParameter("schedule2").replace("&nbsp;", " "); //1회차 일정 저장
		String schedule3 =request.getParameter("schedule3").replace("&nbsp;", " "); //1회차 일정 저장
		String schedule4 =request.getParameter("schedule4").replace("&nbsp;", " "); //1회차 일정 저장
		String schedule5 =request.getParameter("schedule5").replace("&nbsp;", " "); //1회차 일정 저장
		String schedule6 =request.getParameter("schedule6").replace("&nbsp;", " "); //1회차 일정 저장
		String schedule7 =request.getParameter("schedule7").replace("&nbsp;", " "); //1회차 일정 저장
		String schedule8 =request.getParameter("schedule8").replace("&nbsp;", " "); //1회차 일정 저장
		String schedule9 =request.getParameter("schedule9").replace("&nbsp;", " "); //1회차 일정 저장
		String schedule10 =request.getParameter("schedule10").replace("&nbsp;", " "); //1회차 일정 저장
		String price =request.getParameter("classPrice");
		//String place =request.getParameter("classPlace"); //classPlace는 나중에 수정
		String classStartTime =request.getParameter("classStartTime"); 
		String classEndTime =request.getParameter("classEndTime"); 
		String post =request.getParameter("post"); 
		String address1 =request.getParameter("address1"); 
		String address2 =request.getParameter("address2");
		
		String place= "("+post+")"+address1+address2;
		//System.out.println(schedule1+"--"+schedule2+"--"+schedule3);
		
		String textClassInfo =request.getParameter("textClassInfo");
		String textTutorInfo =request.getParameter("textTutorInfo");
		String textNotice =request.getParameter("textNotice");
		String textAttention =request.getParameter("textAttention");
		
		
		//class테이블에 저장
		//ClassDTO cDTO= new ClassDTO(0, className, userId, category, Integer.parseInt(price), schedule1, place);
		ClassDTO cDTO= new ClassDTO(0, className, userId, subCategory, Integer.parseInt(price), 
				schedule1, schedule2, schedule3, schedule4, schedule5, schedule6, 
				schedule7, schedule8, schedule9, schedule10, place);
		ClassService service= new ClassService();
		int result =service.classOpen(cDTO);
		
		System.out.println("클래스 등록 성공:"+result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
