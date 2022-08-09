package com.controller.login;

import java.awt.Window;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.login.MemberDAO;
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
			// 팝업창 닫으면서 부모창 이동
			// out.println("<script>opener.parent.location='MainForm2.jsp'; window.close();</script>");
			response.sendRedirect("MainForm2.jsp");
		} else {	// 회원아닌 경우			
//			out.println("<script>alert('아이디 및 비밀번호를 확인해주세요.');</script>");
			HttpSession session = request.getSession();
//			session.setAttribute("mesg", "아이디 및 비밀번호를 확인해주세요.");
//			out.println("<script>alert(mesg); location.href='MainForm.jsp'; </script>");
//			out.println("<script>alert('아이디 및 비밀번호를 확인해주세요.'); location.href='MainForm.jsp'; </script>");
			out.println("<script>alert('아이디 및 비밀번호를 확인해주세요.'); history.back(); </script>");
			out.flush(); // 전의 내용을 강제적으로 화면에 뿌려주는 기능
//			response.sendRedirect("MainForm.jsp");
		}
		
	}
}
