<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품등록 - 셀리</title>
<link rel="shortcut icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="16x16" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="32x32" href="http://localhost:8080/SellreMarket/image/logo.png" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="css/adminProductRegister.css" />
<script src="js/adminProductRegister.js"></script>

</head>
<body>
	<jsp:include page="adminHeader.jsp" flush="false" />
		<div class="main">
			<div class="title">제품 등록</div>
				
		
			<form name="productForm" method="post" enctype="multipart/form-data">
				
				<!-- product_image -->				
					<div class="form-group">
						<label for="image">이미지 *</label>
						 <img id="preview" src="" style="max-width: 100%; max-height: 200px;">
						<input type="file" id="image" name="image" onchange="readURL(this);">
					</div>
					
				<!-- product_image -->
				<!-- product -->
					<div class="form-group1">
						<label for="bname">제조사명 *</label>
						<select id="bname" name="bname"></select>
					</div>
					
					<div class="form-group">
						<label for="pname">제품명 *</label>
						<input type="text" id="pname" name="pname">
					</div>
					
					<div class="form-group">
						<label for="pEngname">영문명 *</label>
						<input type="text" id="pEngname" name="pEngname">
					</div>
					
					<div class="form-group">
						<label for="allery">알레르기</label>
						<input type="text" id="allery" name="allery">
					</div>
					
					<div class="form-group">
						<label for="nutrition">영양성분</label>
						<input type="text" id="nutrition" name="nutrition">
					</div>
					
					<div class="form-group">
						<label for="pstock">수량 *</label>
						<input type="text" id="pstock" name="pstock">
					</div>
					
					
					<div class="form-group">
						<label for="origin">원산지 *</label>
						<input type="text" id="origin" name="origin">
					</div>
					
					<div class="form-group"> 
						<label for="description">설명 *</label>
						<textarea id="description" name="description"></textarea>
					</div>
				<!-- product -->
				
				
				<!-- price -->				
					<div class="form-group">
						<label for="price">가격 *</label>
						<input type="text" id="price" name="price" oninput="formatNumber(this.value)">
					</div>
				<!-- price -->	
				
				
				<!-- category -->	
					<div class="form-group2">
						<label for="category">카테고리 *</label>
						<select id="type" name="type"></select>
						<select id="subType" name="subType"></select>
					</div>
				<!-- category -->	
				
				<!-- packing -->	
					<div class="form-group1">
						<label for="packtype">포장타입</label>
						<select id="packType" name="packType"></select>
					</div>
	
					<div class="form-group1">
						<label for="packkind">포장종류</label>
						<select id="packKind" name="packKind"></select>
					</div>
				<!-- packing -->
				
				<!-- saleunit -->
					<div class="form-group">
						<label for="utype">판매단위</label>
						<input type="text" id="utype" name="utype">
					</div>
					
					<div class="form-group">
						<label for="ugram">중량</label>
						<input type="text" id="ugram" name="ugram">
					</div>
				<!-- saleunit -->
				
				<!-- delivertype -->
					<div class="form-group1">
						<label for="dname">배송종류</label>
						<select id="dname" name="dname"></select>
					</div>
				<!-- delivertype -->	

				
			</form>
			<input type="submit" class="registerBtn" onclick="insertProduct()" value="등록">
</div>
</body>
</html>
		
