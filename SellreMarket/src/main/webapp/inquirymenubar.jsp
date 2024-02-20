<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script type="text/javascript">
var id = '<%=(String)session.getAttribute("id")%>';

function inquirywrite() {
	// 로그인 여부 확인
	if (id !== "null") {
		window.location.href = 'inquiry.do';
	}
	else {
		var result = window.confirm("로그인 후 이용 가능합니다. 로그인 하시겠습니까?")
		if (result === true) {
			window.location.href = 'Login.jsp';
		}
	}
}
</script>
<script src="js/inquiry.js"></script>
<link rel="stylesheet" href="css/individualInquiry.css" />
<body>
	<div class="css-833hqy ecbxmj3">
		<div class="css-1v4whg ecbxmj2">고객센터</div>
		<ul id="myList" class="css-1x9bshx ecbxmj1">
			<li id="1">
			<a class=" css-g4g0eu ecbxmj0" href="notice.jsp">공지사항
			<svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 24 24">
				<defs><path id="gfk9q0rhta" d="M1.657 1.657L9.657 1.657 9.657 9.657"></path></defs>
				<g fill="none" fill-rule="evenodd"><g><g><g>
				<g transform="translate(-339 -398) translate(0 386) translate(339 12) translate(4.69 6.343)">
				<use stroke="#999" stroke-linecap="round" stroke-width="1.8" stroke-linejoin="round" transform="rotate(45 5.657 5.657)" xlink:href="#gfk9q0rhta"></use>
				</g></g></g></g></g></svg></a>
			</li>
			<li id="3">
				<a class="active css-g4g0eu ecbxmj0" href="#" onclick="inquirywrite()">1:1 문의
				<svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 24 24">
				<defs><path id="gfk9q0rhta" d="M1.657 1.657L9.657 1.657 9.657 9.657"></path></defs>
				<g fill="none" fill-rule="evenodd"><g><g><g>
				<g transform="translate(-339 -398) translate(0 386) translate(339 12) translate(4.69 6.343)">
				<use stroke="#999" stroke-linecap="round" stroke-width="1.8" stroke-linejoin="round" transform="rotate(45 5.657 5.657)" xlink:href="#gfk9q0rhta"></use>
				</g></g></g></g></g></svg></a></li>
		</ul>
	</div>
</body>
</html>