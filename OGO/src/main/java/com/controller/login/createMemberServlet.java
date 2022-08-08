package com.controller.login;

import java.awt.Window;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/createMemberServlet")
public class createMemberServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// response.setContentType("text/html;charset=utf-8");
		// PrintWriter out = response.getWriter();
		// 팝업창 닫으면서 부모창 새로운창 생성
		// out.println("<script> opener.parent.location='LoginCURD/createMember.jsp'; window.close();</script>");
		response.sendRedirect("LoginCURD/createMember.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
