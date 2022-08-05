package com.controller.login;

import java.awt.Button;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.service.login.MemberService;


@WebServlet("/MemberNicknameCheckServlet")
public class MemberNicknameCheckServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String nickname= request.getParameter("nickname");
		System.out.println(nickname);
		
		MemberService service = new MemberService();
		int count = service.nicknameCheck(nickname);
		System.out.println("닉네임 중복갯수"+count);
		
		// 개발자 확인용
		if(count==0) {
			System.out.println("사용가능한 닉네임입니다.");
		} else if (count==1){
			System.out.println("중복된 닉네임입니다.");
		}
		
		// 넘겨줄 data
		PrintWriter out = response.getWriter();
		out.print(count);
		
//		RequestDispatcher dis = request.getRequestDispatcher("createMember.jsp");
//		dis.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
