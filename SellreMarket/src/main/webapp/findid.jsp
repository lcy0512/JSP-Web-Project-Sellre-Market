<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="css/findid.css" />
<script src="js/findid.js"></script>
<body>
	<jsp:include page="header.jsp" />
	<div class="css-140915z e13dlrpy2">
		<div class="css-7500ra e13dlrpy0">아이디 찾기</div>
		<div class="css-u3y03b e13dlrpy1">
			<form class="css-s3iz85 e1h5g482">
				<div class="css-1blp8ou e1h5g481">
					<div class="css-1yjqrpx e1uzxhvi6">
						<label for="name" class="css-c3g9of e1uzxhvi4">이름</label>
						<div class="css-176lya2 e1uzxhvi3">
							<input data-testid="input-box" id="name" name="name"
								placeholder="이름을 입력해 주세요" type="text"
								class="css-u52dqk e1uzxhvi2" value="">
						</div>
					</div>
				</div>
				<div class="css-1blp8ou e1h5g481">
					<div class="css-1yjqrpx e1uzxhvi6">
						<label for="email" class="css-c3g9of e1uzxhvi4">이메일</label>
						<div class="css-176lya2 e1uzxhvi3">
							<input data-testid="input-box" id="email" name="email"
								placeholder="이메일을 입력해 주세요" type="email"
								class="css-u52dqk e1uzxhvi2" value="">
						</div>
					</div>
				</div>
				<div class="css-3vxi16 e1h5g480">
					<button class="css-1s9rhb5 e4nu7ef3" type="button" radius="4" onclick="findId()">
						<span class="css-nytqmg e4nu7ef1">확인</span>
					</button>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>