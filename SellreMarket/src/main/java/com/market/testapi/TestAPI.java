package com.market.testapi;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

public class TestAPI {

    // 네이버 검색 API 요청 URL
    private static final String NAVER_API_URL = "https://openapi.naver.com/v1/search/blog.json";

    // 발급받은 네이버 API 키
    private static final String NAVER_API_KEY = "2uuBJL_CJSGPRvNs6XfU";  // 실제 클라이언트 아이디로 교체
    private static final String NAVER_API_SECRET = "AZDIw7wNQP";  // 실제 클라이언트 시크릿으로 교체

    // 네이버 API를 사용하여 데이터를 가져오는 메서드
    public String fetchDataFromNaverApi(String query) throws IOException {
        // 검색어를 UTF-8로 인코딩
        String encodedQuery = URLEncoder.encode(query, "UTF-8");

        System.out.printf("인코딩된 검색어: %s\n", encodedQuery);

        // API 요청 URL 생성
        String apiUrl = NAVER_API_URL + "?query=" + encodedQuery;

        System.out.printf("API 요청 URL: %s\n", apiUrl);

        // HTTP 연결 설정
        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("X-Naver-Client-Id", NAVER_API_KEY);
        connection.setRequestProperty("X-Naver-Client-Secret", NAVER_API_SECRET);

        // 응답 코드 확인
        int responseCode = connection.getResponseCode();
        System.out.println("HTTP 응답 코드: " + responseCode);

        // API 응답 헤더 확인
        Map<String, List<String>> headers = connection.getHeaderFields();
        for (Map.Entry<String, List<String>> entry : headers.entrySet()) {
            System.out.println(entry.getKey() + ": " + entry.getValue());
        }

        if (responseCode == HttpURLConnection.HTTP_OK) {
            // API 응답 데이터 읽기
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;

            while ((line = reader.readLine()) != null) {
                response.append(line);
            }

            reader.close();

            // 성공적으로 데이터를 가져왔을 때의 작업 수행
            System.out.println("API 요청에 성공했습니다. 결과:");
            System.out.println(response.toString());

            return response.toString();
        } else {
            System.out.println("API 요청에 실패했습니다. 응답 메시지: " + connection.getResponseMessage());
            throw new IOException("API 요청에 실패했습니다. 응답 코드: " + responseCode);
        }
    }

    public static void main(String[] args) {
        TestAPI testAPI = new TestAPI();
        try {
            // 예제 검색어, 실제 검색어로 대체 가능
            String result = testAPI.fetchDataFromNaverApi("자바");
            // 결과를 필요에 따라 출력
            System.out.println(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}