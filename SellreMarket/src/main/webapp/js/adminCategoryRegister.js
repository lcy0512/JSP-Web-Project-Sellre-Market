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
	}

	
	/************************************************************************************************
	 * Function : 작성한 정보 inset하기
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	
	function insertCategory() {
					 
		let type = $("#type").val();
		let subtype = $("#subtype").val();

		if(infoCheck() == 0) {
			
			$.ajax({
				
				type : "POST",
				url : "insertCategory.do",
				data : {
					type: type,
					subtype : subtype
				},
				success : function(response){
					 if (response === "1") {
						 	alert(type+"["+subtype+"]이 등록되었습니다.")
			                window.location.replace("/SellreMarket/admin_product.jsp");
			            }
			        },
				 error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
				
			});
		}	
	}