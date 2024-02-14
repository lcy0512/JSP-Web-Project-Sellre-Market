<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 상세내역 - 셀리마켓</title>
</head>
<link rel="stylesheet" href="css/inquirywrite.css" />
<body>
	<jsp:include page="header.jsp"/>
	<div class="css-2b29tl eug5r8l2"> <!-- content를 전부 감싸주는 div -->
		<div class="css-luwwab eug5r8l1"> <!-- menubar와 content의 형태를 잡아주는 div -->
			<jsp:include page="inquirymenubar.jsp"/>
			<div class="css-171zbec eug5r8l0"> <!-- 현재 페이지에서 보여줄 content에 대한 div -->
				<div class="css-j0lifa ed9qr673"> <!-- 1:1 문의 div -->
					<div class="css-fhxb3m ed9qr672">
						<h2 class="css-1268zpe ed9qr671">1:1 문의 내역</h2>
					</div>
				</div>
				<c:forEach items="${detailInquiry}" var="detail">
				<div class="css-inputrow">
					<div class="css-titlename">유형</div>
					<div class="css-width"><input type="text" value="${detail.questid}" style="height: 44px; width:100px; padding-left: 5px; border-width: 2px;" readonly="readonly"></div>
				</div>
				<div class="css-inputrow">
					<div class="css-titlename">등록일자</div>
					<div class="css-width"><input type="text" value="${detail.insertdate}" style="height: 44px; width:200px; padding-left: 5px; border-width: 2px;" readonly="readonly"></div>
				</div>
				<div class="css-inputrow">
					<div class="css-titlename">제목</div>
					<div class="css-width"><input type="text" value="${detail.intitle}" style="height: 44px; width:640px; padding-left: 5px; border-width: 2px;" readonly="readonly"></div>
				</div>
				<div class="css-inputrow">
					<div class="css-titlename">내용</div>
					<div class="css-width"><textarea class="css-textarea" readonly="readonly">${detail.incontent}</textarea></div>
				</div>
				<div class="css-inputrow">
					<div class="css-titlename">사진</div>
					<c:choose>
						<c:when test="${detail.inimage eq null}">
							<div class="css-width" style="margin-top: 12px;">사진이 없습니다.</div>
						</c:when>
						<c:otherwise>
						<div class="css-width">
							<img src="${pageContext.request.contextPath}/image/${detail.inimage}" style="height: 250px;">
						</div>
						</c:otherwise>
						</c:choose>
				</div>
				<div class="css-line12"></div>
				<div class="css-j0lifa ed9qr673"> <!-- 1:1 문의 div -->
					<div class="css-fhxb3m ed9qr672">
						<h2 class="css-1268zpe ed9qr671">문의내역 답변</h2>
					</div>
				</div>
				<div class="css-inputrow">
					<div class="css-titlename">진행상태</div>
					<div class="css-width"><input type="text" value="${detail.status}" style="height: 44px; width:100px; padding-left: 5px; border-width: 2px;" readonly="readonly"></div>
				</div>
				<div class="css-inputrow">
					<div class="css-titlename">답변 등록일자</div>
					<div class="css-width"><input type="text" value="${detail.answerdate}" style="height: 44px; width:200px; padding-left: 5px; border-width: 2px;" readonly="readonly"></div>
				</div>
				<div class="css-inputrow">
					<div class="css-titlename">답변</div>
					<div class="css-width"><textarea class="css-textarea" readonly="readonly">${detail.answer}</textarea></div>
				</div>
				</c:forEach>
				</div>
			</div>
		</div>
	
	<jsp:include page="footer.html"/>
</body>
</html>