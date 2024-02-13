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
<!-- <link rel="stylesheet" href="css/adminCategoryDetail.css" />
<script src="js/adminCategoryDetail.js"></script> -->
<style>

.title {
	width:80%;
	margin-left:20px;
	align-items: left;
	font-size: 27px; /* 제목의 글꼴 크기 조정 */
	font-weight: 700; /* 제목의 글꼴 굵기 조정 */
	color: #333333; /* 제목의 글꼴 색상 조정 */
	margin-top: 500px; /* 제목의 상단 여백 조정 */
	padding-left: 20px; /* 제목의 왼쪽 여백 조정 */
	border-left: 2px solid #333333; /* 왼쪽 테두리 설정 */
	margin-bottom: 50px;
	
}
	
	
body {
    margin: 0;
    padding: 0;
    overflow-x: hidden;
}

	
	
.main {
  display: flex;
  justify-content: center;
  height: 1000px;
  flex-direction: column;
  align-items: center;
  background-color: #fff;
  padding: 20px;
  border-radius: 5px;
  margin-top : 0px;
  margin-bottom : 50px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
	
form {
  width: 80%;
  max-width: 700px; 
}
    
    .form-group {
      margin-bottom: 25px;
    }
    
    label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }
    
    .updateBtn {
      padding: 10px 20px;
      background-color: #E5E5D1;
      color: #6F6F67;
      border: none;
      border-radius: 3px;
      font-size: 16px;
      cursor: pointer;
      width: 100%;
      margin-top: 30px;
      margin-left : 10px;
    }
    
    .updateBtn:hover {
      background-color: #DADAC8;
      color : black;
    }
    
     .deleteBtn {
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
    
    .deleteBtn:hover {
      background-color: #DADAC8;
      color : black;
    }
    
   
    input[type="text"],
    textarea {
      width: 100%;
      padding: 8px;
      border-radius: 3px;
      border: 1px solid #ccc;
    }
    
    #pstock, #pname{
    	background-color: #efefef;
    }
    
   .alarm {
		font-size : 10px;
		color : red;
		margin-left : 20px;
	}
</style>
<script>

window.onload=function(){
	init();
}	
	
function init() {
	select();
	productNum()
	questNum()
}


//header-제품현황 알림표시
function productNum() {
	
	$.ajax({
		type : "POST",
		url : "adminProductNum.do",
		success : function(response){
			document.getElementById('productNum').innerText = response
		},
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

//문의 진행중 갯수 Header 알림표시
function questNum() {
	
	$.ajax({
		type : "POST",
		url : "adminQuestNum.do",
		success : function(response){
			document.getElementById('questNum').innerText = response
		},
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function select() {
	
	$.ajax({
		type : "POST",
		url : "selectAdminProductDetail.do",
		success : function(response){
			
			$("#pname").val(response[0].pname);
			$("#pEngname").val(response[0].pEngname);
			$("#pstock").val(response[0].pstock);
			$("#allery").val(response[0].allery);
			$("#nutrition").val(response[0].nutrition);
			$("#origin").val(response[0].origin);
			$("#description").val(response[0].description);
			$("#productid").val(response[0].productid);
			
		},
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

/************************************************************************************************
 * Function : 정규식 체크 
 * @param 	: null
 * @return 	: null
************************************************************************************************/
function infoCheck(){
	
	let form = document.categoryForm;
	let regex = /^[가-힣]+$/;
	let num = 0;
	
	let type = form.type.value;
	let subtype = form.subtype.value;
	
	if(type == ""){
		alert("대분류를 등록하세요.");
		form.type.select()
		num++;
		return
	}
	
	if(bname == ""){
		alert("중분류를 등록하세요.");
		form.subtype.select()
		num++;
		return
	}
	
	if (!regex.test(type) || !regex.test(subtype)) {
		alert('한글로만 입력하세요!')
		num++;
		return
	}
	
	if(num == 0){
		updateCategory()
	} else {
		return
	}
}


/************************************************************************************************
 * Function : 작성한 정보 update하기
 * @param 	: null
 * @return 	: null
************************************************************************************************/

function updateProduct() {
				 
	let pEngname = $("#pEngname").val();
	let allery = $("#allery").val();
	let nutrition = $("#nutrition").val();
	let origin = $("#origin").val();
	let description = $("#description").val();
	let productid = $("#productid").val();
	
	$.ajax({
		
		type : "POST",
		url : "adminUpdateProduct.do",
		data : {
			pEngname: pEngname,
			allery : allery,
			nutrition : nutrition,
			origin : origin,
			description : description,
			productid : productid
		},
		success : function(response){
				 if (response == "1") {
					alert("수정되었습니다.")
	                window.location.replace("/SellreMarket/admin_product.jsp"); 
	         	} else {
	         		alert('수정에 실패했습니다.')
	         	}
	        },
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}



/************************************************************************************************
 * Function : delete
 * @param 	: null
 * @return 	: null
************************************************************************************************/
function deleteProduct() {
	let productid = $("#productid").val();
	$.ajax({
		
		type : "POST",
		url : "deleteProduct.do",
		data : {
			productid : productid
		},
		success : function(response){
			
				 if (response == "1") {
					alert("삭제되었습니다.")
	                window.location.replace("/SellreMarket/admin_product.jsp"); 
	         	} else {
	         		alert('삭제에 실패했습니다.')
	         	}
	        },
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}
</script>
</head>
<body id="body">
	<jsp:include page="adminHeader.jsp" flush="false" />
		<div class="main">
			<div class="title">제품 상세<span class="alarm">* 제품명과 입고갯수는 수정할 수 없습니다.</span></div>
			
			
			<form name="categoryForm">
				<div class="form-group">
					<label for="pname">제품명</label>
					<input type="text" id="pname" name="pname" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="pEngname">영문명</label>
					<input type="text" id="pEngname" name="pEngname">
				</div>
				
				<div class="form-group">
					<label for="pstock">입고갯수</label>
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
					
				<input type="submit" class="updateBtn" onclick="updateProduct()" value="수정">
				<input type="submit" class="deleteBtn" onclick="deleteProduct()" value="삭제">
			</form>
	</div>
</body>
</html>
		
