<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    
    <!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iK7t1TIq0IYzcqL/tnuU6J1bYWFIVXutUPnN0PBKpZQUMuXAfmgt5L9a1" crossorigin="anonymous">
	
	<!-- Bootstrap JavaScript (requires Popper.js) -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofNol/wwZQqjW9M4aPskD5S/R1HD87Hjr" crossorigin="anonymous"></script>
	
    <script>
		function popup() {
			/* 새로운 url 위치 */ 
			var url = "popup.do";
			/* 어떤 방식으로 띄울 것인가 */
			var name = "_blank";
			// option 스펙 설정
			var specs = 'width=500, height=420, top=150, left=400, location=yes, toolbar=yes, menubar=yes, scrollbars=no, resizable=no'
		   
			window.open(url, name, specs);
		}
	</script>	
</head>
<body>
	<!-- Topbar Start -->
    
    <!-- Topbar End -->


    <!-- Navbar Start -->
    
    <!-- Navbar End -->


    <!-- Carousel Start -->
    <div class="container" style="width:100%">
	    <div id="imgslider" class="carousel slide" data-ride="carousel" style="width:100%;">
	     <!-- indicator 없음 -->
	     
	     <!-- 슬라이드 쇼 실행 -->
		<div class="carousel-inner">
		    <c:forEach items="${eventImgs}" var="event">
		        <!-- 첫번째 이미지일 때 active 설정 -->
		        <c:choose>
		            <c:when test="${event.eimg eq '이벤트1.jpg'}">
		                <div class="carousel-item active">
		                    <img class="d-block w-100" src="${pageContext.request.contextPath}/image/event/${event.eimg}" alt="Event Image">
		                    <!-- 캡션 없음 -->
		                </div>
		            </c:when>
		            <c:otherwise>
		                <div class="carousel-item">
		                    <img src="${pageContext.request.contextPath}/image/event/${event.eimg}" class="d-block w-100" alt="Event Image">
		                    <!-- 캡션 없음 -->
		                </div>
		            </c:otherwise>
		        </c:choose>
		    </c:forEach>
		</div>

		  
		  <!-- 컨트롤 -->
		  <a href="#imgslider" class="carousel-control-prev" data-slide="prev">
		  	<span class="carousel-control-prev-icon"></span>
		  </a>
		  <a href="#imgslider" class="carousel-control-next" data-slide="next">
		  	<span class="carousel-control-next-icon"></span>
		  </a>
		</div>
	</div>
	<br>
    <!-- Carousel End -->
	
	<h2 align="center">설 선물특가 실시간 랭킹🔥🔥</h2>
	<p class="css-149yh9z ej3ms6t1" align="center">지금 주목해야할 인기 상품 최대 79% 할인</p>


    <!-- Products Start -->
    <div class="container-fluid pt-5 pb-3">
        <div class="row px-xl-5">
        	<c:if test="${not empty productList}">
	        	<c:forEach items="${productList}" var="dto">
		            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
		                <div class="product-item bg-light mb-4">
		                    <div class="product-img position-relative overflow-hidden">
		                        <a href="#">
		                        	<img class="img-fluid w-200" src="${pageContext.request.contextPath}/image/product/${dto.ysrc}" alt="">
		                        </a>
		                    </div>
		                    <div style="margin-top: 7px; margin-left:1%; border: 1px solid lightgray; border-radius: 5px; width:98%;">
		                    	<a href="popup.do" onclick="popup(); return false;" class="btn btn-primary btn-light align-items-center" style="width:100%;">장바구니</a>
	                    	</div>
		                    <div class="text-center py-4">
		                        <a class="h6 text-decoration-none text-truncate" href="">[${dto.yname}] ${dto.rcontent}</a>
		                        <input id="name" type="hidden" value="${dto.rcontent}">
		                        <div class="d-flex align-items-center justify-content-center mt-2">
		                            <h5>${dto.price}원</h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
		                        </div>
		                        <div class="d-flex align-items-center justify-content-center mb-1">
		                        	<img src="https://cdn-icons-png.flaticon.com/128/535/535234.png" style="width:12px; height:12px;">&nbsp;
                            		<small>${dto.like}</small>
		                        </div>
		                    </div>
		                </div>
		            </div>
	            </c:forEach>
            </c:if>
        </div>
    </div>
    <!-- Products End -->

    <!-- Vendor Start -->
<!--     <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel vendor-carousel">
                    <div class="bg-light p-4">
                        <img src="img/vendor-1.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="img/vendor-2.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="img/vendor-3.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="img/vendor-4.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="img/vendor-5.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="img/vendor-6.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="img/vendor-7.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="img/vendor-8.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
 -->    <!-- Vendor End -->


    <!-- Footer Start -->
   	<jsp:include page="/jsp/footer.jsp"></jsp:include>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>
</body>
</html>