
window.onload = function(){
	let curPage = 1;
	// AJAX 요청
	pageNum(curPage);
}

function createEventList(data) {
	// 초기화
	$("#ulinput").html("");
	$("#block").html("");
	
	//let dataReal = Array.from(data);
	let ul = "";
	let block = "";
	
	
	//ul += "<input type='hidden' id='curPage' name='curPage' value='" + data.curPage + "'>";
	
	for(let i=0; i<data.eventList.length; i++) {
	console.log("eventid : " + data.eventList[i].eventid)
	console.log("category : " + data.eventList[i].category)
		
		ul += "<li>" 
//			+ "<a href='#' onclick='eventdetail(\"" + data.eventList[i].eventid + "\")'>" 
			+ "<a href='noticedetail.do?eventid=" + data.eventList[i].eventid + "'>" 
			+ "<div class='css-14yglsw e1cfowvj4'>"
			+ "<div class='css-3o6rrk e1cfowvj2'>" + data.eventList[i].eventid +"</div>";

		if(data.eventList[i].category == 2) {
			ul += "<div class='css-fzefrb e1cfowvj2'>[공지] " + data.eventList[i].ename + "</div>"
		}
		else {
			ul += "<div class='css-fzefrb e1cfowvj2c'>[이벤트] " + data.eventList[i].ename + "</div>"
		}		
		
		ul += "<div class='css-3d2kks eß1cfowvj2'>셀리마켓</div>"
			+ "<div class='css-b1hszl e1cfowvj2'>" + data.eventList[i].inputdate + "</div>"
			+ "</div></a></li>";
			
	}
	
	let blockStart = data.blockStartPage;
	let blockEnd = data.blockEndPage;
	let totalPage = data.totalPage;
	
	console.log(blockStart)
	console.log(blockEnd)
	console.log(totalPage)
	
	let newBlockStart = blockStart;
	let newBlockEnd = blockEnd;
	
	if(blockStart - 5 < 1) {
		newBlockStart = 1;
	}
	else {
		newBlockStart = newBlockStart - 5;
	}
	
	if(blockEnd + 1 > totalPage) {
		newBlockEnd = totalPage;
	}
	else {
		newBlockEnd = newBlockEnd + 1;
	}
	
	console.log("new start : " + newBlockStart)
	console.log("new end : " + newBlockEnd)
	
	block += "<span style='border: solid; border-width: 1px; border-color: lightgrey; font-size : 20px; cursor : pointer; margin-left: 10px; margin-right:10px;'>";
	block += "<a href='#' onclick='pageNum(" + newBlockStart + ")'><<</a>";
	block += "</span>"
	
	for(let j=blockStart; (j<=blockEnd && j<=totalPage); j++) {
		block += "<span style='border: solid; border-width: 1px; border-color: lightgrey; font-size : 20px; cursor : pointer; margin-left: 10px; margin-right:10px;";
		if(j == data.curPage) {
			block += "background-color : rgb(249,249,228)'>";
		}
		else {
			block += "'>";
		}
		block += "<a href='#' onclick='pageNum(" + j + ")'>" + j + "</a>";
		block += "</span>";
	}
	
	block += "<span style='border: solid; border-width: 1px; border-color: lightgrey; font-size : 20px; cursor : pointer; margin-left: 10px; margin-right:10px;'";
	block += "<a href='#' onclick='pageNum(" + newBlockEnd + ")'>>></a>";
	block += "</span>"
	
	$("#ulinput").html(ul);
	$("#block").html(block);
}


function pageNum(page) {
	
	let curPage = page;
	let keyword = $("#searchkeyword").val();
	
	// AJAX 요청
	$.ajax({
		type : "POST",
		url : "noticelist.do",
		data : {
			curPage : curPage,
			keyword : keyword
			},
		success : function(response) {
			createEventList(response);
		}, // success
		error : function(xhr, status, error) {
			alert("문제가 발생하였습니다." + error)
		}
	}) // $.ajax
}
