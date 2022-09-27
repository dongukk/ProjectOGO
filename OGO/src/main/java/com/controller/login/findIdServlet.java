package com.controller.login;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.login.MemberDTO;
import com.service.login.MemberService;

/**
 * Servlet implementation class find_id_Servlet
 */
@WebServlet("/findIdServlet")
public class findIdServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String findName = request.getParameter("findName");
		String findEmail = request.getParameter("findEmail");
		System.out.println(findName+"\t"+findEmail);
		
		int emailSplit = findEmail.indexOf('@');
		System.out.println("@위치 : "+emailSplit);
		String findEmail1 = findEmail.substring(0,emailSplit);
		String findEmail2 = findEmail.substring(emailSplit+1);
		System.out.println(findEmail1+"\t"+findEmail2);
		
		HashMap<String, String> map = new HashMap<>();
		map.put("findName", findName);
		map.put("findEmail1", findEmail1);
		map.put("findEmail2", findEmail2);
		
		MemberService service = new MemberService();
		MemberDTO dto = service.findId(map);
		System.out.println(dto);
		if(dto!=null) {
			request.setAttribute("userId", dto.getUserId());		
		} else {
			request.setAttribute("userId", null);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("findId2.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
