package com.controller.login;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.login.MemberDTO;
import com.service.login.MemberService;

/**
 * Servlet implementation class find_id_Servlet
 */
@WebServlet("/PwUpdateServlet")
public class PwUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String newPw = request.getParameter("newPw");
		System.out.println(userId+"\t"+newPw);

		HashMap<String, String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("newPw", newPw);
		
		MemberService service = new MemberService();
		int n = service.newPw(map);
		System.out.println("newPw 업데이트 갯수"+n);
		
		HttpSession session = request.getSession();
		session.setAttribute("mesg", "비밀번호가 변경되었습니다.");
		session.setMaxInactiveInterval(60*30);
		response.sendRedirect("MainForm.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
