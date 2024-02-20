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

function findUserInfoBeforePW() {
	
	let name = $("#name").val();
	let userid = $("#userid").val();
	let email = $("#email").val();
	
	// AJAX 요청
	$.ajax({
		type : "POST",
		url : "findUserInfoBeforePW.do",
		data : {
			name : name,
			userid : userid,
			email : email
			},
		success : function(response) {
			let findResult = response;
			
			// 입력한 정보가 존재하면,
			if(findResult === true) {
				sendCodetoEmail(name,email);
			}
			else {
				alert("정보를 찾을 수 없습니다.")
			}
			
		}, // success
		error : function(xhr, status, error) {
			alert("문제가 발생하였습니다." + error)
		}
	}) // $.ajax
}

function sendCodetoEmail(name, email) {
	// AJAX 요청
	$.ajax({
		type: "POST",
		url: "findUserPW.do",
		data: {
			name: name,
			email: email
		},
		success: function(response) {
			alert("이메일에 인증번호가 발송되었습니다.")
			let systemPWauthentication = response.PWauthentication;
			$("#sysAuthentic").val(systemPWauthentication);
			
			//console.log("인증번호 : " + systemPWauthentication);
			
			// 인증번호 입력 표시
			var emailElement = document.getElementById('Emailauthentication');
			emailElement.style.display = 'block';
			// 인증번호 발송 버튼 숨김
			var sendBtn = document.getElementById('sendBtn');
			sendBtn.style.display = 'none';
			// 인증번호 확인 버튼 표시
			var confirmBtn = document.getElementById('confirmBtn');
			confirmBtn.style.display = 'block';
			// input 요소들 readonly
			var docname = document.getElementById('name');
			docname.readOnly = true;
			var docuserid = document.getElementById('userid');
			docuserid.readOnly = true;
			var docemail = document.getElementById('email');
			docemail.readOnly = true;
			
		}, // success
		error: function(xhr, status, error) {
			alert("문제가 발생하였습니다." + error)
		}
	}) // $.ajax
}

// 인증확인 버튼을 눌렀을 때 사용자가 입력한 인증번호와 sendCodetoEmail을 통해 response로 가지고 있는 인증번호의 값을 비교 

function confirmCode() {
	
	// 시스템에서 만든 인증번호
	let sysAuthentic = $("#sysAuthentic").val();
	// 사용자가 입력한 인증번호
	let inputauthentication = $("#inputauthentication").val();
	
	if(sysAuthentic === inputauthentication) {
		let form = document.getElementById('findForm');
		
		form.submit();
	}
	else {
		alert("인증번호가 일치하지 않습니다.");
	}
	
}

