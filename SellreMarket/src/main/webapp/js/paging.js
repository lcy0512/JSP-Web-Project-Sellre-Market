var curPage = document.getElementById("curPage");

// Ajax 요청	
$.ajax({
	type: "POST",
	url: "paging.do",
	data: {curPage:curPage},
	success: function(response) {
		paging(response)
	}
})

function paging(data) {
	
	var curPage = data.curPage;
	var endPage = data.endPage;
	var blockStart = data.blockStart;
	var endBlock = data.endBlock;
	var href = data.href;
	var a = "";
	console.log(curPage);
	console.log(endPage);
	console.log(blockStart);
	console.log(endBlock);
	console.log(href);
	
	
	if (curPage > 1) {
			a += href + (curPage - 1) + "' class='prev'> << </a>"
	}
	
	
	
	for (var i = blockStart; i <= endBlock && i <= endPage; i++) {
		a += href + i + "' class='cur'>" + i + "</a>"
	}
	
	console.log(curPage);
	if (curPage < endPage) {
			a += href + (curPage+ 1) + "' class='next'> >> </a>"
	}
	
	console.log(a);
	$("#paging").html(a);
}
