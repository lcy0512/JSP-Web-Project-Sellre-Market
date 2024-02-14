<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고요청 - 셀리</title>
<link rel="icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="16x16" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="32x32" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="stylesheet" href="css/adminOrderDetail.css" />
<script src="js/adminOrderDetail.js"></script>
</head>
<body id="body">
	<jsp:include page="adminHeader.jsp" flush="false" />
		<div class="main">
			<div class="title">입고요청</div>
		
			<form name="categoryForm">
					
				<div class="form-group">
					<label for="type">제품명</label>
					<input type="text" id="pname" name="pname" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="subtype">수량 *</label>
					<input type="text" id="count" name="count">
				</div>
				
				<div class="form-group">
					<label for="subtype">내용</label>
					<input type="text" id="content" name="content">
				</div>
				
				<input type="text" id="productid" name="productid" hidden="true">
				<button type="button" class="orderBtn" onclick="order()">요청</button>	
			</form>
			
	</div>
</body>
</html>