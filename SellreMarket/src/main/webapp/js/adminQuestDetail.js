
window.onload=function(){
	init();
}	
	
function init() {
	select();
	questNum();
	productNum(); //header[제품현황] 알림표시
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
		url : "selectAdminQuestDetail.do",
		success : function(response){
			
			$("#preview").attr("src", "/SellreMarket/image/" + response[0].img);
			$("#intitle").val(response[0].intitle);
			$("#incontent").val(response[0].incontent);
			$("#insertdate").val(response[0].insertdate);
			$("#answer").val(response[0].answer);
			$("#inquiryid").val(response[0].inquiryid);

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

function registerEvent() {
	 
	let answer = $("#answer").val();
	let inquiryid = $("#inquiryid").val();

		
	$.ajax({
		
		type : "POST",
		url : "adminInsertQuest.do",
		data : {
			answer : answer,
			inquiryid : inquiryid
		},
		success : function(response){
			 if (response == "1" || response == 1) {
				alert("답변이 등록되었습니다.")
				window.location.replace("/SellreMarket/adminQuest.jsp"); 
         	} else {
         		alert('답변 등록에 실패했습니다.')
         	}
	    },
		error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}

