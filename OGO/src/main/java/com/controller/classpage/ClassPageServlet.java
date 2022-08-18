package com.controller.classpage;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.classpage.ClassDTO;
import com.dto.classpage.ClassImgDTO;
import com.dto.login.MemberDTO;
import com.service.classpage.ClassService;
import com.service.classpage.ContentService;
import com.service.classpage.HeartService;

/**
 * Servlet implementation class ClassPageServlet
 */
@WebServlet("/ClassPage")
public class ClassPageServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		MemberDTO mDTO= (MemberDTO)session.getAttribute("login");
		int classNum=221; //나중에 클래스Num 받아오기
		
		ClassService service= new ClassService();
		//클래스 정보
		ClassDTO cDTO= service.selectClass(classNum); //class 정보
			//System.out.println(cDTO);//dto 확인
		
		String tuterId= cDTO.getUserId(); //클래스의 튜터 아이디 - 나중에 변수명 바꾸기
			//System.out.println(tuterId);//튜터 아이디 확인
		//클래스 일정 정보
		
		
		//튜터 닉네임
		String nickName=service.selectNickName(tuterId);
			//System.out.println(nickName);//튜터 닉네임 확인
		//클래스소개,튜터소개,일정장소,유의사항,공지사항-resultMap
		ContentService conService= new ContentService();
		HashMap classContents =conService.selectContent(classNum); 
			//System.out.println(classContents);//content확인
		
		//찜 
		String userId=""; //로그인이 되지 않은 경우에도 페이지 볼 수 있도록 처리하는 중
		if (mDTO!=null) { //로그인 된 경우
			userId=mDTO.getUserId(); //유저 아이디 
		}
		HeartService hservice= new HeartService();
		HashMap<String, Object> heartData= new HashMap<String, Object>();
		heartData.put("userId", userId);
		heartData.put("classNum", classNum);
		
		//클래스의 찜 여부 확인
		//classPage.jsp에서 클릭 시 발생해야 함 
		int num =hservice.heartSearch(heartData); //해당 클래스가 찜 목록에 있는지 검사
		String heartYN= String.valueOf(num);
		
		//찜 개수 count
		int count =hservice.heartCount(classNum);
		
		//이미지 불러오기
		ClassImgDTO imgDTO =service.getImage(classNum);
		
		request.setAttribute("heartYN", heartYN);//찜 여부 검사
		request.setAttribute("heartCount", count);//찜 개수 count
		request.setAttribute("cDTO", cDTO);
		request.setAttribute("nickName", nickName);
		request.setAttribute("classContents", classContents);
		request.setAttribute("imgDTO", imgDTO); //클래스 별 이미지 
		
		//클래스 등록 페이지 테스트 위한 session
		session.setAttribute("cDTO", cDTO);
		
		RequestDispatcher dis =request.getRequestDispatcher("ClassPage.jsp");
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
