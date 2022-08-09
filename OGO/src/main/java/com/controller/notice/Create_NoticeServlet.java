package com.controller.notice;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.login.MemberDAO;
import com.dto.login.MemberDTO;
import com.dto.notice.NoticeDTO;
import com.service.notice.NoticeService;

/**
 * Servlet implementation class Create_eNoticeServlet
 */
@WebServlet("/Create_NoticeServlet")
public class Create_NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Create_NoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ntitle = request.getParameter("ntitle");
		String ncontent = request.getParameter("textarea");
		
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		String userid = dto.getUserId();
		
		NoticeDTO Ndto = new NoticeDTO(0, userid, ntitle, ncontent, "today"); 
		//dto는 nickname자리지만 필요한 정보는 userid이기 때문에  nickname자리에 userid작성
		
		NoticeService service = new NoticeService();
		int Cnum = service.new_notice(Ndto);
		if (Cnum == 1) {
			session.setAttribute("mesg", "성공적으로 글을 작성했습니다.");
			response.sendRedirect("NoticeListServlet");
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
