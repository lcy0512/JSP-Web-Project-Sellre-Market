<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	
	<!--------------- 카카오 api 시작 --------------->
	<!-- 카카오 초기화 -->
	window.Kakao.init("ce9aa48349f4e12d726406c5ad402bfd")
	
	<!-- 카카오 동의 -->
	function loginWithKakao() {
    	Kakao.Auth.authorize({
      		redirectUri: 'https://developers.kakao.com/tool/demo/oauth',
    	});
  	}
	
	<!-- 카카오 로그인 -->
	function kakaoLogin() {
		window.Kakao.Auth.login({
			scope : 'profile_nickname, profile_image',
			success : function (authObj) {
				console.log(authObj)
				window.Kakao.API.request({
					url : '/v2/user/me',
					success : function(result) {
						var accessToken = Kakao.Auth.getAccessToken();//액세스 토큰 할당
						Kakao.Auth.setAccessToken(accessToken); //액세스 토큰 사용하게 등록
						
						
						//필수 snsType, snskey
						params.form.append([
							$('<input />', {'type' : 'hidden', 'name':'snsKey', 'value':result.id}),
							$('<input />', {'type' : 'hidden', 'name':'snsType', 'value':'kakaotalk'}),
							$('<input />', {'type' : 'hidden', 'name':'accessToken', 'value':raccessToken}),
						]);
						
						//추가 요청 값
						var dataArray = new Array();
						if(result.kaka0_account) {
							$.each(result.kakao_account, function(key, val) {
								if(typeof val == 'object'){
									$.each(val, function(smallKey, smallVal){
										dataArray[smallKey] = smallVal;
									});
								} else {
									dataArray[key] = val;
								}
							});
						}
						
						$.each(params.request, function(key, val) {
							params.form.append($('<input />', {'type':'hidden', 'name':val, 'value':dataArray[val]}))
						});
						
						params.form.submit();
					},
					
					fail : function(error){
						console.lof('연결안됨')
					}
				})
			},
			fail : function(error) {
				console.log('연결안됨')
			},
		})
	
	}
	
	
	
	/* function getCookie(name) {
	    var parts = document.cookie.split(name + '=');
	    if (parts.length === 2) { return parts[1].split(';')[0]; }
	} */
	
</script>
<script>
	<!-- 카카오 로그아웃 -->
	function kakaoLogout() {
	    Kakao.Auth.logout()
			window.Kakao.API.request({
				url : 'https://kapi.kakao.com/v1/user/logout',
				 headers: {
			            "Authorization": "Bearer "+access_token
			     },
			     json : true
			})
		}
	 }

	  // 아래는 데모를 위한 UI 코드입니다.
	  function deleteCookie() {
	    document.cookie = 'authorize-access-token=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
	  }
	<!--------------- 카카오 api 끝 --------------->
	

</script>
</head>
<body>
	<a id="kakao-login-btn" href="javascript:kakaoLogin()">
 		<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" alt="카카오 로그인 버튼" />
	</a>
	<button class="api-btn" onclick="kakaoLogout()">로그아웃</button>
	
	
</body>
</html>