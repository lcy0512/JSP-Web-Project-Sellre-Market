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

<!-- <link rel="stylesheet" href="css/" /> -->

<style>
	/* 타이틀 스타일 */
   .title {
		display: flex;
		align-items: center;
		font-size: 27px; /* 제목의 글꼴 크기 조정 */
		font-weight: 700; /* 제목의 글꼴 굵기 조정 */
		color: #333333; /* 제목의 글꼴 색상 조정 */
		margin-top: 100px; /* 제목의 상단 여백 조정 */
		padding-left: 20px; /* 제목의 왼쪽 여백 조정 */
		border-left: 2px solid #333333; /* 왼쪽 테두리 설정 */
		margin-bottom: 28px;
	}
	
	 .main {
        position : relative;
        top : 10px;
        left : 240px;
        flex-direction: column;
        align-items: center;
    	overflow-y: auto;
    }

	form {
		width:  80%; 
	}    
    
    .form-group {
      margin-bottom: 25px;
    }
    
    label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }
    
    input[type="text"],
    input[type="file"],
    textarea {
      width: 100%;
      padding: 8px;
      border-radius: 3px;
      border: 1px solid #ccc;
    }
    
    input[type="checkbox"] {
      margin-right: 5px;
    }
    
    .form-group input[type="date"] {
		padding: 5px;
		border: 1px solid #ccc;
		border-radius: 4px;
		font-size: 14px;
	}
    
    
    .registerBtn {
      padding: 10px 20px;
      background-color: #E5E5D1;
      color: #6F6F67;
      border: none;
      border-radius: 3px;
      font-size: 16px;
      cursor: pointer;
      width: 100%;
      margin-top: 30px;
      margin-bottom: 200px;
      margin-left : 10px;
    }
    
    .registerBtn:hover {
      background-color: #DADAC8;
      color : black;
    }
    
    
    
    .form-group1 {
	  display: flex;
	  flex-direction: column;
	  margin-bottom: 25px;
	}
	
	.form-group1 label {
	  font-weight: bold;
	}
	
	.form-group1 input,
	.form-group1 select {
	  padding: 5px;
	  border: 1px solid #ccc;
	  border-radius: 4px;
	  font-size: 14px;
	}
	
	.form-group1 select {
	  height: 30px;
	}
	
	
	.form-group2 {
	  display: flex;
	  flex-direction: row;
	  align-items: center;
	  margin-bottom: 25px;
	}
	
	.form-group2 label {
	  font-weight: bold;
	  margin-right: 15px;
	}
	
	.form-group2 select {
	  padding: 5px;
	  border: 1px solid #ccc;
	  border-radius: 4px;
	  font-size: 14px;
	  height: 30px;
	  width: 150px; /* 원하는 너비로 조정해주세요 */
	  margin-right: 5px;
	}
	
    
