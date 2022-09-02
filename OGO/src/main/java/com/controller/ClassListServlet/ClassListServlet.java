package com.controller.ClassListServlet;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.ClassList.ClassListDto;
import com.service.ClassList.ClassListService;

/**
 * Servlet implementation class ClassListServlet
 */
@WebServlet("/ClassListServlet")
public class ClassListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		ClassListService listservice = new ClassListService(); /*service 불러옴*/
		List<ClassListDto> listDTO = listservice.view(); 
		System.out.println(listDTO); /*Dto 안 테이블 불러옴*/
		
		request.setAttribute("listDTO", listDTO);
		RequestDispatcher dispatcher = request.getRequestDispatcher("home2.jsp");
		dispatcher.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	

}
