package com.controller.login;

import java.awt.Event;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginUIServlet")
public class loginUIServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 안됬을시 경고 처리
		HttpSession session=request.getSession();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String mesg = (String)session.getAttribute("mesg");
		if(mesg!=null){			
			out.println("<script> alert('mesg');  location.href='MainForm.jsp'; </script>"); 
			session.removeAttribute("mesg");
			out.close();
			// response.sendRedirect("MainForm.jsp");
		} 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
