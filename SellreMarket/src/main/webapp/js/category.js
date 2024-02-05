
$(document).ready(function() {
	// 첫번째인지 확인하는 boolean 값
	var isCategoryLoaded = false;
	
    // categorySpan에 마우스를 올리면,
    $("#categorySpan").mouseover(function() {
		// 맨 처음만 불러오면 되므로, 첫번째인지 확인
		 if (!isCategoryLoaded) {
	        // AJAX를 사용하여 JSP 페이지를 로드하고 보여줌
	        $.ajax({
	            url: "Category.jsp",
	            method: "GET",
	            success: function(data) {
	                // JSP 페이지의 내용을 header.jsp에 있는 categoryBar에 삽입
	                $("#categoryBar").html(data);
	                // 또 다시 불러오지 않게 boolean 값 변경
	                isCategoryLoaded = true;
	            },
	            error: function() {
	                console.log("JSP 페이지 로드 실패");
	            }
	        });
        }
    }); // $("#categorySpan").mouseover
    
    // 마우스가 categorySpan 또는 categoryBar 영역 밖으로 나갔을 때,
     $(document).on("mouseout", "#categorySpan, #categoryBar", function(e) {
        if (!$(e.relatedTarget).closest("#categorySpan, #categoryBar").length) {
			// 카테고리 숨김
            $("#categoryBar").html("");
            isCategoryLoaded = false;
        }
    });

}); // $(document).ready

$(document).ready(function() {
    // Category.jsp의 ul.css-13ct7qm 아래에 있는 모든 li tag들에게 적용
	$(document).on("mouseover", "ul.css-13ct7qm li", function() {
		changeClass(this);
	});
	
	$(document).on("mouseout", "ul.css-13ct7qm li", function() {
	    restoreClass(this);
	});
});

var originalStyles;
var changeStyles;

function changeClass(element) {
	// 원래의 스타일
	originalStyles = {
        fontWeight: $(element).find('.css-mhaka4').css('font-weight'),
        color: $(element).find('.css-mhaka4').css('color')
    };
    // 마우스를 올려놨을 때, 강조되는 스타일
    changeStyles = {
		fontWeight: $(element).find('.css-mhaka4').css('font-weight', '450'),
		color: $(element).find('.css-mhaka4').css('color', 'rgb(186,190,0)')
	}
	
    element.classList.add("css-rpv8dm");
}

function restoreClass(element) {
	
	$(element).find('.css-mhaka4').css(originalStyles);
    element.classList.remove("css-rpv8dm");
    
}
