package com.controller.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.login.MemberService;


@WebServlet("/MemberIdCheckServlet")
public class MemberIdCheckServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String userId= request.getParameter("userId");
		System.out.println(userId);
		
		MemberService service = new MemberService();
		int count = service.idCheck(userId);
		System.out.println("아이디 중복갯수"+count);
		
		
		// 넘겨줄 data
				PrintWriter out = response.getWriter();
				out.print(count);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
