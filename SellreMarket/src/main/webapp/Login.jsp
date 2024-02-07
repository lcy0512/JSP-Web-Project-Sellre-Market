<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sellre Market Login</title>

<link rel="preload" href="https://res.kurly.com/_next/static/css/d59287ec5b86dc49.css" as="style" />
<link rel="stylesheet" href="https://res.kurly.com/_next/static/css/d59287ec5b86dc49.css" data-n-g />
<link rel="stylesheet" href="css/login.css" />

</head>

<script type="text/javascript">
	function signup() {
		window.location.href = "CustomerSignup.jsp";
	}
	
	// 정규식
	function checkMember() {
		
		//정규식
		let regExpId = /^[A-Za-z][A-Za-z0-9]{2,}$/;
		let regExpPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,100}$/;
		
		let form = document.Member;
		
		let id = form.id.value;
		let pw = form.pw.value;
		
		if(id === ""){
			alert("아이디를 입력해 주세요.");
			form.id.focus();
			return false;
		}
		if(!regExpId.test(id)){
			alert("아이디는 영문자로 시작하고, 3자리 이상이여야 합니다.");
			form.id.select();
			return false	;
		}
		if(pw === ""){
			alert("비밀번호를 입력해 주세요.");
			form.pw.focus();
			return false;
		}
		if(!regExpPw.test(pw)){
			alert("비밀번호는 영문 대소문자, 숫자, 특수문자 중 하나 이상 포함하여야 하고 8~100자까지 작성할 수 있습니다.");
			form.pw.select();
			return false	;
		}			
		return true;	
	}
	
	/* function checkId() {
		
		var form = document.getElementById('myForm'); 
		
		document.getElementById('setId').value = document.getElementById('id').value;
		
		form.submit();
	} */
</script>

<body>

	<!-- footer start -->
		<jsp:include page="header.jsp"/>
	<!-- footer end -->

	<div class="css-1bb6q2p etkckst2">
		<div class="css-a7gihu etkckst1">로그인</div>
		<div class="css-1axolzg etkckst0">
			<form id="myForm" action="loginCheck.do" method="post">
				<div class="css-46b038 e18ap6t76">
					<div class="css-1accgqb e1uzxhvi6">
						<div class="css-176lya2 e1uzxhvi3">
							<input id="id"
								placeholder="아이디를 입력해주세요" type="text"
								class="css-u52dqk e1uzxhvi2">
							<c:set var="setId" value="${param.id}" scope="request" />
						</div>
					</div>
					<div class="css-1accgqb e1uzxhvi6">
						<div class="css-176lya2 e1uzxhvi3">
							<input id="password"
								placeholder="비밀번호를 입력해주세요" type="password"
								class="css-u52dqk e1uzxhvi2">
						</div>
					</div>
				</div>
				<div class="css-1vjdduq e18ap6t75">
					<a class="css-i4t6me e18ap6t74">아이디 찾기</a><span
						class="css-1cgn39v e18ap6t73"></span><a
						class="css-i4t6me e18ap6t74">비밀번호 찾기</a>
				</div>
				<div class="css-s4i9n2 e18ap6t71">
					<button class="css-qaxuc4 e4nu7ef3" type="submit" height="54" radius="3">
						<span class="css-nytqmg e4nu7ef1">로그인</span>
					</button>
					<button class="css-hxorrg e4nu7ef3" type="button" height="54" radius="3" onclick="signup()">
						<span class="css-nytqmg e4nu7ef1">회원가입</span>
					</button>
				</div>
			</form>
		</div>
	</div>
	
	
	<!-- footer start -->
	<jsp:include page="footer.html"/>
	<!-- footer end -->
</body>
</html>