// 정규식
function checkMember() {
	
	//정규식
	let regExpId = /^[A-Za-z][A-Za-z0-9]{2,}$/;
	let regExpPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,50}$/;
	
	let form = document.Member;
	
	let id = form.id.value;
	let pw = form.pw.value;
	
	if(id === ""){
		alert("아이디를 입력해 주세요.");
		form.id.focus();
		return false;
	}
	if(!regExpId.test(id)){
		alert("아이디는 영문자로 시작하고, 3자리 이상이여야 합니다.");
		form.id.select();
		return false	;
	}
	if(pw === ""){
		alert("비밀번호를 입력해 주세요.");
		form.pw.focus();
		return false;
	}
	if(!regExpPw.test(pw)){
		alert("비밀번호는 영문 대소문자, 숫자, 특수문자 중 하나 이상 포함하여야 하고 8~100자까지 작성할 수 있습니다.");
		form.pw.select();
		return false	;
	}			
	return true;	
}


// 왜 form으로 데이터를 넘길 수 없는가? 그래서 ajax 사용
function checkId() {
	
	var id = document.getElementById('id').value;
	var password = document.getElementById('password').value;
	
	$.ajax({
		type:'POST',
		url: 'loginCheck.do',
		data: {
			id:id,
			password:password
		},
		// 아이디 비밀번호가 일치하면 success로 받아와 이동한다.
		success: function(response) {
			if (response == 'success') {
				window.location.href = 'mainPage.do';
			}
			else {
				alert(response);
			}
		}
	});
}
