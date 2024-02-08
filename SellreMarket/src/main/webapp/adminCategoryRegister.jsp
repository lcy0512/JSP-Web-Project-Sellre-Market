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
    
    
</style>
<script>
	
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
		
		if(num == 0) {
			insertCategory()
		} else {
			return;
		}
	}

	
	/************************************************************************************************
	 * Function : 작성한 정보 inset하기
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	
	function insertCategory() {
					 
		let type = $("#type").val();
		let subtype = $("#subtype").val();

		$.ajax({
			
			type : "POST",
			url : "insertCategory.do",
			data : {
				type: type,
				subtype : subtype
			},
			success : function(response){
				if(response.num == 1){
					alert(type+"["+subtype+"]이 등록되었습니다.");
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
					
				<input type="submit" class="registerBtn" onclick="insertCategory()" value="등록">
			</form>
	</div>
</body>
</html>
		
