
$(document).ready(function() {

	$("#checkinputbtn").click(function() {
		let userid = $("#userId").val();
		let password = $("#password").val();

		$.ajax({
			method: "POST",
			url: "mypage.do",
			data: {
				userid: userid,
				password: password
			},
			success: function(response) {

				if (response === false) {
					let message = "비밀번호가 일치하지 않습니다.";
					$("#pwmessage").text(message).css("color", "red");
				}
				
				else {
					console.log("성공");
					document.checkForm.submit();
				}
			},
		})
		
	});
});