<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 - 셀리마켓</title>
</head>
<body>
<jsp:include page="header.jsp"/>
	<div class="css-2b29tl eug5r8l2">
		<div class="css-luwwab eug5r8l1">
			<jsp:include page="inquirymenubar.jsp"/>
			<div class="css-171zbec eug5r8l0">
				<div class="css-j0lifa ed9qr673">
					<div class="css-fhxb3m ed9qr672">
						<h2 class="css-1268zpe ed9qr671">1:1 문의</h2>
					</div>
				</div>
				<div class="css-e23nfx e16adls21">
					<div width="100" class="css-16tcewl e16adls20">유형</div>
					<div class="css-1ym8aqm e16adls20">제목</div>
					<div width="100" class="css-16tcewl e16adls20">작성일</div>
					<div width="100" class="css-16tcewl e16adls20">답변상태</div>
				</div>
				
					<c:choose>
	       				<c:when test="${empty InquiryList}">
	       				<div class="css-l0r8ps e1cfowvj1" style="margin-top: 40px;">
	            			게시글이 없습니다.
	            			</div>
	        			</c:when>
	        			<c:otherwise>
	            			<c:forEach items="${InquiryList}" var="inquiry">
	            			<div class="css-l0r8ps e1cfowvj1" style="margin-top: 0px;">
	            			 <form action="inquirydetail.do" method="post">
	            			<input type="hidden" name="inquiryid" value="${inquiry.inquiryid}">
	            				<button type="submit" class="css-e24nfx">
	            					<div width="100" class="css-15tcewl">${inquiry.questid}</div>
	            					<div class="css-1ym7aqm">${inquiry.intitle}</div>
	               					<div width="100" class="css-15tcewl">${inquiry.insertdate}</div>
	                				<div width="100" class="css-15tcewl">${inquiry.status}</div>
	                			</button>
	                			</form>
	                			</div>
	            			</c:forEach>
	        			</c:otherwise>
	    			</c:choose>
				<div class="css-15jhycr e3tf63e0"></div>
				<form method="POST" action="inquirywrite.jsp">
					<button class="css-1ibxj4m e4nu7ef3" id="inquirybtn" type="submit" width="120" radius="3">
						문의하기
					</button>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.html"/>
</body>
</html>