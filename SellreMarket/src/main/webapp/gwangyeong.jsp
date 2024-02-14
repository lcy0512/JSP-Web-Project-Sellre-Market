<%--
		(1) Desc : 장바구니 page를 미리 제작된 header, footer 등과 조합하기 위한 router 제작하기.
		(2) Date
			1) 2024.02.14. (Ver 0.0.0)
		(3) Author : Gwangyeong Kim
		(4) History
			1) 최초 작성
			2) JTSL 이용하여 main content 부분 설정하기.
					1. <c:choose> 와 <c:when> tag 이용하여 원하는 main content 불러오기.
						- 이 때, 사용하는 변수를 router로 지정하였음.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sellre - Cart from 셀리마켓</title>
</head>
<body>
	<%-- Topbar --%>
	<jsp:include page="header.jsp"></jsp:include>
	
	<%-- main content --%>
	<main>
		<c:choose>
			<c:when test="${router == 'cart'}">
				<jsp:include page="cart.jsp"></jsp:include>
			</c:when>
			<%--
			<c:when test="${router == 'something1'}">
				<jsp:include page="something1.jsp"></jsp:include>
			</c:when>
			<c:when test="${router == 'something2'}">
				<jsp:include page="something2.jsp"></jsp:include>
			</c:when>
			<c:when test="${router == 'something3'}">
				<jsp:include page="something3.jsp"></jsp:include>
			</c:when>
			<c:otherwise>
				<jsp:include page="something.jsp"></jsp:include>
			</c:otherwise>
		  --%>
		</c:choose>
	</main>
	
	<%-- footer --%>
	<jsp:include page="footer.html"></jsp:include>
	
</body>
</html>