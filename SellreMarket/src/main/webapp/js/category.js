
$(document).ready(function() {
    // span에 마우스를 올렸을 때 이벤트 처리
    $("#categorySpan").click(function() {
        // AJAX를 사용하여 JSP 페이지를 로드하고 보여줌
        $.ajax({
            url: "Category.jsp",
            method: "GET",
            success: function(data) {
                // JSP 페이지의 내용을 특정한 div에 삽입
                $("#categoryBar").html(data);
            },
            error: function() {
                console.log("JSP 페이지 로드 실패");
            }
        });
    });

    // 마우스를 뗐을 때 이벤트 처리
    $("#document").mouseover(function() {
        // JSP 페이지를 숨김
        $("#categoryBar").html("");
    }); 
    
     // #categoryBar를 클릭했을 때 이벤트 처리
    $("#categoryBar").click(function(e) {
        // 이벤트 전파 방지
        e.stopPropagation();
    });
    
});

/*
const menu = document.getElementById("categorySpan");

function slideDown() {
	menu.style.left = "-300px";
}

function slideUp() {
	menu.style.left = "0";
}

function handleMouseMove(event) {
	let clientX = event.clientX;
	
	if(clientX >= 0 && clientX <= 10) {
		slideUp();
	}
	else {
		slideDown();
	}
}

function init() {
	document.addEventListener("mousemove",handleMouseMove);	
}
*/
