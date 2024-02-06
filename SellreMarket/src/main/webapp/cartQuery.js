// ajax는 async 비동기 방식이다.
$(document).ready(function() {
	
	// 버튼 클릭시 AJAX 요청
	$("#addCart").click(function() {
		
		// 입력된 데이터 가져오기
		console.log($("#selectedNumber").val());
		var selectedNumber= $("#selectedNumber").val()
		
		// AJAX 요청
		$.ajax({
			type: "POST",
			// servlet 이름
			url: "getCart.do", 
			
			// key (변수 : name) : value (html에서 받아온 id:name)
			data: {
				selectedNumber : selectedNumber
				},
				
			success: function() {
				// 서버에서 받은 응답 처리
				//$("#result").html(response)
				alert("장바구니에 입력");
				
				
			}
		}) // $.ajax
	}) // $("#queryButton").click(function()
}) // $(document).ready(function()