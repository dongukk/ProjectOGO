package com.controller.heartlist;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.heartlist.heartlistDTO;
import com.dto.login.MemberDTO;
import com.service.heartlist.heartlistService;

/**
 * Servlet implementation class HeartListDelServlet
 */
@WebServlet("/HeartListDelServlet")
public class HeartListDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HeartListDelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		MemberDTO dto=(MemberDTO)session.getAttribute("login");
		String nextPage=null;
		
		if(dto != null) {
			
			String num = request.getParameter("num");
			heartlistService service=new heartlistService();
			
			int n = service.heartlistdel(Integer.parseInt(num));
			nextPage = "HeartListServlet";
	
		}else {
			nextPage="loginUIServlet";
			session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
		}
		
		response.sendRedirect(nextPage);
		
		}
		
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
