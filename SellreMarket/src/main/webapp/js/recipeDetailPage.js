// 페이지가 로드될 때 자동으로 실행되는 함수
window.onload = function() {
    // 시작할 때 "상품을 선택해주세요" 옵션을 선택합니다.
    selectOption('상품을 선택해주세요');
    
    // 장바구니 버튼에 클릭 이벤트 리스너 추가
    var cartButton = document.querySelector('.cart-button');
    if (cartButton) {
        // 이벤트 리스너가 아직 등록되지 않았다면 등록합니다.
        cartButton.removeEventListener('click', updateCartItem); // 이벤트 리스너 제거
        cartButton.addEventListener('click', updateCartItem);
    }
};

// 드롭다운을 토글하는 함수
function toggleDropdown() {
    // "dropdownOptions" 요소를 가져옵니다.
    var dropdownOptions = document.getElementById("dropdownOptions");
    // 만약 "dropdownOptions" 요소의 표시 속성이 "none" 이거나 비어있다면
    if (dropdownOptions.style.display === "none" || dropdownOptions.style.display === "") {
        // "dropdownOptions" 요소의 표시 속성을 "block" 으로 설정하여 보여줍니다.
        dropdownOptions.style.display = "block";
    } else {
        // 그렇지 않으면, "dropdownOptions" 요소를 숨깁니다.
        dropdownOptions.style.display = "none";
    }
}

// 옵션을 선택할 때 실행되는 함수
function selectOption(option, price, saleprice) {
    var dropdownText = document.getElementById("dropdownText");
    var dropdownOptions = document.getElementById("dropdownOptions");
    var cartOptions = document.getElementById("cartOptions");

    // 선택된 옵션이 "상품을 선택해주세요"가 아닌 경우에만 선택 텍스트를 변경합니다.
    if (option !== "상품을 선택해주세요") {
        // 선택된 옵션을 드롭다운 버튼에 표시합니다.
        dropdownText.innerText = option;

        // 이미 선택된 상품에 대한 장바구니 옵션이 존재하는지 확인합니다.
        var existingCartOption = document.getElementById(option + "-cart-option");
        if (!existingCartOption) {
            // 선택된 상품에 대한 장바구니 옵션이 존재하지 않는 경우, 새로운 옵션을 생성하여 추가합니다.
            var newCartOption = document.createElement("div");
            newCartOption.id = option + "-cart-option";
            newCartOption.innerHTML = `
                <!-- 장바구니 옵션 항목 -->
                <div class="cart-option-item css-1cb5lnc e1bjklo18">
                    <!-- 옵션 항목 내용 -->
                    <div class="css-1qdyvok e1bjklo16">
                        <!-- 아이콘 표시 부분 -->
                        <span class="css-1yojl0t e1bjklo14">${option}</span>
                        <!-- 삭제 버튼 -->
                        <button class="css-rrel8y e1ad0u7r0" onclick="deleteCartItem('${option}')">
                            <!-- 삭제 버튼 아이콘 -->
                            <svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeSmall" focusable="false" viewBox="0 0 24 24" aria-hidden="true">
                                <path fill="none" d="M0 0h24v24H0z"></path>
                                <path d="M19 6h-4.5l-1-1h-5l-1 1H5v2h14V6zM8 18v-8h2v8H8zm6 0v-8h2v8h-2z"></path>
                            </svg>
                        </button>
                    </div>
                    <!-- 수량 조절 부분 -->
                    <div class="css-tk6lxo e1bjklo15">
                        <div class="css-nx0orh e1cqr3m40">
                            <!-- 수량 감소 버튼 -->
                            <button type="button" aria-label="수량내리기" class="css-1e90glc e1hx75jb0" onclick="decreaseQuantity('${option}')">-</button>
                            <!-- 수량 표시 -->
                            <div class="count css-6m57y0 e1cqr3m41" id="${option}-quantity">1</div>
                            <!-- 수량 증가 버튼 -->
                            <button type="button" aria-label="수량올리기" class="css-18y6jr4 e1hx75jb0" onclick="increaseQuantity('${option}')">+</button>
                        </div>
                        <!-- 가격 정보 부분 -->
                        <div class="css-1jzvrpg e1bjklo12">
                            <!-- 원래 가격 -->
                            <span class="css-fburr9 e1bjklo11">${(price * 1).toLocaleString()}원</span>
                            <!-- 할인 가격 -->
                            <span class="css-gqkxk8 e1bjklo10">${(saleprice * 1).toLocaleString()}원</span>
                        </div>
                    </div>
                </div>
            `;

            cartOptions.appendChild(newCartOption);
            updateCartItemNames();
        }
        // 장바구니 옵션을 보여줍니다.
        cartOptions.style.display = "block";
    } else {
        // 선택된 옵션이 "상품을 선택해주세요"인 경우, 선택 텍스트를 변경하지 않고 장바구니 옵션을 숨깁니다.
        dropdownText.innerText = option;
        cartOptions.style.display = "none";
    }

    // 드롭다운 옵션을 숨깁니다.
    dropdownOptions.style.display = "none";

    // 장바구니 옵션의 할인 가격의 합을 계산하여 콘솔에 출력합니다.
    calculateTotalSalePrice();
}

