<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
   <style>
        /* 수정된 CSS 코드 */
        #productGroup {
            border: 1px solid #ccc; /* 테두리 스타일 추가 */
            padding: 10px; /* 내부 여백 추가 */
            margin-bottom: 10px; /* 아래 여백 추가 */
        }

        #quantityContainer {
            display: flex;
            align-items: center; /* 세로 중앙 정렬 */
            /* justify-content: center; */ /* 가로 중앙 정렬 해제 */
        }

        button {
            margin-left: 5px; /* - 버튼이 숫자 입력 왼쪽에 위치하도록 수정 */
            margin-right: 5px; /* + 버튼과 숫자 입력 사이의 간격 조절 */
        }

        #buyButton {
            margin-top: 10px; /* 구매 버튼과 총 상품 금액 사이의 간격 조절 */
        }
    </style>

      <script>
        function showItemInfo() {
            var comboBox = document.getElementById("productComboBox");
            var selectedItemValue = comboBox.value;

            // 선택된 상품의 value를 이용하여 동적으로 <p> 업데이트
            var selectedItemInfo = document.getElementById("selectedItemInfo");
            var quantityContainer = document.getElementById("quantityContainer");

            // 기존에 생성된 수량 입력 요소와 버튼들을 삭제
            while (quantityContainer.firstChild) {
                quantityContainer.removeChild(quantityContainer.firstChild);
            }

            if (selectedItemValue) {
                selectedItemInfo.innerHTML = selectedItemValue;

                // "-" 버튼 추가
                var decreaseButton = document.createElement("button");
                decreaseButton.innerHTML = "-";
                decreaseButton.onclick = function() {
                    updateQuantity(-1);
                };
                quantityContainer.appendChild(decreaseButton);

                // 수량 표시
                var quantityDisplay = document.createElement("span");
                quantityDisplay.id = "quantityDisplay";
                quantityDisplay.innerHTML = "1"; // 초기값
                quantityContainer.appendChild(quantityDisplay);

                // "+" 버튼 추가
                var increaseButton = document.createElement("button");
                increaseButton.innerHTML = "+";
                increaseButton.onclick = function() {
                    updateQuantity(1);
                };
                quantityContainer.appendChild(increaseButton);
            } else {
                selectedItemInfo.innerHTML = "";  // 선택이 해제되면 내용을 지움
            }
        }

        function updateQuantity(delta) {
            var quantityDisplay = document.getElementById("quantityDisplay");
            var currentQuantity = parseInt(quantityDisplay.innerHTML);

            // 수량 업데이트
            var newQuantity = currentQuantity + delta;

            // 수량이 1 미만으로 떨어지면 경고창 출력
            if (newQuantity < 1) {
                alert("상품은 1개 이상 구매해야합니다.");
            } else {
                quantityDisplay.innerHTML = newQuantity;
            }
        }
    </script>
</head>
<body>
<table border="1">
	<!-- 1행 -->
    <tr>
        <td colspan="2">[하루한끼] 초간단 계란 잡채</td>
    </tr>
	<!-- 2행 -->
    <tr>
        <td colspan="2">18900</td>
    </tr>
	<!-- 3행 -->
    <tr>
        <td>25%</td>
        <td>14220</td>        
    </tr>       
	<!-- 4행 -->
    <tr>
        <td>배송방법</td>
        <td>
        신속배송<br>
        23시 전 주문 시 다음 날 07시 이전 도착<br>
        (일부 지역 운영시간 별도 확인)
        </td>        
    </tr>
	<!-- 5행 -->
    <tr>
        <td>포장타입</td>
        <td>냉장(종이 포장)</td>        
    </tr>
	<!-- 6행 -->
    <tr>
        <td>판매단위</td>
        <td>1팩</td>        
    </tr>
	<!-- 7행 -->
    <tr>
        <td>종량</td>
        <td>선택 제품 참조</td>        
    </tr>
	<!-- 8행 -->
    <tr>
        <td>알레르기 정보</td>
        <td>선택 제품 참조</td>        
    </tr>
	<!-- 9행 -->
    <tr>
        <td>상품 선택</td>
        <td>
            <select id="productComboBox" onchange="showItemInfo()">
                <option value="">상품을 선택해주세요</option>
                <option value="사과">사과</option>
                <option value="배">배</option>
                <option value="딸기">딸기</option>
            </select>
        	<p id="selectedItemInfo"></p>
        	<p id="quantityContainer"></p>
        </td>        
    </tr>
</table>
총 상품금액 : 14,220원

<!-- 구매 버튼 추가 -->
<div id="buyButton">
    <button onclick="buyProduct()">구매하기</button><br><br><br>
</div>

<!-- JavaScript로 구매 기능 구현 -->
<script>
    function buyProduct() {
        // 여기에 구매 로직을 추가
        alert("상품을 구매합니다!");
    }
</script>

<!-- footer.jsp를 include -->
<!--jsp:include page="footer.html" flush="false" /-->

</body>
</html>
