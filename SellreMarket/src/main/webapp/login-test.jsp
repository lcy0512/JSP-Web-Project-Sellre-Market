<%@page import="com.market.testapi.TestAPI"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.IOException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <h1>Naver Login Example</h1>

    <!-- 네이버 로그인 버튼 -->
    <a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=2uuBJL_CJSGPRvNs6XfU&redirect_uri=http://localhost:8080/SellreMarket/login-test.jsp&state=STATE_STRING">네이버로 로그인</a>

	<%
    // 네이버 API 서비스 객체 생성
    TestAPI naverApiService = new TestAPI();

    try {
        // 네이버 API에서 데이터 가져오기
        String naverData = naverApiService.fetchDataFromNaverApi("검색어");

        // 가져온 데이터 출력
        out.println("<p>Naver API에서 가져온 데이터: " + naverData + "</p>");
    } catch (IOException e) {
        // 예외 처리
        out.println("<p>데이터를 가져오는 중에 오류가 발생했습니다.</p>");
        e.printStackTrace();
    }
%>

</body>
</html>