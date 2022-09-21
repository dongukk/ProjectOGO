package com.pay.main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.login.MemberDTO;
import com.dto.pay.PayDTO;
import com.dto.pay.paymentDTO;
import com.service.pay.PayService;

@WebServlet("/PaySuccess")
public class PaySuccess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public PaySuccess() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PayService service = new PayService();
		
		String amount = request.getParameter("amount");
		System.out.println(amount);
		
		HttpSession session = request.getSession();
		String orderNum = (String) session.getAttribute("orderNum");
		System.out.println(orderNum);
		
		
		if (amount != null && amount != "" && orderNum != null) {
			PayService Pservice = new PayService();
			int COS = Pservice.COS(orderNum);
			System.out.println(COS); //결제 완료
			session.removeAttribute("orderNum");
			
			MemberDTO dto = (MemberDTO) session.getAttribute("login");
			List<PayDTO> list = service.getPaylist(dto.getUserId());
			
			for (PayDTO payDTO : list) {
				List<String> SClist = new ArrayList<>();
				SClist.add(payDTO.getSCHEDULE1());
				SClist.add(payDTO.getSCHEDULE2());
				SClist.add(payDTO.getSCHEDULE3());
				SClist.add(payDTO.getSCHEDULE4());
				SClist.add(payDTO.getSCHEDULE5());
				SClist.add(payDTO.getSCHEDULE6());
				SClist.add(payDTO.getSCHEDULE7());
				SClist.add(payDTO.getSCHEDULE8());
				SClist.add(payDTO.getSCHEDULE9());
				SClist.add(payDTO.getSCHEDULE10());		
				
				String date = "";
				for (int i = 0; i < SClist.size(); i++) {
					if (SClist.get(i) != null) {
						date += SClist.get(i)+",";
					}//if
				
				System.out.println("하나씩 만들어서 date에 넣었어!"+date);
				
				payDTO.setAllschedule(date);
				
				}//for
			}//list
			
			
			
			
			session.setAttribute("PayList", list);
		}//if 아이디가 있을 경우
		
		session.removeAttribute("orderNum");
		response.sendRedirect("/OGO/PaySuccess.jsp"); 
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
