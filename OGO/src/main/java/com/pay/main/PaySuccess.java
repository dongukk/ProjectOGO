package com.pay.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.service.pay.PayService;

/**
 * Servlet implementation class PaySuccess
 */
@WebServlet("/PaySuccess")
public class PaySuccess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public PaySuccess() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String amount = request.getParameter("amount");
		System.out.println(amount);
		
		HttpSession session = request.getSession();
		String orderNum = (String) session.getAttribute("orderNum");
		System.out.println(orderNum);
		
		
		if (amount != null && amount != "" && orderNum != null) {
			PayService Pservice = new PayService();
			int COS = Pservice.COS(orderNum);
			System.out.println(COS);
		}
		
		
		 response.sendRedirect("/OGO/PaySuccess.jsp"); 
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
