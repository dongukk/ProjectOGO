package com.controller.notice;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.notice.NoticeDTO;
import com.service.notice.NoticeService;

/**
 * Servlet implementation class NoticeContentServlet
 */
@WebServlet("/NoticeContentServlet")
public class NoticeContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeContentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			
			String nnum =(String) request.getParameter("Nnum");
			
			NoticeService service = new NoticeService();
			NoticeDTO dto = service.selectContent(nnum);
			System.out.println(dto);
			
			request.setAttribute("dto", dto);
			
			RequestDispatcher dis = request.getRequestDispatcher("notice/NoticeContent.jsp");
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
