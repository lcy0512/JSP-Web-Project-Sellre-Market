<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 등록 - 셀리</title>
<link rel="shortcut icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="16x16" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="32x32" href="http://localhost:8080/SellreMarket/image/logo.png" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="css/adminCategoryRegister.css" />
<script src="js/adminCategoryRegister.js"></script>
</head>
<body id="body">
	<jsp:include page="adminHeader.jsp" flush="false" />
		<div class="main">
			<div class="title">카테고리 등록</div>
		
			<form name="categoryForm">
					
				<div class="form-group">
					<label for="type">대분류 *</label>
					<input type="text" id="type" name="type">
				</div>
				
				<div class="form-group">
					<label for="subtype">중분류 *</label>
					<input type="text" id="subtype" name="subtype">
				</div>
			</form>
				<input type="submit" class="registerBtn" onclick="insertCategory()" value="등록">
	</div>
</body>
</html>
		
