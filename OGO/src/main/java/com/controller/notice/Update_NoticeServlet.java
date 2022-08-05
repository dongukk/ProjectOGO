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
 * Servlet implementation class Update_NoticeServlet
 */
@WebServlet("/Update_NoticeServlet")
public class Update_NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_NoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
		String nextpage = "";
		
		if (mdto == null) {
			session.setAttribute("mesg", "로그인이 필요한 서비스입니다.");
			nextpage = "MAIN";
			//로그인 페이지 연결 되면 연결
			
		} else if (mdto.userid.equals("admin") && mdto.getUserpasswd().equals("admin")) {
			
		String nnum =  request.getParameter("nnum");
		String ntitle =  request.getParameter("ntitle");
		String ncontent =  request.getParameter("ncontent");
		
		NoticeDTO ndto = new NoticeDTO(Integer.parseInt(nnum), mdto.getUserid(), ntitle, ncontent, "today");
		
		NoticeService service = new NoticeService();
		int num = service.update(ndto);
		
				if (num == 1 ) {
					session.setAttribute("mesg", "성공적으로 수정 되었습니다.");
				} else {
					session.setAttribute("mesg", "수정중 오류가 발생 했습니다.");
				}//수정 갯수 if 
		 nextpage = "NoticeListServlet";
			
		};
			
		response.sendRedirect(nextpage);
		
	}//doget

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
