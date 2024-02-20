
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
		url : "selectAdminProductDetail.do",
		success : function(response){
			
			let status = response[0].status
			
			if(status == "0"){	//판매종료 일 때,
				
				//회색처리
				document.getElementById('pname').style.backgroundColor = "#efefef";
				document.getElementById('pEngname').style.backgroundColor = "#efefef";
				document.getElementById('pstock').style.backgroundColor = "#efefef";
				document.getElementById('allery').style.backgroundColor = "#efefef";
				document.getElementById('nutrition').style.backgroundColor = "#efefef";
				document.getElementById('origin').style.backgroundColor = "#efefef";
				document.getElementById('description').style.backgroundColor = "#efefef";
				
				//readonly 처리
				document.getElementById('pname').readOnly = true;
				document.getElementById('pEngname').readOnly = true;
				document.getElementById('pstock').readOnly = true;
				document.getElementById('allery').readOnly = true;
				document.getElementById('nutrition').readOnly = true;
				document.getElementById('origin').readOnly = true;
				document.getElementById('description').readOnly = true;
				
				//버튼 disabled 처리
				document.getElementById('deleteBtn').disabled = true;
				document.getElementById('updateBtn').disabled = true;
				
				//값 집어넣음
				$("#pname").val(response[0].pname);
				$("#pEngname").val(response[0].pEngname);
				$("#pstock").val(response[0].pstock);
				$("#allery").val(response[0].allery);
				$("#nutrition").val(response[0].nutrition);
				$("#origin").val(response[0].origin);
				$("#description").val(response[0].description);
				$("#productid").val(response[0].productid);
				
			} else {
				
				//혹시나 이미지 없을 때
				let image = response[0].image
				if(image == null) {
					image = "이미지 없음"
				} 
				
				$("#preview").attr("src", "/SellreMarket/image/" + image);
				//$("#img").val(image);
				$("#pname").val(response[0].pname);
				$("#pEngname").val(response[0].pEngname);
				$("#pstock").val(response[0].pstock);
				$("#allery").val(response[0].allery);
				$("#nutrition").val(response[0].nutrition);
				$("#origin").val(response[0].origin);
				$("#description").val(response[0].description);
				$("#productid").val(response[0].productid);
			}
			
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
			pEngname : pEngname,
			allery : allery,
			nutrition : nutrition,
			origin : origin,
			description : description,
			productid : productid
		},
		cache : false,
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

