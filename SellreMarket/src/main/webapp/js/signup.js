var isChecked = false;
let gender;
// validation
let idcheck = false;
let emailcheck = false;
let passwordcheck = false;
let namecheck = false;
let phonecheck = false;
let birthdatecheck = false;

// HTML 문서의 모든 요소가 사용 가능한 상태가 되었을 때
document.addEventListener('DOMContentLoaded', function() {
	// 라디오 버튼 요소들을 가져옴
	var radioButtons = document.querySelectorAll('input[name="gender"]');

	// 라디오 버튼에 이벤트 리스너 추가
	radioButtons.forEach(function(radioButton) {
		radioButton.addEventListener('click', function() {
			// gender값 연결
			gender = radioButton.value;
			console.log(gender);
		});
	});

});

document.addEventListener('DOMContentLoaded', function() {
	var noneradio = document.getElementById("gender-none1");
	noneradio.classList.add('css-198i9ca');

	var radioButtons = document.querySelectorAll('input[type="radio"]');
	radioButtons.forEach(function(radioButton) {
		radioButton.addEventListener('click', function() {
			// 라디오 버튼에 해당하는 span 태그의 클래스를 초기화
			var siblingSpan = this.parentNode.querySelector('span');
			var siblingSpans = this.parentNode.parentNode.querySelectorAll('span');
			siblingSpans.forEach(function(span) {
				span.classList.remove('css-5xw1m2');
			});

			// 클릭된 라디오 버튼에 해당하는 span 태그에 클래스를 추가
			siblingSpan.classList.add('css-5xw1m2');

		});
	});
});


function checkInput(boolean) {
	let regExpAddress = /^[가-힣0-9 -]*$/;
	
	idcheck = boolean;
	isChecked = boolean;
	
	let form = document.signupForm;
	
	let address = form.address.value;
	let detailAddress = form.detailAddress.value;
	
	if(idcheck === false) {
		alert("아이디 중복 확인을 해주세요.")
		document.signupForm.memberId.select();
		return;
	}
	if (passwordcheck === false) {
		alert("비밀번호가 올바르지 않습니다.")
		document.signupForm.password.select();
		return;
	}
	if (namecheck === false) {
		alert("이름이 올바르지 않습니다.")
		document.signupForm.name.select();
		return;
	}
	if(emailcheck === false) {
		alert("이메일 중복 확인을 해주세요.")
		document.signupForm.email.select();
		return;
	}
	if (phonecheck === false) {
		alert("전화번호가 올바르지 않습니다.")
		document.signupForm.mobileNumber.select();
		return;
	}
	if (birthdatecheck === false) {
		alert("생년월일이 올바르지 않습니다.")
		return;
	}

	// address
	if (address === "") {
		alert("주소를 입력해주세요.")
		form.address.select()
		return
	}
	if (detailAddress === "") {
		alert("상세주소를 입력해주세요.")
		form.detailAddress.select()
		return
	}
	if (!regExpAddress.test(detailAddress)) {
		alert("상세주소는 한글과 숫자만 입력해주세요.")
		return
	}
	
	
	checkAllCheckboxes();
	
	if (!isChecked) {
		alert("이용약관에 동의해야 합니다.");
		return
	}
	
	form.submit();
}



function clickCheckBox(checkboxId) {
	// 체크박스 요소와 해당 아이콘의 path 요소
	var checkbox = document.getElementById(checkboxId);
	var path = document.querySelector("#" + checkboxId + " + .css-79hxr7 path");

	// 체크되었는지 확인, 그에 따라 아이콘의 색상을 변경
	if (checkbox.checked) {
		path.setAttribute("fill", "#BABE00"); // 체크되었을 때 아이콘 색상 변경
		console.log("check!")
	} else {
		path.setAttribute("fill", "#fff"); // 체크 해제되었을 때 아이콘 색상 변경
	}
}

function validateDate(input) {
	// 현재 날짜 가져오기
	var currentDate = new Date();
	let valiResult = true;
	// 입력된 날짜와 현재 날짜 비교
	if (new Date(input) > currentDate) {
		valiResult = false;
	}

	return valiResult;
}

// 이용약관 선택 확인
function checkAllCheckboxes() {
	var checkboxes = document.querySelectorAll("#checkboxContainer input[type='checkbox']");

	isChecked = true;

	checkboxes.forEach(function(checkbox) {
		if (!checkbox.checked) { // 만약 이용약관이 선택이 안됐다면,
			isChecked = false; // isChecked 변수를 false로 설정
		}
	});
}


function checkAuthentication() {
	// 발급한 인증번호
	let sysAuthentication = $("#sysAuthentic").val();
	// 유저가 입력한 인증번호
	let userAuthentication = $("#authentication").val();
	// 유저 이메일을 통해 인증번호 넣기
	let email = $("#email").val();
	
	
	if (userAuthentication == null || userAuthentication == "") {
		alert("인증번호를 입력하세요.");
	}
	else if (sysAuthentication != userAuthentication) {
		alert("정확한 인증번호를 입력하세요.")
	}
	else {
		$.ajax({
			type:"POST",
			url:"authenticKeyCheck.do",
			data: {
				authentication:userAuthentication,
				email:email
				},
			success: function(response) {
				if (response == false) {
					alert("인증이 완료 되었습니다.")
				  	$("#confirmCheck").prop("disabled", true); // idDuplicatedCheck 버튼을 비활성화
					$("#authentication").prop("readonly", true); // memberId 입력란을 읽기 전용으로 설정
				}
				
			}
		});
	}
}

