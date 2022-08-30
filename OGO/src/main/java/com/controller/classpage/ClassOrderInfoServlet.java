package com.controller.classpage;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.classpage.ClassOrderDTO;
import com.dto.login.MemberDTO;
import com.service.classpage.ClassOrderService;

/**
 * Servlet implementation class ClassOrderServlet
 */
@WebServlet("/ClassOrderInfoServlet")
public class ClassOrderInfoServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//신청한 클래스번호,일정 정보
		int classNumber=Integer.parseInt(request.getParameter("classNumber"));
		String selectSched1= request.getParameter("selectSched1");
		String selectSched2= request.getParameter("selectSched2");
		String selectSched3= request.getParameter("selectSched3");
		String selectSched4= request.getParameter("selectSched4");
		String selectSched5= request.getParameter("selectSched5");
		String selectSched6= request.getParameter("selectSched6");
		String selectSched7= request.getParameter("selectSched7");
		String selectSched8= request.getParameter("selectSched8");
		String selectSched9= request.getParameter("selectSched9");
		String selectSched10= request.getParameter("selectSched10");
		int price= Integer.parseInt(request.getParameter("classPrice"));
		//클래스 신청한 유저id
		HttpSession session=request.getSession();
		MemberDTO mDTO= (MemberDTO) session.getAttribute("login");
		String userId = mDTO.getUserId();
		//파싱 확인
//		System.out.println("classNumber:"+classNumber);
//		System.out.println("selectSched:"+selectSched1+"\t"+selectSched2+"\t"+selectSched3+"\t"+selectSched4
//				+"\t"+selectSched5+"\t"+selectSched6+"\t"+selectSched7+"\t"+selectSched8+"\t"+selectSched9
//				+"\t"+selectSched10);
//		System.out.println("userId:"+userId);
		
		//오늘 날짜구하기
		LocalDate now =LocalDate.now();
		DateTimeFormatter formatter=DateTimeFormatter.ofPattern("yyMMdd");
		String today= now.format(formatter);
		  //System.out.println(formatedNow);
		//주문번호 orderNum
		String orderNum= userId+classNumber+today;
		
		//유저가 이전에 같은 클래스 신청한 적 있는지 검사
		ClassOrderService oService= new ClassOrderService();
		ClassOrderDTO prevDTO= new ClassOrderDTO();
		prevDTO.setClassNum(classNumber);
		prevDTO.setUserId(userId);
		int findResult = oService.findOrder(prevDTO);
		  System.out.println("findResult: "+findResult);

		String mesg="";
		int findSchedResult=0;
		if (findResult == 1) { //이전에 신청한 적이 있음
			
			mesg= "이미 결제(수강)한 클래스입니다. 다른 회차를 선택해주세요";
		}else { //해당 클래스를 이전에 신청한 적이 없거나, 새로운 회차를 신청한 경우
			//classorderinfo에 insert
			ClassOrderDTO oDTO= new ClassOrderDTO(orderNum, userId, classNumber, price, null, "결제 대기중", selectSched1, 
					selectSched2, selectSched3, selectSched4, selectSched5, selectSched6, selectSched7, 
					selectSched8, selectSched9, selectSched10);
			int result =oService.classOrder(oDTO);
			System.out.println("classOrderInfo insert 성공:"+result);
			mesg= "성공";
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print(mesg);//mesg 전송
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
