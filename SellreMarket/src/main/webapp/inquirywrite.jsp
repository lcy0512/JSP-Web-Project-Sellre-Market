<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의하기 - 셀리마켓</title>
</head>
<script src="js/inquirywrite.js"></script>
<link rel="stylesheet" href="css/inquirywrite.css" />
<body>
	<jsp:include page="header.jsp" />
	<div class="css-luwwab eug5r8l1">
	<jsp:include page="inquirymenubar.jsp" />
		<div class="css-171zbec eug5r8l0">
			<div class="css-j0lifa ed9qr673">
				<div class="css-fhxb3m ed9qr672">
					<h2 class="css-1268zpe ed9qr671">1:1 문의</h2>
				</div>
			</div>
			<form id="inquiryForm" action="inquiryInsert.do" method="post" enctype="multipart/form-data">
				<div class="css-inputrow">
					<div class="css-titlename">유형</div>
					<select name="questid" style="height: 44px; width: 320px; font-size: 50px; margin-top:10px;">
						<option value="none" selected="selected">문의 유형을 선택해주세요.</option>
						<option value="1">배송문의</option>
						<option value="2">환불문의</option>
						<option value="3">취소문의</option>
						<option value="4">상품관련</option>
					</select>
				</div>
				<div class="css-inputrow">
					<div class="css-titlename">제목</div>
					<div class="css-width"><input type="text" name="intitle" style="height: 44px; width:640px; padding-left: 5px; border-width: 2px;" placeholder="제목을 입력해주세요."></div>
				</div>
				<div class="css-inputrow">
					<div class="css-titlename">내용</div>
					<div class="css-width"><textarea name="incontent" class="css-textarea" placeholder="내용을 입력해 주세요."></textarea></div>
				</div>
				<div class="css-line12"></div>
				
				<div class="css-inputrow">
					<img id="preview" >
				</div>
				
				<div class="css-inputrow" style="margin-bottom: 0px;">
					<label for="fileInput" style="margin-left: 138px; margin-top: 10px;">사진 업로드</label>
					<input type="file" name="image" class="form-control" id="fileInput" accept="image/*"
				style="width: 500px; height: 60px; margin-bottom: 25px; margin-left: auto; display: none;" onchange="readURL(this)">
				<input class="css-submitbtn" type="button" id="inputfilename" value="사진 첨부" onclick="document.getElementById('fileInput').click();" style="margin-left: 50px; width: 80px; height: 40px; margin-top: 0px;">
				</div>
				
				<button class="css-submitbtn" type="button" width="120" radius="3"
				onclick="submitinquiry()">
					작성완료
				</button>
			</form>
		</div>
	</div>
	<jsp:include page="footer.html"/>
</body>
</html>