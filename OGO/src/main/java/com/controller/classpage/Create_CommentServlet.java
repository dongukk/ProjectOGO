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
		ClassDTO dto_c =(ClassDTO) session.getAttribute("cDTO");
		System.out.println(dto_c);
	/*	if (dto!=null) {*/
			//String comment_no = request.getParameter("comment_no");
		    String comment_no ="COMMENT_NO_SEQ.nextval" ; //nextval
		    System.out.println("commentNo: "+comment_no);
			String comment_notice = request.getParameter("cmttextarea");
			System.out.println("게시글: "+comment_notice);
			
			String comment_date = "sysdate";
			System.out.println("현재날짜: "+comment_date);
			
			String userid = dto.getUserId();
			System.out.println("ID: "+userid);
			int classnum = Integer.parseInt(request.getParameter("cmt_classnum").trim());
			/* int classnum = dto_c.getClassNum(); */
			System.out.println("classnum: "+ classnum);
			
			
			  ClassCommentDTO cmt_dto = new
			  ClassCommentDTO(comment_no,comment_notice,comment_date,userid,classnum);
			 
			ClassCommentService cmt_service = new ClassCommentService();
			
			  int n = cmt_service.cmtAdd(cmt_dto); if (n==1) {
			  session.setAttribute("mesg","저장성공");
			  
			  }else {
			  
			  session.setAttribute("mesg","로그인이 필요한작업입니다"); }
			  response.sendRedirect("ClassPage");
			 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
