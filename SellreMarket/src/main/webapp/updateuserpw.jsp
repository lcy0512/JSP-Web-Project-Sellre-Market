<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 - 셀리마켓</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="css/findid.css" />
<script src="js/updateuserpw.js"></script>
<body>
	<jsp:include page="header.jsp" />
	<div class="css-140915z e13dlrpy2">
		<div class="css-7500ra e13dlrpy0">비밀번호 변경</div>
		<div class="css-u3y03b e13dlrpy1">
			<form class="css-s3iz85 e1h5g482" method="post" id="updateForm" action="updateUserPW.do">
				<div class="css-1blp8ou e1h5g481">
					<input type="hidden" id="userid" name="userid" value="${userid}">
					<div class="css-1yjqrpx e1uzxhvi6">
						<label for="newPassword" class="css-c3g9of e1uzxhvi4">새로운 비밀번호</label>
						<div class="css-176lya2 e1uzxhvi3">
							<input id="newPassword" name="newPassword" placeholder="새로운 비밀번호를 입력해 주세요" type="password" class="css-u52dqk e1uzxhvi2" value="">
						</div>
					</div>
				</div>
				<div class="css-1blp8ou e1h5g481">
					<div class="css-1yjqrpx e1uzxhvi6">
						<label for="authentication" class="css-c3g9of e1uzxhvi4">새로운 비밀번호 확인</label>
						<div class="css-176lya2 e1uzxhvi3">
							<input id="confirmNewPassword" name="confirmNewPassword" placeholder="새로운 비밀번호 확인을 입력해 주세요" type="password" class="css-u52dqk e1uzxhvi2" value="">
						</div>
						<span id="passwordcheckmessage"></span>
					</div>
				</div>
				<div class="css-3vxi16 e1h5g480" id="submitBtn">
					<button class="css-1s9rhb5 e4nu7ef3" type="button" radius="4" onclick="updatePW()">
						<span class="css-nytqmg e4nu7ef1">비밀번호 변경</span>
					</button>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>