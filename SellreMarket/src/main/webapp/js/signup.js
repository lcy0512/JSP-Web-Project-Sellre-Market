var isChecked = false;
let gender;

// HTML 문서의 모든 요소가 사용 가능한 상태가 되었을 때
document.addEventListener('DOMContentLoaded', function() {
	// 라디오 버튼 요소들을 가져옴
	var radioButtons = document.querySelectorAll('input[name="gender"]');

	// 라디오 버튼에 이벤트 리스너 추가
	radioButtons.forEach(function(radioButton) {
		radioButton.addEventListener('click', function() {
			// console 에서 확인
			gender = radioButton.value
			console.log(gender)
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


function checkInput() {
	/* 		let regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; */
	let regExpId = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{6,}$/;
	let regExpPasswd = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()-=_+])[A-Za-z\d!@#$%^&*()-=_+]{8,}$/;
	let regExpName = /^[가-힣]*$/;
	let regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	let regExpPhone = /^010\d{8}$/;
	let regExpAddress = /^[가-힣0-9 -]*$/;
	let regExpBirthDate = /^((19|20)\d{2}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))$/;

	let form = document.signupForm;

	let id = form.memberId.value;
	let password = form.password.value;
	let name = form.name.value;
	let email = form.email.value;
	let mobileNumber = form.mobileNumber.value;
	let address = form.address.value;
	let detailAddress = form.detailAddress.value;
	let birthYear = form.birthYear.value;
	let birthMonth = form.birthMonth.value;
	let birthDay = form.birthDay.value;
	let birthdate = birthYear + "-" + birthMonth + "-" + birthDay

	// id
	if (id === "") {
		alert("아이디를 입력해주세요.")
		form.memberId.select()
		return
	}
	if (!regExpId.test(id)) {
		alert("아이디는 소문자와 숫자로 6자 이상 입력해주세요.")
		form.memberId.select()
		return
	}

	// password
	if (password === "") {
		alert("비밀번호를 입력해주세요.")
		form.password.select()
		return
	}
	if (password.length < 8) {
		alert("비밀번호는 8자리 이상 입력해주세요.")
		form.password.select()
		return
	}
	if (!regExpPasswd.test(password)) {
		alert("비밀번호는 적어도 하나의 특수문자와 대문자를 포함해야 합니다.")
		form.password.select()
		return
	}

	// name
	if (name === "") {
		alert("이름을 입력해주세요.")
		form.name.select()
		return
	}
	if (!regExpName.test(name)) {
		alert("이름은 한글만 입력해주세요.")
		form.name.select()
		return
	}

	// email
	if (email === "") {
		alert("이메일을 입력해주세요.")
		form.email.select()
		return
	}
	if (!regExpEmail.test(email)) {
		alert("이메일 형식을 확인해주세요. (예시 : example123@example.com")
		form.email.select()
		return
	}

	// mobileNumber
	if (mobileNumber === "") {
		alert("전화번호를 입력해주세요.")
		form.mobileNumber.select()
		return
	}
	if (!regExpPhone.test(mobileNumber)) {
		alert("전화번호는 숫자만, 11자리를 입력해주세요.")
		return
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

	// gender
	if (gender === null) {
		alert("성별을 선택해주세요.")
		return
	}

	// birthdate
	if (birthdate === "") {
		alert("생년월일을 입력해주세요.")
		return
	}
	if (!regExpBirthDate.test(birthdate)) {
		alert("생년월일은 숫자만 입력해야 하고, 형식을 확인해주세요.")
		return
	}
	if (validateDate(birthdate) === false) {
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
	// 체크박스 요소와 해당 아이콘의 path 요소를 가져옵니다.
	var checkbox = document.getElementById(checkboxId);
	var path = document.querySelector("#" + checkboxId + " + .css-79hxr7 path");

	// 체크박스가 체크되었는지 확인하고, 그에 따라 아이콘의 색상을 변경합니다.
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
		alert("생년월일이 올바르지 않습니다.")
		valiResult = false;
	}

	return valiResult;
}

function checkAllCheckboxes() {
	var checkboxes = document.querySelectorAll("#checkboxContainer input[type='checkbox']");

	isChecked = true;

	checkboxes.forEach(function(checkbox) {
		if (!checkbox.checked) { // 만약 체크되지 않은 체크박스가 있다면
			isChecked = false; // isChecked 변수를 false로 설정
		}
	});
}
