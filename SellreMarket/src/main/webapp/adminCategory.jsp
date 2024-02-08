<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 현황 - 셀리</title>
<link rel="shortcut icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="16x16" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="32x32" href="http://localhost:8080/SellreMarket/image/logo.png" />
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="css/adminCategory.css" />
<script src="js/adminCategory.js"></script>
</head>
<body>
	<main>
	<jsp:include page="adminHeader.jsp" flush="false" />
		<div class="main">
			<div class="title" style="display : inline-block">카테고리 현황</div>
			<div class="btnGroup" style="display : inline-block">
				<a href="adminCategoryRegister.do"><button class="registerBtn">등록</button></a>
			</div>
			<div class="main_content">
				<div id="result" class="tableContainer"></div> <!-- 테이블 조회 위치 -->
			</div>
			<div id="paging"></div>	<!-- 페이징 조회 위치 -->
		</div>
	</main>
	
</body>
</html>