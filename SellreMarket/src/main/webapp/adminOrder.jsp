<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고요청 - 셀리</title>
<link rel="shortcut icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="16x16" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="32x32" href="http://localhost:8080/SellreMarket/image/logo.png" />
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<!-- <link rel="stylesheet" href="css/adminCategory.css" />
<script src="js/adminCategory.js"></script> -->
<style>

body {
    margin: 0;
    padding: 0;
    overflow-x: hidden;
}


.main {
  display: flex;
  justify-content: center;
  height: 1000px;
  flex-direction: column;
  align-items: center;
  background-color: #fff;
  padding: 20px;
  border-radius: 5px;
  margin-top : 100px;
  margin-bottom : 50px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.title {
	/* display: flex; */
	width:80%;
	margin-left:20px;
	align-items: left;
	font-size: 27px; /* 제목의 글꼴 크기 조정 */
	font-weight: 700; /* 제목의 글꼴 굵기 조정 */
	color: #333333; /* 제목의 글꼴 색상 조정 */
	margin-top: 100px; /* 제목의 상단 여백 조정 */
	padding-left: 20px; /* 제목의 왼쪽 여백 조정 */
	border-left: 2px solid #333333; /* 왼쪽 테두리 설정 */
	margin-bottom: 28px;
}
	
.btnGroup {
    text-align: right;
    width: 80%;
    margin-right: 5px;
    margin-bottom: 10px;
} 

.registerBtn {
  background-color: #f2f2f2;
  color: #6F6F67;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin-top: 20px;
}

.tableContainer {
  margin: 0 auto;
  width: 80%;
}


.registerBtn:hover {
  background-color: #E5E5D1;
  color : black;
}

table {
  width: 100%;
  border-collapse: collapse;
  table-layout: fixed;
}

table th, table td {
  padding: 15px;
  text-align: left;
  border-bottom: 1px solid #ccc;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

table td {
	border: none;
}

table th {
  background-color: #f2f2f2;
  font-weight: bold;
  text-align:center;
}


table tr:nth-child(even) {
  background-color: #f9f9f9;
}

table tr:hover {
  background-color: #ddd;
}

 /* 페이징 스타일 */
#paging {
       display: flex;
       justify-content: center;
       margin-top: 20px;
       margin-bottom: 150px;
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
</style>
<script>
window.onload=function(){
	init();
}	
	
function init() {
	paging();
	productNum(); //header[제품현황] 알림표시
	
}

//header-제품현황 알림표시
function productNum() {
	
	$.ajax({
		type : "POST",
		url : "adminProductNum.do",
		success : function(response){
			document.getElementById('productNum').innerText = response
		},
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
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
	table += "<tr><th>행번호</th><th>상품명</th><th>입고갯수</th><th>재고갯수</th><th>상태</th></tr>"
	
	//데이터가 없을 때 처리
	if(data.length == 0) {
		table += "<tr><td colspan='6'></td></tr>";
	}
	
	//이중 for문으로 페이징처리와 해당 페이지에 데이터 조회를 동시에 처리
	for(let j= 1; j <= lastPage; j++){
		
		for(let i=0; i < data.productList.length; i++){ //=> 범위를 0~9까지 계속 10개씩 가져오는 것이 아니라, data 길이만큼씩 보여주게 해야된다잇!!
			
			calc = data.productList[i].pstock - data.productList[i].stock;
			let backgroundColor = calc <=100 ? "pink" : "";
			
			table += "<tr style='background-color : "+backgroundColor+"' onclick='detail(" + data.productList[i].productid + ")'>" +
						"<td style='text-align:center'>" + rownumber +"</td>" +
						"<td style='text-align:left'>" + data.productList[i].pname +"</td>" +
						"<td style='text-align:center'>" + data.productList[i].pstock +"</td>" +
						"<td style='text-align:center'>" + calc +"</td>" +
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

/* .do로 보내기 위해서 form을 만들고, id값도 붙여줌 */
function detail(id){
	
	let url = "/SellreMarket/adminOrderDetailPage.do";
	
	let form = document.createElement("form");
	form.action = url;
	form.method = "POST";
	
	let idField = document.createElement("input");
	idField.type = "hidden";
	idField.name = "id";
	idField.value = id;
	
	form.appendChild(idField);
	
	document.body.appendChild(form)
	form.submit();
	
}
</script>
</head>
<body>
	<main>
	<jsp:include page="adminHeader.jsp" flush="false" />
		<div class="main">
			<div class="title" style="display : inline-block">입고요청</div>
			<!-- <div class="btnGroup" style="display : inline-block">
				<a href="adminOrderRegister.do"><button class="registerBtn">요청</button></a>
			</div> -->
			<div class="main_content">
				<div id="result" class="tableContainer"></div> <!-- 테이블 조회 위치 -->
			</div>
			<div id="paging"></div>	<!-- 페이징 조회 위치 -->
		</div>
	</main>
	
</body>
</html>