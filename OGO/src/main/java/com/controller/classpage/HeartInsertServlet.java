package com.controller.classpage;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.classpage.HeartService;

/**
 * Servlet implementation class HeartServlet
 */
@WebServlet("/HeartInsertServlet")
public class HeartInsertServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//userId와 classNum은 classPage.jsp에서 ajax로 받아와서 처리
		String userId= request.getParameter("userId");
		int classNum= Integer.parseInt(request.getParameter("classNum"));
		int heartYN = Integer.parseInt(request.getParameter("heartYN"));
		System.out.println(userId+"\t"+classNum+"\t"+heartYN);
		
		//찜 
		HeartService hservice= new HeartService();
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("classNum", classNum);
			//클래스의 찜 여부 확인
			//classPage.jsp에서 클릭 시 발생해야 함 

		if (heartYN==0) { //찜 되어 있지 않은 경우 - heart에 insert
			int num = hservice.heartInsert(map);
			//System.out.println(num);
			if (num==1) {
				System.out.println("insert 성공");
			}
		}else {
			int num = hservice.heartdelete(map);
			if (num==1) {
				System.out.println("delete 성공");
			}
		}
//		
		//int num = hservice.heartdelete(map);
		//System.out.println(num);
		//num이 1인 경우 delete 성공 -> 알림창
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
