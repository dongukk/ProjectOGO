package com.controller.ClassListServlet;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthOptionPaneUI;

import com.dto.ClassList.ClassListDto;
import com.service.ClassList.ClassListCategoryService;
import com.service.ClassList.ClassListService;

/**
 * Servlet implementation class ClassListServlet
 */
@WebServlet("/ClassListCategoryServlet")
public class ClassListCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassListCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subcategory = request.getParameter("subcategory");
		String listsort = request.getParameter("listsort");
		String listsortall = request.getParameter("listsortall");
		String pricedesc = request.getParameter("pricedesc");
		String priceasc = request.getParameter("priceasc");
		String datedesc = request.getParameter("datedesc");
		
		  if(pricedesc!=null)
		 {  
			 List<ClassListDto> listall = ClassListService.listsortdesc(listsort);
			 request.setAttribute("listall", listall);
			 subcategory = "hello";
		 }else if(priceasc!=null) {
			 List<ClassListDto> listall = ClassListService.listsortasc(listsort);
			 request.setAttribute("listall", listall); 
			 subcategory="hello";
		 }else if(subcategory==null){
			 List<ClassListDto> listall = ClassListService.view();
			 request.setAttribute("listall", listall); 
		 }
		  
		 
		System.out.println(subcategory);
		System.out.println("소분류: "+subcategory);
		ClassListCategoryService listcategory = new ClassListCategoryService(); /*service 불러옴*/
		List<ClassListCategoryServlet> categoryDTO = listcategory.classB(subcategory); 
		//System.out.println(categoryDTO); /*Dto 안 테이블 불러옴*/
		
		
		request.setAttribute("listDTO", categoryDTO); //카테고리 출력
		System.out.println(categoryDTO);
		RequestDispatcher dispatcher = request.getRequestDispatcher("home2.jsp");
		dispatcher.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	

}
