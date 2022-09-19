package com.controller.classpage;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.classpage.ClassOrderDTO;
import com.dto.login.MemberDTO;
import com.service.classpage.ClassInsertService;
import com.service.classpage.ClassOrderService;

/**
 * Servlet implementation class ClassOrderServlet
 */
@WebServlet("/ClassOrderInfoServlet")
public class ClassOrderInfoServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//신청한 클래스번호,일정 정보
		int classNumber=Integer.parseInt(request.getParameter("classNumber"));
		String selectSched1= request.getParameter("selectSched1");
		String selectSched2= request.getParameter("selectSched2");
		String selectSched3= request.getParameter("selectSched3");
		String selectSched4= request.getParameter("selectSched4");
		String selectSched5= request.getParameter("selectSched5");
		String selectSched6= request.getParameter("selectSched6");
		String selectSched7= request.getParameter("selectSched7");
		String selectSched8= request.getParameter("selectSched8");
		String selectSched9= request.getParameter("selectSched9");
		String selectSched10= request.getParameter("selectSched10");
		int price= Integer.parseInt(request.getParameter("classPrice"));
		//클래스 신청한 유저id
		HttpSession session=request.getSession();
		MemberDTO mDTO= (MemberDTO) session.getAttribute("login");
		String userId = mDTO.getUserId();
		//확인
		System.out.println("신청정보 classNumber:"+classNumber+" userId:"+userId+" selectSched:"+selectSched1
				+"\t"+selectSched2+"\t"+selectSched3+"\t"+selectSched4+"\t"+selectSched5+"\t"+selectSched6
				+"\t"+selectSched7+"\t"+selectSched8+"\t"+selectSched9+"\t"+selectSched10);
		
		//오늘 날짜구하기
		LocalDate nowD =LocalDate.now();
		DateTimeFormatter dateFormatter=DateTimeFormatter.ofPattern("yyMMdd");
		String today= nowD.format(dateFormatter);
		LocalTime nowT =LocalTime.now();
		DateTimeFormatter timeFormatter=DateTimeFormatter.ofPattern("HH");
		String time= nowT.format(timeFormatter);
		  //System.out.println(formatedNow);
		
		//주문번호 orderNum
		int idIndex =userId.indexOf("@");
		String orderUserId=userId;
		if (idIndex > -1) {//userId에 @가 포함된 경우
			orderUserId=userId.substring(0, idIndex);//@앞부분까지만 저장
		}
		String orderNum= today+time+classNumber+orderUserId;
		session.setAttribute("orderNum", orderNum); //세션에 주문번호 저장
		
		//유저가 이전에 같은 클래스 신청한 적 있는지 검사
		ClassOrderService oService= new ClassOrderService();
		ClassOrderDTO prevDTO= new ClassOrderDTO();
		prevDTO.setClassNum(classNumber);
		prevDTO.setUserId(userId);
		int findResult = oService.findOrder(prevDTO);
		  System.out.println("findResult: "+findResult);
		
		  
		String mesg="";
		if (findResult > 0) { //이전에 신청한 적이 있음
			mesg= "이전에 수강한 클래스입니다. 다른 클래스를 신청해주세요";
			//test 중
			HashMap<String, Object> scheduleMap= new HashMap<String, Object>();
			String[] schedules= {selectSched1,selectSched2,selectSched3,selectSched4,selectSched5,
					selectSched6,selectSched7,selectSched8,selectSched9,selectSched10};
			String orderSched = null;
			for (int i = 0; i < schedules.length; i++) {
				if (schedules[i].length()>0) {
					if (orderSched==null) {
						orderSched = ""+(i+1); //신청한 회차를 저장
					}else {
						orderSched += ","+(i+1); //신청한 회차를 저장
					}
					
				}
			}
			System.out.println("새롭게 신청한 회차 정보(orderSched): "+ orderSched);
			String[] orderSchedules= orderSched.split(",");
			for (String s : orderSchedules) {
				System.out.println("String[] orderSchedules:");
				System.out.println(s);
			}
			//////
			HashMap<String, Object> findRecordMap= new HashMap<String, Object>();
			findRecordMap.put("classNum", classNumber);
			findRecordMap.put("userId", userId);
			HashMap resultMap=oService.findRecord(findRecordMap);
			System.out.println("resultMap: "+resultMap);
			
			//HashMap<String, Object> insertSched= new HashMap();
			
			
			Set keys=resultMap.keySet();
			for (Object key : keys) {
				String k= (String)key;
				Object v= resultMap.get(k);
				System.out.println(k+"\t"+v);
				
//				for (String s : orderSchedules) { //이건 동작하지 않음. 이유는 나중에 알아보기
//					if (k.equals(s)) {
//						insertSched.put("choiceSched", k);
//						insertSched.put("v", v);
//						System.out.println("insertSched(insert할 회차):"+insertSched);
//					}
//				}
			}
			resultMap.put("schedules", schedules); //schedules배열도 넘기기
			//service->dao 에서 insert
			ClassInsertService insertService= new ClassInsertService();
			int insertResult =insertService.insert(resultMap); //동적sql insert test
			
		}else { //해당 클래스를 이전에 신청한 적이 없는 경우
			//classOrderInfo에 insert
			ClassOrderDTO oDTO= new ClassOrderDTO(orderNum, userId, classNumber, price, null, "결제 대기중", selectSched1, 
					selectSched2, selectSched3, selectSched4, selectSched5, selectSched6, selectSched7, 
					selectSched8, selectSched9, selectSched10);
			int result =oService.classOrder(oDTO);
			System.out.println("classOrderInfo insert 성공:"+result);
			mesg= "성공";
		}
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print(mesg);//mesg 전송
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
