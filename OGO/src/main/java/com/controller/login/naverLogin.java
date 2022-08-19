package com.controller.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.login.MemberDTO;
import com.service.login.MemberService;


@WebServlet("/naverLogin")
public class naverLogin extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 String userId = request.getParameter("email");
		 String userName = request.getParameter("userName");
		 String nickname = request.getParameter("nickname");
		 // 이메일 나누기
		 String email = request.getParameter("email");
		 int emailSplit = email.indexOf("@");  // @의 문자의 위치 값을 얻는다.
		 String email1 = email.substring(0, emailSplit);
		 String email2 = email.substring(emailSplit+1, email.length());
		 // 개인정보때문에 더미데이터 저장합니다.
		 String userPasswd = "1";
		 String gender = "남자";
		 String birth = "1990/02/04";
		 String phone1 = "010";
		 String phone2 = "1111";
		 String phone3 = "1111";
		 String post = "05399";
		 String address1 = "서울 강동구 성내로8길 9-11 (성내동)";
		 String address2 = "서울 강동구 성내동 550-10";
		 String profilePhoto = "noImage.jpg";	
		 String hobbys = "";
		 
		 System.out.println(userId);
		 System.out.println(userName);
		 System.out.println(nickname);
		 System.out.println(email1);
		 System.out.println(email2);
		 
		 MemberDTO dto = new MemberDTO();
			dto.setUserId(userId);
			dto.setUserPasswd(userPasswd);
			dto.setUserName(userName);
			dto.setNickname(nickname);
			dto.setGender(gender);
			dto.setBirth(birth);
			dto.setPhone1(phone1);
			dto.setPhone2(phone2);
			dto.setPhone3(phone3);
			dto.setPost(post);
			dto.setAddress1(address1);
			dto.setAddress2(address2);
			dto.setEmail1(email1);
			dto.setEmail2(email2);
			dto.setProfilePhoto(profilePhoto);	
			dto.setHobby(hobbys);
			System.out.println(dto);
			
		HttpSession session = request.getSession();	
		MemberService service = new MemberService();
		// 아이디 중복체크
		int n1 = service.idCheck(userId);	
		System.out.println("아이디중복 갯수"+n1);
		// 네이버 로그인 처음이면 자동 회원가입db 저장	
		if(n1==0) {
			int n2 = service.memberAdd(dto);
			System.out.println("insert 갯수"+n2);		
			if(n2==1) {				
				session.setAttribute("memberAdd",nickname+"님 회원가입성공");	
			}		
		}
		session.setAttribute("login",dto);
		session.setMaxInactiveInterval(60*30);
		response.sendRedirect("MainForm2.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
