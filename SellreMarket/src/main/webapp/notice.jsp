<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 - 셀리마켓</title>
</head>
<link rel="stylesheet" href="css/notice.css" />
<link rel="stylesheet" href="css/individualInquiry.css" />
<link rel="stylesheet" href="css/inquirywrite.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="js/noticelist.js"></script>
<body>
	<jsp:include page="header.jsp" />
	<div class="css-luwwab eug5r8l1">
		<jsp:include page="inquirymenubar.jsp" />
		<div class="css-171zbec eug5r8l0">
			<div class="css-j0lifa ed9qr673">
				<div class="css-fhxb3m ed9qr672">
					<h2 class="css-1268zpe ed9qr671">공지사항</h2>
					<span class="css-a3vgo2 ed9qr670">셀리마켓의 새로운 소식들과 유용한 정보들을 한곳에서
						확인하세요.</span>
				</div>
			</div>
			<div class="css-e23nfx e16adls21">
				<div width="50" class="css-mbsaqp e16adls20">번호</div>
				<div class="css-1ym8aqm e16adls20">제목</div>
				<div width="100" class="css-16tcewl e16adls20">작성자</div>
				<div width="100" class="css-16tcewl e16adls20">작성일</div>
			</div>
			<ul class='css-1fttcpj e1cfowvj5' id="ulinput">
			</ul>
			<br><br><br>
			<div class="css-inputrow">
				<input type="text" id="searchkeyword" name="searchkeyword" placeholder="검색할 단어를 입력해주세요." style="width: 350px; height: 44px; margin-left: 150px; padding-left: 10px;" value="">
				<button type="button" class="css-1ibxj4m" style="margin-left: 30px;" onclick="pageNum(1)">
					<span>검색하기</span>
				</button>
			</div>
			<br><br>
			<div id="block" style="text-align: center;"></div>
		</div>
		<br><br><br>
	</div>
<jsp:include page="footer.html"/>
</body>
</html>