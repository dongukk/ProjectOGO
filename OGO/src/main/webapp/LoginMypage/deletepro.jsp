<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="com.dao.login.MemberDAO"%>
<%@page import="com.dto.login.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
 
    MemberDTO dto=(MemberDTO)session.getAttribute("login");
    String id = dto.getUserId();   
    
 String pw=request.getParameter("password");
 System.out.println(pw);
    
 MemberDAO dao=new MemberDAO();
 boolean result=dao.deleteID(id,pw);
 
 if(result) {
	 session.invalidate();	 /* 세션만 삭제됨, db회원정보 삭제로 수정요청 */

    %> 
  <h2>회원탈퇴 되었습니다.</h2>  
    <a href="../MainForm.jsp">로그인 페이지로</a>
    
   <%}else{ %> 
   
      <h2>비밀번호를 다시 확인해주세요.</h2>  
     <%}%> 
    
    
    
    
    
    
    
    
    