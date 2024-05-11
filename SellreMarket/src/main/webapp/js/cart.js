/**
* 장바구니에서 제품 전체선택 하기 기능 구현.
*/
const selectAllItems = () => {
	// 제목 행의 체크박스의 체크여부를 확인
	const allCheck = document.querySelector('#allCheck');
	
	// 제목 줄의 체크박스가 클릭되면..
	allCheck.addEventListener('click', function () {
		//참고)
		//alert(allCheck.checked);
		//allCheck.id;	// allCheck
		//allCheck.type;	// checkbox
		
		const isChecked = allCheck.checked;	// 체크된 제목줄 체크박스를 isChecked라고 한다.
		
		// 클래스가 cart-item-check인 태그들을 모두 데리고 온다.
		// 장바구니의 모든 체크박스를 체크한다.
		const check = document.querySelectorAll('.cart-item-check');
		
		// 제목 줄의 체크박스가 체크 됐다면..
		if (isChecked) {
			// check.checked = true;
			
			// 자바스크립트는 for문 사용가능하나 자료형이 없어서 int 사용은 안한다.
			for (i=0; i<check.length; i++) {
				check[i].checked = true;	// 체크된 클래스가 check의 값은 true로 준다.
			}
			
			// 자바스크립트의 for-each문: of를 사용한다!
			// for (const e of check) {
			// e.checked = true;
			// }
		}
		else {
			for (i=0; i<check.length; i++) {
				check[i].checked = false;	// 체크된 클래스가 check의 값은 true로 준다.
			}
		}
	});
}

// 제목줄 아래 체크박스칸들이 전부! 체크가 된다면..
// 제목줄 아래 체크박스칸들이 전부! 가져온다.
const check = document.querySelectorAll('.cart-item-check');

for (const e of check) {
	// 원래라면..
	// 매개변수 e
	// e.addEventListener('click',function(e){});
	
	// 위의 이벤트문을 조금 변경한다면..
	e.addEventListener('click', e=>{
		const cnt = check.length;	// 제목줄 밑의 전체 체크박스의 갯수는 cnt
		const checkedCnt = document.querySelectorAll('.cart-item-check:checked').length;	// 클래스가 cart-item-check 인 것들 중에서 체크된 것만 들고오겠다. 그 것의 갯수.
		
		if (cnt == checkedCnt) {
			document.querySelector('#allCheck').checked = true;
		}
		
		else {
			document.querySelector('#allCheck').checked = false;
		}		
	});	
}

/**
* 장바구니에서 선택한 제품 선택삭제 하기 기능 구현.
*/
const confirmDeletion = () => {
	// 확인 대화상자를 표시하여 사용자의 의사를 확인합니다.
	const result = confirm("정말로 삭제하시겠습니까?");
	
	if (result) {
		// 사용자가 확인을 선택한 경우, 삭제 로직을 실행합니다.
		const checkedItems = document.querySelectorAll('.cart-item-check:Checked');
		// 선택한 제품이 없을 때
		if (checkedItems.length == 0) {
			alert('선택한 제품이 없습니다.');
			return;
		}
		// 선택된 제품들이 있을 때
		deleteCart(checkedItems);
	} else {
		// 사용자가 취소를 선택한 경우, 삭제를 취소합니다.
		return;
	}
}

const deleteCart = (checkedItems) => {
	checkedItems.forEach((checkedItem) => {
		const cartItem = checkedItem.closest('.cart-item');
		const cartId = cartItem.id.split('_')[2];	// cartId를 id에서 추출
		
		const dto = {cartId: cartId};
		deleteCartItem(dto);
	});
}

/**
 * @typedef {Object} CartDeleteDto
 * @property {number} cartId - 카트 번호
 */

/**
 * @param {CartDeleteDto} dto
 */
const deleteCartItem = (dto) => {
	
	 $.ajax({
			// 요청:
			type: "POST",
			url: "cart/item/delete.do",
			data: dto,
			
			// 성공 시 실행할 함수:
			success: function(response) {
				updateCartsAndPriceSummary();
			},
			
			error: function(e) {
				console.error(e);
			}
		});
}

/**
* 장바구니에서 제품 수량 변경하기 기능 구현.
*/
const decreaseAmount = (cartId) => {
	const amountElement = document.querySelector('#cart_item_'+ cartId +' .amount-box .amount-value');
	const currentAmount = Number(amountElement.innerHTML);
	
	if (currentAmount <= 0) {
		// TODO remove item from cart list
		return;
	}
	
	const newAmount = currentAmount - 1;
	const dto = {cartId: cartId, amount: newAmount};
	updateCartAmount(dto);
};

const increaseAmount = (cartId) => {
	const amountElement = document.querySelector('#cart_item_'+ cartId +' .amount-box .amount-value');
	const currentAmount = Number(amountElement.innerHTML);
	const newAmount = currentAmount + 1;
	
	const dto = {cartId: cartId, amount: newAmount};
	updateCartAmount(dto);
};

/**
 * @typedef {Object} CartAmountUpdateDto
 * @property {number} cartId - 카트 번호
 * @property {number} amount - 수량
 */

/**
 * @param {CartAmountUpdateDto} dto
 */
const updateCartAmount = (dto) => {
	const amountElement = document.querySelector('#cart_item_'+ dto.cartId +' .amount-box .amount-value');
	
	 $.ajax({
			// 요청:
			type: "POST",
			url: "cart/amount/update.do",
			data: dto,
			
			// 성공 시 실행할 함수:
			success: function(response) {
				updateCartsAndPriceSummary();
			},
			
			error: function(e) {
				console.error(e);
			}
		});
}

const updateCartsAndPriceSummary = () => {
	$.ajax({
		// 요청:
		type: "GET",
		url: "api/cart/query.do",
		
		success: function(response) {
			console.log('response: ', response);
			const carts = response.carts;
			const priceSummary = response.priceSummary;

			total_price.innerHTML = priceSummary.totalPrice;
			discount_price.innerHTML = priceSummary.discountPrice;
			payment_price.innerHTML = priceSummary.paymentPrice;
			
			for (const item of carts) {
				const amountElement = document.querySelector('#cart_list #cart_item_' + item.cartId + ' .amount-box .amount-value');
				amountElement.innerHTML = item.amount;
			}
			
			// rm removed cart li
			const enableIds = carts.map((item) => 'cart_item_' + item.cartId);
			
			const disabledLi = Array.from(cart_list.children).filter((li) => !enableIds.includes(li.id));
			console.log('disabled: ', disabledLi);
			disabledLi.forEach((item, index, arr) => cart_list.removeChild(item));
			
			// when carts empty
			if (carts.length === 0) {
				cart_container.classList.remove('justify-start');
				cart_container.classList.add('justify-center');
				cart_container.classList.add('py-32');
				
				const emptyCartElement = document.createElement('p');
				emptyCartElement.classList.add('css-l1lu2l');
				emptyCartElement.classList.add('eqymnpn0');
				emptyCartElement.innerHTML = '장바구니에 담긴 상품이 없습니다';
				
				cart_container.appendChild(emptyCartElement);
			}
		},
		
		error: function(e) {
			console.error(e);
		}
	});
}

// TODO rm later
const tempLogin = () => $.ajax({
	// 요청:
	type: "POST",
	url: "fake/login.do",
	
	success: function(response) {
		console.log('response: ', response);
	},
	
	error: function(e) {
		console.error(e);
	}
});