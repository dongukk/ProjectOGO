package com.pay.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.pay.PayDTO;
import com.service.pay.PayService;

/**
 * Servlet implementation class pay
 */
@WebServlet("/PayMain")
public class PayMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayMain() {
        super();
        // TODO Auto-generated constructor stub
    }

    
//protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		String userId = request.getParameter("userId");
//		String classNum = request.getParameter("classNum");
//
//		/* System.out.println("payMain.java"+userId+" "+classNum); */
//		
//		//오늘 날짜구하기
//	      LocalDate nowD =LocalDate.now();
//	      DateTimeFormatter dateFormatter=DateTimeFormatter.ofPattern("yyMMdd");
//	      String today= nowD.format(dateFormatter);
//	      LocalTime nowT =LocalTime.now();
//	      DateTimeFormatter timeFormatter=DateTimeFormatter.ofPattern("HH");
//	      String time= nowT.format(timeFormatter);
//	        //System.out.println(formatedNow);
//	      //주문번호 orderNum
//	      int idIndex =userId.indexOf("@");
//	      String orderUserId=userId;
//	      if (idIndex > -1) {
//	         orderUserId=userId.substring(0, idIndex);
//	      }
//	      String orderNum= today+time+classNum+orderUserId;
//		
//			/* System.out.println("payMain.java"+userId+" "+classNum+" "+orderNum); */
//	      
//	      HttpSession session = request.getSession();
//	      session.setAttribute("orderNum", orderNum);
//		
//		
//		
//		//ordernum 만든 후 데이터 가져오기
//		PayService Pservice = new PayService();
//		HashMap map = Pservice.selectOrder(orderNum.trim());		
//
//		 System.out.println("갔다 왔음 정보 가지러 :"+map);
//		Set<String> keys = map.keySet();
//		
//		PayDTO dto = new PayDTO();
//		for (String key : keys) {
//			System.out.println(key);
//			if (key.equals("ORDERNUM")) {
//				BigDecimal data = (BigDecimal) map.get("ORDERNUM");
//				int ordernum =  data.intValue();
//				dto.setORDERNUM(ordernum);
//			}
//			if (key.equals("PRICE")) {
//				BigDecimal data = (BigDecimal) map.get("PRICE");
//				int price =  data.intValue();
//				dto.setPRICE(price);
//			}
//			if (key.equals("ORDERDATE")) {
//				String data = (String) map.get("ORDERDATE");
//				dto.setORDERDATE(data);
//			}
//			
//		}
//		System.out.println(dto);
//		
//		
//		
//		
////		List<String> list = new ArrayList<>();
////		list.add(dto.getSCHEDULE1());
////		list.add(dto.getSCHEDULE2());
////		list.add(dto.getSCHEDULE3());
////		list.add(dto.getSCHEDULE4());
////		list.add(dto.getSCHEDULE5());
////		list.add(dto.getSCHEDULE6());
////		list.add(dto.getSCHEDULE7());
////		list.add(dto.getSCHEDULE8());
////		list.add(dto.getSCHEDULE9());
////		list.add(dto.getSCHEDULE10());		
////		
////		System.out.println("널인지 확인!!!!!!!"+list);
////		
////		String date = "";
////		for (int i = 0; i < list.size(); i++) {
////			if (list.get(i) != null) {
////				date += list.get(i)+",";
////			}
////		}
////		
////		String arraydate[]= date.split(",");
////		int countDate = arraydate.length;
////		
////		response.setContentType("text/html; charset=UTF-8");
////		PrintWriter out = response.getWriter();
////		String json = "{\"price\" : \"";
////		json += dto.getPRICE()+"\", \"PLACE\" : \"";
////		json += dto.getPLACE() +"\", \"CLASSNAME\" : \"";
////		json += dto.getCLASSNAME()+"\", \"countDate\": \"";
////		json += countDate+"\", \"customerName\" : \"";
////		json += dto.getUSERNAME()+"\", \"orderNum\" : \"";
////		json += dto.getORDERNUM();
////		json += "\" }";
////		out.print(json); 
//		
//	}
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String classNum = request.getParameter("classNum");

		/* System.out.println("payMain.java"+userId+" "+classNum); */
		
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
	      if (idIndex > -1) {
	         orderUserId=userId.substring(0, idIndex);
	      }
	      String orderNum= today+time+classNum+orderUserId;
		
			/* System.out.println("payMain.java"+userId+" "+classNum+" "+orderNum); */
	      
	      HttpSession session = request.getSession();
	      session.setAttribute("orderNum", orderNum);
		
		
		
		//ordernum 만든 후 데이터 가져오기
		PayService Pservice = new PayService();
		PayDTO dto = Pservice.selectOrder(orderNum.trim());		

		 System.out.println("갔다 왔음 정보 가지러 :"+dto);
		
		List<String> list = new ArrayList<>();
		list.add(dto.getSCHEDULE1());
		list.add(dto.getSCHEDULE2());
		list.add(dto.getSCHEDULE3());
		list.add(dto.getSCHEDULE4());
		list.add(dto.getSCHEDULE5());
		list.add(dto.getSCHEDULE6());
		list.add(dto.getSCHEDULE7());
		list.add(dto.getSCHEDULE8());
		list.add(dto.getSCHEDULE9());
		list.add(dto.getSCHEDULE10());		
		
		System.out.println("널인지 확인!!!!!!!"+list);
		
		String date = "";
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i) != null) {
				date += list.get(i)+",";
			}
		}
		
		String arraydate[]= date.split(",");
		int countDate = arraydate.length;
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String json = "{\"price\" : \"";
		json += dto.getPRICE()+"\", \"PLACE\" : \"";
		json += dto.getPLACE() +"\", \"CLASSNAME\" : \"";
		json += dto.getCLASSNAME()+"\", \"countDate\": \"";
		json += countDate+"\", \"customerName\" : \"";
		json += dto.getUSERNAME()+"\", \"orderNum\" : \"";
		json += dto.getORDERNUM();
		json += "\" }";
		out.print(json); 
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
