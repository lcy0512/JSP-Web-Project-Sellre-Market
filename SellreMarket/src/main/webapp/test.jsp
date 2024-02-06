<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

</head>
<style>
    
	/**제목 css 시작 **/
	.home {
		position : relative;
		top : 0px;
		height: 100vh;
		left : 220px;
		width: calc(100%-220px);
		transition : var(--trans-05);
		height: 100px;
		display: flex;
		align-items: center;
	}
	
	.home .text{
		font-size: 25px;
		font-weight: 700;
		font-weight : bold;
		padding: 15px 40px;
		display: flex;
		align-items: center;
		height: 63px;
		
	}
	/**제목 css 끝 **/	
	
	/* 정보 css 시작 */	
	.container {
		display: flex;
		justify-content: space-between;
		align-items: center;
   		
	}
	/* 정보 css 끝 */

	/* 내용 css 시작 */
    .info {
        white-space: nowrap; /* 텍스트 줄 바꿈을 방지합니다. */
 	   	overflow: auto; /* 내용이 넘칠 경우 스크롤이 표시됩니다. */
  		width: 100%; /* 가로 너비를 100%로 설정합니다. */
  		font-size: 12px;
  		display: flex;
  		justify-content: center;
  		
    }
    
	
	.main {
		position : relative;
		top : -300px;
		height: 100vh;
		left : 260px;
		width: calc(100%-260px);
		transition : var(--trans-05);
		display: flex;
		align-items: center;
		
	}
	
	/* 내용 css 끝 */
	
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
<body>
	
<jsp:include page="admin_menu.jsp" flush="false" />

	<main>
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
	
</body>
</html>