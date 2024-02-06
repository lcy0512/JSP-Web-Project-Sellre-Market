<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<script type="text/javascript">
	function signup() {
		window.location.href = "CustomerSignup.jsp";
	}
</script>
<link rel="preload"
		href="https://res.kurly.com/_next/static/css/d59287ec5b86dc49.css"
		as="style" />
	<link rel="stylesheet"
		href="https://res.kurly.com/_next/static/css/d59287ec5b86dc49.css"
		data-n-g />
	<link rel="stylesheet" href="../css/login.css" />
	<jsp:include page="header.jsp"/>
	<div class="css-1bb6q2p etkckst2">
		<div class="css-a7gihu etkckst1">로그인</div>
		<div class="css-1axolzg etkckst0">
			<form>
				<div class="css-46b038 e18ap6t76">
					<div class="css-1accgqb e1uzxhvi6">
						<div class="css-176lya2 e1uzxhvi3">
							<input data-testid="input-box" name="id"
								placeholder="아이디를 입력해주세요" type="text"
								class="css-u52dqk e1uzxhvi2" value="">
						</div>
					</div>
					<div class="css-1accgqb e1uzxhvi6">
						<div class="css-176lya2 e1uzxhvi3">
							<input data-testid="input-box" name="password"
								placeholder="비밀번호를 입력해주세요" type="password" autocomplete="off"
								class="css-u52dqk e1uzxhvi2" value="">
						</div>
					</div>
				</div>
				<div class="css-1vjdduq e18ap6t75">
					<a class="css-i4t6me e18ap6t74">아이디 찾기</a><span
						class="css-1cgn39v e18ap6t73"></span><a
						class="css-i4t6me e18ap6t74">비밀번호 찾기</a>
				</div>
				<div class="css-s4i9n2 e18ap6t71">
					<button class="css-qaxuc4 e4nu7ef3" type="submit" height="54"
						radius="3">
						<span class="css-nytqmg e4nu7ef1">로그인</span>
					</button>
					<button class="css-hxorrg e4nu7ef3" type="button" height="54" radius="3" onclick="signup()">
						<span class="css-nytqmg e4nu7ef1">회원가입</span>
					</button>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="footer.html"/>
</body>
</html>