
$(document).ready(function() {

	$("#checkinputbtn").on("click", function() {
		let userid = $("#memberId").val();
		let password = $("#password").val();

		$.ajax({
			method: "POST",
			url: " ",
			data: {
				userid: userid,
				password: password
			},
			success: function(response) {

				if (response === false) {
					let message = "비밀번호가 일치하지 않습니다.";
					$("#pwmessage").text(message).css("color", "red");
				}
			},
		})
		
	});
}