<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 등록 - 셀리</title>
<link rel="shortcut icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="16x16" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="32x32" href="http://localhost:8080/SellreMarket/image/logo.png" />
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="css/adminEventRegister.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/adminEventRegister.js"></script>
</head>
<body id="body">
	<jsp:include page="adminHeader.jsp" flush="false" />
		<div class="main">
			<div class="title">이벤트 등록</div>
		
			<form action='#' name="eventForm" method="POST" enctype="multipart/form-data">
			
				<div class="form-group">
					<label for="image">이미지 *</label>
					 <img id="preview" src="" style="max-width: 100%; max-height: 200px;">
					<input type="file" id="image" name="image" onchange="readURL(this);">
				</div>
					
				<div class="form-group">
					<label for="ename">이벤트 명 *</label>
					<input type="text" id="ename" name="ename">
				</div>
				
				<div class="form-group">
					<label for="econtent">이벤트 내용 *</label>
					<input type="text" id="econtent" name="econtent">
				</div>
				
				<div class="form-group">
					<label for="startdate">이벤트 시작일 *</label>
					<input type="date" id="startdate" name="startdate">
				</div>
				
				<div class="form-group">
					<label for="enddate">이벤트 종료일 *</label>
					<input type="date" id="enddate" name="enddate">
				</div>
				
				<div class="form-group">
					<label for="salerate">할인율(%) *</label>
					<input type="text" id="salerate" name="salerate" style="text-align:right">
				</div>
				<button type="button" class="registerBtn" onclick="insertCheck()"> 등록</button>	
			</form>
	</div>
</body>
</html>