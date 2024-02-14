
document.addEventListener('DOMContentLoaded', function() {
	// signup의 validation 일부 무시
	
	// birthdate를 각각 연,월,일으로 분리
	var birthdate =  document.getElementById("birthdate").value;
	
	// "YYYY-MM-DD" 형식의 문자열에서 원하는 부분만 추출
	var birthYear = birthdate.substring(0, 4);
	var birthMonth = birthdate.substring(5, 7);
	var birthDay = birthdate.substring(8, 10);
	
	// 분리된 값을 각 input 요소에 할당
	document.getElementById("birthYear").value = birthYear;
	document.getElementById("birthMonth").value = birthMonth;
	document.getElementById("birthDay").value = birthDay;
	
	namecheck = true;
	idcheck = true;
	emailcheck = true;
	passwordcheck = true;
	phonecheck = true;
 	birthdatecheck = true;
 	
	console.log(birthdate);
	console.log(birthYear);
	console.log(birthMonth);
	console.log(birthDay);
	
	// -----------------------------------

    // 라디오 버튼 요소들을 가져옴
    var radioButtons = document.querySelectorAll('input[name="gender"]');
    
    // 0 - 남자, 1 - 여자, 2 - 선택안함
    var receivedGender = document.getElementById("receivedGender").value;
	
	switch (receivedGender) {
	    case "0":
	        receivedGender = "MALE";
	        break;
	    case "1":
	        receivedGender = "FEMALE";
	        break;
	    case "2":
	        receivedGender = "NONE";
	        break;
	    default:
	        receivedGender = "UNKNOWN";
	        break;
	}

    // 초기 설정
    radioButtons.forEach(function(radioButton) {
        if (radioButton.value === receivedGender) {
            radioButton.checked = true;
            let spanElement = radioButton.nextElementSibling;
            spanElement.classList.add("selected");
            let labelElement = spanElement.nextElementSibling;
            labelElement.textContent = receivedGender === "MALE" ? "남자" : (receivedGender === "FEMALE" ? "여자" : "선택안함");
        	
        	spanElement.classList.add('css-5xw1m2')
        	// 각 라디오 버튼의 상태 확인
        	console.log("라디오 버튼 값: " + radioButton.value);
        	console.log("span 요소 클래스: " + spanElement.className);
        	console.log("span 요소 텍스트: " + labelElement.textContent);
        }
    });

    // 라디오 버튼에 이벤트 리스너 추가
    radioButtons.forEach(function(radioButton) {
        radioButton.addEventListener('change', function() {	
            // gender값 연결
            var gender = radioButton.value;

            // 받아온 성별값을 기반으로 스타일 변경
            let spanElement = radioButton.nextElementSibling;
            let labelElement = spanElement.nextElementSibling;
            radioButtons.forEach(function(btn) {
                let btnSpanElement = btn.nextElementSibling;
                btnSpanElement.classList.remove("selected");
            });
            spanElement.classList.add("selected");

            // 선택된 값을 표시
            labelElement.textContent = gender === "MALE" ? "남자" : (gender === "FEMALE" ? "여자" : "선택안함");
        });
    });
});

function deleteuserinfo() {
	var result = window.confirm("정말로 탈퇴를 진행하시겠습니까? 탈퇴하면 셀리마켓 이용이 제한될 수 있습니다.")
	if (result === true) {
		alert("탈퇴 되었습니다.")
		window.location.href = 'deleteuserinfo.do';
	}
}