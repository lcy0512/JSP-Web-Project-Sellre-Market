$(document).ready(function() {
    // span에 마우스를 올렸을 때 이벤트 처리
    $("#categorySpan").mouseover(function() {
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
    
    $("#categoryBar").mouseout(function() {
        // JSP 페이지를 숨김
        $("#categoryBar").html("");
    }); 
});