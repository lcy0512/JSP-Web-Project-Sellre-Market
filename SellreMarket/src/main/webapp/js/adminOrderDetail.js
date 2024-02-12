
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