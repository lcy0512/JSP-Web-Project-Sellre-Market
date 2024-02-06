 
// HTML 문서의 모든 요소가 사용 가능한 상태가 되었을 때
document.addEventListener('DOMContentLoaded', function() {
	// 라디오 버튼 요소들을 가져옴
	var radioButtons = document.querySelectorAll('input[name="gender"]');

	// 라디오 버튼에 이벤트 리스너 추가
	radioButtons.forEach(function(radioButton) {
		radioButton.addEventListener('click', function() {
			// console 에서 확인
			console.log('Selected gender:', radioButton.value);
			
		});
	});
});