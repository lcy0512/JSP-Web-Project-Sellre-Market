<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의답변 - 셀리</title>
<link rel="shortcut icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="16x16" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="32x32" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="stylesheet" href="css/adminQuestDetail.css" />
<script src="js/adminQuestDetail.js"></script>
</head>
<body id="body">
	<jsp:include page="adminHeader.jsp" flush="false" />
		<div class="main">
			<div class="title">문의 답변</div>
		
			<form name="eventForm">
			
				<div class="form-group">
					<label for="image">첨부이미지</label>
					<img id="preview" src="" style="max-width: 100%; max-height: 200px;">
				</div>
					
				<div class="form-group">
					<label for="intitle">문의 제목</label>
					<input type="text" id="intitle" name="intitle" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="incontent">문의 내용</label>
					<textarea id="incontent" name="incontent" rows="8" cols="96" readonly="readonly"></textarea>
				</div>
				
				<div class="form-group">
					<label for="insertdate">문의 작성일</label>
					<input type="text" id="insertdate" name="insertdate" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="answer">답변내용 *</label>
					<textarea id="answer" name="answer" rows="8" cols="96" ></textarea>
				</div>
				
				<input type="text" id="inquiryid" name="inquiryid" hidden="true">	
				
			</form>
				<input type="submit" class="registerBtn" onclick="registerEvent()" value="등록">
	</div>
</body>
</html>