<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 - 셀리마켓</title>
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
						<h2 class="css-1268zpe ed9qr671">공지사항</h2>
					</div>
				</div>
				
				<div class="css-inputrow" style="margin-bottom: 10px;">
					<div class="css-titlename">번호</div>
						<div class="css-width"><input type="text" value="${detailDto.eventid}" style="height: 30px; width: 80px; padding-left: 10px; margin-left: 57px; margin-top: 6px; margin-bottom: 10px; border: solid; border-color: lightgrey; border-width: 1px;" readonly="readonly"></div>
						<div class="css-titlename">작성자</div>
						<div class="css-width"><input type="text" value="셀리마켓" style="height: 30px; width: 250px; padding-left: 10px; margin-top: 6px; margin-left: 30px; border: solid; border-color: lightgrey; border-width: 1px;" readonly="readonly"></div>
					</div>
				<div>
					<div class="css-inputrow" style="margin-bottom: 10px;">
						<div class="css-titlename">작성일자</div>
						<div class="css-width"><input type="text" value="${detailDto.inputdate}" style="height: 30px; width: 250px; padding-left: 10px; margin-top: 6px; margin-bottom: 10px; margin-left: 57px; border: solid; border-color: lightgrey; border-width: 1px;" readonly="readonly"></div>
						<div class="css-titlename">진행여부</div>
						<div class="css-width"><input type="text" value="${detailDto.status}" style="height: 30px; width: 250px; padding-left: 10px; margin-top: 6px; margin-left: 30px; border: solid; border-color: lightgrey; border-width: 1px;" readonly="readonly"></div>
					</div>
					</div>
					<c:choose>
						<c:when test="${detailDto.startdate eq ''}"></c:when>
						<c:otherwise>
							<div class="css-inputrow" style="margin-bottom: 10px;">
								<div class="css-titlename">시작날짜</div>
								<div class="css-width"><input type="text" value="${detailDto.startdate}" style="height: 30px; width: 250px; padding-left: 10px; margin-top: 6px; margin-left: 57px; border: solid; border-color: lightgrey; border-width: 1px;" readonly="readonly"></div>
								<span style="margin-top : 15px;">~</span>
								<div class="css-titlename">종료날짜</div>
								<div class="css-width"><input type="text" value="${detailDto.enddate}" style="height: 30px; width: 250px; padding-left: 10px; margin-top: 6px; margin-left: 30px; border: solid; border-color: lightgrey; border-width: 1px;" readonly="readonly"></div>
							</div>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${detailDto.category eq 2}">
							<div class="css-inputrow">
								<div class="css-titlename">제목</div>
								<div class="css-width"><input type="text" value="[공지]  ${detailDto.ename}" style="height: 30px; width: 634px; padding-left: 10px; margin-top: 6px; border: solid; border-color: lightgrey; border-width: 1px;" readonly="readonly"></div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="css-inputrow">
								<div class="css-titlename">제목</div>
								<div class="css-width"><input type="text" value="[이벤트]  ${detailDto.ename}" style="height: 30px; width: 634px; padding-left: 10px; margin-top: 6px; border: solid; border-color: lightgrey; border-width: 1px;" readonly="readonly"></div>
							</div>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${detailDto.pname eq null}"></c:when>
						<c:otherwise>
							<div class="css-inputrow">
								<div class="css-titlename">적용 상품</div>
								<div class="css-width">
									<input type="text" style="height: 30px; width: 250px; padding-left: 10px; margin-top: 6px; border: solid; border-color: lightgrey; border-width: 1px;" readonly="readonly" value="${detailDto.pname}">
									<a href="#" style="margin-left: 30px; text-decoration: underline; font-weight: bold; color: blue;">상품 보러가기</a>
									</div>
							</div>
						</c:otherwise>
					</c:choose>
					<div class="css-inputrow">
						<div class="css-titlename">내용</div>
						<div class="css-width"><textarea id="contentarea" class="css-textarea" style="border: solid; border-color: lightgrey; border-width: 1px; padding-left: 10px;" rows="" cols="" readonly="readonly">${detailDto.econtent}</textarea>
						</div>
					</div>
					<div class="css-inputrow">
						<div class="css-titlename">첨부파일</div>
						<img class="css-width" src="${pageContext.request.contextPath}/image/event/new/${detailDto.img}" alt="첨부파일">
					</div>
					<div class="css-inputrow" style="border-bottom: solid; border-bottom-width: 2px;"></div>
					<div class="css-inputrow" style="justify-content: right;">감사합니다.</div>
				</div>
			</div>
		</div>
	<jsp:include page="footer.html" />
</body>
</html>