<%--
		(1) Desc : 장바구니 page Main Contents 제작하기.
		(2) Date
			1) 2024.02.06. (Ver 0.0.0)
			2) 2024.02.08. (Ver 0.0.1)
			3) 2024.02.12. (Ver 0.0.2)
			4) 2024.02.13. (Ver 0.0.3)
		(3) Author : Gwangyeong Kim
		(4) History
			1) 최초 작성
			2) JTSL 이용하여 장바구니 데이터 불러오기.
					1. <c> tag 이용하여 데이터 불러오기.
					2. <fmt> tag 이용하여 원화 표시하기.
			3) 장바구니 제품 수량 변경 기능 구현하기.
			4) 장바구니 제품들의 각종 가격 부분 구현하기.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charSet="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, viewport-fit=cover"/>
	<title>Sellre - Cart from 셀리마켓 Main Contents 제작 page</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<meta content="Free HTML Templates" name="keywords">
	<meta content="Free HTML Templates" name="description">
	
	<%-- Favicon --%>
	<link href="img/favicon.ico" rel="icon">
	
	<%-- Google Web Fonts --%>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link
		href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
		rel="stylesheet">
		
	<%-- Font Awesome --%>
	<link
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
		rel="stylesheet">
		
	<%-- Libraries Stylesheet --%>
	<link href="lib/animate/animate.min.css" rel="stylesheet">
	<link href="lib/owlcarousel/assets/owl.carousel.min.css"
		rel="stylesheet">
		
	<%-- Customized Bootstrap Stylesheet --%>
	<link href="css/style.css" rel="stylesheet">
	
	<%-- JavaScript Libraries --%>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	
	<%-- Contact Javascript File --%>
	<script src="mail/jqBootstrapValidation.min.js"></script>
	<script src="mail/contact.js"></script>
	
	<%-- Template Javascript --%>
	<script src="js/main.js"></script>
	
	<%-- Bootstrap CSS --%>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-GLhlTQ8iK7t1TIq0IYzcqL/tnuU6J1bYWFIVXutUPnN0PBKpZQUMuXAfmgt5L9a1"
		crossorigin="anonymous">
		
	<%-- Bootstrap JavaScript (requires Popper.js) --%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofNol/wwZQqjW9M4aPskD5S/R1HD87Hjr"
		crossorigin="anonymous">
	</script>
	
	<%-- Tailwind CSS CDN --%>
	<script src="https://cdn.tailwindcss.com"></script>
	
	<%-- Font Awesome Kit CDN --%>
	<script src="https://kit.fontawesome.com/498f840871.js" crossorigin="anonymous"></script>
	
	<%-- jquery --%>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	</head>
	<body>
		<%-- Carts Start --%>
		<div class="css-1pz4b76 er0tf675">
			<style data-emotion="css 1n2hipb">
				.css-1n2hipb {
					padding: 50px 0 48px;
					font-weight: 500;
					font-size: 28px;
					line-height: 35px;
					text-align: center;
				}
			</style>
			<h2 class="css-1n2hipb er0tf674">장바구니</h2>
			<style data-emotion="css a6t9xs">
				.css-a6t9xs {
					display: -webkit-box;
					display: -webkit-flex;
					display: -ms-flexbox;
					display: flex;
					-webkit-box-pack: justify;
					-webkit-justify-content: center;
					justify-content: center;
					letter-spacing: -0.5px;
				}
			</style>
			<div class="css-a6t9xs er0tf673 gap-8">
				<style data-emotion="css 8wfj4z">
					.css-8wfj4z {
					    width: 742px;
					}
				</style>
				<div class="css-8wfj4z er0tf672">
					<style data-emotion="css 20o6z0">
						.css-20o6z0 {
							display: -webkit-box;
							display: -webkit-flex;
							display: -ms-flexbox;
							display: flex;
							-webkit-box-pack: justify;
							-webkit-justify-content: space-between;
							justify-content: space-between;
							-webkit-align-items: center;
							-webkit-box-align: center;
							-ms-flex-align: center;
							align-items: center;
							padding: 18px 10px 16px 2px;
							font-size: 14px;
							line-height: 26px;
							font-weight: 500;
						}
					</style>
					<div class="css-20o6z0 e149z643">
						<style data-emotion="css zbxehx">
							.css-zbxehx label {
								display: -webkit-inline-box;
								display: -webkit-inline-flex;
								display: -ms-inline-flexbox;
								display: inline-flex;
								font-size: 14px;
								line-height: 26px;
								padding: 0;
								color: #333;
							}
						</style>
						<div class="css-zbxehx e149z642">
							<style data-emotion="css 1vf8o8s">
								.css-1vf8o8s {
									padding: 14px 0 9px;
									position: relative;
									display: -webkit-box;
									display: -webkit-flex;
									display: -ms-flexbox;
									display: flex;
									-webkit-align-items: center;
									-webkit-box-align: center;
									-ms-flex-align: center;
									align-items: center;
									font-size: 16px;
									vertical-align: top;
									line-height: normal;
									color: #ddd;
								}
							</style>
							<label class="css-1vf8o8s e1dcessg3" disabled>
								<style data-emotion="css agvwxo">
									.css-agvwxo {
										overflow: hidden;
										position: absolute;
										clip: rect(0 0 0 0);
										-webkit-clip-path: inset(50%);
										clip-path: inset(50%);
										width: 1px;
										height: 1px;
									}
								</style>
								<input type="checkbox" disabled class="css-agvwxo e1dcessg2"/>
									<style data-emotion="css 79hxr7">
										.css-79hxr7 {
											margin-right: 12px;
										}
										
										.css-79hxr7 svg {
											vertical-align: middle;
										}
									</style>
								<div class="css-79hxr7 e1dcessg1">
									<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z" stroke="#ddd" fill="#f2f2f2"></path>
										<path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
									</svg>
								</div>
								<span>전체선택 (0/0)</span>
							</label>
							<style data-emotion="css 454d5e">
								.css-454d5e {
									display: inline-block;
									width: 1px;
									height: 14px;
									background: #ddd;
									margin: 6px 21px 0 22px;
									vertical-align: top;
								}
							</style>
							<span class="css-454d5e e149z641"></span>
							<button disabled class="css-0 e149z640">선택삭제</button>
						</div>
					</div>
					<div id="cart_container" class="ej77nku0 flex flex-col border-t-2 border-t-black ${not empty carts ? "justify-start" : "justify-center py-32"} items-center border-b">
						<style data-emotion="css l1lu2l">
							.css-l1lu2l {
								font-size: 16px;
								line-height: 24px;
								text-align: center;
								color: #b5b5b5;
							}
						</style>
						<c:if test="${empty carts}">
							<p class="css-l1lu2l eqymnpn0">장바구니에 담긴 상품이 없습니다</p>
						</c:if>
						<c:if test="${not empty carts}">
							<ul id="cart_list" class="w-full flex flex-col divide-y">
								<c:forEach var="cart" items="${carts}">
									<li id="cart_item_${cart.cartId()}" class="cart-item">
										<section class="grid grid-cols-10 py-4 items-center">
											<div class="col-span-1 flex justify-center items-center">
												<label class="">
													<input type="checkbox" class="peer sr-only">
													<div class="relative w-4 h-4 bg-white border-2 border-[#92a8d1] rounded-lg ring-[#92a8d1] ring-offset-2 peer-focus:ring-2 peer-checked:!bg-[#92a8d1]">
														<svg class="scale-[0.8] -translate-x-[0.0625rem]" stroke="#000000" fill="#ffffff" stroke-width="0" viewBox="0 0 512 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M173.898 439.404l-166.4-166.4c-9.997-9.997-9.997-26.206 0-36.204l36.203-36.204c9.997-9.998 26.207-9.998 36.204 0L192 312.69 432.095 72.596c9.997-9.997 26.207-9.997 36.204 0l36.203 36.204c9.997 9.997 9.997 26.206 0 36.204l-294.4 294.401c-9.998 9.997-26.207 9.997-36.204-.001z"></path></svg>
													</div>
												</label>
											</div>
											<div class="col-span-6 flex justify-start items-center gap-4">
												<img
													src="${cart.imagePath()}"
													alt="${cart.productName()} 이미지"
													class="w-32 h-32 border rounded-lg"
												>
												${cart.productName()}
											</div>
											<div
												class="amount-box col-span-2 flex justify-center items-center border-2 border-black rounded-md h-8 w-24"
											>
												<div class="grid grid-cols-3 items-center gap-2">
													<button
													  class="px-2 font-bold duration-150 active:scale-95"
													  onclick="decreaseAmount(${cart.cartId()})"
													>-</button>
													<span
														class="amount-value flex justify-center items-center"
													>${cart.amount()}</span>
													<button
													  class="px-2 font-bold duration-150 active:scale-95"
													  onclick="increaseAmount(${cart.cartId()})"
													>+</button>
												</div>
											</div>
											<%-- <div class="col-span-1 flex justify-center items-center">${cart.priceLocale()}원</div> --%>
											<div class="col-span-1 flex justify-center items-center">
												<fmt:setLocale value="ko_kr"/>
												<fmt:formatNumber value="${cart.price()}" type="number" pattern="###,###원" />
											</div>
          					</section>
									</li>
          			</c:forEach>
							</ul>
						</c:if>
					</div>
					<div class="css-20o6z0 e149z643">
						<div class="css-zbxehx e149z642">
							<label class="css-1vf8o8s e1dcessg3" disabled>
								<input type="checkbox" disabled class="css-agvwxo e1dcessg2"/>
									<div class="css-79hxr7 e1dcessg1">
										<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z" stroke="#ddd" fill="#f2f2f2"></path>
											<path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
										</svg>
									</div>
									<span>전체선택 (0/0)</span>
							</label>
							<span class="css-454d5e e149z641"></span>
							<button disabled class="css-0 e149z640">선택삭제</button>
						</div>
					</div>
				</div>
					<style data-emotion="css 1dta0ch">
						.css-1dta0ch {
							position: relative;
							width: 284px;
							min-height: 942px;
						}
					</style>
				<div class="css-1dta0ch er0tf671">
					<style data-emotion="css 50ad8x">
						.css-50ad8x {
							position: absolute;
							width: 284px;
							padding-top: 60px;
						}
					</style>
					<div class="css-50ad8x er0tf670">
						<style data-emotion="css 1t6so8j">
							.css-1t6so8j {
								padding: 19px 18px 18px 20px;
								border: 1px solid #f2f2f2;
								background-color: #fafafa;
							}
						</style>
						<div class="css-1t6so8j em21elb0">
							<style data-emotion="css 1dacand">
								.css-1dacand {
									padding-top: 0;
								}
							</style>
							<style data-emotion="css 8jmoub">
								.css-8jmoub {
									display: -webkit-box;
									display: -webkit-flex;
									display: -ms-flexbox;
									display: flex;
									-webkit-box-pack: justify;
									-webkit-justify-content: space-between;
									justify-content: space-between;
									padding-top: 10px;
									padding-top: 0;
								}
							</style>
							<div class="css-8jmoub ea1mry77">
								<style data-emotion="css vmo0an">
									.css-vmo0an {
										width: 100px;
										font-size: 16px;
										line-height: 24px;
										white-space: nowrap;
									}
								</style>
								<span class="css-vmo0an ea1mry76">상품금액</span>
								<style data-emotion="css iinokh">
									.css-iinokh {
										font-size: 18px;
										line-height: 24px;
										text-align: right;
									}
								</style>
								<span class="css-iinokh ea1mry74">
									<span id="total_price">
										<fmt:setLocale value="ko_kr"/>
										<fmt:formatNumber value="${priceSummary.totalPrice()}" type="number" pattern="###,###" />
									</span>
									<style data-emotion="css hfgifi">
										.css-hfgifi {
											padding-left: 2px;
											font-size: 16px;
											font-weight: normal;
											vertical-align: bottom;
										}
									</style>
									<span class="css-hfgifi ea1mry72">원</span>
								</span>
							</div>
								<style data-emotion="css b8kzem">
									.css-b8kzem {
										padding-top: 12px;
									}
								</style>
								<style data-emotion="css t4mc5m">
									.css-t4mc5m {
										display: -webkit-box;
										display: -webkit-flex;
										display: -ms-flexbox;
										display: flex;
										-webkit-box-pack: justify;
										-webkit-justify-content: space-between;
										justify-content: space-between;
										padding-top: 10px;
										padding-top: 12px;
									}
								</style>
									<div class="css-t4mc5m ea1mry77">
										<span class="css-vmo0an ea1mry76">상품할인금액</span>
										<span id="discount_price" class="css-iinokh ea1mry74">
											<fmt:setLocale value="ko_kr"/>
											<fmt:formatNumber value="${priceSummary.discountPrice()}" type="number" pattern="- ###,###" />
											<span class="css-hfgifi ea1mry72">원</span>
										</span>
									</div>
									<div class="css-t4mc5m ea1mry77">
										<span class="css-vmo0an ea1mry76">배송비</span>
										<span class="css-iinokh ea1mry74">
											<fmt:setLocale value="ko_kr"/>
											<fmt:formatNumber value="0" type="number" pattern="+ ###,###" />
											<span class="css-hfgifi ea1mry72">원</span>
										</span>
									</div>
										<style data-emotion="css 7ygxxm">
											.css-7ygxxm {
												display: -webkit-box;
												display: -webkit-flex;
												display: -ms-flexbox;
												display: flex;
												-webkit-box-pack: justify;
												-webkit-justify-content: space-between;
												justify-content: space-between;
												margin-top: 16px;
												padding-top: 18px;
												border-top: 1px solid #f4f4f4;
											}
										</style>
									<div class="css-7ygxxm eepcpbj4">
										<span class="css-vmo0an eepcpbj3">결제예정금액</span>
										<style data-emotion="css da7gr8">
											.css-da7gr8 {
												width: 162px;
												font-size: 18px;
												line-height: 24px;
												text-align: right;
											}
										</style>
										<span class="css-da7gr8 eepcpbj2">
											<style data-emotion="css xmbce4">
												.css-xmbce4 {
													font-size: 20px;
													font-weight: 700;
													line-height: 28px;
												}
											</style>
											<strong id="payment_price" class="css-xmbce4 eepcpbj0">
												<fmt:setLocale value="ko_kr"/>
												<fmt:formatNumber value="${priceSummary.paymentPrice()}" type="number" pattern="###,###" />
											</strong>
											<style data-emotion="css aro4zf">
												.css-aro4zf {
													padding-left: 4px;
													font-size: 16px;
													vertical-align: 1px;
												}
											</style>
											<span class="css-aro4zf eepcpbj1">원</span>
										</span>
									</div>
						</div>
						<style data-emotion="css 8qz8ia">
							.css-8qz8ia {
								padding-top: 20px;
							}
						</style>
						<div class="css-8qz8ia e1mybczi1">
							<style data-emotion="css 10rvbm3">
								.css-10rvbm3 {
									font-weight: 500;
								}
							</style>
							<style data-emotion="css 1hekulg">
								.css-1hekulg {
									display: block;
									padding: 0 10px;
									text-align: center;
									overflow: hidden;
									width: 100%;
									height: 56px;
									border-radius: 3px;
									color: #fff;
									background-color: #5f0080;
									border: 0 none;
									background: #ddd;
									cursor: not-allowed;
									font-weight: 500;
								}
							
								.css-1hekulg:disabled {
									background-color: #ddd;
								}
							
								.css-1hekulg >div {
									display: inline-block;
									position: relative;
								}
							
								.css-1hekulg >div >div:first-of-type {
									max-width: 100px;
									max-height: 100px;
									width: 70%;
									height: 70%;
								}
							</style>
							<button type="button" class="css-1hekulg e4nu7ef2" height="56">
								<style data-emotion="css 1h3g2ha">
									.css-1h3g2ha {
										position: fixed;
										top: 0;
										left: 0;
										width: 100%;
										height: 100%;
										z-index: 999;
									}
								</style>
								<div class="css-1h3g2ha euwlw0z1">
									<style data-emotion="css 17j3ye5">
										.css-17j3ye5 {
											overflow: hidden;
											position: absolute;
											top: 50%;
											left: 50%;
											width: 134px;
											height: 134px;
											-webkit-transform: translate(-50%, -50%);
											-moz-transform: translate(-50%, -50%);
											-ms-transform: translate(-50%, -50%);
											transform: translate(-50%, -50%);
										}
									</style>
									<div class="css-17j3ye5 euwlw0z0">
										<span>
											<div style="width:100%;height:100%">
												주문하기
											</div>
										</span>
									</div>
								</div>
							</button>
							<style data-emotion="css 19kxq7d">
								.css-19kxq7d {
									padding: 16px 0;
								}
							
								.css-19kxq7d li {
									padding-top: 4px;
									color: #666;
								}
							</style>
							<ul class="css-19kxq7d">
								<style data-emotion="css 1741abm">
									.css-1741abm {
										position: relative;
										padding-top: 4px;
										font-size: 12px;
										line-height: 16px;
										padding-left: 7px;
										color: #999;
										text-align: left;
									}
									
									.css-1741abm:before {
										overflow: hidden;
										position: absolute;
										width: 1px;
										height: 1px;
										margin: 6px 0px 0 -6px;
										background: #999;
										vertical-align: top;
										border-radius: 50%;
										content: '';
									}
								</style>
									<li class="css-1741abm ejr204i0">[주문완료] 상태일 경우에만 주문 취소 가능합니다.</li>
									<li class="css-1741abm ejr204i0">[마이셀리 &gt;주문내역 상세페이지] 에서 직접 취소하실 수 있습니다.</li>
							</ul>
							<button class="border rounded px-4 py-2" onclick="tempLogin()">임시 로그인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
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
					url: "cart/amount/increase.do",
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
		</script>
	</body>
</html>