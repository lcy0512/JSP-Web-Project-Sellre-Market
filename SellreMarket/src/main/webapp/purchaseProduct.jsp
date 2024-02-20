<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- header Start -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- header End -->
	
	<h2 align="center" style="padding-top: 60px; font-weight:bold; font-size:30px;">주문서</h2>
	
	<div class="css-1ykiyus e146m4rf2">
	<div class="css-1uom1od e146m4rf0">
	<h2 class="css-10owlr e146m4rf1">주문서</h2>
	<div class="css-ixlb9s epvroj94">
	<div class="css-zo1i6f edbbr7c2">
		<h3 class="css-1ddzp0m edbbr7c1">주문 상품</h3>
		<button data-testid="fold-button" class="css-lvqq7y e17cst860">
			<svg width="30" height="30" viewBox="0 0 30 30" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
				<defs><path id="7a02qqg3ja" d="M11 12h9v9"></path></defs>
				<g fill="none" fill-rule="evenodd">
					<path d="M0 0h30v30H0z"></path>
					<use stroke="#333" stroke-width="2" stroke-linecap="square" transform="rotate(-45 15.5 16.5)" href="#7a02qqg3ja"></use>
				</g>
			</svg>
		</button>
	</div>
	<div class="css-bd9p1l e17a7yib10">
		<img src="https://img-cf.kurly.com/cdn-cgi/image/width=120,height=156,fit=crop,quality=85/shop/data/goods/1654846801479l0.jpg" alt="Top 장바구니 목록" class="css-17jyui4 e17a7yib9">
			<span class="css-10nl60h e17a7yib8">
				<span class="css-9j7jhp e17a7yib7">
				장바구니 1번 제품 이
				</span>
			</span>
		<span class="css-1efb5i1 e17a7yib5">2개</span>
		<span class="css-1j31gob e17a7yib4">
			<span class="css-jnogx7 e17a7yib3">9,010원</span>
			<span class="css-9dxu4e e17a7yib2">10,600원</span>
		</span>
	</div>
	
	<div class="css-12aowi2 edbbr7c2">
	<h3 class="css-1ddzp0m edbbr7c1">주문자 정보</h3>
	</div>
	
	<div id="kurly-orderer-info" class="css-shoa2s e1vfdada3">
		<div class="css-yazyg9 e150alo82">
		<span class="css-ln1csn e150alo81">보내는 분</span>
		<div class="css-82a6rk e150alo80">
			<div class="css-t6o2y8 e1vfdada2">사용자 이름</div>
		</div>
		</div>
		
		<div class="css-yazyg9 e150alo82">
			<span class="css-ln1csn e150alo81">휴대폰</span>
			<div class="css-82a6rk e150alo80">
				<div class="css-t6o2y8 e1vfdada2">010-5967-1329</div>
			</div>
		</div>
		
		<div class="css-yazyg9 e150alo82">
			<span class="css-ln1csn e150alo81">이메일</span>
			<div class="css-82a6rk e150alo80">jsungj3@gmail.com
				<div class="css-1r0yqr6 e1vfdada1">
					<p class="css-i7dt79 e1vfdada0">이메일을 통해 주문처리과정을 보내드립니다.</p>
					<p class="css-i7dt79 e1vfdada0">정보 변경은 마이컬리 &gt; 개인정보 수정 메뉴에서 가능합니다.</p>
				</div>
			</div>
		</div>
	</div>
	
	<div id="shipping-container">
		<div class="css-12aowi2 edbbr7c2">
			<h3 class="css-1ddzp0m edbbr7c1">배송 정보</h3>
			<div class="css-bjn8wh er4y7r83">
				<a class="css-orhu8r er4y7r82">배송지 변경 안내
					<span class="css-gwort8 er4y7r81"></span>
				</a>
				<div width="188" height="60" class="css-1k2fiq3 ev65imb2">
					<div class="css-82a6rk ev65imb1">
						<span class="css-2s3epn er4y7r80">장바구니, 홈에서</span>
						<span class="css-4zleql er4y7r80">배송지를 변경할 수 있어요</span>
					</div>
					<button class="css-157xhr7 ev65imb0">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
							<path d="M12.6154 12.8154L3 3" stroke="#fff" stroke-linecap="round"></path>
							<path d="M3 12.8154L12.6242 3" stroke="#fff" stroke-linecap="round"></path>
						</svg>
					</button>
				</div>
			</div>
		</div>
		<div class="css-5d6nlw e17yjk9v4">
			<div class="css-1gshg9u e150alo82">
			<span class="css-ln1csn e150alo81">배송지</span>
				<div class="css-82a6rk e150alo80">
					<span class="css-3uygi7 e17yjk9v3">기본배송지</span>
					<p class="css-36j4vu e17yjk9v2">강원 양양군 현남면 동산큰길 44-39 (뉴그린회집) 파머스키친</p>
					<div class="css-iqoq9n e17yjk9v0">
						<button class="css-1xky6jf e4nu7ef3" type="button" width="60" height="30" radius="3">
							<span class="css-nytqmg e4nu7ef1">변경</span>
						</button>
					</div>
				</div>
			</div>
		</div>
		<div id="checkout-shipping-details" class="css-1y0xj4c e1pxan881">
			<div class="css-kc45zq e150alo82">
				<span class="css-ln1csn e150alo81">배송 요청사항</span>
				<div class="css-82a6rk e150alo80">
					<div>
						<span class="css-11y0tcn efthce41"></span>
					</div>
					<div class="css-rqc9f e14u1xpe0">조성진, 010-5967-1329</div>
					<div class="css-iqoq9n e1pxan880">
						<button class="css-117jo2j e4nu7ef3" type="button" width="60" height="30" radius="3">
							<span class="css-nytqmg e4nu7ef1">수정</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
  <div class="css-12aowi2 edbbr7c2">
  	<h3 class="css-1ddzp0m edbbr7c1">결제 수단</h3>
  </div>
  
  <div class="css-1gshg9u e150alo82">
	  <span class="css-ln1csn e150alo81">결제수단 선택</span>
	  <div class="css-82a6rk e150alo80">
		  <div class="css-gd125q e4nb37r1">
			  <div>
				  <div class="css-18dvwsu ef0cmoa0">
					  <button type="button" class="css-1wlyg0y ehlmjxl0" data-testid="kakao-pay-button" color="#f6e500">
					  	<span class="css-1oanxtx e106vb1p0">혜택</span>
						  <img class="css-1wbfblw e1ewacwr0" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNTAiIGhlaWdodD0iMjAiIH
						  htbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgICA8ZyBmaWxsPSIjMDAwIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgI
						  CAgIDxwYXRoIGQ9Ik03LjUxNSAyLjhDMy4zNjUgMi44IDAgNS40NDUgMCA4LjcwN2MwIDEuOTM4IDEuMTg3IDMuNjU3IDMuMDIxIDQuNzM0
						  LS4xOTEuNzY4LS42ODQgMi43NDItLjc1IDIuOTU3LS4wODMuMjY2LS4xMDMgMS4wNDYuNzAyLjUxMi42MzQtLjQyIDIuNDc5LTEuNyAzLjU
						  3LTIuMzQ4LjMxOC4wMzMuNjQyLjA1MS45NzIuMDUxIDQuMTUgMCA3LjUxNS0yLjY0NCA3LjUxNS01LjkwNiAwLTMuMjYyLTMuMzY1LTUuO
						  TA3LTcuNTE1LTUuOTA3TTIxLjA0OCA0LjExM2MxLjUxNy0xLjMxMyAzLjQ2OC0xLjUwOCA0Ljg5My0uNTg1IDEuNzA3IDEuMTA2IDIuMTY4
						  IDIuNzU0IDIuMTY4IDQuODkyIDAgMi40LTEuMTE1IDMuOTY4LTEuNjQyIDQuNDYtLjUyNi40OTMtMS42NzMgMS4yOTItMi44OCAxLjI5Mkgy
						  MS40MnYzLjc4NGgtMi45MTFWMy4yODJoMi4xMDZzLjI2LjU0OC40MzMuODN6bTEuOTUxIDEuMTUzYy0uNjk3IDAtMS4xNTMuMTc3LTEuNTMz
						  LjQ3N3Y2LjMwNmgxLjEzOGMuNTU4IDAgMi41NDctLjUwNyAyLjU0Ny0zLjM4MyAwLS42NzctLjA5LTEuMzg1LS4yNzgtMS45LS4zNTctLjk
						  3Ny0xLjI0Ny0xLjUtMS44NzQtMS41ek0zMy44MTcgMy4wNDZjMi4wODUgMCAyLjk0Mi43MTggMy40NDggMS4zNTQuNDgxLjYwNC44NjI
						  gMS40OTcuODYyIDIuOHY2LjY4aC0yLjI2di0uOTU0cy0uNDQyLjQyLTEuMzc5LjgzMWMtLjk4LjQzLTIuNjUzLjg3Ny00LjA0MS0uMT
						  g0LTEuMzk3LTEuMDY4LTEuMi0zLjQ3MS0uODUyLTQuMTU0LjQ4LS45MzggMS4zNjMtMS45NjggMy43MTYtMS45NjhoMi4wMjl2LS45M
						  DhjMC0uNTU0LS41ODMtMS4xMDctMS43My0xLjEwNy0xLjI4IDAtMS44MzMuMTkyLTIuODE3LjYzNWwtLjk5Ni0xLjk0M3MxLjQ5Ni0x
						  LjA4MiA0LjAyLTEuMDgyem0xLjQ3NyA2LjI1aC0xLjQxNWMtLjU5OSAwLTEuOTYxLjIxNi0xLjk2MSAxLjQ3NyAwIDEuMjgzIDEuMDk
						  gMS4yNiAxLjQ0OCAxLjIzIDEuMDg5LS4wOTEgMS45MzgtLjc5NCAxLjkzOC0uNzk0bC0uMDEtMS45MTN6TTQ3LjA2MSAzLjA0NmwtMi
						  4yOTEgOC4xMTEtMi41NC04LjExLTIuODQ5LjgyczMuNSA5LjM4MyAzLjYyNCA5Ljc4M2MuMTIzLjQtLjAwNS44NTgtLjI4IDEuMzIyL
						  S4zNzEuNjMtMS44MjYgMi4wMy0xLjgyNiAyLjAzbDEuODc4IDEuNjYzcy44NTctLjY4OCAxLjc0NS0xLjc1NWMuNzQzLS44OTIgMS42M
						  zYtMi44MyAxLjkzOC0zLjU3Ny44NTktMi4xMTkgMy40Mi05LjQ2NiAzLjQyLTkuNDY2bC0yLjgxOS0uODJ6Ii8+CiAgICA8L2c+Cjwv
						  c3ZnPgo=" alt="카카오페이">
					  </button>
				  </div>
				 <div class="css-18dvwsu ef0cmoa0">
					 <button type="button" class="css-1wlyg0y ehlmjxl0" data-testid="creditcard-button">신용카드</button>
					 <button type="button" class="css-1pvbmgb ehlmjxl0" data-testid="simplepay-button">
					 	<span class="css-1oanxtx e106vb1p0">혜택</span>간편 결제
					 </button>
					 <button type="button" class="css-1wlyg0y ehlmjxl0" data-testid="phonebill">휴대폰</button>
				 </div>
			 </div>
			 <div class="css-nemdq9 evz7bw03">
				 <div class="css-nznuh9 evz7bw02">
					 <label class="css-11zj85u et8nqc33" for="naver-pay">
					 <input data-testid="radio-naver-pay" id="naver-pay" name="naver-pay" type="radio" class="css-1pes2r6 et8nqc32" value="naver-pay">
					 <span class="css-198i9ca e2sqze61">
					 	<div class="css-1dahn5m e2sqze60"></div>
					 </span>
					 <span aria-labelledby="naver-pay" class="css-mgd87h et8nqc31">
					 	<span class="css-s5xdrg evz7bw00">네이버페이 </span>
					 </span>
					 </label>
				 </div>
				 <div class="css-nznuh9 evz7bw02">
					 <label class="css-11zj85u et8nqc33" for="toss">
						 <input data-testid="radio-toss" id="toss" name="toss" type="radio" class="css-1pes2r6 et8nqc32" value="toss" checked="">
						 <span class="css-5xw1m2 e2sqze61"><div class="css-1vic0rk e2sqze60"></div></span>
						 <span aria-labelledby="toss" class="css-mgd87h et8nqc31">
							 <span class="css-s5xdrg evz7bw00">토스 
							 	<span class="css-1ox35cj evz7bw01">혜택</span>
							 </span>
						 </span>
					 </label>
				 </div>
				 <div class="css-nznuh9 evz7bw02">
					 <label class="css-11zj85u et8nqc33" for="payco">
						 <input data-testid="radio-payco" id="payco" name="payco" type="radio" class="css-1pes2r6 et8nqc32" value="payco">
						 <span class="css-198i9ca e2sqze61">
						 	<div class="css-1dahn5m e2sqze60"></div>
						 </span>
						 <span aria-labelledby="payco" class="css-mgd87h et8nqc31">
						 <span class="css-s5xdrg evz7bw00">페이코 
						 	<span class="css-1ox35cj evz7bw01">혜택</span>
						 </span>
						 </span>
					 </label>
				 </div>
			 </div>
			 <div class="css-p04ye2 eqgsbpy1">
				 <div class="css-1uv50i eqgsbpy0">
				 <span>혜택안내</span>
				 <button class="css-1lecd96 ekuwusm0">무이자 혜택 안내 
					 <svg width="12" height="12" viewBox="0 0 14 14" version="1.1" xmlns="http://www.w3.org/2000/svg">
					 <title>Shape</title>
						 <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
							 <g id="commonIcon_info" fill="#999" fill-rule="nonzero">
								 <path d="M6.3,3.5 L7.7,3.5 L7.7,4.9 L6.3,4.9 L6.3,3.5 Z M6.3,6.3 L7.7,6.3 L7.7,10.5 L6.3,10.5 L6.3,6.3 Z
								  M0,7 C0,10.864 3.129,14 6.993,14 C10.864,14 14,10.864 14,7 C14,3.136 10.864,0 6.993,0 C3.129,0 0,3.136 
								  0,7 Z M1.4,7 C1.4,3.906 3.906,1.4 7,1.4 C10.094,1.4 12.6,3.906 12.6,7 C12.6,10.094 10.094,12.6 7,12.6 
								  C3.906,12.6 1.4,10.094 1.4,7 Z" id="Shape">
								  </path>
							  </g>
						  </g>
					  </svg>
				  </button>
				  </div>
				  <div class="css-1eyoyxr e1dfkh4o6">
					  <div class="css-109w7xc e1dfkh4o3">
						  <p class="css-1rlhglk e1dfkh4o2">토스</p>
						  <p class="css-5jw6s3 e1dfkh4o1">토스페이 6만원 이상 결제 시 2천원 즉시할인</p>
						  <p class="css-95xna2 e1dfkh4o0">토스머니 &amp; 후불결제 6만원 이상 결제 시 2천원 즉시할인</p>
						  <p class="css-95xna2 e1dfkh4o0">기간중, 인당 1회 사용가능</p>
						  <p class="css-95xna2 e1dfkh4o0">2/15 11시 ~ 2/26 11시</p>
					  </div>
					  <div class="css-109w7xc e1dfkh4o3">
						  <p class="css-1rlhglk e1dfkh4o2">컬리페이</p>
						  <p class="css-5jw6s3 e1dfkh4o1">컬리카드 &amp; 컬리페이 결제 혜택</p>
						  <p class="css-95xna2 e1dfkh4o0">1. 컬리카드 첫 결제 3만원 즉시 할인 + 2만원 쿠폰팩 + 8만원 적립금 제공</p>
						  <p class="css-95xna2 e1dfkh4o0">24/02/01~ 02/29</p>
						  <p class="css-95xna2 e1dfkh4o0">2. 컬리페이 X 현대카드 5만원 이상 결제 시, 최대 2천원 M포인트 차감 할인 ...</p>
					  </div>
					  <button class="css-755sul e1dfkh4o5">
					  <span class="css-1b9oelf e1dfkh4o4">혜택 더보기</span>
					  <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
						  <path d="M13 7L9 11L5 7" stroke="#333" stroke-width="1.2">
						  </path>
					  </svg>
					  </button>
				  </div>
			  </div>
		  </div>
	  </div>
  </div>
  <ul class="css-wx42bm e4nb37r0">
	  <li>※ 카카오페이, 토스, 네이버페이, 페이코 결제 시, 결제하신 수단으로만 환불되는 점 양해부탁드립니다.</li>
	  <li>※ 고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 토스 페이먼츠의 구매안전(에스크로) 서비스를 이용하실 수 있습니다.</li>
  </ul>
  
  <div class="css-12aowi2 edbbr7c2">
  	<h3 class="css-1ddzp0m edbbr7c1">개인정보 수집/제공</h3>
  </div>
  
  <div class="css-37px7p eh5sxvr5">
	  <div class="css-vtybye eh5sxvr2">
		  <span class="css-0 eh5sxvr1">개인정보 수집∙이용 및 처리 동의</span>
		  <button class="css-1q6jmiw eh5sxvr0">보기</button>
	  </div>
	  <div class="css-vtybye eh5sxvr2">
		  <span class="css-0 eh5sxvr1">전자지급 결제대행 서비스 이용약관 동의</span>
		  <button class="css-1q6jmiw eh5sxvr0">보기</button>
	  </div>
  	<strong class="css-87vide eh5sxvr4">위 내용을 확인 하였으며 결제에 동의합니다.</strong>
  </div>
  <p class="css-1tak4sl eh5sxvr3">주문완료 상태일 경우에만 주문 취소가 가능하며, 상품 미배송 시 결제하신 수단으로 환불됩니다.</p>
  <p class="css-1tak4sl eh5sxvr3">컬리 내 개별 판매자가 등록한 오픈마켓 상품의 경우 컬리는 통신판매중개자로서 주문, 품질, 교환/환불 등 의무와 책임을 부담하지 않습니다.</p>
  <div class="css-1azakc el0c5j40">
	  <button class="css-1lha8en e4nu7ef3" type="button" width="240" height="56" radius="3">
	  	<span class="css-nytqmg e4nu7ef1">37,810원 결제하기</span>
	  </button>
  </div>
  </div>
  
  
  <div class="css-1rz7w0y epvroj91">
  <div class="css-9i9om4 epvroj90">
	  <div class="css-6hge48 edbbr7c2">
	  <h3 class="css-1ddzp0m edbbr7c1">결제 금액</h3>
	  </div>
  <div class="css-hdnk73 e12lli9y0">
	  <div class="css-1hvttuk eahaaoi12">
	  	  <div class="css-1rmc3ba eahaaoi11">주문금액</div>
		  <div>
			  <span class="css-2pg1ps eahaaoi10">
				  <span class="css-rfpchb eahaaoi3"></span>
				  34,810
			  </span>
			  <span class="css-158icaa eahaaoi8">원</span>
		  </div>
	  </div>
	  <div class="css-sk644d eahaaoi9">
		  <div class="css-zjik7 eahaaoi0">
			  <svg width="16" height="20" viewBox="0 0 16 20" fill="none" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" clip-rule="evenodd" d="M1 5H0V10V11H1H6V10H1V5Z" fill="#ddd"></path>
			  </svg>
			  <div class="css-1rmc3ba eahaaoi11">상품금액</div>
		  </div>
		  <div>
			  <span class="css-2pg1ps eahaaoi10">
				  <span class="css-rfpchb eahaaoi3"></span>
				  36,400
			  </span>
			  <span class="css-158icaa eahaaoi8">원</span>
		  </div>
	  </div>
  <div class="css-sk644d eahaaoi9"><div class="css-zjik7 eahaaoi0"><svg width="16" height="20" viewBox="0 0 16 20" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M1 5H0V10V11H1H6V10H1V5Z" fill="#ddd"></path></svg><div class="css-1rmc3ba eahaaoi11">상품할인금액</div></div><div><span class="css-2pg1ps eahaaoi10"><span class="css-rfpchb eahaaoi3">-</span>1,590</span><span class="css-158icaa eahaaoi8">원</span></div></div><div class="css-1bj5qaf eahaaoi12"><div class="css-1rmc3ba eahaaoi11">배송비</div><div><span class="css-2pg1ps eahaaoi10"><span class="css-rfpchb eahaaoi3">+</span>3,000</span><span class="css-158icaa eahaaoi8">원</span></div></div><div class="css-1bj5qaf eahaaoi12"><div class="css-1rmc3ba eahaaoi11">쿠폰할인</div><div class="css-0"><span class="css-2pg1ps eahaaoi10"><span class="css-rfpchb eahaaoi3"></span>0</span><span class="css-158icaa eahaaoi8">원</span></div></div><div class="css-1bj5qaf eahaaoi12"><div class="css-1rmc3ba eahaaoi11">카드즉시할인</div><div class="css-37wf0k"><span class="css-2pg1ps eahaaoi10"><span class="css-rfpchb eahaaoi3"></span>0</span><span class="css-158icaa eahaaoi8">원</span></div></div><div class="css-1hvttuk eahaaoi12"><div class="css-1rmc3ba eahaaoi11">적립금 ∙ 컬리캐시</div><div><span class="css-2pg1ps eahaaoi10"><span class="css-rfpchb eahaaoi3"></span>0</span><span class="css-158icaa eahaaoi8">원</span></div></div><div class="css-sk644d eahaaoi9"><div class="css-zjik7 eahaaoi0"><svg width="16" height="20" viewBox="0 0 16 20" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M1 5H0V10V11H1H6V10H1V5Z" fill="#ddd"></path></svg><div class="css-1rmc3ba eahaaoi11">적립금</div></div><div><span class="css-2pg1ps eahaaoi10"><span class="css-rfpchb eahaaoi3"></span>0</span><span class="css-158icaa eahaaoi8">원</span></div></div><div class="css-sk644d eahaaoi9"><div class="css-zjik7 eahaaoi0"><svg width="16" height="20" viewBox="0 0 16 20" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M1 5H0V10V11H1H6V10H1V5Z" fill="#ddd"></path></svg><div class="css-1rmc3ba eahaaoi11">컬리캐시</div></div><div><span class="css-2pg1ps eahaaoi10"><span class="css-rfpchb eahaaoi3"></span>0</span><span class="css-158icaa eahaaoi8">원</span></div></div><div class="css-1hgn7mh eahaaoi7"><div class="css-1rmc3ba eahaaoi11">최종결제금액</div><div><span class="css-2pg1ps eahaaoi10"><span class="css-rfpchb eahaaoi3"></span>37,810</span><span class="css-158icaa eahaaoi8">원</span></div></div><div class="css-1ujngs9 eahaaoi1">컬리카드 결제 시 최대 1,891원 추가 적립</div></div><button class="css-18yu7bm ehhfrwe0"><span style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: absolute; inset: 0px;"><img alt="PC 주문서 컬리멤버스 결제정보 하단" src="https://product-image.kurly.com/banner/da-banner/2feaa426-dfcc-4e71-bf73-62be98bbcd50.png" decoding="async" data-nimg="fill" class="css-0" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: medium; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;" sizes="100vw" srcset="https://product-image.kurly.com/banner/da-banner/2feaa426-dfcc-4e71-bf73-62be98bbcd50.png 640w, https://product-image.kurly.com/banner/da-banner/2feaa426-dfcc-4e71-bf73-62be98bbcd50.png 750w, https://product-image.kurly.com/banner/da-banner/2feaa426-dfcc-4e71-bf73-62be98bbcd50.png 828w, https://product-image.kurly.com/banner/da-banner/2feaa426-dfcc-4e71-bf73-62be98bbcd50.png 1080w, https://product-image.kurly.com/banner/da-banner/2feaa426-dfcc-4e71-bf73-62be98bbcd50.png 1200w, https://product-image.kurly.com/banner/da-banner/2feaa426-dfcc-4e71-bf73-62be98bbcd50.png 1920w, https://product-image.kurly.com/banner/da-banner/2feaa426-dfcc-4e71-bf73-62be98bbcd50.png 2048w, https://product-image.kurly.com/banner/da-banner/2feaa426-dfcc-4e71-bf73-62be98bbcd50.png 3840w"></span></button></div></div></div></div></div></div>
	
	<!-- footer Start -->
	<jsp:include page="footer.html"></jsp:include>
	<!-- footer End -->
	
	
	

</body>
</html>