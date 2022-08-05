package com.controller.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.dto.notice.FaqDTO;
import com.dto.notice.NoticeDTO;
import com.dto.notice.PageDTO;
import com.service.notice.FaqService;
import com.service.notice.NoticeService;

/**
 * Servlet implementation class NoticeLinkServlet
 */
@WebServlet("/NoticeListServlet")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		FaqService faqService = new FaqService();
		List<FaqDTO> list = faqService.selectAll();
		request.setAttribute("faqList", list);
		
		NoticeService service = new NoticeService();
		
		String curPage = request.getParameter("curPage");
		if (curPage == null) curPage="1"; //처음 들어왔을 시
		PageDTO pDTO = service.selectP( Integer.parseInt(curPage) );
		  
		  request.setAttribute("pDTO", pDTO); 
		  RequestDispatcher dis =request.getRequestDispatcher("notice/MainNotice.jsp"); 
		  dis.forward(request,response);
		 
		 
 	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
