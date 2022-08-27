package com.pay.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ordernum = request.getParameter("ordernum"); //데이터 받기
		System.out.println("넘어온 데이터 확인"+ordernum); //데이터 확인
		
		PayService Pservice = new PayService();
		PayDTO dto = Pservice.selectOrder(ordernum);		
		System.out.println(dto);
		
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
