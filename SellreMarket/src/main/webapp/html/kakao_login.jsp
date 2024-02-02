<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	
	window.Kakao.init("ce9aa48349f4e12d726406c5ad402bfd")
	
	function loginWithKakao() {
    	Kakao.Auth.authorize({
      		redirectUri: 'https://developers.kakao.com/tool/demo/oauth',
    	});
  	}
	
	function kakaoLogin() {
		window.Kakao.Auth.login({
			scope : 'profile_nickname, profile_image',
			success : function (authObj) {
				console.log(authObj)
				window.Kakao.API.request({
					url : '/v2/user/me',
					success : res => {
						const kakao_account = res.kakao_account
						console.log(kakao_account)
						
					}
				})
			}
		})
	}
	
	function getCookie(name) {
	    var parts = document.cookie.split(name + '=');
	    if (parts.length === 2) { return parts[1].split(';')[0]; }
	}
	

</script>
</head>
<body>
	<a id="kakao-login-btn" href="javascript:kakaoLogin()">
 		<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" alt="카카오 로그인 버튼" />
	</a>
	
	<a id="kakao-logout-btn" href="javascript:kakaoLogout()">
 		로그아웃
	</a>
	
	
</body>
</html>