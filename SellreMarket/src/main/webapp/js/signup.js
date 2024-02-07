
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



document.addEventListener('DOMContentLoaded', function() {
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
            
            console.log("클릭된 라디오 버튼에 대한 클래스를 추가합니다.");
        });
    });
});












