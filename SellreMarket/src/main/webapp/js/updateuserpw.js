let passwordcheck = false;

$(document).ready(function() {
	$("#confirmNewPassword").on("input", function() {
		// 입력된 비밀번호와 확인용 비밀번호
		let regExpPasswd = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()-=_+])[A-Za-z\d!@#$%^&*()-=_+]{8,}$/;
		let password = $("#newPassword").val();
		let checkPassword = $("#confirmNewPassword").val();

		if (!regExpPasswd.test(password)) {
			let message = "하나의 특수문자와 대문자를 포함해야 합니다.";
			$("#passwordcheckmessage").text(message).css("color", "red");
		}
		else {
			// 비밀번호와 확인용 비밀번호 비교
			if (password === checkPassword) {
				let message = "비밀번호가 일치합니다.";
				$("#passwordcheckmessage").text(message).css("color", "green");
				passwordcheck = true;
			} else {
				let message = "비밀번호가 일치하지 않습니다.";
				$("#passwordcheckmessage").text(message).css("color", "red");
			}
		}
	}) //  $("#passwordConfirm").on("input"
});

function updatePW() {
	if(passwordcheck === true) {
		alert("비밀번호가 변경되었습니다.")
		let updateform = document.getElementById('updateForm');
		updateform.submit();
	}
	else {
		alert("비밀번호가 일치하지 않습니다.");
	}
}