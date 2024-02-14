<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정 - 셀리마켓</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="js/mypageinfo.js"></script>
<link rel="stylesheet" href="css/mypageinfo.css" />
<body>
	<jsp:include page="header.jsp" />
	<div class="css-luwwab eug5r8l1">
		<jsp:include page="mypagemenubar.jsp" />
		<div class="css-171zbec eug5r8l0">
			<div class="css-j0lifa ed9qr673" style="border-bottom: none;">
				<div class="css-fhxb3m ed9qr672">
					<h2 class="css-1268zpe ed9qr671">개인정보 수정</h2>
				</div>
			</div>
			<div class="css-1492bdb e1f12ame0">
				<h4 class="css-z4258j e1nwufn91">비밀번호 재확인</h4>
				<p class="css-1fup356 e1nwufn90">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시
					한번 확인해주세요.</p>
			 <form action="mypagedetail.do" method="post" id="checkForm" name="checkForm">
					<div class="css-14gj3aw enqf8aq1" style="border-top: 1px solid rgb(221,221,221)">
						<div class="css-1pjgd36 e744wfw6">
							<div class="css-1y8737n e744wfw5">
								<label for="userId" class="css-1obgjqh e744wfw4">아이디</label>
							</div>
							<div class="css-82a6rk e744wfw3">
								<div class="css-1waqr6j e1uzxhvi6">
									<div class="css-176lya2 e1uzxhvi3">
										<input data-testid="input-box" id="userId" name="userId" type="text" readonly="" class="css-u52dqk e1uzxhvi2" value="${sessionScope.id}">
									</div>
								</div>
							</div>
							<div class="css-1w0ksfz e744wfw2"></div>
						</div>
						<div class="css-1pjgd36 e744wfw6">
							<div class="css-1y8737n e744wfw5">
								<label for="password" class="css-1obgjqh e744wfw4">비밀번호
								<span class="css-qq9ke6 e744wfw0">*</span></label>
							</div>
							<div class="css-82a6rk e744wfw3">
								<div class="css-1waqr6j e1uzxhvi6">
									<div class="css-176lya2 e1uzxhvi3">
										<input data-testid="input-box" id="password" name="password" placeholder="현재 비밀번호를 입력해주세요" type="password" autocomplete="off" class="css-u52dqk e1uzxhvi2" value="">
									</div>
								</div>
								<span id="pwmessage"></span>
							</div>
							<div class="css-1w0ksfz e744wfw2"></div>
						</div>
					</div>
					<div class="css-144iql5 enqf8aq0">
						<button class="css-18m884r e4nu7ef3" type="button" width="240" height="56" radius="3" id="checkinputbtn">
							<span class="css-nytqmg e4nu7ef1">확인</span>
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.html" />
</body>
</html>