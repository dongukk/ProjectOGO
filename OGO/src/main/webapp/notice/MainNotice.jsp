<%@page import="com.dto.notice.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.invoke.CallSite"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OGO: Notice&FAQ</title>
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

 /* bar.css */ 
.header {
  position: fixed;
  top: 0;
  z-index: 1;
  width: 100%;
  background-color: #f1f1f1;
}

.content img {
  display: block;
  padding: 10px 0;
}
	</style>
	

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
<br>
<jsp:include page="../common/OGO_footer.jsp"></jsp:include>>
</body>
</html>