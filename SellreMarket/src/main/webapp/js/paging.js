// Ajax 요청	
window.onload = function() {
	console.log("load completely");
	$.ajax({
		type: "POST",
		url: "paging.do",
		data: {curPage:$("#curPage").val()},
		success: function(response) {
			paging(response)
		}
	});
}

/*
function paging(data) {
	
	var curPage = data.curPage;
	var endPage = data.endPage;
	var href = data.href;
	var a = "";
	
	if (curPage >= 4 ) {
			a += href + (curPage - 1) + "' class='prev' style='border: solid; border-width: 1px; border-color: lightgrey; font-size : 20px; cursor : pointer; margin-left: 10px; margin-right:10px;'> << </a>";
		}
	
	if ( curPage <= 3) {
		for (var j = 1; j < 6 && j <= endPage ; j++){
			a += href + j + "' class='cur' style='border: solid; border-width: 1px; border-color: lightgrey; font-size : 20px; cursor : pointer; margin-left: 10px; margin-right:10px;'>" + j + "</a>";
		}
	}
	else if (curPage+2 >= endPage){
		for (var z = endPage-4; z <= endPage ; z++){
			a += href + z + "' class='cur' style='border: solid; border-width: 1px; border-color: lightgrey; font-size : 20px; cursor : pointer; margin-left: 10px; margin-right:10px;'>" + z + "</a>";
		}
	}
	else {
		for (var i = curPage-2; i <= endPage &&  i <= curPage+2 ; i++) {
			a += href + i + "' class='cur' style='border: solid; border-width: 1px; border-color: lightgrey; font-size : 20px; cursor : pointer; margin-left: 10px; margin-right:10px;'>" + i + "</a>";
		}
	}
	
	if (endPage > curPage+2) {
			a += href + (curPage+1) + "' class='next' style='border: solid; border-width: 1px; border-color: lightgrey; font-size : 20px; cursor : pointer; margin-left: 10px; margin-right:10px;'> >> </a>";
		}
		
	$("#showPaging").html(a);
}
*/

function paging(data) {

	var curPage = data.curPage;
	var endPage = data.endPage;
	var href = data.href;
	var a = "";

	if (curPage >= 4) {
		a +=  href + (curPage - 1) + "' class='prev' style='border: solid; border-width: 1px; border-color: lightgrey; font-size: 20px; cursor: pointer; margin-left: 10px; margin-right: 10px;'> << </a>";
	}

	if (curPage <= 3) {
		for (var j = 1; j < 6 && j <= endPage; j++) {
			if (j === curPage) {
				a += href + j + "' class='cur' style='border: solid; border-width: 1px; border-color: lightgrey; font-size: 20px; cursor: pointer; margin-left: 10px; margin-right: 10px; background-color: rgb(249,249,228);'> " + j + " </a>";
			} else {
				a += href + j + "' class='cur' style='border: solid; border-width: 1px; border-color: lightgrey; font-size: 20px; cursor: pointer; margin-left: 10px; margin-right: 10px;'> " + j + " </a>";
			}
		}
	} else if (curPage + 2 >= endPage) {
		for (var z = endPage - 4; z <= endPage; z++) {
			if (z === curPage) {
				a += href + z + "' class='cur' style='border: solid; border-width: 1px; border-color: lightgrey; font-size: 20px; cursor: pointer; margin-left: 10px; margin-right: 10px; background-color: rgb(249,249,228);'> " + z + " </a>";
			} else {
				a += href + z + "' class='cur' style='border: solid; border-width: 1px; border-color: lightgrey; font-size: 20px; cursor: pointer; margin-left: 10px; margin-right: 10px;'> " + z + " </a>";
			}
		}
	} else {
		for (var i = curPage - 2; i <= endPage && i <= curPage + 2; i++) {
			if (i === curPage) {
				a += href + i + "' class='cur' style='border: solid; border-width: 1px; border-color: lightgrey; font-size: 20px; cursor: pointer; margin-left: 10px; margin-right: 10px; background-color: rgb(249,249,228);'> " + i + " </a>";
			} else {
				a += href + i + "' class='cur' style='border: solid; border-width: 1px; border-color: lightgrey; font-size: 20px; cursor: pointer; margin-left: 10px; margin-right: 10px;'> " + i + " </a>";
			}
		}
	}

	if (endPage > curPage + 2) {
		a += href + (curPage + 1) + "' class='next' style='border: solid; border-width: 1px; border-color: lightgrey; font-size: 20px; cursor: pointer; margin-left: 10px; margin-right: 10px;'> >> </a>";
	}

	$("#showPaging").html(a);
}

