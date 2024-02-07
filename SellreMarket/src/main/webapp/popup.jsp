<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

	<style>
        .number-selector {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .decrement, .increment {
            cursor: pointer;
            font-size: 20px;
            margin: 0 10px;
        }

        .number {
            font-size: 16px;
            font-weight: bold;
        }
        
        .total {
        	font-size: 20px;
            font-weight: bold;
            padding-left: 20px;
            padding-top: 6px;
        }
    </style>
    
    
	<script>
		let selectedNumber = 1; // Initial value
		
		
		// 번호를 받아서 -1, +1 selectNumber에 적용한다.
		function updateNumber(change) {
	        selectedNumber += change;
	
	        // Ensure the number stays within the range of 1 to 10
	        selectedNumber = Math.min(Math.max(selectedNumber, 1), 10);
	
	        // Update the displayed number using textContent
	        document.getElementById('selectedNumber').textContent = selectedNumber;
	
	        // Update the total price when the selected number changes
	        updateTotalPrice(selectedNumber);
	        addCart(selectedNumber);
	    }
		
		// total price sum을 위한 함수
		function updateTotalPrice(selectedNumber) {
			const hiddenPrice = document.getElementById('hiddenPrice');
            const totalPriceElement = document.getElementById('totalPrice');

            // Get the current total price as an integer
            const totalPrice = parseInt(hiddenPrice.value.replace(/,/g, ""), 10);

            // Update the total price by multiplying it with the selected number
            const newTotalPrice = totalPrice * selectedNumber;

            // Set the new total price as the content of the element
            totalPriceElement.textContent = newTotalPrice.toLocaleString(); // Add commas back
        }
	
		
	    function addCart(selectedNumber) {
	    	/* var selectedNumber = document.getElementById('selectedNumber').textContent; */
	    	
	    	$.ajax({
	    		type: 'POST',
	    		url: 'getCart.do',
	    		data: {selectedNumber:selectedNumber}
	    		/* success: function(response) {
	    			window.location.href('getCart.do');
	    		} */
	    	});
	    	
	        /* document.getElementById('addCart').value = selectedNumber;
	        document.getElementById('myForm').action = 'getCart.do';
	        document.getElementById('myForm').submit(); */
	        
	    }
	</script>
<!-- // js 따로 관리한다. -->
<script src="cartQuery.js"></script>
</head>

<body>

	<!-- 이미지, 유튜버 이름, 제품 타이틀 가져오기 -->
	<div style="display: flex; align-items: center; padding-left: 20px; padding-top: 34px;">
		<a href="#">
			<!-- 이미지 불러오기 -->
			<img class="img-fluid" style="width: 50px; height: 50px;"
				src="<%= session.getAttribute("ySrc") %>"
				alt="Cart Click Image">
		</a>
		
		<!-- 제품의 타이틀 가져오기 -->
		<div style="padding-top: 40px; padding-left: 15px;">
			<strong><%=session.getAttribute("yName") %> <%=session.getAttribute("yTitle") %></strong>
		</div>
	</div>
	
	
	<!-- 줄 긋기 -->
	<hr style="border-color: lightgray;">

	<!--  유튜버 이름, 제품 타이틀 가져오기 -->
	<div style="padding-left: 20px; padding-top: 6px; font-size: 14px;">
		<p><%=session.getAttribute("yName") %> <%=session.getAttribute("yTitle") %></p>
	</div>
	
	
	<!-- 제품 갯수 카운트 -->
	<div style="display: flex; padding-left: 20px; padding-top: 6px;">
		<strong id="price"><%=session.getAttribute("price") %></strong>
		<div style="margin-left: auto; margin-right:20%; border:1px solid lightgray; border-radius:4px; ">
			<div class="number-selector">
				<div class="decrement" onclick="updateNumber(-1)">-</div>
				<div class="number" id="selectedNumber">1</div>
				<div class="increment" onclick="updateNumber(1)">+</div>
			</div>
		</div>
	</div>
	
	<!-- 줄 긋기 -->
	<hr style="border-color: lightgray;">
	
	
	<!-- 합계 -->
	<div class="total" style="display: flex;">
        <p>합계</p>
        <div style="margin-left: auto; margin-right:20%; margin-top: 20px;">
            <span id="totalPrice"><%= session.getAttribute("price") %></span>
            <input type="hidden" id="hiddenPrice" value="<%= session.getAttribute("price") %>">
            <span>원</span>
        </div>
    </div>
	
	
	<!-- 버튼 섹션 -->
	<div style="display: flex; justify-content: center; align-items: center; margin: auto;">
        <button type="button" style="margin-right: 10px;" onclick="window.close()">취소</button>
        <form id="myForm" method="post">
        	<button id="addCart" type="button" style="background-color: green; color: white;" onclick="addCart()">장바구니 담기</button>
        </form>
    </div>
    
</body>
</html>

