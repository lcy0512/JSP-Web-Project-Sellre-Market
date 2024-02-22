	window.onload=function(){
		init();
	}	
	
	
	function init() {
		productNum();
		questNum();
		selectCategory();
		selectPackType();
		selectPackKind();
		selectBrand();
		selectDeliveryType();
	}
	
	//제품현황 Header 알림표시
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
	
	 /************************************************************************************************
	 * Function : 브랜드명 조회 - ajax
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	function selectBrand() {
		 
		$.ajax({
			type : "POST",
			url : "selectBrand.do",
			success : function(response){
				createBrand(response)
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	} 
 
 
	function createBrand(data) {
		
		let option = "";
		
		for (var i = 0; i < data.length; i++) {
			if(i == 0){
				option +="<option value='option" + (i + 1) + "' selected='selected'>"+data[i].bname+"</option>";
			} else {
				option +="<option value='option" + (i + 1) + "'>"+data[i].bname+"</option>";
			}
		}
		
		$("#bname").html(option);
		
	}
	
	
	/************************************************************************************************
	 * Function : 카테고리 대분류 조회 - ajax
	 *			  가져온 대분류 카테고리를 <option>태그에 넣고 <select>태그에 집어넣기 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	function selectCategory() {
		$.ajax({
			type : "POST",
			url : "selectCategory.do",
			success : function(response){
				createCategory(response)
			},
			 error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	 
	function createCategory(data){
		let option = "";
		
		for (var i = 0; i < data.length; i++) {
		    if (i === 0) {
		        option += "<option value='option" + (i + 1) + "' selected='selected'>" + data[i].type + "</option>";
		      } else {
		    	  option += "<option value='option" + (i + 1) + "'>" + data[i].type + "</option>";
		      }
		    }
		$("#type").html(option);
		
		selectSubCategory();
	}
	
	
	/************************************************************************************************
	 * Function : 대분류 카테고리가 변경 될 떼, 중분류 카테고리가 변경되도록 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	document.addEventListener("DOMContentLoaded", function() {
		  var typeSelect = document.getElementById("type");
		  typeSelect.addEventListener("change", selectSubCategory);
	});
	
	
	
	
	/************************************************************************************************
	 * Function : 중분류 카테고리 ajax로 조회
	 *			  가져온 중분류 카테고리를 <option>태그에 넣고 <select>태그에 집어넣기 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	function selectSubCategory() {
		
 		let selectElement = document.getElementById("type"); 						// HTML에서 <select> 요소 가져오기
		let selectedText = selectElement.options[selectElement.selectedIndex].text;	// <select>요소의 selected된 텍스트 가져오기 
		
		$.ajax({
			
			type : "POST",
			url : "selectSubCategory.do",
			data : {categoryType: selectedText},
			success : function(response){
				createSubCategory(response)
			},
			 error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
	}
	
	function createSubCategory(data){
		let option = "";
		
		for (var i = 0; i < data.length; i++) {
			if(i == 0){
				option +="<option value='option" + (i + 1) + "' selected='selected'>"+data[i].type+"</option>";
			} else {
				option +="<option value='option" + (i + 1) + "'>"+data[i].type+"</option>";
			}
		}
		$("#subType").html(option);
	}
	
	 
 /************************************************************************************************
	 * Function : 포장타입 조회 - ajax
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	function selectPackType() {
		 
		$.ajax({
			type : "POST",
			url : "selectPackType.do",
			success : function(response){
				createPackType(response)
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	} 
 
 
	function createPackType(data) {
		
		let option = "";
		
		for (var i = 0; i < data.length; i++) {
			if(i == 0){
				option +="<option value='option" + (i + 1) + "' selected='selected'>"+data[i].packtype+"</option>";
			} else {
				option +="<option value='option" + (i + 1) + "'>"+data[i].packtype+"</option>";
			}
		}
		
		$("#packType").html(option);
		
	}

	/************************************************************************************************
	 * Function : 포장종류 조회 - ajax, 가져온 데이터 해당 id에 넣기
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	function selectPackKind() {
		 
		$.ajax({
			type : "POST",
			url : "selectPackKind.do",
			success : function(response){
				createPackKind(response)
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	} 
 
 
	function createPackKind(data) {
		
		let option = "";
		
		for (var i = 0; i < data.length; i++) {										
			if(i == 0){
				option +="<option value='option" + (i + 1) + "' selected='selected'>"+data[i].packkind+"</option>";
			} else {
				option +="<option value='option" + (i + 1) + "'>"+data[i].packkind+"</option>";
			}
		}
		
		$("#packKind").html(option);
		
	}
	
	/************************************************************************************************
	 * Function : 배달타입 조회 - ajax, 가져온 데이터 해당 id에 넣기
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	function selectDeliveryType() {
		 
		$.ajax({
			type : "POST",
			url : "selectDelivery.do",
			success : function(response){
				createDelivery(response)
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	} 
 
 
	function createDelivery(data) {
		
		let option = "";
		
		for (var i = 0; i < data.length; i++) {										
			if(i == 0){
				option +="<option value='option" + (i + 1) + "' selected='selected'>"+data[i].dname+"</option>";
			} else {
				option +="<option value='option" + (i + 1) + "'>"+data[i].dname+"</option>";
			}
		}
		
		$("#dname").html(option);
		
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
	
	
	
	/************************************************************************************************
	 * Function : 숫자입력 시 3자리마다 쉼표 
	 * @param 	: 입력한 price 값
	 * @return 	: null
	************************************************************************************************/	
	function formatNumber(value) {
		
		let number = parseFloat(value.replace(/,/g, ''));	// 숫자만 추출
		
		let formattedNumber = number.toLocaleString();		// 3자리마다 쉼표 추가
		
		if (!isNaN(number)) {								// 입력값 업데이트
			document.registerForm.price.value = formattedNumber
		}
	}
	
	
	
	/************************************************************************************************
	 * Function : 정규식 체크 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	function infoCheck(){
		
		let form = document.productForm;
		let num = 0;
		
		let file = form.image.value;
		let bname = form.bname.value;
		let pname = form.pname.value;
		let pEngname = form.pEngname.value;
		let pstock = form.pstock.value;
		let origin = form.origin.value;
		let expirationdate = form.expirationdate.value;
		let description = form.description.value;
		let price = form.price.value;
		
		if(file == ""){
			alert("이미지를 등록하세요.");
			num++;
			return
		}
		
		if(bname == ""){
			alert("제조사명을 등록하세요.");
			form.bname.select()
			num++;
			return
		}
		
		if(pname == ""){
			alert("제품명을 등록하세요.");
			form.pname.select()
			num++;
			return
		}
		
		if(pEngname == ""){
			alert("영문명을 등록하세요.");
			form.pEngname.select()
			num++;
			return
		}
		
		if(pstock == ""){
			alert("수량을 등록하세요.");
			form.pstock.select()
			num++;
			return
		}
		
		if(origin == ""){
			alert("원산지를 등록하세요.");
			form.origin.select()
			num++;
			return
		}
		
		if(expirationdate == ""){
			alert("소비기한을 등록하세요.");
			num++;
			return
		}
		
		if(description == ""){
			alert("설명을 등록하세요.");
			form.description.select()
			num++;
			return
		}	
		
		if(price == ""){
			alert("가격을 등록하세요.");
			form.price.select()
			num++;
			return
		}	
	
		if(num == 0) {
			insertProduct();
		}
	}

	
	
	/************************************************************************************************
	 * Function : 작성한 정보 inset하기
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	
/*	function insertProduct() {
					 
		try {
			insertInfo();
			insertPrice();
			insertBrand();
			insertCategory();
			insertPacking();
			insertUnit();
			
			alert('등록되었습니다.')
			
			
		} catch (error) {
			console.error('error : '+error);
		}
			
	} */

