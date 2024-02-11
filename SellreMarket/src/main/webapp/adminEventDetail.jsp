<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세 - 셀리</title>
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
	margin-top: 200px; /* 제목의 상단 여백 조정 */
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
  margin-top : 100px;
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
      margin-left : 10px;s
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
   
    input[type="file"],
    input[type="text"] {
      width: 100%;
      padding: 8px;
      border-radius: 3px;
      border: 1px solid #ccc;
    }
    
     .form-group input[type="date"] {
		padding: 5px;
		border: 1px solid #ccc;
		border-radius: 4px;
		font-size: 14px;
	}
</style>
<script>

window.onload=function(){
	init();
}	
	
function init() {
	select();
}


function select() {
	
	$.ajax({
		type : "POST",
		url : "selectAdminEventDetail.do",
		success : function(response){
			
			$("#preview").attr("src", "/SellreMarket/image/" + response[0].img);
			$("#img").val(response[0].img);
			//document.getElementById("image").value = response[0].img
			$("#ename").val(response[0].ename);
			$("#econtent").val(response[0].econtent);
			$("#startdate").val(response[0].startdate);
			$("#enddate").val(response[0].enddate);
			$("#salerate").val(response[0].salerate);
			$("#eventid").val(response[0].eventid);

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
	
	let form = document.eventForm
	 var regex = "/^[가-힣]*$/";

	  // 이벤트 명 체크
	  var ename = document.getElementById("ename").value;
	  if (ename === "") {
	    alert("이벤트 명을 입력해주세요.");
	    form.ename.select()
	    return false;
	  } else if (!regex.test(ename)){
		  alert("이벤트 명은 한글만 입력할 수 있습니다.");
		  form.ename.select()
		  return false;
	  }

	  // 이벤트 내용 체크
	  var econtent = document.getElementById("econtent").value;
	  if (econtent === "") {
	    alert("이벤트 내용을 입력해주세요.");
	    form.econtent.select();
	    return false;
	  } else if (!regex.test(econtent)){
		  alert("이벤트 명은 한글만 입력할 수 있습니다.");
		  form.econtent.select();
		  return false;
	  }

	  // 이벤트 시작일 체크
	  var startdate = document.getElementById("startdate").value;
	  var today = new Date().toISOString().split("T")[0];
	 
	  if (startdate === "") {
	    alert("이벤트 시작일을 선택해주세요.");
	    form.startdate.select();
	    return;
	  } else if (startdate < today) {
	    alert("이벤트 시작일은 오늘 날짜보다 이전일 수 없습니다.");
	    form.startdate.select();
	    return;
	  }

	  // 이벤트 종료일 체크
	  var enddate = document.getElementById("enddate").value;
	
	  if (enddate === "") {
	    alert("이벤트 종료일을 선택해주세요.");
	    form.enddate.select();
	    return false;
	  } else if (enddate < startdate) {
	    alert("이벤트 종료일은 이벤트 시작일보다 이전일 수 없습니다.");
	    form.enddate.select();
	    return false;
	  }

	  // 할인율 체크
	  var salerate = document.getElementById("salerate").value;
	  if (salerate === "") {
	    alert("할인율을 입력해주세요.");
	    form.salerate.select();
	    return false;
	  }

	  // 할인율이 숫자인지 체크
	  var regex = /^[0-9]*$/;
	  if (!regex.test(salerate)) {
	    alert("할인율은 숫자만 입력할 수 있습니다.");
	    return false;
	  }
	  
	  updateEvent();
}


function goToPage() {

	let form = document.createElement("form");
	form.action = "/SellreMarket/adminEvent.jsp";
	form.method = "POST";
	document.body.appendChild(form);
	form.submit();
}

/************************************************************************************************
 * Function : 작성한 정보 inset하기
 * @param 	: null
 * @return 	: null
************************************************************************************************/

function updateEvent() {
	let ename = $("#ename").val();
	let econtent = $("#econtent").val();
	let startdate = $("#startdate").val();
	let enddate = $("#enddate").val();
	let salerate = $("#salerate").val();
	let eventid = $("#eventid").val();

		
	$.ajax({
		
		type : "POST",
		url : "updateEvent.do",
		data : {
		//	image: image,
			ename : ename,
			econtent : econtent,
			startdate : startdate,
			enddate : enddate,
			salerate : salerate,
			eventid : eventid
		},
		success : function(response){
			 if (response === "1") {
				alert("이벤트가 수정되었습니다.")
				goToPage()
                //window.location.replace("/SellreMarket/adminEvent.jsp"); 
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
function deleteEvent() {
	let eventid = $("#eventid").val();
	$.ajax({
		
		type : "POST",
		url : "deleteEvent.do",
		data : {
			eventid : eventid
		},
		success : function(response){
			
			 if (response === "1") {
				alert("삭제되었습니다.")
				goToPage();
            //    window.location.replace("/SellreMarket/adminCategory.jsp"); 
         	} else {
         		alert('삭제에 실패했습니다.')
         	}
	    },
		error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}



/************************************************************************************************
 * Function : 이미지 선택했을 때 preview에 이미지 넣기 이벤트 
 * @param 	: null
 * @return 	: null
*********************************************************/
$("#image").on("change", function(event) {

    var file = event.target.files[0];

    var reader = new FileReader(); 
    reader.onload = function(e) {

        $("#preview").attr("src", e.target.result);
        $("#img").attr("")
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
		document.getElementById("img").value = "";
		document.getElementById("img").hidden = "true";

	} else {
		document.getElementById('preview').src = "";
	}
}

</script>
</head>
<body id="body">
	<jsp:include page="adminHeader.jsp" flush="false" />
		<div class="main">
			<div class="title">이벤트 상세</div>
		
			<form name="eventForm">
			
				<div class="form-group">
					<label for="image">이미지 *</label>
					<img id="preview" src="" style="max-width: 100%; max-height: 200px;">
					<input type="text" id="img" name="img">
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
				<input type="text" id="eventid" name="eventid" hidden="true">	
				<input type="submit" class="updateBtn" onclick="updateEvent()" value="수정">
				<input type="submit" class="deleteBtn" onclick="deleteEvent()" value="삭제">
			</form>
	</div>
</body>
</html>
		
