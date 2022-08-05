package com.controller.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.login.MemberDTO;
import com.service.login.MemberService;

@WebServlet("/MyPageServlet")
public class MyPageServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		String nextPage=null;
		if(dto != null) {
			
			nextPage="mypageForm.jsp";
			String userid= dto.getUserId();
			
			MemberService service=new MemberService();
			
			MemberDTO x =service.mypage(userid);
			if(x !=null) {
				session.setAttribute("login", x); //세션데이터 덮어쓰기
				System.out.println("mypage 이동");
			}
		
		}else {
			nextPage="loginUIServlet";
			//session.setAttribute("mesg", "로그인이 필요한 작업입니다");
		}
		RequestDispatcher dis=request.getRequestDispatcher(nextPage);
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
