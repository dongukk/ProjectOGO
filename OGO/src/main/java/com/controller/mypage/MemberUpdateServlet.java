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

@WebServlet("/MemberUpdateServlet")
public class MemberUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		MemberDTO dto =(MemberDTO)session.getAttribute("login");
		String nextPage=null;
		if(dto != null) {
			request.setCharacterEncoding("utf-8");
			String userId = request.getParameter("userId");
			String userPasswd = request.getParameter("userPasswd");
			String userName = request.getParameter("userName");
			String nickname = request.getParameter("nickname");
			String gender = request.getParameter("gender");
			String birth = request.getParameter("birth");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			String post = request.getParameter("post");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");
			String profilePhoto=request.getParameter("profilePhoto");
			String hobby=request.getParameter("hobby");
			
			
			System.out.println(userId);
			System.out.println(nickname);
			System.out.println(phone1);
			System.out.println(post);
			System.out.println(email1);
			System.out.println(profilePhoto);
			System.out.println(hobby);
			
			MemberDTO dto2= new MemberDTO(userId, userPasswd, userName,  nickname, 
					gender, birth, phone1, phone2, phone3, 
					post, address1, address2,  email1, email2, profilePhoto, hobby);
			
			
			
			MemberService service=new MemberService();
			int num=service.memberUpdate(dto2);
			
			if(num ==1) {
				dto2=service.mypage(userId);
				session.setAttribute("login", dto2);
				session.setAttribute("memberAdd", "회원정보가 수정되었습니다"); 
			}
			nextPage="MainForm2.jsp";
			
		}else {
			nextPage="loginUIServlet";
			/* request.setAttribute("mesg", "로그인이 필요한 작업입니다"); */
			
		}
		response.sendRedirect(nextPage);
//		RequestDispatcher dis=request.getRequestDispatcher(nextPage);
//		dis.forward(request, response);
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
