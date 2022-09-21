package com.controller.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.login.MemberService;

/**
 * Servlet implementation class deleteAllMemberServlet
 */
@WebServlet("/deleteAllMemberServlet")
public class deleteAllMemberServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String [] userIds = request.getParameterValues("delCheck");
	    List<String> list = Arrays.asList(userIds);
	    System.out.println(list);
	    MemberService service = new MemberService();
	    int n = service.deleteAll(list);
	     
	    response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(n == 1) {	
			out.println("<script>alert('회원 "+list+"을(를) 탈퇴시켰습니다.'); window.location.href='ManagementMember.jsp';	</script>");
		} else {		
			out.println("<script>alert('회원삭제 실패'); </script>");	
		}
		out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
