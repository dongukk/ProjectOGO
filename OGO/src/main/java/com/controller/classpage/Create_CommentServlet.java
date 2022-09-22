package com.controller.classpage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.dto.classpage.ClassCommentDTO;
import com.dto.classpage.ClassDTO;
import com.dto.login.MemberDTO;
import com.service.classpage.ClassCommentService;

/**
 * Servlet implementation class Create_CommentServlet
 */
@WebServlet("/Create_CommentServlet")
public class Create_CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Create_CommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		ClassDTO dto_c = (ClassDTO) session.getAttribute("classnum");
		request.setCharacterEncoding("UTF-8");
	/*	if (dto!=null) {*/
			String comment_no = request.getParameter("comment_no");
			String textarea = request.getParameter("textarea");
			String comment_date = request.getParameter("comment_date");
			String userid = dto.getUserId();
			int classnum = dto_c.getClassNum();
			
			ClassCommentDTO cmt_dto = 
					new ClassCommentDTO(Integer.parseInt(comment_no),textarea,comment_date,userid,classnum);
			
			ClassCommentService cmt_service = new ClassCommentService();
			int n = cmt_service.cmtAdd(cmt_dto);
		if (n==1) {
			session.setAttribute("mesg","저장성공");
			
		}else {
			
			session.setAttribute("mesg","로그인이 필요한작업입니다");
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
