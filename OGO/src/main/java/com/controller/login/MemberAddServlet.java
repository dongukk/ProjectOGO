package com.controller.login;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.StringUtils;

import com.dto.login.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.service.login.MemberService;

@WebServlet("/MemberAddServlet")
public class MemberAddServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 서버의 위치 - webapp(맨앞의 /) 아래의 위치 
		String path = "/upload/member";
		// 서버 컴퓨터의 실제적으로 저장되는 폴더 위치 
		// 프로젝트 이름 바꿀시 경로도 수정해야됨
		String savePath = request.getServletContext().getRealPath(path);
		// 상대경로 저장안됨, 절대경로로 지정
		// String savePath = "C:\\eclipse\\jsp_test\\work1\\OGO\\src\\main\\webapp\\upload\\member";

		// 파일 크기 제한 - 20MB
		int maxSize = 1024*1024*20;
		
		//↓ request 객체,               ↓ 저장될 서버 경로,       ↓ 파일 최대 크기,    ↓ 인코딩 방식,       ↓ 같은 이름의 파일명 방지 처리
		//(HttpServletRequest request, String saveDirectory, int maxPostSize, String encoding, FileRenamePolicy policy)
		//아래와 같이 MultipartRequest를 생성만 해주면 파일이 업로드 된다.(파일 자체의 업로드 완료)
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "utf-8" ,new DefaultFileRenamePolicy());

//		//MultipartRequest로 전송받은 데이터를 불러온다.
		//enctype을 "multipart/form-data"로 선언하고 submit한 데이터들은 request객체가 아닌 MultipartRequest객체로 불러와야 한다
			request.setCharacterEncoding("UTF-8");
			String userId = multi.getParameter("userId");
			String userPasswd = multi.getParameter("userPasswd");
			String userName = multi.getParameter("userName");
			String nickname = multi.getParameter("nickname");
			String gender = multi.getParameter("gender");
			String birth = multi.getParameter("birth");
			String phone1 = multi.getParameter("phone1");
			String phone2 = multi.getParameter("phone2");
			String phone3 = multi.getParameter("phone3");
			String post = multi.getParameter("post");
			String address1 = multi.getParameter("address1");
			String address2 = multi.getParameter("address2");
			String email1 = multi.getParameter("email1");
			String email2 = multi.getParameter("email2");
			String[] hobby = multi.getParameterValues("hobby");
			System.out.println(birth);
		// 전송받은 데이터가 파일일 경우 getFilesystemName()으로 파일 이름을 받아올 수 있다.
			String profilePhoto = multi.getFilesystemName("profilePhoto");	// 서버에 저장된 프로필사진명(중복될시 뒤에1부터숫자붙음 , img2.jpg => img21.jpg
			if(profilePhoto == null || profilePhoto.equals(""))
				profilePhoto = "noImage.jpg";	// 이미지 등록안할시 기본이미지 삽입			
		// 사진업로드 후 이클립스 자동 재실행 설정해야 한다.	(그래도 회원가입완료후 재실행까지 5초정도 걸린다. )
		//	1. Window -> Preferences -> General -> Workspace -> Refersh using nateve hooks or polling을 check해주면 된다.
		// 그래도 안될시 2번까지 설정.
		//	2. Window -> Preferences -> General -> Workspace -> Save automatically before manual build를 check해주면 된다.
			MemberDTO dto = new MemberDTO();
			dto.setUserId(userId);
			dto.setUserPasswd(userPasswd);
			dto.setUserName(userName);
			dto.setNickname(nickname);
			dto.setGender(gender);
			String birth1 = birth.substring(0,10);	// 시간이 같이 저장되서 데이터 잘라서 날짜만 저장
			dto.setBirth(birth1);
			dto.setPhone1(phone1);
			dto.setPhone2(phone2);
			dto.setPhone3(phone3);
			dto.setPost(post);
			dto.setAddress1(address1);
			dto.setAddress2(address2);
			dto.setEmail1(email1);
			dto.setEmail2(email2);
			dto.setProfilePhoto(profilePhoto);
			if(hobby == null) {	// 취미가 없으면 null값입력
				String hobbys = "";
				dto.setHobby(hobbys);
			} else {	// 취미가 있으면 사이에 ,삽입(하나있으면 콤마삽입안함.)
				String hobbys = String.join(",", hobby);
				dto.setHobby(hobbys);
			}			
		// Service 객체 생성.(서비스가 없고 DAO에서 직접 처리한다면 DAO 객체 생성)
			MemberService service = new MemberService();
		// 서비스에서 만들어놓은 insert 수행 메서드 사용. set으로 담아줬던 DTO를 넘겨서 insert 수행.
			int n = service.memberAdd(dto);
			System.out.println("insert 갯수"+n);
		
			if(n==1) {
				HttpSession session = request.getSession();
				session.setAttribute("memberAdd",userId+"님 회원가입성공");
				session.setAttribute("login",dto);
				session.setMaxInactiveInterval(60*30);
				response.sendRedirect("MainForm2.jsp");
			}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
