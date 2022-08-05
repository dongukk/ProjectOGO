package com.controller.classpage;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.classpage.ClassDTO;
import com.service.classpage.ClassService;
import com.service.classpage.HeartService;

/**
 * Servlet implementation class ClassPageServlet
 */
@WebServlet("/ClassPage")
public class ClassPageServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int classNum= 3; //나중에 클래스Num 받아오기
		
		ClassService service= new ClassService();
		//클래스 정보
		ClassDTO dto= service.select(classNum);
			System.out.println(dto);//dto 확인
		
		String userId= "tutor3";
			//System.out.println(userId);//id확인
		
		//튜터 닉네임
		String nickName=service.selectNickName(userId);
		//클래스소개,튜터소개,일정장소,유의사항,공지사항-resultMap
		HashMap classContents =service.selectContent(classNum); 
			//System.out.println(classContents);
		
		//찜 
		HeartService hservice= new HeartService();
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("classNum", classNum);
		//클래스의 찜 여부 확인
		//classPage.jsp에서 클릭 시 발생해야 함 
		
		int num =hservice.heartSearch(map); //해당 클래스가 찜 목록에 있는지 검사
		String heartYN= String.valueOf(num);
		
		System.out.println("heartYN: "+heartYN);
		request.setAttribute("heartYN", heartYN);//찜 여부 검사
				
		request.setAttribute("dto", dto);
		request.setAttribute("nickName", nickName);
		request.setAttribute("classContents", classContents);
		
		RequestDispatcher dis =request.getRequestDispatcher("ClassPage.jsp");
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
