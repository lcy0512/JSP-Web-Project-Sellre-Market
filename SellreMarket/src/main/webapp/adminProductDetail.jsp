<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 - 셀리</title>
<link rel="shortcut icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="16x16" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="32x32" href="http://localhost:8080/SellreMarket/image/logo.png" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="css/adminProductDetail.css" />

</head>
<body id="body">
	<jsp:include page="adminHeader.jsp" flush="false" />
		<div class="main">
			<div class="title">제품 상세<span class="alarm">* 제품명, 이미지, 수량은 수정할 수 없습니다.</span></div>
			
			
			<form name="categoryForm" id="formPlease" enctype="multipart/form-data" method="post">
			
			
				<div class="form-group1">
					<label for="image">이미지 *</label>
					<img id="preview" src="" style="max-width: 100%; max-height: 200px;">
					
					<!-- <div class="fileContainer">
						<input type="file" id="image" name="image" onchange="readURL(this);">
					</div> -->
					<!-- <input type="text" id="ddddimg" name="iddddmg"> -->
					
				</div>
				<div class="form-group">
					<label for="pname">제품명</label>
					<input type="text" id="pname" name="pname" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="pEngname">영문명</label>
					<input type="text" id="pEngname" name="pEngname">
				</div>
				
				<div class="form-group">
					<label for="pstock">수량</label>
					<input type="text" id="pstock" name="pstock" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="allery">알레르기 성분</label>
					<textarea id="allery" name="allery" rows="8" cols="96" ></textarea>
				</div>
				
				<div class="form-group">
					<label for="nutrition">영양성분</label>
					<textarea id="nutrition" name="nutrition" rows="8" cols="96" ></textarea>
				</div>
				
				<div class="form-group">
					<label for="origin">원산지</label>
					<input type="text" id="origin" name="origin">
				</div>
				
				<div class="form-group">
					<label for="description">설명</label>
					<textarea id="description" name="description" rows="8" cols="96" ></textarea>
				</div>
				
				
				<input type="text" id="productid" name="productid" hidden="true">
					
			</form>
				<input type="submit" class="updateBtn" id="updateBtn" onclick="updateProduct()" value="수정">
				<input type="submit" class="deleteBtn" id="deleteBtn" onclick="deleteProduct()" value="삭제">
	</div>
	
	<script src="js/adminProductDetail.js"></script>
</body>
</html>
		
