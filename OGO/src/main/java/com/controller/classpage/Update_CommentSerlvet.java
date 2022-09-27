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
		ClassDTO dto_c =(ClassDTO) session.getAttribute("cDTO");
		System.out.println(dto_c);
		String nextpg = "";
		if (mdto==null) {
			session.setAttribute("mesg", "로그인이 필요합니다.");
			nextpg =""; 
		}else if(mdto!=null) {
			String comment_notice = request.getParameter("cmttextarea2");
			System.out.println("수정글: "+comment_notice);
			String userid = mdto.getUserId();
			System.out.println("ID: "+userid);
			int classnum = dto_c.getClassNum();
			System.out.println("classNum: "+classnum);
			String comment_date = "sysdate";
			System.out.println("현재날짜: "+comment_date); 
			
			UpdateCommentDTO cmtupdatedto = new UpdateCommentDTO(classnum,userid,comment_notice,comment_date);
			ClassCommentService cmtservice = new ClassCommentService();
			int cmtnum = cmtservice.cmtUpdate(cmtupdatedto);
			if(cmtnum ==1) {
				session.setAttribute("mesg", "성공적으로 수정 되었습니다.");
			}else {
				session.setAttribute("mest", "다시 시도해주세요.");
			}
			//nextpg="ClassPage";
			response.sendRedirect("ClassPage");
			
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
