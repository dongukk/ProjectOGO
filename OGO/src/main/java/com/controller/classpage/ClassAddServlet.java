package com.controller.classpage;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.classpage.ClassDTO;
import com.dto.classpage.ClassImgDTO;
import com.dto.classpage.ContentDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.service.classpage.ClassImgService;
import com.service.classpage.ClassService;
import com.service.classpage.ContentService;

/**
 * Servlet implementation class ClassOpenServlet
 */
@WebServlet("/ClassAddServlet")
public class ClassAddServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		//카테고리별로 이미지 경로 수정, 저장
		HttpSession session =request.getSession();
		String sCategory=(String) session.getAttribute("sCategory");
		System.out.println(sCategory);
		session.removeAttribute("sCategory"); //세션에서 remove
		
		String savePath="";//저장경로
		if (sCategory.equals("메이크업")||sCategory.equals("스타일링")) {
			savePath="C:\\Users\\sohyeon\\git\\ProjectOGO\\OGO\\src\\main\\webapp\\class_img\\category\\A_뷰티";
		}else if (sCategory.equals("영어")||sCategory.equals("일본어·중국어")||sCategory.equals("기타 외국어")) {
			savePath="C:\\Users\\sohyeon\\git\\ProjectOGO\\OGO\\src\\main\\webapp\\class_img\\category\\B_외국어";
		}else if (sCategory.equals("댄스")||sCategory.equals("뮤직")) {
			savePath="C:\\Users\\sohyeon\\git\\ProjectOGO\\OGO\\src\\main\\webapp\\class_img\\category\\C_댄스,뮤직";
		}else if (sCategory.equals("요리·음료")||sCategory.equals("공예·DIY")) {
			savePath="C:\\Users\\sohyeon\\git\\ProjectOGO\\OGO\\src\\main\\webapp\\class_img\\category\\D_요리,공예";
		}else if (sCategory.equals("디자인")||sCategory.equals("영상")) {
			savePath="C:\\Users\\sohyeon\\git\\ProjectOGO\\OGO\\src\\main\\webapp\\class_img\\category\\E_드로잉,영상";
		}
		
		// 파일 크기 제한 - 20MB
		int maxSize = 1024*1024*20;
		
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "utf-8" ,new DefaultFileRenamePolicy());
		
		String userId =multi.getParameter("tutorId"); //나중에 tutorId로 수정
		String className =multi.getParameter("className");
		String category =multi.getParameter("category");
		String subCategory =multi.getParameter("subCategory");
		//String classDate =request.getParameter("classDate");
		String schedule1 =multi.getParameter("schedule1").replace("&nbsp;", " "); //1회차 일정 저장
		String schedule2 =multi.getParameter("schedule2").replace("&nbsp;", " "); 
		String schedule3 =multi.getParameter("schedule3").replace("&nbsp;", " "); 
		String schedule4 =multi.getParameter("schedule4").replace("&nbsp;", " "); 
		String schedule5 =multi.getParameter("schedule5").replace("&nbsp;", " "); 
		String schedule6 =multi.getParameter("schedule6").replace("&nbsp;", " "); 
		String schedule7 =multi.getParameter("schedule7").replace("&nbsp;", " "); 
		String schedule8 =multi.getParameter("schedule8").replace("&nbsp;", " "); 
		String schedule9 =multi.getParameter("schedule9").replace("&nbsp;", " "); 
		String schedule10 =multi.getParameter("schedule10").replace("&nbsp;", " "); 
		String price =multi.getParameter("classPrice");
		//String place =request.getParameter("classPlace"); //classPlace는 나중에 수정
		String classStartTime =multi.getParameter("classStartTime"); 
		String classEndTime =multi.getParameter("classEndTime"); 
		String post =multi.getParameter("post"); 
		String address1 =multi.getParameter("address1"); 
		String address2 =multi.getParameter("address2");
		
		String place= "("+post+")"+address1+address2;
		//System.out.println(schedule1+"--"+schedule2+"--"+schedule3);
		
		String con_class =multi.getParameter("textClassInfo");
		String con_tutor =multi.getParameter("textTutorInfo");
		String con_notice =multi.getParameter("textNotice");
		String con_attention =multi.getParameter("textAttention");
		
		//업로드 파일
		String classPhoto1= multi.getFilesystemName("classPhoto1");
		String classPhoto2= multi.getFilesystemName("classPhoto2");
		String classPhoto3= multi.getFilesystemName("classPhoto3");
		String classPhoto4= multi.getFilesystemName("classPhoto4");
		String classPhoto5= multi.getFilesystemName("classPhoto5");

		//class테이블에 저장
		ClassDTO cDTO= new ClassDTO(0, className, userId, subCategory, Integer.parseInt(price), 
				schedule1, schedule2, schedule3, schedule4, schedule5, schedule6, 
				schedule7, schedule8, schedule9, schedule10, place);
		ClassService service= new ClassService();
		int result =service.classOpen(cDTO);
		System.out.println("클래스 등록 성공:"+result);
		
		//content 테이블에 저장
		//1. classnum 먼저 받아오기
		String cName=cDTO.getClassName();
		String cID=cDTO.getUserId();
		HashMap<String, String> map= new HashMap<String, String>();
		map.put("cName", cName);
		map.put("cID", cID);
		ClassService cService= new ClassService();
		int classNum=cService.searchClassNum(map);
		System.out.println(cName+ "의 classNum:" + classNum);
		
		//2. content 테이블에 저장하기
		ContentService conService= new ContentService();
		ContentDTO conDTO= new ContentDTO(classNum, con_class, con_tutor, con_attention, con_notice);
		HashMap<String, Object> contentMap= new HashMap<String, Object>();
		contentMap.put("conDTO", conDTO); //contentDTO 저장
		contentMap.put("classNum", classNum); //classNum 저장
		int result2 =conService.saveContent(contentMap);
		System.out.println("content insert : "+ result2);
		
		//3. classimg 테이블에 저장하기
		ClassImgDTO iDTO= new ClassImgDTO(classNum, classPhoto1, classPhoto2, classPhoto3, classPhoto4, classPhoto5);
		System.out.println(iDTO);
		ClassImgService iService= new ClassImgService();
		int result3=iService.uploadImg(iDTO); //파일 업로드 저장
		System.out.println("파일 업로드 성공:"+result3);
		
		//나중에 클래스 목록 페이지로 이동하도록 수정하기
		response.sendRedirect("MainForm.jsp");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
