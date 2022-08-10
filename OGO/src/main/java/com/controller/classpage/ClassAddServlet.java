package com.controller.classpage;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.classpage.ClassDTO;
import com.dto.classpage.ContentDTO;
import com.service.classpage.ClassService;
import com.service.classpage.ContentService;

import oracle.security.pki.ssl.ClassServer;

/**
 * Servlet implementation class ClassOpenServlet
 */
@WebServlet("/ClassAddServlet")
public class ClassAddServlet extends HttpServlet {
	
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
		
		String con_class =request.getParameter("textClassInfo");
		String con_tutor =request.getParameter("textTutorInfo");
		String con_notice =request.getParameter("textNotice");
		String con_attention =request.getParameter("textAttention");
		//System.out.println(con_class+"=="+con_tutor+"=="+con_notice+"=="+con_attention);
		
		
		
		//class테이블에 저장
		//ClassDTO cDTO= new ClassDTO(0, className, userId, category, Integer.parseInt(price), schedule1, place);
		ClassDTO cDTO= new ClassDTO(0, className, userId, subCategory, Integer.parseInt(price), 
				schedule1, schedule2, schedule3, schedule4, schedule5, schedule6, 
				schedule7, schedule8, schedule9, schedule10, place);
		ClassService service= new ClassService();
		int result =service.classOpen(cDTO);
		System.out.println("클래스 등록 성공:"+result);
		
		//content 테이블에 저장
		//1. classnum 먼저 받아오기
		String cName=cDTO.getClassName();
		String cID=cDTO.getUserId();
		HashMap<String, String> map= new HashMap<String, String>();
		map.put("cName", cName);
		map.put("cID", cID);
		ClassService cService= new ClassService();
		int classNum=cService.searchClassNum(map);
		System.out.println(cName+ "의 classNum:" + classNum);
		
		
		//2. content 테이블에 저장하기
		ContentService conService= new ContentService();
		ContentDTO conDTO= new ContentDTO(classNum, con_class, con_tutor, con_attention, con_notice);
		HashMap<String, Object> contentMap= new HashMap<String, Object>();
		contentMap.put("conDTO", conDTO); //contentDTO 저장
		contentMap.put("classNum", classNum); //classNum 저장
		int result2 =conService.saveContent(contentMap);
		System.out.println("content insert : "+ result2);
		
		//response.sendRedirect("");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
