package com.controller.classpage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.classpage.ClassService;

/**
 * Servlet implementation class ClassNameSearchServlet
 */
@WebServlet("/ClassNameSearchServlet")
public class ClassNameSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassNameSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userid=request.getParameter("userid");
		String className= request.getParameter("className");
		//System.out.println(userid+"\t"+className);
		
		//hashmap에 저장
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("className", className);
		ClassService service= new ClassService();
		int result =service.searchClassName(map); //튜터의 클래스 중 동일 클래스명이 있는지 검색
		String mesg="";
		if (result > 0) { //있는 경우
			mesg="이미 등록한 클래스명입니다. 다른 클래스명을 입력해주세요";
		}else { //없는 경우
			mesg="등록 가능한 클래스명입니다";
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print(mesg);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