// 장바구니 옵션을 삭제하는 함수
function deleteCartItem(option) {
    var cartOption = document.getElementById(option + "-cart-option");
    // 장바구니 옵션을 삭제합니다.
    cartOption.parentNode.removeChild(cartOption);

    // 모든 장바구니 옵션이 삭제된 경우, 다시 "상품을 선택해주세요" 옵션으로 변경합니다.
    var cartOptions = document.getElementById("cartOptions");
    if (cartOptions.children.length === 0) {
        selectOption('상품을 선택해주세요');
    }

    // 장바구니 옵션의 할인 가격의 합을 다시 계산하여 콘솔에 출력합니다.
    calculateTotalSalePrice();
    updateCartItemNames();
}

// 초기 가격을 저장하는 변수
var initialPrices = {};

// 수량을 증가시키는 함수
function increaseQuantity(option) {
    var quantityElement = document.getElementById(`${option}-quantity`);
    var quantity = parseInt(quantityElement.textContent);
    quantityElement.textContent = quantity + 1;

    // 가격 정보 업데이트
    updatePrice(option, quantity + 1);

    // 장바구니 옵션의 할인 가격의 합을 다시 계산하여 콘솔에 출력합니다.
    calculateTotalSalePrice();
}

// 수량을 감소시키는 함수
function decreaseQuantity(option) {
    var quantityElement = document.getElementById(`${option}-quantity`);
    var quantity = parseInt(quantityElement.textContent);
    if (quantity > 1) {
        quantityElement.textContent = quantity - 1;

        // 가격 정보 업데이트
        updatePrice(option, quantity - 1);

        // 장바구니 옵션의 할인 가격의 합을 다시 계산하여 콘솔에 출력합니다.
        calculateTotalSalePrice();
    }
}

// 가격 정보 업데이트하는 함수
function updatePrice(option, quantity) {
    // 옵션 요소를 찾습니다.
    var optionElement = document.getElementById(`${option}-cart-option`);

    // 옵션 요소를 찾고 가격 정보를 업데이트합니다.
    if (optionElement) {
        var quantityElement = document.getElementById(`${option}-quantity`);
        var currentQuantity = parseInt(quantityElement.textContent);

        var priceElement = optionElement.querySelector('.css-fburr9');
        var salepriceElement = optionElement.querySelector('.css-gqkxk8');

        if (priceElement && salepriceElement) {
            // 초기 가격이 설정되어 있지 않다면 저장합니다.
            if (!(option in initialPrices)) {
                initialPrices[option] = {
                    originalPrice: parseInt(priceElement.textContent.trim().replace(/[^\d]/g, '')),
                    salePrice: parseInt(salepriceElement.textContent.trim().replace(/[^\d]/g, ''))
                };
            }

            var initialOriginalPrice = initialPrices[option].originalPrice;
            var initialSalePrice = initialPrices[option].salePrice;

            var totalOriginalPrice = initialOriginalPrice * (quantity > 1 ? quantity : 1);
            var totalSalePrice = initialSalePrice * (quantity > 1 ? quantity : 1);

            priceElement.textContent = totalOriginalPrice.toLocaleString() + "원";
            salepriceElement.textContent = totalSalePrice.toLocaleString() + "원";
        } else {
            console.error("가격 요소를 찾을 수 없습니다.");
        }
    } else {
        console.error("옵션 요소를 찾을 수 없습니다.");
    }
}

