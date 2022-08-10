package com.controller.classpage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.login.MemberDTO;

/**
 * Servlet implementation class ClassCreateServlet
 */
@WebServlet("/ClassCreateServlet")
public class ClassCreateServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session =request.getSession();
		MemberDTO mDTO =(MemberDTO) session.getAttribute("login");
		
		String nextPage=null;
		if (mDTO != null) {
			nextPage= "class_page/classForm.jsp";
		}else {
			//나중에 alert mesg request나 session에 저장해서 전달 ("로그인 후 이용 가능합니다");
			//나중에 튜터 인증 수단이 생기면 튜터인 경우에만 등록할 수 있도록 하고, 아닌 경우에는 
				//"튜터 인증 후 클래스를 등록할 수 있습니다" 경고창 띄우기
			nextPage= "MainForm.jsp";
		}
		
		RequestDispatcher dis =request.getRequestDispatcher(nextPage);
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
