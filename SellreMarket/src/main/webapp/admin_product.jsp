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
    
    /* 관리자환영합니다. 로그아웃 css start*/
    header {
    	text-align : right;
    	padding: 30px;
	    font-size : 12px;
    }
	/* 관리자환영합니다. 로그아웃 css end*/
    
    
	/* 내용 css 시작 */
	.main {
		position : relative;
		top : 80px;
		height: 100vh; 
		left : 50px;
		justify-content : center;
		height: 600px;
		width: calc(100%-260px);
		transition : var(--trans-05);
		display: flex;
		align-items: center;
		
	}
	/* 내용 css 끝 */

	
	/* 제목 css 시작 */
	.title {
		display: block;
		font-size: 27px; /* 제목의 글꼴 크기 조정 */
  		font-weight: 700; /* 제목의 글꼴 굵기 조정 */
    	color: #333333; /* 제목의 글꼴 색상 조정 */
    	justify-content : center;
    	text-align: center;
    	margin-top : 60px;
    	padding-bottom: 40px;
    	
	}
	/* 제목 css 끝 */
	
	/* javascript table css start */
	.table-style {
		border-collapse: collapse;
		width: 100%;
		padding-top : 0px;
	}
	
	.table-style th, .table-style td {
		 border: 1px solid black;
		 padding: 8px;
		 text-align: left;
	}
	
	.table-style th {
		background-color: #f2f2f2;
	}
	
	.table-style tr:nth-child(even) {
		background-color: #f9f9f9;
	}
	
	.table-style tr:hover {
		background-color: #ddd;
	}
	
	.table-style td {
	    border: none; /* 좌우 테두리 제거 */
	    padding: 15px;
	    text-align: left;
	    padding-left: 40px; /* 열 간격을 넓게 주기 위한 왼쪽 패딩 설정 */
	    padding-right: 40px; /* 열 간격을 넓게 주기 위한 오른쪽 패딩 설정 */
	}
	
	.table-style th {
	 	padding: 20px;
		border: none; /* 좌우 테두리 제거 */
		text-align: center;
	    padding-left: 20px; /* 열 간격을 넓게 주기 위한 왼쪽 패딩 설정 */
	    padding-right: 20px; /* 열 간격을 넓게 주기 위한 오른쪽 패딩 설정 */
	}
	
	#paging {
		display: flex;
    	justify-content: center;
    	align-items: center;
		margin-top : 30px;
	}
	
	#paging button {
	    background-color: #f2f2f2;
	    border: none;
	    color: #333;
	    padding: 8px 16px;
	    margin: 4px;
	    cursor: pointer;
	    border-radius: 4px;
	}
	
	#paging button:hover {
	    background-color: #f9f9f9;
	}
	
	#paging button:disabled {
	    background-color: #ddd;
	    cursor: not-allowed;
	}
	
	
	
	/* javascript table css end */
</style>

<script>
		
	window.onload=function(){
		//제품 list 조회
		$.ajax({
			type : "POST",
			url : "adminProduct.do",
			success : function(response){
				createTable(response)
			},
			 error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
		/* let pageNum = $("#pageNum").val() */
		
		
		$.ajax({
			type : "POST",
			url : "adminProductCnt.do",
			data : {pageNum : 1},
			success : function(response){
				ㅣ
				
				createPaging(response)
	
			},
			 error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	function btnClick(pageNum) {
		$.ajax({
			type : "POST",
			url : "adminProductCnt.do",
			data : {pageNum : pageNum} ,
			success : function(response){
				createPaging(response)
	
			},
			 error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	//productid, pname, pEngname, nutrition, pinsertdate, expirationdate, status from product";
	function createTable(data) {
		let table = "<table class='table-style'>";
		table += "<tr><th>번호</th><th>상품명</th><th>영문명</th><th>원산지</th><th>입고일</th><th>소비기한</th><th>상태</th></tr>"
		
		if(data.length == 0) {
			table += "<tr><td colspan='7'></td></tr>";
		}
		
		//데이터 행 추가
		for(let i=0; i<data.length; i++){
			table += "<tr>" +
						"<td style='text-align:center'>" + data[i].productid +"</td>" +
						"<td style='text-align:left'>" + data[i].pname +"</td>" +
						"<td>" + data[i].pEngname +"</td>" +
						"<td style='text-align:center'>" + data[i].origin +"</td>" +
						"<td style='text-align:center'>" + data[i].pinsertdate +"</td>" +
						"<td style='text-align:center'>" + data[i].expirationdate +"</td>" +
						"<td style='text-align:center'>" + data[i].status +"</td>" +
					"</tr>" 
		}
		
		table += "</table>"
		
		$("#result").html(table);
		
	}	 

	
	function createPaging(data) {
		
		//listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		let currentPage = data.pageInfo.currentPage
		let startPage = data.pageInfo.startPage;
		let endPage = data.pageInfo.endPage;
		let maxPage = data.pageInfo.maxPage;
		
		let div ="<div>"
		
		if (currentPage != 1) {
		    //div += "<button onclick='location.href=\"/adminProductCnt.do?pageNum=" + (currentPage - 1) + "\"'>&lt;</button>";
		    div += "<button onclick='btnClick(" + (currentPage - 1) + ")'>&lt;</button>";
		}

		for (let p = startPage; p <= endPage; p++) {
		    if (p == currentPage) {
		        div += "<button style='background: #f9f9f9' disabled>" + p + "</button>";
		    } else {
		   		 //div += "<button onclick='location.href=\"/adminProductCnt.do?pageNum=" + p + "\"'>" + p + "</button>";
		    	   div += "<button onclick='btnClick(" +p+ ")'>" + p + "</button>";
		    }
		}

		if (currentPage != maxPage) {
		   //div += "<button onclick='location.href=\"/adminProductCnt.do?pageNum=" + (currentPage + 1) + "\"'>&gt;</button>";
			div += "<button onclick='btnClick(" + (currentPage + 1) + ")'>&gt;</button>";
		}

		div += "</div>";

		
		$("#paging").html(div);

	}	
	
	* {
		backco : blue';
	}
	
</script>
<body>

<!-- sidebar include start-->	
<jsp:include page="admin_menu.jsp" flush="false" />
<!-- sidebar include end-->
	
	<main>
		<!-- header start -->
		<header>
			<div class="info">
				관리자님 환영합니다. &nbsp; <a href="logout.do">로그아웃</a>
			</div>
		</header>
		
		<!-- header end -->
		
		<!-- title start -->
		<div class="title">제품현황</div>
		
		<div class="btnGroup">
			
		</div>
		<!-- title end -->
		
		<!-- content start -->
		<div class="main">
			<div class="main_content">
				<div id="result"></div>
				<div id="paging">
				
				</div>		
			</div>
		</div>
		<!-- content end -->
		
		
	</main>
	
	
	<!-- 	페이징 처리 -->
	
	
</body>
</html>