package com.controller.notice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.notice.MemberDTO;
import com.dto.notice.NoticeDTO;
import com.service.notice.NoticeService;

/**
 * Servlet implementation class Delete_NoticeServlet
 */
@WebServlet("/Delete_NoticeServlet")
public class Delete_NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete_NoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nnum = (String) request.getParameter("nnum");

		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
		String nextpage = "";
		
		if (mdto == null) {
			session.setAttribute("mesg", "로그인이 필요한 서비스입니다.");
			nextpage = "MAIN";
			//로그인 페이지 연결 되면 연결
			
		} else if (mdto.userid.equals("admin") && mdto.getUserpasswd().equals("admin")) {
		
			NoticeService service = new NoticeService();
			int num = service.delete(nnum);
			System.out.println("삭제 갯수"+ num);
			session.setAttribute("mesg", "영구적으로 삭제되었습니다.");
			nextpage = "MAIN";
			
		}//delete끝
		response.sendRedirect(nextpage);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
