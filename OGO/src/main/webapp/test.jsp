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
 <!-- (1) LoginWithNaverId Javscript SDK -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>


	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "{ekZ3X4W9E8FY6vv_Y7AK}", 
				callbackUrl: "{http://localhost:8083/OGO/test.jsp}",
				isPopup: false,
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);

		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();

		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					var email = naverLogin.user.getEmail();
					var userName = naverLogin.user.getName();
					console.log(email); // 사용자 이메일 정보를 받을수 있습니다.
					console.log(userName); // 사용자 이름 정보를 받을수 있습니다.
            		console.log(naverLogin.user); //사용자 정보를 받을수 있습니다.
            		
            		 // 유저 아이디, 이메일 주소, 이름을 Session에 저장하였습니다.
            		sessionStorage.setItem("user_info",naverLogin.user.id);
                    sessionStorage.setItem("naver_email", naverLogin.user.getEmail());
                    sessionStorage.setItem("naver_name", naverLogin.user.getName());
                	<% String email = naverLogin.user
                	session.setAttribute("email", naverLogin.user.getEmail()); %>
                    // 네이버 로그인과 카카오 로그인을 구분하기 위해 별도의 세션을 저장합니다.
                    sessionStorage.setItem("kinds","naver");
                    
                    // 회원가입 혹은 로그인 시 처리하기 위한 페이지 입니다. 예를 들어 DB
                    /* 인증이 완료된후 /sample/main.html 페이지로 이동하라는것이다. 본인 페이로 수정해야한다. */
//					 location.href = "MainForm2.jsp";
                    
                    if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}

/* 					window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "main.jsp");
 */				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
	</script>
	 String email = sessionStorage.sessionStorage.getItem("email");
<%-- 	<% 
		String email = (String) session.getAttribute("email");
	%> --%>
	<%=email %>
  </body>
</html>