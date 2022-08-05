package com.controller.classpage;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet("/HeartServlet")
public class HeartServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//userId와 classNum은 classPage.jsp에서 ajax로 받아와서 처리
		String userId= request.getParameter("userId");
		int classNum= Integer.parseInt(request.getParameter("classNum"));
		int heartYN = Integer.parseInt(request.getParameter("heartYN"));
		
		//찜 
		HeartService hservice= new HeartService();
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("classNum", classNum);
			//클래스의 찜 여부 확인
			//classPage.jsp에서 클릭 시 발생해야 함 
		heartYN=hservice.heartSearch(map); //값이 바뀐 경우 있으므로 다시한번 search
		int num=0;
		String result=null;
		
		if (heartYN==0) { //찜 되어 있지 않은 경우 - heart에 insert
			num = hservice.heartInsert(map);
			//System.out.println(num);
			if (num==1) {
				System.out.println("insert 성공");
				heartYN =hservice.heartSearch(map); //해당 클래스가 찜 목록에 있는지 다시 검사
				System.out.println("insert후 heartYN:"+heartYN);
				result="insert";
			}
		}else {//이미 찜 되어있는 경우 delete
			num = hservice.heartdelete(map);
			if (num==1) {
				System.out.println("delete 성공");
				heartYN =hservice.heartSearch(map); //해당 클래스가 찜 목록에 있는지 다시 검사
				System.out.println("delete후 heartYN:"+heartYN);
				result="delete";
			}
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
