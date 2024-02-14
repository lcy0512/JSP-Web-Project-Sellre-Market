
window.onload=function(){
	init();
}	
	
function init() {
	select();
	productNum(); //header[제품현황] 알림표시
	questNum();
}

//header-제품현황 알림표시
function productNum() {
		
		$.ajax({
			type : "POST",
			url : "adminProductNum.do",
			success : function(response){
				if(response == "0"){
					document.getElementById('productNum').style.display = 'none';
				} else {
					document.getElementById('productNum').style.display = 'block';
					document.getElementById('productNum').innerText = response	
				}
				
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
				if(response == "0"){
					document.getElementById('questNum').style.display = 'none';
				} else {
					document.getElementById('questNum').style.display = 'block';
					document.getElementById('questNum').innerText = response
				}
			},
			 error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
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