function insertProduct() {
	insertInfo();
	insertPrice();
	insertBrand();
	insertCategory()
	insertPacking()
	insertUnit()
	insertDelivery()
	insertImage()
	
	alert('등록되었습니다.')
	window.location.replace("/SellreMarket/admin_product.jsp");
}	
	
function insertInfo() {
	let pname = $("#pname").val();
	let pEngname = $("#pEngname").val();
	let allery = $("#allery").val();
	let nutrition = $("#nutrition").val();
	let pstock = $("#pstock").val();
	let origin = $("#origin").val();
	let description = $("#description").val();
	
	$.ajax({
		
		type : "POST",
		url : "insertProduct.do",
		async : false,
		data : {
				pname : pname,
				pEngname : pEngname,
				allery : allery,
				nutrition : nutrition, 
				pstock : pstock,
				origin : origin,
				description : description
				
		},
		success : function(response){
			if(response == 1){
				return ;
			} else {
				console.log("error")
			}
		},
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
	
}	
	
//가격 insert하기	
function insertPrice() {
	let price = $("#price").val();
	
	$.ajax({
		
		type : "POST",
		url : "insertPrice.do",
		async : false,
		data : {
				price : price
				
		},
		success : function(response){
			if(response == 1){
				return response;					
			} else {
				console.log("error")
			}
		},
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}	


//브랜드 insert하기	
function insertBrand() { 
	var selectElement = document.getElementById("bname");
	var selectedOption = selectElement.options[selectElement.selectedIndex].text;
	
	$.ajax({
		
		type : "POST",
		url : "insertBrandToProduct.do",
		async : false,
		data : {
				bname : selectedOption
				
		},
		success : function(response){
			if(response == 1){
				return response;			
			} else {
				console.log("error")
			}
		},
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}	


//category insert
function insertCategory() { 
	
 	var typeElement = document.getElementById("type");
    var typeText = typeElement.options[typeElement.selectedIndex].text;

    var subTypeElement = document.getElementById("subType");
    var subTypeText = subTypeElement.options[subTypeElement.selectedIndex].text;

	
	$.ajax({
		
		type : "POST",
		url : "insertCategoryToProduct.do",
		async : false,
		data : {
			type: typeText,
            subtype: subTypeText
				
		},
		success : function(response){
			if(response == 1){
				return response;			
			} else {
				console.log("error")
			}
		},
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}	


//category insert
function insertPacking() { 
	
	// packType select 요소에서 선택한 옵션의 텍스트 가져오기
	var packTypeElement = document.getElementById("packType");
	var packTypeText = packTypeElement.options[packTypeElement.selectedIndex].text;
	
	// packKind select 요소에서 선택한 옵션의 텍스트 가져오기
	var packKindElement = document.getElementById("packKind");
	var packKindText = packKindElement.options[packKindElement.selectedIndex].text;
	
	$.ajax({
		
		type : "POST",
		url : "insertPackToProduct.do",
		async : false,
		data : {
			packType : packTypeText,
			packKind : packKindText
				
		},
		success : function(response){
			if(response == 1){
				return response;			
			} else {
				console.log("error")
			}
		},
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}	

//unit insert
function insertUnit() { 
	let utype = $("#utype").val();
	let ugram = $("#ugram").val();
	
	$.ajax({
		
		type : "POST",
		url : "insertUnitToProduct.do",
		async : false,
		data : {
			utype : utype,
			ugram : ugram
				
		},
		success : function(response){
			console.log('6')
			if(response == 1){
				console.log('7')
				return 			
			} else {
				console.log('8')
				console.log("error")
			}
		},
		
		 error:function(request, status, error){
			console.log('9')
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	console.log('10')
}	


//delivery insert
function insertDelivery() { 
	
	var dnameElement = document.getElementById("dname");
	var dnameText = dnameElement.options[dnameElement.selectedIndex].text;
	
	$.ajax({
		
		type : "POST",
		async : false,
		url : "insertDelivery.do",
		data : {
			dname : dnameText
		},
		success : function(response){
			if(response == 1){
			//	window.location.replace("/SellreMarket/admin_product.jsp");
				return response;			
			} else {
				console.log("error")
				alert('배달타입 inser 오류! 시스템문의로 전화하세요')
			}
		},
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}	


//image insert 
function insertImage() {
	
	//let form = new FormData();
	//form.append("image", $("#image"[0].files[0]))
	
	let image = $('input[name="image"]').get(0).files[0];
	let formData = new FormData();
	formData.append('image',image)

	
	$.ajax({
		
		type : "POST",
		async : false,
		url : "insertImage.do",
		data : formData,
		processData : false,
		contentType : false,
		success : function(response) {
			if(response == 1){
				return;
			} else {
				alert('이미지 insert 실패!')
			}
		},
		error : function(request,status, error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}

