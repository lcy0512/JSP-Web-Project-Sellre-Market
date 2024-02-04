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
    <div class="container-fluid">
        
        <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
            <div class="col-lg-4">
                <a href="" class="text-decoration-none">
                    <span class="h1 text-uppercase text-primary bg-dark px-2">Sellre</span>
                    <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">셀리마켓</span>
                </a>
            </div>
            <div class="col-lg-4 col-6 text-left">
                <form action="">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="검색어를 입력하세요.">
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="row bg-secondary py-1 px-xl-5">
	            <div class="col-lg-6 d-none d-lg-block">
	                <div class="d-inline-flex align-items-center h-100">
	                    <a class="text-body mr-3" href=""></a>
	                    <a class="text-body mr-3" href=""></a>
	                    <a class="text-body mr-3" href=""></a>
	                    <a class="text-body mr-3" href=""></a>
	                </div>
	            </div>
	            <div class="col-lg-6 text-center text-lg-right">
	                <div class="d-inline-flex align-items-center">
	                    <div class="btn-group">
	                        <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">회원가입</button>
	                        <div class="dropdown-menu dropdown-menu-right">
	                            <button class="dropdown-item" type="button">Sign in</button>
	                            <button class="dropdown-item" type="button">Sign up</button>
	                        </div>
	                    </div>
	                    <div class="btn-group mx-2">
	                        <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">로그인</button>
	                        <div class="dropdown-menu dropdown-menu-right">
	                            <button class="dropdown-item" type="button">EUR</button>
	                            <button class="dropdown-item" type="button">GBP</button>
	                            <button class="dropdown-item" type="button">CAD</button>
	                        </div>
	                    </div>
	                    <div class="btn-group">
	                        <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">고객센터</button>
	                        <div class="dropdown-menu dropdown-menu-right">
	                            <button class="dropdown-item" type="button">FR</button>
	                            <button class="dropdown-item" type="button">AR</button>
	                            <button class="dropdown-item" type="button">RU</button>
	                        </div>
	                    </div>
	                </div>
	                <div class="d-inline-flex align-items-center d-block d-lg-none">
	                    <a href="" class="btn px-0 ml-2">
	                        <i class="fas fa-heart text-dark"></i>
	                        <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
	                    </a>
	                    <a href="" class="btn px-0 ml-2">
	                        <i class="fas fa-shopping-cart text-dark"></i>
	                        <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
	                    </a>
	                </div>
	            </div>
	        </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid bg-dark mb-30">
        <div class="row px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                    <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>카테고리</h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                    <div class="navbar-nav w-100">
                        <div class="nav-item dropdown dropright">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">유튜버 <i class="fa fa-angle-right float-right mt-1"></i></a>
	                            <div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
	                                <a href="" class="dropdown-item">요리왕비룡</a>
	                                <a href="" class="dropdown-item">백종원</a>
	                                <a href="" class="dropdown-item">고기남자</a>
	                            </div>
                        </div>
                        <div class="nav-item dropdown dropright">
                        	<a href="" class="nav-item nav-link">채소</a>
	                        	<div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
		                                <a href="" class="dropdown-item">친환경</a>
		                                <a href="" class="dropdown-item">고구마·감자·당근</a>
		                                <a href="" class="dropdown-item">시금치·나물</a>
		                                <a href="" class="dropdown-item">양파·대파·마늘·배추</a>
		                                <a href="" class="dropdown-item">오이·호박·고추	</a>
		                                <a href="" class="dropdown-item">버섯·콩나물</a>
	                            </div>
                        </div>
                        <div class="nav-item dropdown dropright">
                        	<a href="" class="nav-item nav-link">과일	·견과	·쌀</a>
	                        	<div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
		                                <a href="" class="dropdown-item">친환경</a>
		                                <a href="" class="dropdown-item">제철과일</a>
		                                <a href="" class="dropdown-item">국산과일</a>
		                                <a href="" class="dropdown-item">수입과일</a>
		                                <a href="" class="dropdown-item">간편과일</a>
		                                <a href="" class="dropdown-item">냉동</a>
		                                <a href="" class="dropdown-item">견과류·쌀·잡곡</a>
		                                <a href="" class="dropdown-item">쌀·잡곡</a>
	                            </div>
                        </div>
                        <div class="nav-item dropdown dropright">
                        	<a href="" class="nav-item nav-link">수산·해산·건어물</a>
	                        	<div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
		                                <a href="" class="dropdown-item">제철수산</a>
		                                <a href="" class="dropdown-item">생선류</a>
		                                <a href="" class="dropdown-item">굴비·반건류</a>
		                                <a href="" class="dropdown-item">연어·참치</a>
		                                <a href="" class="dropdown-item">회·탕류</a>
		                                <a href="" class="dropdown-item">오징어·낙지·문어</a>
		                                <a href="" class="dropdown-item">해산물·전복·조개류</a>
		                                <a href="" class="dropdown-item">새우·게·랍스터</a>
		                                <a href="" class="dropdown-item">수산가공품</a>
		                                <a href="" class="dropdown-item">명란</a>
		                                <a href="" class="dropdown-item">젓갈·장류</a>
		                                <a href="" class="dropdown-item">간편구이</a>
		                                <a href="" class="dropdown-item">김·미역·해조류</a>
		                                <a href="" class="dropdown-item">멸치·황태·다시팩</a>
	                            </div>
                        </div>
                        <div class="nav-item dropdown dropright">
                        	<a href="" class="nav-item nav-link">정육·가공육·계란</a>
	                        	<div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
		                                <a href="" class="dropdown-item">국내산 소고기</a>
		                                <a href="" class="dropdown-item">수입산 소고기</a>
		                                <a href="" class="dropdown-item">국내산 돼지고기</a>
		                                <a href="" class="dropdown-item">수입산 돼지고기·양고기</a>
		                                <a href="" class="dropdown-item">닭·오리고기</a>
		                                <a href="" class="dropdown-item">식단관리용 가공육</a>
		                                <a href="" class="dropdown-item">양념육</a>
		                                <a href="" class="dropdown-item">돈까스·떡갈비·함박</a>
		                                <a href="" class="dropdown-item">소시지·베이컨·하몽</a>
		                                <a href="" class="dropdown-item">계란·가공란</a>
	                            </div>
                        </div>
                        <div class="nav-item dropdown dropright">
                        	<a href="" class="nav-item nav-link">면·양념·오일</a>
	                        	<div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
		                                <a href="" class="dropdown-item">라면</a>
		                                <a href="" class="dropdown-item">파스타·면류·조리용 떡</a>
		                                <a href="" class="dropdown-item">밀가루·가루·믹스</a>
		                                <a href="" class="dropdown-item">햄·통조림·병조림</a>
		                                <a href="" class="dropdown-item">죽·스프·카레</a>
		                                <a href="" class="dropdown-item">양념·액젓·장류</a>
		                                <a href="" class="dropdown-item">식용유·참기름·오일</a>
		                                <a href="" class="dropdown-item">식초·소스·드레싱</a>
		                                <a href="" class="dropdown-item">소금·설탕·향신료</a>
	                            </div>
                        </div>
                        <div class="nav-item dropdown dropright">
                        	<a href="" class="nav-item nav-link">생수·음료·커피</a>
	                        	<div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
		                                <a href="" class="dropdown-item">생수·탄산수</a>
		                                <a href="" class="dropdown-item">음료·주스</a>
		                                <a href="" class="dropdown-item">원두·드립백</a>
		                                <a href="" class="dropdown-item">캡슐·인스턴트 커피</a>
		                                <a href="" class="dropdown-item">차</a>
	                            </div>
                        </div>
                        <div class="nav-item dropdown dropright">
                        	<a href="" class="nav-item nav-link">유제품</a>
	                        	<div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
		                                <a href="" class="dropdown-item">우유·두유</a>
		                                <a href="" class="dropdown-item">요거트·생크림</a>
		                                <a href="" class="dropdown-item">자연치즈</a>
		                                <a href="" class="dropdown-item">가공치즈</a>
		                                <a href="" class="dropdown-item">버터</a>
		                                <a href="" class="dropdown-item">아이스크림</a>
	                            </div>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <span class="h1 text-uppercase text-dark bg-light px-2">Multi</span>
                        <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Shop</span>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="index.html" class="nav-item nav-link active">Home</a>
                            <a href="shop.html" class="nav-item nav-link">Shop</a>
                            <a href="detail.html" class="nav-item nav-link">Shop Detail</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages <i class="fa fa-angle-down mt-1"></i></a>
                                <div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
                                    <a href="cart.html" class="dropdown-item">Shopping Cart</a>
                                    <a href="checkout.html" class="dropdown-item">Checkout</a>
                                </div>
                            </div>
                            <a href="contact.html" class="nav-item nav-link">Contact</a>
                        </div>
                        <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                            <a href="" class="btn px-0">
                                <i class="fas fa-heart text-primary"></i>
                                <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
                            </a>
                            <a href="" class="btn px-0 ml-3">
                                <i class="fas fa-shopping-cart text-primary"></i>
                                <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
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
		            <c:when test="${event.eimg eq '1.jpeg'}">
		                <div class="carousel-item active">
		                    <img class="d-block w-100" src="${pageContext.request.contextPath}/image/event/1.jpeg" alt="Event Image">
		                    <!-- 캡션 없음 -->
		                </div>
		            </c:when>
		            <c:otherwise>
		                ${event.eimg}
		                <div class="carousel-item">
		                    <img src="${pageContext.request.contextPath}/image/event/${event.eimg}" class="d-block w-100" alt="...">
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
		                        	<img class="img-fluid w-200" src="${dto.ysrc}" alt="">
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
    <div class="container-fluid py-5">
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
    <!-- Vendor End -->


    <!-- Footer Start -->
    <div class="container-fluid bg-dark">
		<!-- padding left 5, top 5 -->
        <div class="row px-xl-5 pt-5">
        	<!-- 왼쪽과 오른쪽 컬럼의 간격 차이 -->
            <div class="col-lg-6">
                <h5 class="text-secondary text-uppercase mb-4">고객행복센터</h5>
                <table>
				    <tr>
				        <td width="150px">
				            <h3 style="color: white;">1577-1541</h3>
				        </td>
				        <td>
				            <p style="margin-bottom: 0px"> 월~토요일 오전 9시 - 오후 6시</p>
				        </td>
				    </tr>
				<!-- </table>
                <table> -->
				    <tr>
				        <td>
                			<button type="button" class="btn btn-light" style="width:120px">1:1 문의</button>
               			</td>
				        <td style="font-size:13px;">
                			365일
                			<br>
                			고객센터 운영시간에 순차적으로
                			<br>
                			답변드리겠습니다.
                		</td>
				    </tr>
				</table>
				<br>
				<p style="font-size:11px;">비회원 문의 : <a href="#">help@sellremarket.com</a></p>
            </div>
              <div>
              	<a href="#">셀리소개</a>&nbsp;
              	<a href="#">이용약관</a>&nbsp;
              	<a href="#">개인정보처리방침</a>&nbsp;
              	<a href="#">이용안내</a>
              	<br><br>
              	<div style="font-color:lightray; size:10px;">
              		법인명 (상호) : 주식회사 셀리 | 사업자등록번호 : 269-32-11111 <a href="#">사업자정보 확인</a>
              		<br>
              		통신판매업 : 제 2023-서울강남-12345 호
              		<br>
              		주소 : 서울특별시 송파구 올림픽로 300, 40층(신천동) | 대표이사 : 제임스
              		<br>
              		채용문의 : recruit@sellrecorp.com
              		<br>
              		팩스 : 070 - 1266 - 3911
              	</div>
              </div>
        </div>
        <div class="row border-top mx-xl-5 py-4" style="border-color: rgba(256, 256, 256, .1) !important;">
            <div class="col-md-6 px-xl-0">
                <p class="mb-md-0 text-center text-md-left text-secondary">
                    &copy; <a class="text-primary" href="#">Domain</a>. All Rights Reserved. Designed
                    by
                    <a class="text-primary" href="https://htmlcodex.com">HTML Codex</a>
                </p>
            </div>
            <div class="col-md-6 px-xl-0 text-center text-md-right">
                <img class="img-fluid" src="img/payments.png" alt="">
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>
</body>
</html>