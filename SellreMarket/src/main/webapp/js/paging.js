// Ajax 요청	
window.onload = function() {
	console.log($("#curPage").val() + " : window.onload curPage");
	$.ajax({
		type: "POST",
		url: "paging.do",
		data: {curPage:$("#curPage").val()},
		success: function(response) {
			paging(response)
		}
	});
}

function paging(data) {
	
	var curPage = data.curPage;
	var endPage = data.endPage;
	var blockStart = data.blockStart;
	var endBlock = data.endBlock;
	var href = data.href;
	var a = "";
	
	console.log(blockStart + " blockStart는 몇???")
	console.log(curPage + ": curPage");
	
	for (var i = blockStart; i <= endBlock && i <= endPage; i++) {
		if (curPage > 1 && curPage == i) {
			a += href + (curPage - 1) + "' class='prev'> << </a>"
		}
		if (i >= curPage) {
			a += href + i + "' class='cur'>" + i + "</a>"
		}
		if (curPage < endPage && i == endBlock) {
			a += href + (curPage+ 1) + "' class='next'> >> </a>"
		}
	}
	
	$("#paging").html(a);
}
