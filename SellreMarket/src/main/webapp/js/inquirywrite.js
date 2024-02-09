function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('preview').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	}
	else {
		document.getElementById('preview').src = "";
	}
}

function submitinquiry() {
	let form = document.getElementById("inquiryForm")

	let questid = form.questid.value;
	let intitle = form.elements.intitle.value;
	let incontent = form.elements.incontent.value;

	if (questid == "none") {
		alert("문의 유형을 선택해 주세요.")
		return;
	}

	if (intitle == "") {
		alert("제목을 입력해 주세요.")
		form.intitle.select();
		return;
	}

	if (incontent == "") {
		alert("내용을 입력해 주세요.")
		form.incontent.select();
		return;
	}

	form.submit();
}