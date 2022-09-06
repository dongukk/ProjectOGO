package com.controller.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.login.MemberDTO;
import com.service.login.MemberService;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String userPasswd = request.getParameter("userPasswd");
		System.out.println(userId+"\t"+userPasswd);
			
		HashMap<String, String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("userPasswd", userPasswd);
		
		MemberService service = new MemberService();
		MemberDTO dto = service.login(map);
		System.out.println(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(dto != null) {	// 인증완료
			HttpSession session = request.getSession();
			session.setAttribute("login", dto);	// 인증정보 저장 후 회원전용페이지에서 활용
			session.setMaxInactiveInterval(60*60);
			response.sendRedirect(request.getHeader("referer"));	// 로그인한 페이지로 이동
		} else {	// 회원아닌 경우			
			out.println("<script>alert('아이디 및 비밀번호를 확인해주세요.'); window.history.go(-1); </script>");
			out.flush();
		}
		
	}
}
