<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 셀리</title>
<link rel="shortcut icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" href="http://localhost:8080/sellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="16x16" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="32x32" href="http://localhost:8080/SellreMarket/image/logo.png" />
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="css/admin_product.css" />
</head>
<style>


</style>
<script>
		
	window.onload=function(){
		init();
	}	
		
	function init() {
		paging();
	}
	
	
	function paging(pageNum) {
		
		//pageNum이 null일 때 처리
		if(pageNum == null ){
			pageNum = "1";
		}
		
		$.ajax({
			type : "POST",
			url : "adminProduct.do",
			data : {pageNum : pageNum},
			success : function(response){
				createPaging(response)
			},
			 error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	
	function createPaging(data) {
		
		document.getElementById("result").innerHTML = "";
		//페이지 번호 보여주기 위해 div태그 생성
		let rownumber = data.total - data.index_no;	//행번호
		let index_no = data.index_no;	//행번호
		let lastPage = data.lastPage;
		let div = "<div>";
		
		//데이터 조회하기 위해 테이블 생성
		let table = "<table id='listTable' class='table-style'>";
		table += "<tr><th>행번호</th><th>상품명</th><th>영문명</th><th>원산지</th><th>입고일</th><th>소비기한</th><th>상태</th></tr>"
		
		//데이터가 없을 때 처리
		if(data.length == 0) {
			table += "<tr><td colspan='7'></td></tr>";
		}
		
		//이중 for문으로 페이징처리와 해당 페이지에 데이터 조회를 동시에 처리
		for(let j= 1; j <= lastPage; j++){
			
			for(let i=0; i < data.productList.length; i++){ //=> 범위를 0~9까지 계속 10개씩 가져오는 것이 아니라, data 길이만큼씩 보여주게 해야된다잇!!
				table += "<tr>" +
				
							"<td style='text-align:center'>" + rownumber +"</td>" +
							"<td style='text-align:left'>" + data.productList[i].pname +"</td>" +
							"<td>" + data.productList[i].pEngname +"</td>" +
							"<td style='text-align:center'>" + data.productList[i].origin +"</td>" +
							"<td style='text-align:center'>" + data.productList[i].pinsertdate +"</td>" +
							"<td style='text-align:center'>" + data.productList[i].expirationdate +"</td>" +
							"<td style='text-align:center'>" + data.productList[i].status +"</td>" +
							"<td hidden style='width:0px;'>" + data.productList[i].productid +"</td>" +
						"</tr>" 
						rownumber--;
						
				
			}
			table += "</table>"
			div += "<button onclick='paging("+j+")'>"+j+"</button> ";
			
		}
 		$("#paging").html(div);
		$("#result").html(table);
		
		// 텍스트 제거
	    var tableElement = document.getElementById("listTable");
	    var nextSibling = tableElement.nextSibling;
	    while (nextSibling) {
	        var nextElement = nextSibling.nextSibling;
	        nextSibling.parentNode.removeChild(nextSibling);
	        nextSibling = nextElement;
	    }
	}	


	
</script>
<body>

<jsp:include page="admin_menu.jsp" flush="false" />
	
	<main>
		<header>
			<div class="info">
				관리자님 환영합니다. &nbsp; <a href="logout.do">로그아웃</a>
			</div>
		</header>
		
		
		
		<div class="btnGroup">
			
		</div>
		
		<div class="main">
			<div class="title">제품현황</div>
			<div class="main_content">
				<div id="result" class="tableContainer"></div> <!-- 테이블 조회 위치 -->
			</div>
			<div id="paging"></div>	<!-- 페이징 조회 위치 -->
		</div>
	</main>
	
</body>
</html>