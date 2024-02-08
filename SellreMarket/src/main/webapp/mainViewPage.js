function sendProductInfo(recipeid, productid) {
		    // Get product information from the current clicked button's parent element
		    // 아이템을 담기 위해 컨테이너 하나 만들기
		    var productContainer = event.target.closest('.product-item');
		    var yName = productContainer.querySelector('.text-truncate').innerText;
		    var ySrc = productContainer.querySelector('img').getAttribute('src');
		    var yTitle = productContainer.querySelector('.ytitle').innerText;  // Update this line with the appropriate way to get yTitle
		    var price = productContainer.querySelector('h5').innerText;
			
		    $.ajax({
		    	type: 'POST',
		    	url: 'popup.do',
		    	data: {
		    		yName:yName,
		    		ySrc:ySrc,
		    		yTitle:yTitle,
		    		price:price,
		    		recipeid:recipeid,
		    		productid:productid
		    	},
		    	success: function(response){
		    		var url = "popup.jsp";  
		    		/* 어떤 방식으로 띄울 것인가 */  
					var name = "_blank";
					// option 스펙 설정
					var specs = 'width=500, height=420, top=300, left=780, location=no, toolbar=no, menubar=no, scrollbars=no, resizable=no'
					window.open(url, name, specs);
		    	}
		    });
		}