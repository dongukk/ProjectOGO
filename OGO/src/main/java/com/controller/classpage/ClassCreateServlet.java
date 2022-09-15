package com.controller.classpage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.login.MemberDTO;
import com.service.classpage.ClassService;

/**
 * Servlet implementation class ClassCreateServlet
 */
@WebServlet("/ClassCreateServlet")
public class ClassCreateServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session =request.getSession();
		MemberDTO mDTO =(MemberDTO) session.getAttribute("login");
		
		String nextPage=null;
		if (mDTO != null) {
			ClassService cService= new ClassService();
			String userId=mDTO.getUserId();
			String tintroduce= cService.getTintroduce(userId);
			//System.out.println(tintroduce);
			request.setAttribute("tintroduce", tintroduce);
			nextPage= "classForm.jsp";
		}else {
			nextPage= "ClassListServlet";
		}
		
		RequestDispatcher dis =request.getRequestDispatcher(nextPage);
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
