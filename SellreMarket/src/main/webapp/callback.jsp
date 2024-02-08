<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>네이버로그인</title>
</head>
<body>
<%
    String clientId = "2uuBJL_CJSGPRvNs6XfU";
    String clientSecret = "AZDIw7wNQP";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8080/SellreMarket/callback.jsp", "UTF-8");
    String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    apiURL += "&scope=naverApiRead";

    System.out.println("apiURL=" + apiURL);

    try {
        URL tokenUrl = new URL(apiURL);
        HttpURLConnection tokenCon = (HttpURLConnection) tokenUrl.openConnection();
        tokenCon.setRequestMethod("GET");
        int tokenResponseCode = tokenCon.getResponseCode();

        BufferedReader tokenBr;
        System.out.print("tokenResponseCode=" + tokenResponseCode);

        if (tokenResponseCode == 200) { // 토큰 정상 호출
            tokenBr = new BufferedReader(new InputStreamReader(tokenCon.getInputStream()));
            String tokenInputLine;
            StringBuffer tokenRes = new StringBuffer();

            while ((tokenInputLine = tokenBr.readLine()) != null) {
                tokenRes.append(tokenInputLine);
            }

            tokenBr.close();
            if (tokenResponseCode == 200) {
                out.println("Token Response: " + tokenRes.toString());

                // 토큰 정보에서 access_token 추출
                Gson gson = new Gson();
                JsonObject tokenJson = gson.fromJson(tokenRes.toString(), JsonObject.class);
                String accessToken = tokenJson.get("access_token").getAsString();

                // 네이버 API를 호출할 URL을 생성합니다. (예: 사용자 프로필 정보 가져오기)
                String apiUrl = "https://openapi.naver.com/v1/nid/me";
                URL userUrl = new URL(apiUrl);
                HttpURLConnection userCon = (HttpURLConnection) userUrl.openConnection();
                userCon.setRequestMethod("GET");

                // Authorization 헤더에 액세스 토큰을 추가합니다.
                userCon.setRequestProperty("Authorization", "Bearer " + accessToken);

                // 사용자 정보 응답 코드를 확인합니다.
                int userResponseCode = userCon.getResponseCode();

                if (userResponseCode == 200) { // 성공적인 응답인 경우
                    // 사용자 정보를 읽어옵니다.
                    BufferedReader userBr = new BufferedReader(new InputStreamReader(userCon.getInputStream()));
                    String userInputLine;
                    StringBuilder userResponse = new StringBuilder();

                    while ((userInputLine = userBr.readLine()) != null) {
                        userResponse.append(userInputLine);
                    }

                    userBr.close();

                    // JSON 파싱을 통해 사용자 이름 추출
                    JsonObject userJson = gson.fromJson(userResponse.toString(), JsonObject.class);
                    JsonObject userResponseObj = userJson.getAsJsonObject("response");
                    String userName = userResponseObj.get("name").getAsString();

                    // 이름 출력
                    out.println("User Name: " + userName);
                } else {
                    // 사용자 정보 요청에서 에러 응답인 경우, 에러 처리를 수행합니다.
                    out.println("Error: " + userResponseCode);
                }
            }
        } else { // 에러 발생
            tokenBr = new BufferedReader(new InputStreamReader(tokenCon.getErrorStream()));
            String tokenInputLine;
            StringBuffer tokenRes = new StringBuffer();

            while ((tokenInputLine = tokenBr.readLine()) != null) {
                tokenRes.append(tokenInputLine);
            }

            tokenBr.close();
            out.println("Token Error Response: " + tokenRes.toString());
        }
    } catch (Exception e) {
        System.out.println(e);
    }
%>
</body>
</html>
