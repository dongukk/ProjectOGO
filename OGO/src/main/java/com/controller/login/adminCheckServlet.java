package com.controller.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.login.MemberDTO;

/**
 * Servlet implementation class adminCheck
 */
@WebServlet("/adminCheckServlet")
public class adminCheckServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO dto=(MemberDTO)session.getAttribute("login");
	    String userId = dto.getUserId();
	    System.out.println(userId);
	    
	    response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
	    if(userId.equals("admin")) {
	    	out.println("<script>alert('관리자님 환영합니다.'); window.location='ManagementMember.jsp'; </script>");		
	    } else {
	    	out.println("<script>alert('관리자 전용페이지입니다.'); window.history.go(-1); </script>");
		}
	    out.flush();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
