<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("ekZ3X4W9E8FY6vv_Y7AK", "http://localhost:8097/OGO/LoginCURD/naverCollback.jsp");
  // 접근 토큰 값 출력
 /*  alert(naver_id_login.oauthParams.access_token); */ 
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
		     var userId = naver_id_login.getProfileData('id');
			 var nickname = naver_id_login.getProfileData('nickname');
			 var email = naver_id_login.getProfileData('email');
			 var access_token = naver_id_login.oauthParams.access_token;
			 console.log(userId);
			 console.log(nickname);	 
			 alert('네이버 로그인 성공');
			 window.opener.location.href = "../naverLogin?nickname="+nickname+"&email="+email;
			 window.close();
		  }
</script>
  </body>
</html>