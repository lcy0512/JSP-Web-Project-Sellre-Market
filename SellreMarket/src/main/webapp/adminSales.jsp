<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 셀리</title>
<link rel="shortcut icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="16x16" href="http://localhost:8080/SellreMarket/image/logo.png" />
<link rel="icon" type="image/png" sizes="32x32" href="http://localhost:8080/SellreMarket/image/logo.png" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://cdn.canvasjs.com/ga/canvasjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- <link rel="stylesheet" href="css/adminBrand.css" />
<script src="js/adminBrand.js"></script> -->
<script>
window.onload=function(){
	init();
}	
	
function init() {
	sales();
	popular();
	gender();
	user();
	productNum(); //header[제품현황] 알림표시
	questNum();
	
}

//header-제품현황 알림표시
function productNum() {
		
	$.ajax({
		type : "POST",
		url : "adminProductNum.do",
		success : function(response){
			if(response == "0"){
				document.getElementById('productNum').style.display = 'none';
			} else {
				document.getElementById('productNum').style.display = 'block';
				document.getElementById('productNum').innerText = response	
			}
			
		},
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

//문의 진행중 갯수 Header 알림표시
function questNum() {
	
	$.ajax({
		type : "POST",
		url : "adminQuestNum.do",
		success : function(response){
			if(response == "0"){
				document.getElementById('questNum').style.display = 'none';
			} else {
				document.getElementById('questNum').style.display = 'block';
				document.getElementById('questNum').innerText = response
			}
		},
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

// 매출현황 데이터 조회
function sales() {
	
	$.ajax({
		type : "POST",
		url : "showSaleChart.do",
		success : function(response){
			createChart(response)
		},
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}


//매출현황 차트 만들기
function createChart(list) {
		let chart = new Chart(document.getElementById("chartContainer"), {
			
		type: 'line',
	   		options: {
	   			responsive: false,
	      		title: {
	        		text: "매출현황"
	      		},
	      		axisX: {
	       			title: "날짜",
		        	gridThickness: 2
		     	},
	     		axisY: {
	        		title: "금액(원)"
	      		},
	    	},
	    	
	    	data: {
	    		labels : [
	    			
	   				  list[0].purchasedate,
	   				  list[1].purchasedate,
	   				  list[2].purchasedate,
	   				  list[3].purchasedate,
	   				  list[4].purchasedate,
	   				  list[5].purchasedate,
	   				  list[6].purchasedate
	   				  
	    		],
	    		datasets: [{
		    		label : '매출(원)',
		    		data : [
		    			
		    			list[0].total,
		    			list[1].total,
		    			list[2].total,
		    			list[3].total,
		    			list[4].total,
		    			list[5].total,
		    			list[6].total
		    			
		    		],
		    		borderColor: "rgba(255, 201, 14, 1)",
		            backgroundColor: "rgba(255, 201, 14, 0.5)",
		            hoverBorderColor : "rgba(255, 189, 14, 0.5)",
		            fill: false,
		            lineTension: 0
		    	}]
	   		} 
	    
 		});
	  chart.render();
}

// 이 달 인기제품 top 5 가져오기
function popular() {
	
	$.ajax({
		type : "POST",
		url : "showPopular.do",
		success : function(response){
			popularChart(response)
		},
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function popularChart(list){
	let chart = new Chart(document.getElementById("donutContainer"), {
		
		  	type: 'doughnut',
	   		options: {
	   			responsive: false
	      		
	    	},
	    	
	    	data: {
	    		labels : [
	    			
	   				  list[0].name,
	   				  list[1].name,
	   				  list[2].name,
	   				  list[3].name,
	   				  list[4].name
	    		],
	    		
	    		datasets: [{
		    		label : '이 달 인기 제품 TOP5',
		    		backgroundColor: ["#E5756E", "#F6C97C","#FAE594","#A2DB89","#90B9F8"],
		    		data : [
		    			
		    			list[0].amount,
		    			list[1].amount,
		    			list[2].amount,
		    			list[3].amount,
		    			list[4].amount
		    			
		    		],
		    	}]
	   		} 
 		});
	  chart.render();
	  
}

//가입 성비 조회
function gender() {
	
	$.ajax({
		type : "POST",
		url : "showGender.do",
		success : function(response){
			genderChart(response)
		},
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function genderChart(list){
	let chart = new Chart(document.getElementById("pieContainer"), {
		
		  	type: 'pie',
	   		options: {
	   			responsive: false
	      		
	    	},
	    	
	    	data: {
	    		labels : [
	    			
	   				  list[0].name,
	   				  list[1].name,
	   				  list[2].name,
	    		],
	    		
	    		datasets: [{
		    		label : '이 달 인기 제품 TOP5',
		    		backgroundColor: ["#EB6D85","#58A0E5","#F7CE6B"],
		    		data : [
		    			
		    			list[0].genderCnt,
		    			list[1].genderCnt,
		    			list[2].genderCnt
		    			
		    		],
		    	}]
	   		} 
 		});
	  chart.render();
	  
}

//많이 주문한 고객 
function user() {
	
	$.ajax({
		type : "POST",
		url : "showUser.do",
		success : function(response){
			userChart(response)
		},
		 error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

//많이 주문한 고객 차트 그리기
function userChart(list){
	let chart = new Chart(document.getElementById("horiContainer"), {
		
	  	type: 'bar',
   		options: {
   			responsive: false
      		
    	},
    	
    	data: {
    		labels : [
    			
   				  list[0].userid +"["+list[0].name+"]",
   				  list[1].userid +"["+list[1].name+"]",
   				  list[2].userid +"["+list[2].name+"]",
   				  list[3].userid +"["+list[3].name+"]",
   				  list[4].userid +"["+list[4].name+"]"
    		],
    		
    		datasets: [{
	    		label : '이 달 인기 제품 TOP5',
	    		backgroundColor: ["#E5756E", "#F6C97C","#FAE594","#A2DB89","#90B9F8"],
	    		data : [
	    			
	    			list[0].purCnt,
	    			list[1].purCnt,
	    			list[2].purCnt,
	    			list[3].purCnt,
	    			list[4].purCnt
	    		],
	    	}]
   		} 
	});
  	chart.render();
}

</script>
<style>
/* 
body {
    margin: 0;
    padding: 0;
    overflow-x: hidden;
}


.main {
  display: flex;
  justify-content :center;
  align-items: center;
  background-color: #fff;
  padding: 20px;
  border-radius: 5px;
  margin-bottom : 50px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  flex-wrap: wrap;
}

.title {
 	display: inline-block;
	align-items: left;
	font-size: 27px; 
	font-weight: 700;
	color: #333333; 
	border-left: 2px solid #333333; 
}

.main_content {
	text-align : center;
	margin-left:0px;
	font-size: 27px;
	font-weight: 700;
	color: #333333; 
	
}
*/
.alarm {
	font-size : 10px;
	color : #006aff;
	font-weight: bold;
	margin-left : 20px;
}
 
/*  body {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 500px;
} */

.main {
  display: flex;
  flex-direction: column;
  align-items: center;
  background-color: #fff;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  margin-bottom: 10px;
}

.title {

  font-size: 27px;
  font-weight: 700;
  color: #333333;
  margin-top : 30px;
  margin-bottom : 20px;
}

.main_content {
  text-align: center;
  margin-top: 20px;
}

canvas {
	margin-bottom: 50px;
}
 
</style>
</head>
<body>
	<main>
	<jsp:include page="adminHeader.jsp" flush="false" />
		<!--  매출현황 차트 시작 -->
		<div class="main">
			<div class="title" style="display : inline-block">매출현황<span class="alarm">오늘 날짜에서 일주일치 확인 가능합니다.</span></div>
			<div class="main_content">
				<canvas id="chartContainer" style="height:400px; width:700px;"></canvas>
			</div>
		</div><!--  매출현황 차트 끝 -->
		
		
		<!--  인기제품 top 5 차트 시작 -->
		<div class="main">
			<div class="title" style="display : inline-block">이 달 인기 제품 TOP5</div>
			<div class="main_content">
				<canvas id="donutContainer" style="height:400px; width:700px;"></canvas>
			</div>
		</div><!--  인기제품 top 5 차트 끝 -->
		
		
		<!--  가입 성비 차트 시작 -->
		<div class="main">
			<div class="title" style="display : inline-block">가입 성비</div>
			<div class="main_content">
				<canvas id="pieContainer" style="height:400px; width:700px;"></canvas>
			</div>
		</div><!--  가입 성비 차트 끝 -->
		
		
		<!-- VVIP 고객 차트 시작-->
		<div class="main">
			<div class="title" style="display : inline-block">많이 주문한 고객(누적)</div>
			<div class="main_content">
				<canvas id="horiContainer" style="height:400px; width:700px;"></canvas>
			</div>
		</div><!-- VVIP 고객 차트 끝 -->
		
	</main>
	
</body>
</html>