<%@page import="com.dto.notice.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.invoke.CallSite"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<jsp:include page="../common/nav.jsp" flush="false"/>
 <style type="text/css">
	/* NavBar */
	body {
  margin: 0;
  font-family: 'Nanum Gothic', sans-serif;
}

a {
  text-decoration: black;
}

.navBar{
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: white;

}
.navBar_logo{
  padding: 8px 10px;
}

.navBar_menu{
  display: flex;
  list-style: none;
  padding-left: 0;
}

.navBar_menu li {
  padding : 8px 20px;
}
.navBar_menu li:hover{
  font-size: 20px;
  transition: 0.5s;

  /*더미 css*/
  border-bottom: solid;
  border-color: blueviolet;
  /*더미 css*/
}

.login {
  /*로그인, 마이페이지 css*/
  display: flex;
  list-style: none;
  padding-left: 0;
}

.login li{
  padding: 8px 10px;
}

.navBar_btn{
  display: none;
  position: absolute;
  right: 32px;
  padding-top: 18px;
}

@media screen and (max-width: 768px){
  .navBar{
    flex-direction: column;
    align-items: flex-start;
    border: 1px;
    background-color: blueviolet;
  }
  .navBar_menu{
    flex-direction: column;
    align-items: flex-start;
    width: 100%;
    /*더미 css*/
    
    /*더미 css*/
  }
  .navBar_menu li{
    width: 100%;
    text-align: center;
    padding-left: 0px;

    /*더미 css*/
    border-bottom: solid;
    border-color: blueviolet; 
    /*더미 css*/
  }
  .login {  
    justify-content: center;
    width: 100%;

    /*더미 css*/
    border-bottom: solid;
    border-color: blueviolet;
    /*더미 css*/
  }
  .navBar_btn{
    display: block;
  }

}


 /* bar.css */ 
.header {
  position: fixed;
  top: 0;
  z-index: 1;
  width: 100%;
  background-color: #f1f1f1;
}

.progress-container {
  width: 100%;
  height: 8px;
  background: #c6c6c6;
}

.progress-bar {
  height: 8px;
  background: #ca3aff;
  width: 0%;
}

.content img {
  display: block;
  padding: 10px 0;
}
	</style>
	


<!--  <link rel="stylesheet" href="/NavBar.css"> 
 <link rel="stylesheet" href="/Bar.css"> -->
 
 
 
 <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
 <% String mesg = (String) session.getAttribute("mesg"); 
 	if(mesg != null){
 %>
<script type="text/javascript">
	alert("<%= mesg %>");
</script>
<%} session.removeAttribute("mesg"); %>
</head>


<body>

<br>
<br>
<br>
<br>
<br>
<br>


<jsp:include page="../NoticeMains/NoticeTable.jsp"></jsp:include>
<br>
<br>
<br>
<br>

<jsp:include page="../NoticeMains/Faq.jsp"></jsp:include>

</body>
</html>