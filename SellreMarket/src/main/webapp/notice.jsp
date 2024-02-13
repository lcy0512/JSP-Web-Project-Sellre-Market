<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 - 셀리마켓</title>
</head>
<link rel="stylesheet" href="css/notice.css" />
<body>
	<jsp:include page="header.jsp" />
	<div class="css-luwwab eug5r8l1">
		<jsp:include page="inquirymenubar.jsp" />
		<div class="css-171zbec eug5r8l0">
			<div class="css-j0lifa ed9qr673">
				<div class="css-fhxb3m ed9qr672">
					<h2 class="css-1268zpe ed9qr671">공지사항</h2>
					<span class="css-a3vgo2 ed9qr670">셀리마켓의 새로운 소식들과 유용한 정보들을 한곳에서
						확인하세요.</span>
				</div>
			</div>
			<div class="css-e23nfx e16adls21">
				<div width="50" class="css-mbsaqp e16adls20">번호</div>
				<div class="css-1ym8aqm e16adls20">제목</div>
				<div width="100" class="css-16tcewl e16adls20">작성자</div>
				<div width="100" class="css-16tcewl e16adls20">작성일</div>
			</div>
			<ul class="css-1fttcpj e1cfowvj5">
			<c:forEach items="${EventList}" var="eventlist">
				<li>
					<div class="css-14yglsw e1cfowvj4">
				<!-- <form method="post" action="noticedetail.do"> -->
					<%-- <input type="hidden" value="${eventlist.eventid}" id="selecteventid" name="selecteventid"> --%>
					<!-- <button type="submit"> -->
						<div class="css-3o6rrk e1cfowvj2">${eventlist.eventid}</div>
			<c:choose>
				<c:when test="${eventlist.category eq 2}">
					<div class="css-fzefrb e1cfowvj2">[공지] ${eventlist.ename}</div>
				</c:when>
				<c:otherwise>
					<div class="css-fzefrb e1cfowvj2">[안내] ${eventlist.ename}</div>
				</c:otherwise>
			</c:choose>
						<div class="css-3d2kks eß1cfowvj2">셀리마켓</div>
						<div class="css-b1hszl e1cfowvj2">${eventlist.inputdate}</div>
					<!-- </button>
				</form> -->
					</div>
				</li>
				</c:forEach>
			</ul>
			<div class="css-1kbzkwh e14yho7m0">
				<div class="css-sxxs1g eytury60">
					<button disabled="" type="button" class="css-rzcdhr e1hbwyso0">
						<div class="css-7qb0sc e1ilyb3p0">이전</div>
					</button>
					<button type="button" class="css-1jwilit e1pk9060">
						<div class="css-7qb0sc e1ilyb3p0">다음</div>
					</button>
				</div>
			</div>
		</div>
		<br><br><br>
	</div>
<jsp:include page="footer.html"/>
</body>
</html>