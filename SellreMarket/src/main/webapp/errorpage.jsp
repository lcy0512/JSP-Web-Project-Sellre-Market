<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류!</title>
<link rel="stylesheet" href="css/inquirywrite.css" />
</head>
<body>
	<jsp:include page="header.jsp" />
	<div style="display: flex; flex-direction: column; justify-content: center; align-items: center; min-height: 80vh; padding: 0 20px;">
    <h1 style="font-size: 3.5vw; margin-bottom: 20px;">오류! 불편을 드려 죄송합니다.</h1>
    <p style="font-size: 1.5vw; text-align: center; margin-bottom: 20px;">주소가 잘못 입력되었거나, 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.</p>
    <p style="font-size: 1.5vw; text-align: center; margin-bottom: 20px;">
        궁금하신 사항은 <a href="inquiry.do" style="color: lightcoral; text-decoration: underline; font-weight: bold;">1:1 문의</a>를 부탁드립니다.
    </p>
    
    <div class="css-line12" style="width: 100%; max-width: 700px; height: 1px; background-color: lightgrey; margin-bottom: 20px;"></div>
    
    <a href="mainPage.do" style="width: 100%; max-width: 300px;">
        <button id="btn" class="css-submitbtn" style="width: 100%; font-size: 1.2vw;">메인화면 돌아가기</button>
    </a>
</div>
	<jsp:include page="footer.html" />
</body>
</html>