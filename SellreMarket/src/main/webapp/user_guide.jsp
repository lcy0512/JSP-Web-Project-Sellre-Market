<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용안내 - 셀리</title>
<link rel="shortcut icon" href="http://localhost:8080/sellreMarket/image/logo.png" />
<link rel="icon" href="http://localhost:8080/sellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="16x16" href="http://localhost:8080/sellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="32x32" href="http://localhost:8080/sellreMarket/image/logo.png" />
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="css/user_guide.css" />
</head>
<body>

	<div class="tContainer">
		<div class="mainTitle">이용안내</div>
	</div>

	<div class="mn1n">
		<div class="wrap">
			<div class="section">
				<div>
					<div class="itemWrapper">
						<span class="subTitle">회원 / 혜택</span> <img
							src="data:image/png;base64,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"
							alt="회원 아이콘 이미지" class="icon">
					</div>
					<div class="content">
						<div class="paragraph">
							컬리에 회원가입을 하시면<br> 가입 즉시 게시판 이용 및 각종 할인 쿠폰과<br> 적립금, 이벤트
							혜택을 받으실 수 있습니다.<br> 쿠폰과 적립금은 로그인 하신 후<br> 마이페이지에서 확인하실
							수 있습니다.
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="wrap">
			<div class="section">
				<div>
					<div class="itemWrapper">
						<span class="subTitle">주문 / 결제</span> <img
							src="data:image/png;base64,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"
							alt="장바구니 아이콘 이미지" class="icon">
					</div>
					<div class="content">
						<div class="paragraph">
							상품 주문은<br>장바구니에 상품 담기 > 회원 혹은 비회원 주문 > <br> 주문서 작성 > 결제
							방법 선택 및 결제 > <br> 주문 완료 로 이루어집니다.
						</div>
					</div>
					<p class="description">비회원 주문인 경우 주문번호를 메모해 두시기 바랍니다.</p>
				</div>
			</div>
		</div>

		<div class="wrap">
			<div class="section">
				<div>
					<div class="itemWrapper">
						<span class="subTitle">배송</span> <img
							src="data:image/png;base64,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"
							alt="배송 차량 아이콘 이미지" class="icon">
					</div>
					<div class="content">
						<div class="paragraph">
							컬리는 싱싱한 유기농 상품을<br> 고객님의 식탁까지 빠르고 안전하게<br> 배달하기 위해 항상
							노력합니다.<br> 특히 샛별배송을 받으시는 경우,<br> 배송 요청사항란에 특수정보를 기입해주셔야<br>
							보다 안전한 배송이 가능합니다.
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="wrap">
			<div class="section">
				<div>
					<div class="itemWrapper">
						<span class="subTitle">취소 / 교환 / 환불</span> <img
							src="data:image/png;base64,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"
							alt="배송 박스 아이콘 이미지" class="icon">
					</div>
					<div class="content">
						<div class="paragraph">
							주문취소는 배송 단계별로 방법이 상이합니다.<br> - [주문완료] 상태일 경우에만 주문 취소 가능합니다.<br>
							- [마이컬리 &gt; 주문 내역 상세페이지]에서 직접<br>취소하실 수 있습니다.<br> 받으신
							상품의 이상이 있거나 궁금한 사항이<br> 있다면 언제든지 1:1문의 게시판 에 문의해주세요.
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<footer class="text-muted py-5">
		<jsp:include page="footer.html" flush="false" />
	</footer>
</body>
</html>