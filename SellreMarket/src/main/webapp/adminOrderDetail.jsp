<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고요청 - 셀리</title>
<link rel="shortcut icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="16x16" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="32x32" href="http://localhost:8080/SellreMarket/image/logo.png" />
</head>
<script>

window.onload=function(){
	init();
}	
	
function init() {
	select();
	productNum();
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

function select() {
	
	$.ajax({
		type : "POST",
		url : "selectAdminOrderDetail.do",
		success : function(response){
			$("#pname").val(response[0].pname);
			$("#productid").val(response[0].productid);
		},
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}



/************************************************************************************************
 * Function : 작성한 정보 inset하기
 * @param 	: null
 * @return 	: null
************************************************************************************************/

function order() {
				 
	let pname = $("#pname").val();
	let count = $("#count").val();
	let productid = $("#productid").val();

		
	$.ajax({
		
		type : "POST",
		url : "orderProduct.do",
		data : {
			count : count,
			productid : productid,
			content : content
		},
		success : function(response){
				 if (response === "2") {
					alert(pname+"["+count+"개 요청되었습니다.")
	                window.location.replace("/SellreMarket/adminOrder.jsp"); 
	         	} else {
	         		alert('수정에 실패했습니다.')
	         	}
	        },
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}


</script>
<style>

.title {
	width:80%;
	margin-left:20px;
	align-items: left;
	font-size: 27px; /* 제목의 글꼴 크기 조정 */
	font-weight: 700; /* 제목의 글꼴 굵기 조정 */
	color: #333333; /* 제목의 글꼴 색상 조정 */
	margin-top: -50px; /* 제목의 상단 여백 조정 */
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
    
     .orderBtn {
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
    
    .orderBtn:hover {
      background-color: #DADAC8;
      color : black;
    }
    
   
    input[type="text"] {
      width: 100%;
      padding: 8px;
      border-radius: 3px;
      border: 1px solid #ccc;
    }
</style>
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
					
				<input type="submit" class="orderBtn" onclick="order()" value="요청">
			</form>
	</div>
</body>
</html>