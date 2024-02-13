<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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