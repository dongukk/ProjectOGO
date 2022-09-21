package com.controller.login;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.login.MemberDTO;
import com.service.login.MemberService;

@WebServlet("/ManageOrderServlet")
public class ManageOrderServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
			
		String order = request.getParameter("order");
		System.out.println("order : "+order);
		MemberService service = new MemberService();
		
		List<MemberDTO> list = service.order(order);
		
		request.setAttribute("order", order);
		request.setAttribute("list", list);

		RequestDispatcher dis = request.getRequestDispatcher("ManagementMember.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
