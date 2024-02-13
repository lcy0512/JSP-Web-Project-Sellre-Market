window.onload=function(){
		init();
	}	
		
	function init() {
		questNum();
		productNum();
	}
	
	//제품현황 Header 알림표시
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