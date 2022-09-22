package com.controller.classpage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.classpage.ClassCommentDTO;
import com.dto.classpage.ClassDTO;
import com.dto.classpage.UpdateCommentDTO;
import com.dto.login.MemberDTO;
import com.service.classpage.ClassCommentService;

/**
 * Servlet implementation class Delete_CommentServlet
 */
@WebServlet("/Delete_CommentServlet")
public class Delete_CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete_CommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
		ClassDTO cdto = (ClassDTO) session.getAttribute("classnum");
		String classnum = (String)request.getParameter("classnum");
		String nextpg = "";
		
		if (mdto==null) {
			session.setAttribute("mesg", "로그인이 필요합니다.");
			nextpg ="MAIN"; 
		}else if(cdto.getUserId()==mdto.getUserId()) {
			ClassCommentDTO cmtdto = new ClassCommentDTO();
			ClassCommentService cmtservice = new ClassCommentService();
			int cmtnum = cmtservice.cmtDelete(classnum);
			System.out.println("삭제"+"cmtnum");
			session.setAttribute("mesg", "삭제가 완료되었습니다.");
			nextpg="ClassPage";
			
		}
		
		
		
		response.sendRedirect(nextpg);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
