<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<!--
	1. Date : 2024.02.02
	2. Author : Woody Jo
	3. Version : v1.0.0
	4. Description : 메인 body 페이지 Dto 
-->
<head>
<meta charset="UTF-8">
<title>Sellre Market</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/style.css" rel="stylesheet">

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="mail/jqBootstrapValidation.min.js"></script>
<script src="mail/contact.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iK7t1TIq0IYzcqL/tnuU6J1bYWFIVXutUPnN0PBKpZQUMuXAfmgt5L9a1"
	crossorigin="anonymous">

<!-- Bootstrap JavaScript (requires Popper.js) -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofNol/wwZQqjW9M4aPskD5S/R1HD87Hjr"
	crossorigin="anonymous"></script>

<script>
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
	</script>
</head>
<body>
	<!-- Topbar Start -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Topbar End -->


	<!-- Navbar Start -->

	<!-- Navbar End -->


	<!-- Carousel Start -->
	<div class="container" style="width: 100%">
		<div id="imgslider" class="carousel slide" data-ride="carousel"
			style="width: 100%;">
			<!-- indicator 없음 -->

			<!-- 슬라이드 쇼 실행 -->
			<div class="carousel-inner">
				<c:forEach items="${eventImgs}" var="event">
					<!-- 첫번째 이미지일 때 active 설정 -->
					<c:choose>
						<c:when test="${event.eimg eq '1.jpg'}">
							<div class="carousel-item active">
								<img class="d-block w-100"
									src="${pageContext.request.contextPath}/image/event/${event.eimg}"
									alt="Event Image">
								<!-- 캡션 없음 -->
							</div>
						</c:when>
						<c:otherwise>
							<div class="carousel-item">
								<img
									src="${pageContext.request.contextPath}/image/event/${event.eimg}"
									class="d-block w-100" alt="Event Image">
								<!-- 캡션 없음 -->
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>


			<!-- 컨트롤 -->
			<a href="#imgslider" class="carousel-control-prev" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a href="#imgslider" class="carousel-control-next" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>
	</div>
	<br>
	<!-- Carousel End -->

	<h2 align="center">설 선물특가 실시간 랭킹🔥🔥</h2>
	<p class="css-149yh9z ej3ms6t1" align="center">지금 주목해야할 인기 상품 최대
		79% 할인</p>


	<!-- Products Start -->
	<div class="container-fluid pt-5 pb-3">
		<div class="row px-xl-5 justify-content-center"
			style="margin-left: 386px; margin-right: 306px;">
			<c:if test="${not empty productList}">
				<c:forEach items="${productList}" var="dto">
					<div class="col-lg-4 col-md-4 col-sm-6 pb-10 mx-auto">
						<div class="product-item bg-light mb-4"
							style="width: 300px; height: 350px; display: flex; flex-direction: column; justify-content: center;">
							<div class="product-img position-relative overflow-hidden">
								<a href="#"> <img class="img-fluid w-100"
									src="${pageContext.request.contextPath}/image/product/${dto.ysrc}"
									alt="Product Image">
								</a>
							</div>
							<div
								style="margin-top: 7px; margin-left: 1%; border: 1px solid lightgray; border-radius: 5px; width: 98%;">
								<button
									onclick="sendProductInfo(${dto.recipeid}, ${dto.productid}); return false;"
									class="btn btn-primary btn-light align-items-center"
									style="width: 100%;">장바구니</button>
							</div>
							
							<div class="text-center py-4"
								style="display: flex; flex-direction: column; justify-content: center;">
								<a class="h6 text-decoration-none text-truncate" href="">[${dto.yname}]</a>
									<a class="ytitle" href="">${dto.ytitle}</a>

								<div class="d-flex align-items-center justify-content-center mt-2">
									<h5>${dto.price}</h5>
									<h6>원</h6>
									<h6 class="text-muted ml-2">
										<del>$123.00</del>
									</h6>
								</div>
								<div
									class="d-flex align-items-center justify-content-center mb-1">
									<img
										src="https://cdn-icons-png.flaticon.com/128/535/535234.png"
										style="width: 12px; height: 12px;">&nbsp; <small>${dto.like}</small>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<!-- Products End -->

	<!-- Paging Start -->
	<%
		int i = 1;
		int current = (int) request.getAttribute("curPage");
	%>
	<!-- 블록과 페이지 가져오기 -->
	<div
		style="display: flex; justify-content: center; font-size: 20px; gap: 0 10px;">
		<a href="mainPage.do?curPage=<%= current - 1 %>" class="prev"
			onclick="prev()"> << </a>

		<c:forEach begin="${blockStart}" end="${endPage}">
			<%
				out.print("<a href='mainPage.do?curPage=" + i + "'>" + i + "</a>");
				request.setAttribute("curPage", i);
				i++;
			%>
		</c:forEach>
		<a href="mainPage.do?curPage=<%= current + 1 %>" class="next"> >>
		</a>
	</div>
	<!-- Paging End -->

	<!-- Footer Start -->
	<jsp:include page="footer.html"></jsp:include>
	<!-- Footer End -->


	<!-- Back to Top -->
	<a href="#" class="btn btn-primary back-to-top"><i
		class="fa fa-angle-double-up"></i></a>
</body>
</html>