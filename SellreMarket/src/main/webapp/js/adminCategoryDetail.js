
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
		url : "selectAdminCategoryDetail.do",
		success : function(response){
			$("#type").val(response[0].type);
			$("#subtype").val(response[0].subtype);
			$("#catetoryid").val(response[0].catetoryid);
			
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


function goToPage() {

	let form = document.createElement("form");
	form.action = "/adminCategory.do";
	form.method = "POST";
	document.body.appendChild(form);
	form.submit();
}

/************************************************************************************************
 * Function : 작성한 정보 inset하기
 * @param 	: null
 * @return 	: null
************************************************************************************************/

function updateCategory() {
				 
	let type = $("#type").val();
	let subtype = $("#subtype").val();
	let catetoryid = $("#catetoryid").val();

		
	$.ajax({
		
		type : "POST",
		url : "updateCategory.do",
		data : {
			type: type,
			subtype : subtype,
			catetoryid : catetoryid
		},
		success : function(response){
				 if (response === "1") {
					alert(type+"["+subtype+"]로 수정되었습니다.")
					//goToPage();
	                window.location.replace("/SellreMarket/adminCategory.jsp"); 
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
function deleteCategory() {
	let catetoryid = $("#catetoryid").val();
	$.ajax({
		
		type : "POST",
		url : "deleteCategory.do",
		data : {
			catetoryid : catetoryid
		},
		success : function(response){
			
				 if (response === "1") {
					alert("삭제되었습니다.")
	                window.location.replace("/SellreMarket/adminCategory.jsp"); 
	         	} else {
	         		alert('삭제에 실패했습니다.')
	         	}
	        },
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}