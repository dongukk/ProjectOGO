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
import com.dto.login.PageDTO;
import com.service.login.MemberService;

@WebServlet("/ManageListServlet")
public class ManageListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String curPage = request.getParameter("curPage");//현재페이지 
		if(curPage == null) curPage = "1";//시작시 현재페이지 1 
		
		String searchName = request.getParameter("searchName");
		String searchValue = request.getParameter("searchValue");
		System.out.println(searchName+"\t"+searchValue);
		MemberService service = new MemberService();
		PageDTO pDTO = service.search(searchName, searchValue, Integer.parseInt(curPage));
		
		request.setAttribute("pDTO", pDTO);
		request.setAttribute("searchName", searchName);
		request.setAttribute("searchValue", searchValue);

		RequestDispatcher dis = request.getRequestDispatcher("ManagementMember.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
