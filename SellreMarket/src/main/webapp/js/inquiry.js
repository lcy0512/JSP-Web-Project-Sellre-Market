


document.addEventListener("DOMContentLoaded", function() {
	// 해당하는 <li> 요소를 클릭했을 때 실행될 함수
	function getIdOfClickedLI() {
		// 클릭한 <li> 요소의 id를 가져옴
		var id = this.id;
		console.log("선택한 <li> 태그의 ID:", id);
	}

	// 모든 <li> 요소를 선택
	var listItems = document.querySelectorAll("#myList li");

	// 각 <li> 요소에 클릭 이벤트 리스너 추가
	for (var i = 0; i < listItems.length; i++) {
		listItems[i].addEventListener("click", getIdOfClickedLI);
	}
	
	
});