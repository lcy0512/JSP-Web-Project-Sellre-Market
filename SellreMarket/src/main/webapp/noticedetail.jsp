<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 - 셀리마켓</title>
</head>
<link rel="stylesheet" href="css/inquirywrite.css" />
<body>
	<jsp:include page="header.jsp"/>
	<div class="css-2b29tl eug5r8l2"> <!-- content를 전부 감싸주는 div -->
		<div class="css-luwwab eug5r8l1"> <!-- menubar와 content의 형태를 잡아주는 div -->
			<jsp:include page="inquirymenubar.jsp"/>
			<div class="css-171zbec eug5r8l0"> <!-- 현재 페이지에서 보여줄 content에 대한 div -->
				<div class="css-j0lifa ed9qr673"> <!-- 1:1 문의 div -->
					<div class="css-fhxb3m ed9qr672">
						<h2 class="css-1268zpe ed9qr671">공지사항</h2>
					</div>
				</div>
				<c:forEach items="${eventDetail}" var="detail">
					${detail.pname}
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>