/*
function sendProductInfo(productid) {
		    // Get product information from the current clicked button's parent element
		    // 아이템을 담기 위해 컨테이너 하나 만들기
		    var productContainer = event.target.closest('.product-item');
		    var yName = productContainer.querySelector('.text-truncate').innerText;
		    var ySrc = productContainer.querySelector('img').getAttribute('src');
		    var yTitle = productContainer.querySelector('.ytitle').innerText;  // Update this line with the appropriate way to get yTitle
		    var price = productContainer.querySelector('h5').innerText;
			
			var width = 500; // 팝업창 너비
			var height = 420; // 팝업창 높이
			
			var top = (window.innerHeight - height) / 2;
			var left = (window.innerWidth - width) / 2;
			
		    $.ajax({
		    	type: 'POST',
		    	url: 'popup.do',
		    	data: {
		    		yName:yName,
		    		ySrc:ySrc,
		    		yTitle:yTitle,
		    		price:price,
		    		productid:productid
		    	},
		    	success: function(response){
		    		var url = "popup.jsp";  
		    		/* 어떤 방식으로 띄울 것인가   
					var name = "_blank";
					// option 스펙 설정
					var specs = 'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left + ', location=no, toolbar=no, menubar=no, scrollbars=no, resizable=no'
					window.open(url, name, specs);
		    	}
		    });
		}
*/

function sendProductInfo(productid) {
	var productContainer = event.target.closest('.product-item');
	var pname = productContainer.querySelector('.text-truncate').innerText;
    
    var customerid = document.getElementById('userid').value;
	
	if (customerid == null || customerid == "") {
		alert("로그인 후 장바구니 버튼을 클릭 하세요.");
	}	
	else {
		var confirmationMessage =  "장바구니에 " + pname + "을(를) 상품을 담으시겠습니까?";
		var result = confirm(confirmationMessage);
		
		if (result) {
		    // 장바구니에 상품을 담는 로직
	    	alert("상품이 장바구니에 담겼습니다.");
	    	$.ajax({
		    	type: 'POST',
		    	url: 'bestPageCart.do',
		    	data: {
		    		/* yName:yName,
		    		ySrc:ySrc,
		    		yTitle:yTitle,
		    		price:price,
		    		*/
		    		productid:productid
	    		}
	    	});
	    	
		} else {
		    // 취소 버튼을 눌렀을 때의 로직
			alert("장바구니에 상품 담기가 취소되었습니다.");
		}
	}
}
