<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 셀리</title>
<link rel="shortcut icon"
	href="http://localhost:8080/sellreMarket/image/logo.png" />
<link rel="icon"
	href="http://localhost:8080/sellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="http://localhost:8080/sellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="http://localhost:8080/sellreMarket/image/logo.png" />
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="../css/admin_menu.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
	
.main {
		position : relative;
		top : 0px;
		height: 100vh;
		left : 260px;
		width: calc(100%-260px);
		transition : var(--trans-05);
		height: 100px;
		display: flex;
		align-items: center;
	}
	
	.sidebar.close ~ .main {
		left : 200px;
		width: calc(100%-160px);
	}

</style>

<script>
	$(document).ready(function(){
		$.ajax({
			type : "POST",
			url : "adminProduct.do",
			dataType : 'json',
			data : {},
			success : function(data){
				alert('성공!!');
				var list = data.list;
				console.log(data);
			},
			error : function(xhr, status, error){
				console.log('에러 : '+error);
			}
			
		});
	});

</script>
</head>

<body id="body">

	<nav class="sidebar close">
		<header>
			<div class="image-text">
				<span class="image"> <img alt="logo" src="../image/logo.png">
				</span>
			</div>
			<i class='bx bx-chevron-right toggle'></i>
		</header>

		<div class="menu-bar">
			<div class="menu">
				<ul class="menu-links">

					<li class="nav-link"><a href="admin_menu.jsp"> <i
							class='bx bx-line-chart icon'></i> <span class="text nav-text">매출현황</span>
					</a></li>

					<li class="nav-link"><a href="adminProduct.do"> <i
							class='bx bxs-bowl-rice icon'></i> <span class="text nav-text">제품현황</span>
					</a></li>

					<li class="nav-link"><a href="#"> <i
							class='bx bxs-category icon'></i> <span class="text nav-text">카테고리</span>
					</a></li>

					<li class="nav-link"><a href="#"> <i
							class='bx bxs-calendar-event icon'></i> <span
							class="text nav-text">이벤트현황</span>
					</a></li>

					<li class="nav-link"><a href="#"> <i
							class='bx bx-list-check icon'></i> <span class="text nav-text">입고요청</span>
					</a></li>

					<li class="nav-link"><a href="#"> <i
							class='bx bx-package icon'></i> <span class="text nav-text">재고현황</span>
					</a></li>
				</ul>
			</div>
		</div>
	</nav> 
	

	<!-----------------  제목  --------------->
	<section class="home">
		<div class="text">제품현황</div>

		<div class="container">
			<div class="info">
				관리자님 환영합니다. &nbsp; <a href="logout.do">로그아웃</a>
			</div>
		</div>
	</section>
	<!-----------------  제목  --------------->
	
	<!-----------------  내용 시작  --------------->
	<main class="main">
		왈랄랄랄라
	
	
	
	
	</main>
	<!-----------------  내용 끝  --------------->
	
	

	<script src="../js/admin_menu.js"></script>

</body>
</html>