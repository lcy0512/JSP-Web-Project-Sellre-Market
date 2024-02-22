window.onload=function(){
		init();
	}	
		
	function init() {
		paging();
		productNum();
		questNum();
	}

	//제품현황 Header 알림표시
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
		table += "<tr><th>행번호</th><th>상품명</th><th>입고개수</th><th>재고개수</th><th>상태</th></tr>"
		
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
	
	let url = "/SellreMarket/adminProductDetailPage.do";
	
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
