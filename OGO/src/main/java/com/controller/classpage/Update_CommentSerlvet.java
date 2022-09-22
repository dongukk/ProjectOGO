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
 * Servlet implementation class Update_CommentSerlvet
 */
@WebServlet("/Update_CommentSerlvet")
public class Update_CommentSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_CommentSerlvet() {
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
		String nextpg = "";
		
		if (mdto==null) {
			session.setAttribute("mesg", "로그인이 필요합니다.");
			nextpg ="MAIN"; 
		}else if(cdto.getUserId()==mdto.getUserId()) {
			String textarea = request.getParameter("textarea");
			String userid = request.getParameter("userid");
			String CLASSNUM = request.getParameter("CLASSNUM");
			
			UpdateCommentDTO cmtupdatedto = new UpdateCommentDTO(Integer.parseInt(CLASSNUM),userid,textarea);
			ClassCommentService cmtservice = new ClassCommentService();
			int cmtnum = cmtservice.cmtUpdate(cmtupdatedto);
			if(cmtnum ==1) {
				session.setAttribute("mesg", "성공적으로 수정 되었습니다.");
			}else {
				session.setAttribute("mest", "다시 시도해주세요.");
			}
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