$(document).ready(function() {
	
	$("#idDuplicatedCheck").click(function() {
		
		let wrongword = /^(?!.*\badmin\b).*$/;
		let regExpId = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{6,}$/;
		let userid = $("#memberId").val();
		
		if (userid.match(wrongword)) {
		    let message = "사용할 수 없는 아이디 입니다.";
		    $("#idcheckmessage").text(message);
		    $("#idcheckmessage").css("color", "red");
		    return;
		}
		
		if (!regExpId.test(userid)) {
			let message = "아이디는 소문자와 숫자로 6자 이상 입력해주세요."
			$("#idcheckmessage").text(message);
			$("#idcheckmessage").css("color", "red");
			return;
		}
		
		$.ajax({
			method : "POST",
			url : "duplicatedCheck.do",
			data : {
				userid : userid
			},
			success : function(response) {
				if(response === false){
					let message = "사용 불가능한 아이디 입니다."
					 $("#idcheckmessage").text(message);
					 $("#idcheckmessage").css("color", "red");
				}
				else {
					let message = "사용 가능한 아이디 입니다."
					 $("#idcheckmessage").text(message);
					 $("#idcheckmessage").css("color", "green");
					 $("#idDuplicatedCheck").prop("disabled", true); // idDuplicatedCheck 버튼을 비활성화
					 $("#memberId").prop("readonly", true); // memberId 입력란을 읽기 전용으로 설정
					idcheck = true;
					
				}
			},
		})
		
	}); // $("#idDuplicatedCheck").click
	
	$("#emailDuplicatedCheck").click(function() {
		
		let regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		let wrongword = /\badmin\b/;
		let email = $("#email").val();
		
		if (email.match(wrongword)) {
		    let message = "사용할 수 없습니다.";
		    $("#emailcheckmessage").text(message);
		    $("#emailcheckmessage").css("color", "red");
		    return;
		}
		
		if (!regExpEmail.test(email)) {
			let message = "이메일 형식을 확인해주세요."
			$("#emailcheckmessage").text(message);
			$("#emailcheckmessage").css("color", "red");
		}
		else {
			$.ajax({
				method : "POST",
				url : "duplicatedCheck.do",
				data : {
					email : email
				},
				success : function(response) {
					if(response.result === false){
						let message = "사용 불가능한 이메일입니다."
						 $("#emailcheckmessage").text(message);
						 $("#emailcheckmessage").css("color", "red");
					}
					else {
						alert("인증번호를 확인 후 입력 해주세요.");
						let message = "사용 가능한 이메일입니다."
						 $("#emailcheckmessage").text(message);
						 $("#emailcheckmessage").css("color", "green");
						 $("#emailDuplicatedCheck").prop("disabled", true); // idDuplicatedCheck 버튼을 비활성화
						 $("#email").prop("readonly", true); // memberId 입력란을 읽기 전용으로 설정
						emailcheck = true;
						
						$("#sysAuthentic").val(response.authentication);
					}
				},
			})
		}
	});
	
	 $("#passwordConfirm").on("input", function() {
		passwordcheck = false;
        // 입력된 비밀번호와 확인용 비밀번호
        let regExpPasswd = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()-=_+])[A-Za-z\d!@#$%^&*()-=_+]{8,}$/;
        let password = $("#password").val();
        let checkPassword = $("#passwordConfirm").val();
        
        if(!regExpPasswd.test(password)){
			let message = "하나의 특수문자와 대문자를 포함해야 합니다.";
			$("#passwordcheck").text(message).css("color", "red");
		}
		else {
	        // 비밀번호와 확인용 비밀번호 비교
	        if(password === checkPassword) {
				let message = "비밀번호가 일치합니다.";
	            $("#passwordcheck").text(message).css("color", "green");
	            passwordcheck = true;
	        } else {
				let message = "비밀번호가 일치하지 않습니다.";
	            $("#passwordcheck").text(message).css("color", "red");
	        }
		}
    }); //  $("#passwordConfirm").on("input"
    
	$("#name").change(function() {
		namecheck = false;
		// 입력된 이름
		let name = $("#name").val();
		let regExpName = /^[가-힣]*$/;

		if (!regExpName.test(name)) {
			let message = "이름은 한글만 입력해주세요.";
			$("#namemessage").text(message).css("color", "red");
		} else {
			$("#namemessage").text(""); // 메시지 지우기
			namecheck = true;
		}
	}); //  $("#name").change
	
	$("#mobileNumber").change(function() {
		phonecheck = false;
		let phone = $("#mobileNumber").val();
		let regExpPhone = /^010\d{8}$/;

		if (!regExpPhone.test(phone)) {
			let message = "전화번호는 숫자만, 11자리를 입력해주세요.";
			$("#phonemessage").text(message).css("color", "red");
		} else {
			$("#phonemessage").text(""); // 메시지 지우기
			phonecheck = true;
		}
	}); // $("#mobileNumber").change
	
	$("#birthYear, #birthMonth, #birthDay").change(function() {
		birthdatecheck = false;
		let regExpBirthDate = /^((19|20)\d{2}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))$/;

		let birthYear = $("#birthYear").val();
		let birthMonth = $("#birthMonth").val();
		let birthDay = $("#birthDay").val();
		let birthdate = birthYear + "-" + birthMonth + "-" + birthDay;

		if (!regExpBirthDate.test(birthdate)) {
			let message = "숫자만 입력해야 하고, 형식을 확인해주세요.";
			$("#birthdatemessage").text(message).css("color", "red");
		} 
		else {
			if(validateDate(birthdate) === false) {
				let message = "미래의 날짜입니다.";
				$("#birthdatemessage").text(message).css("color", "red");
			}
			else {
				$("#birthdatemessage").text(""); // 메시지 지우기
				birthdatecheck = true;
			}
		}
	}); // $("#mobileNumber").change
    
})


