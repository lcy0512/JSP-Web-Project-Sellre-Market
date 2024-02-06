<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 셀리</title>
<link rel="shortcut icon" href="http://localhost:8080/sellreMarket/image/logo.png" />
<link rel="icon" href="http://localhost:8080/sellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="16x16" href="http://localhost:8080/sellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="32x32" href="http://localhost:8080/sellreMarket/image/logo.png" />
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/admin_menu.css" />
</head>
<script>

	//제품현황 메뉴 클릭했을 때
	function goToProduct() {
		$.ajax({
			type : "POST",
			url : "/adminProduct.do",
			dataType : 'json',
			data : {},
			success : function(data){
				alert('성공!!');
				console.log(data);
			},
			error : function(xhr, status, error){
				console.log('에러 : '+error);
			}
			
		});
	}
	
</script>

<script>
	let menuItems = document.querySelectorAll('.menu-item');
	
	menuItems.forEach(function(item) {
		item.onclick = changeSection;
	});
		
	function changeSection() {
		
		//get active page
		let activePage = document.querySelector('.active');
		console.log('ddd : '+activePage)
		
		
		//get new page
		let newPageId = this.getAttribute('href');
		let newPage = document.querySelector(newPageId);
		console.log('1212 : '+newPageId);
		console.log('ddd : '+newPage)
		
		//change active menu item 
/* 		let activeMenuItem = document.querySelector('.menu-item.active');
 */		activePage.classList.remove('.active');
 		activePage.hidden = true;
		
 		newPage.classList.add('active');
 		newPageId.hidden = false;
		
		
		
		/* this.classList.add('active');
		
		//load new Content : fetch를 통해 비동기적으로 로드, mainContent요소에 동적으로 삽입
		fetch(newPageId)
			.then(response -> response.text())
			.then(content => {
				mainContent.innerHTML = content;
			})
			.catch(error => {
				console.error('error : ', error);
			}) */
		
	}

	
</script>
<body id="body">

	<nav class="sidebar close">
		<header>
			<div class="image-text">
				<span class="image">
					<img alt="logo" src="image/logo.png">
				</span>
			</div>
			<i class='bx bx-chevron-right toggle'></i>
		</header>
		
		<div class="menu-bar">
			<div class="menu">
				<ul class="menu-links">
				
					<li class="nav-link">
						<a href="adminSales.do" class="menu-item">
							<i class='bx bx-line-chart icon page1'></i>
							<span class="text nav-text">매출현황</span>
						</a>
					</li>
					
					<li class="nav-link"> 
						<a href="adminProduct.do" class="menu-item"  >
							<i class='bx bxs-bowl-rice icon page2'></i>
							<span class="text nav-text">제품현황</span>
						</a>
					</li>
					
					<li class="nav-link">
						<a href="adminCategory.do" class="menu-item">
							<i class='bx bxs-category icon page3'></i>
							<span class="text nav-text">카테고리</span>
						</a>
					</li>
					
					<li class="nav-link">
						<a href="adminEvent.do" class="menu-item">
							<i class='bx bxs-calendar-event icon page4'></i>
							<span class="text nav-text">이벤트현황</span>
						</a>
					</li>
					
					<li class="nav-link">
						<a href="adminOrder.do" class="menu-item">
							<i class='bx bx-list-check icon page5'></i>
							<span class="text nav-text">입고요청</span>
						</a>
					</li>
					
					<li class="nav-link">
						<a href="adminStock.do" class="menu-item">
							<i class='bx bx-package icon page6'></i>
							<span class="text nav-text">재고현황</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	
	<!-- 
	<main class="active" id="sales">
		<header class="home">
			<div class="text">매출현황</div>
			
			<div class="container">
				<div class="info">
					관리자님 환영합니다. &nbsp; <a href="logout.do">로그아웃</a>
				</div>
			</div>
			
		</header>
		
		<div class="main">
			<div class="main_content">
				매출현황 내용 ~!~~! !~
				Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt<br> ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco<br> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate<br> velit esse cillum dolore eu fugiat nulla pariatur.<br> Excepteur sint occaecat cupidatat non proident, <br>sunt in culpa qui officia deserunt mollit anim id est laborum.
			</div>		
		</div>
	</main>
	
	<main id="product" hidden="true">
		<header class="home">
			<div class="text">제품현황</div>
			
			<div class="container">
				<div class="info">
					관리자님 환영합니다. &nbsp; <a href="logout.do">로그아웃</a>
				</div>
			</div>
			
		</header>
		
		<div class="main">
			<div class="main_content">
				제품현황 제발... <br>
				please//
				
			</div>		
		</div>
	</main>
	 -->
	<script src="js/admin_menu.js"></script>
	
</body>
</html>