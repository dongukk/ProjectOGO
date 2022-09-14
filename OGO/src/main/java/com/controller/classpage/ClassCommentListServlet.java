package com.controller.classpage;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.classpage.ClassCommentDTO;
import com.service.classpage.ClassCommentService;

/**
 * Servlet implementation class ClassCommentServlet
 */
@WebServlet("/ClassCommentListServlet")
public class ClassCommentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassCommentListServlet() {
        super();
    }
    ClassCommentService ClassCommentService = new ClassCommentService();   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		/*
		 * String comment_notice =request.getParameter("comment_notice");
		 * System.out.println(comment_notice);
		 */
		
		 
		
		//조회
		List<ClassCommentDTO> cmtlist = ClassCommentService.view();
		request.setAttribute("commentlist", cmtlist);
		System.out.println(cmtlist);
		
		request.getRequestDispatcher("class_page/comment_index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