</style>
<script>
	/* 소비기한 오늘짜 보다 과거는 선택못하도록  */
	
	/* 카테고리,포장타입 , 포장 종류 창 시작할 때 조회되도록  */
	window.onload=function(){
		init();
	}	
	
	
	function init() {
		selectCategory();
		selectPackType();
		selectPackKind();
	}
	
	
	/************************************************************************************************
	 * Function : 카테고리 대분류 조회 - ajax
	 *			  가져온 대분류 카테고리를 <option>태그에 넣고 <select>태그에 집어넣기 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	function selectCategory() {
		$.ajax({
			type : "POST",
			url : "selectCategory.do",
			success : function(response){
				createCategory(response)
			},
			 error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	 
	function createCategory(data){
		let option = "";
		
		for (var i = 0; i < data.length; i++) {
		    if (i === 0) {
		        option += "<option value='option" + (i + 1) + "' selected='selected'>" + data[i].type + "</option>";
		      } else {
		    	  option += "<option value='option" + (i + 1) + "'>" + data[i].type + "</option>";
		      }
		    }
		$("#type").html(option);
		
		selectSubCategory();
	}
	
	
	/************************************************************************************************
	 * Function : 대분류 카테고리가 변경 될 떼, 중분류 카테고리가 변경되도록 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	document.addEventListener("DOMContentLoaded", function() {
		  var typeSelect = document.getElementById("type");
		  typeSelect.addEventListener("change", selectSubCategory);
	});
	
	
	
	
	/************************************************************************************************
	 * Function : 중분류 카테고리 ajax로 조회
	 *			  가져온 중분류 카테고리를 <option>태그에 넣고 <select>태그에 집어넣기 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	function selectSubCategory() {
		
 		let selectElement = document.getElementById("type"); 						// HTML에서 <select> 요소 가져오기
		let selectedText = selectElement.options[selectElement.selectedIndex].text;	// <select>요소의 selected된 텍스트 가져오기 
		
		$.ajax({
			
			type : "POST",
			url : "selectSubCategory.do",
			data : {categoryType: selectedText},
			success : function(response){
				createSubCategory(response)
			},
			 error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
	}
	
	function createSubCategory(data){
		let option = "";
		
		for (var i = 0; i < data.length; i++) {
			if(i == 0){
				option +="<option value='option" + (i + 1) + "' selected='selected'>"+data[i].type+"</option>";
			} else {
				option +="<option value='option" + (i + 1) + "'>"+data[i].type+"</option>";
			}
		}
		$("#subType").html(option);
	}
	
	 
 /************************************************************************************************
	 * Function : 포장타입 조회 - ajax
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	function selectPackType() {
		 
		$.ajax({
			type : "POST",
			url : "selectPackType.do",
			success : function(response){
				createPackType(response)
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	} 
 
 
	function createPackType(data) {
		
		let option = "";
		
		for (var i = 0; i < data.length; i++) {
			if(i == 0){
				option +="<option value='option" + (i + 1) + "' selected='selected'>"+data[i].packtype+"</option>";
			} else {
				option +="<option value='option" + (i + 1) + "'>"+data[i].packtype+"</option>";
			}
		}
		
		$("#packType").html(option);
		
	}

	/************************************************************************************************
	 * Function : 포장종류 조회 - ajax, 가져온 데이터 해당 id에 넣기
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	function selectPackKind() {
		 
		$.ajax({
			type : "POST",
			url : "selectPackKind.do",
			success : function(response){
				createPackKind(response)
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	} 
 
 
	function createPackKind(data) {
		
		let option = "";
		
		for (var i = 0; i < data.length; i++) {										
			if(i == 0){
				option +="<option value='option" + (i + 1) + "' selected='selected'>"+data[i].packkind+"</option>";
			} else {
				option +="<option value='option" + (i + 1) + "'>"+data[i].packkind+"</option>";
			}
		}
		
		$("#packKind").html(option);
		
	}
	
	
	/************************************************************************************************
	 * Function : 이미지 선택했을 때 preview에 이미지 넣기 이벤트 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	$("#image").on("change", function(event) {

	    var file = event.target.files[0];
	
	    var reader = new FileReader(); 
	    reader.onload = function(e) {
	
	        $("#preview").attr("src", e.target.result);
	    }
	
	    reader.readAsDataURL(file);
	});
	
	
	/************************************************************************************************
	 * Function : 파일명 체크 함수
	 * @param 	: 선택한 파일
	 * @return 	: null
	************************************************************************************************/
	function isImageFile(file) {
	    var ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다. 

	    return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
	}
	
	
	
	/************************************************************************************************
	 * Function : 이미지 선택했을 때 preview에 이미지 넣기 함수 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('preview').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('preview').src = "";
		}
	}
	
	
	
	/************************************************************************************************
	 * Function : 숫자입력 시 3자리마다 쉼표 
	 * @param 	: 입력한 price 값
	 * @return 	: null
	************************************************************************************************/	
	function formatNumber(value) {
		
		let number = parseFloat(value.replace(/,/g, ''));	// 숫자만 추출
		
		let formattedNumber = number.toLocaleString();		// 3자리마다 쉼표 추가
		
		if (!isNaN(number)) {								// 입력값 업데이트
			document.registerForm.price.value = formattedNumber
		}
	}
	
	
	
	/************************************************************************************************
	 * Function : 정규식 체크 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	function infoCheck(){
		
		let form = document.productForm;
		let num = 0;
		
		let file = form.image.value;
		let bname = form.bname.value;
		let pname = form.pname.value;
		let pEngname = form.pEngname.value;
		let pstock = form.pstock.value;
		let origin = form.origin.value;
		let expirationdate = form.expirationdate.value;
		let description = form.description.value;
		let price = form.price.value;
		
		if(file == ""){
			alert("이미지를 등록하세요.");
			num++;
			return
		}
		
		if(bname == ""){
			alert("제조사명을 등록하세요.");
			form.bname.select()
			num++;
			return
		}
		
		if(pname == ""){
			alert("제품명을 등록하세요.");
			form.pname.select()
			num++;
			return
		}
		
		if(pEngname == ""){
			alert("영문명을 등록하세요.");
			form.pEngname.select()
			num++;
			return
		}
		
		if(pstock == ""){
			alert("수량을 등록하세요.");
			form.pstock.select()
			num++;
			return
		}
		
		if(origin == ""){
			alert("원산지를 등록하세요.");
			form.origin.select()
			num++;
			return
		}
		
		if(expirationdate == ""){
			alert("소비기한을 등록하세요.");
			num++;
			return
		}
		
		if(description == ""){
			alert("설명을 등록하세요.");
			form.description.select()
			num++;
			return
		}	
		
		if(price == ""){
			alert("가격을 등록하세요.");
			form.price.select()
			num++;
			return
		}	
	
		if(num == 0) {
			insertProduct();
		}
	}

	
	/************************************************************************************************
	 * Function : 작성한 정보 inset하기
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	
	function insertProduct() {
					 
		let image = $("#image").val();
		let bname = $("#bname").val();
		let pname = $("#pname").val();
		let pEngname = $("#pEngname").val();
		let allery = $("#allery").val();
		let nutrition = $("#nutrition").val();
		let pstock = $("#pstock").val();
		let origin = $("#origin").val();
		let expirationdate = $("#expirationdate").val();
		let description = $("#description").val();
		let price = $("#price").val();
		let type = $("#type").val();
		let subType = $("#subType").val();
		let packType = $("#packType").val();
		let packKind = $("#packKind").val();
		let utype = $("#utype").val();
		let ugram = $("#ugram").val();
		 
		$.ajax({
			
			type : "POST",
			url : "insertProduct.do",
			data : {
					image: image,
					bname : bname,
					pname : pname,
					pEngname : pEngname,
					allery : allery,
					nutrition : nutrition, 
					pstock : pstock,
					origin : origin,
					expirationdate : expirationdate,
					description : description,
					price : price,
					type : type,
					subType : subType,
					packType : packType,
					packKind : packKind,
					utype : utype,
					ugram : ugram
					
			},
			success : function(response){
				if(response == 6){
					alert(pname+'['+pstock+']개 등록되었습니다.');
					window.location.href = "admin_product.jsp";	//성공 시 admin_product.jsp로 이동
				} else {
					console.log("error")
				}
			},
			 error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
			
	}
	
</script>
</head>
<body>
	<jsp:include page="adminHeader.jsp" flush="false" />
		<div class="main">
			<div class="title">제품 등록</div>
				
		
			<form name="productForm">
				
				<!-- product_image -->				
					<div class="form-group">
						<label for="image">이미지 *</label>
						 <img id="preview" src="" style="max-width: 100%; max-height: 200px;">
						<input type="file" id="image" name="image" onchange="readURL(this);">
					</div>
					
				<!-- product_image -->
				<!-- product -->
					<div class="form-group">
						<label for="bname">제조사명 *</label>
						<input type="text" id="bname" name="bname">
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

				<input type="submit" class="registerBtn" onclick="insertProduct()" value="등록">
			</form>
</div>
</body>
</html>
		
