package com.controller.classpage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.login.MemberDTO;

/**
 * Servlet implementation class ClassOrderServlet
 */
@WebServlet("/ClassOrderInfoServlet")
public class ClassOrderInfoServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ClassOrderServlet");
		request.setCharacterEncoding("utf-8");
		
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
		
		HttpSession session=request.getSession();
		MemberDTO mDTO= (MemberDTO) session.getAttribute("login");
		String userId = mDTO.getUserId();
		
		System.out.println("classNumber:"+classNumber);
		System.out.println("selectSched:"+selectSched1+"\t"+selectSched2+"\t"+selectSched3+"\t"+selectSched4
				+"\t"+selectSched5+"\t"+selectSched6+"\t"+selectSched7+"\t"+selectSched8+"\t"+selectSched9
				+"\t"+selectSched10);
		System.out.println("userId:"+userId);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
