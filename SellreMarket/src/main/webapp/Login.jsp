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
<script src="js/Login.js"></script>

<body>

	<!-- footer start -->
		<jsp:include page="header.jsp"/>
	<!-- footer end -->

	<div class="css-1bb6q2p etkckst2">
		<div class="css-a7gihu etkckst1">로그인</div>
		<div class="css-1axolzg etkckst0">
			<form id="myForm" method="post">
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
					<button class="css-qaxuc4 e4nu7ef3" type="button" height="54" radius="3" onclick="checkId()">
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