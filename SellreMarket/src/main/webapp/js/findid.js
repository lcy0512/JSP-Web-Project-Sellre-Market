function findId() {
	
	let name = $("#name").val();
	let email = $("#email").val();
	
	// AJAX 요청
	$.ajax({
		type : "POST",
		url : "findUserID.do",
		data : {
			name : name,
			email : email
			},
		success : function(response) {
			let findUserid = response;
			if(findUserid == "") {
				alert("아이디를 찾을 수 없습니다.")
			}
			else {
				alert(name + "님의 아이디는 '" + findUserid + "' 입니다.")
			}
			
			// 팝업
			
		}, // success
		error : function(xhr, status, error) {
			alert("문제가 발생하였습니다." + error)
		}
	}) // $.ajax
}