// 장바구니 옵션의 할인 가격의 합을 계산하여 콘솔에 출력하는 함수
function calculateTotalSalePrice() {
    var totalSalePrice = 0;
    var cartOptions = document.getElementById("cartOptions");
    // 모든 장바구니 옵션을 순회하며 할인 가격의 합을 계산합니다.
    for (var i = 0; i < cartOptions.children.length; i++) {
        var optionElement = cartOptions.children[i];
        var salepriceElement = optionElement.querySelector('.css-gqkxk8');
        if (salepriceElement) {
            totalSalePrice += parseInt(salepriceElement.textContent.trim().replace(/[^\d]/g, ''));
        }
    }
    // "49,900" 부분에 해당하는 요소를 가져와서 값을 업데이트합니다.
    var totalPriceElement = document.querySelector('.css-x4cdgl');
    if (totalPriceElement) {
        totalPriceElement.textContent = totalSalePrice.toLocaleString(); // 할인 가격의 합을 총 상품 금액으로 업데이트합니다.
    }
}

// 장바구니 옵션의 이름들을 저장하는 함수
function updateCartItemNames() {
    cartItemNames = [];
    var cartOptions = document.getElementById("cartOptions");
    // 모든 장바구니 옵션의 이름을 순회하며 배열에 추가합니다.
    for (var i = 0; i < cartOptions.children.length; i++) {
        var optionElement = cartOptions.children[i];
        var nameElement = optionElement.querySelector('.css-1yojl0t');
        if (nameElement) {
            cartItemNames.push(nameElement.textContent.trim());
        }
    }
    console.log('cartItemNames: ', cartItemNames);
}

const updateCartItem = () => {
    // 장바구니에 담긴 상품들의 이름을 업데이트합니다.
    updateCartItemNames(); // 장바구니에 담긴 상품들의 이름을 업데이트하는 함수 호출
    
    // 장바구니에 상품이 있는지 확인합니다.
    if (cartItemNames && cartItemNames.length > 0) {
        $.ajax({
            // 요청:
            type: "POST", // POST 방식으로 변경
            url: "recipeAjax.do", // 서버에 요청할 URL
            data: { cartItemNames: cartItemNames.join(',') }, // cartItemNames 배열을 서버에 전송
            
            // 성공 시 실행할 함수:
            success: function(response) {
                console.log('response: ', response); // 서버 응답을 콘솔에 출력
                if (response && response.success) {
                    console.log('Cart items successfully updated on the server.'); // 장바구니 상품이 서버에 업데이트되었음을 콘솔에 출력
                } else {
                    console.log('Failed to update cart items on the server. Error:', response.error); // 서버에서 전달한 오류 메시지를 콘솔에 출력
                }
            },
            
            error: function(xhr, status, error) {
                console.error("서버 요청 중 에러가 발생했습니다.", error); // 에러 발생 시 에러를 콘솔에 출력
                console.log('Failed to update cart items on the server.'); // 장바구니 상품이 서버에 업데이트되지 않았음을 콘솔에 출력
            }
        });
    } else {
        // 장바구니에 상품이 없는 경우 메시지를 콘솔에 출력합니다.
        console.log('No items in the cart to update.'); // 장바구니에 업데이트할 상품이 없음을 콘솔에 출력
    }
}
