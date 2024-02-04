<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
  <table class="table table-bordered">
    <tr>
      <td>
        <!-- 이미지 -->
        <img src="이미지URL" alt="이미지" style="width: 25%;">
      </td>
      <td colspan="2">
        <!-- 큰 제목 -->
        <h1 class="text-left">큰 제목</h1>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <!-- 원가 -->
        <p class="text-left"><del>원가: ₩00,000원</del></p>
      </td>
    </tr>
    <tr>
      <td>
        <!-- 할인율 -->
        <p>할인율: 00%</p>
        <!-- 텍스트 -->
        <p>텍스트 1</p>
        <p>텍스트 2</p>
        <p>텍스트 3</p>
        <p>텍스트 4</p>
        <p>텍스트 5</p>
        <p>텍스트 6</p>
      </td>
      <td>
        <!-- 가격 -->
        <p>가격: ₩00,000원</p>
        <!-- 내용 -->
        <p>내용 1</p>
        <p>내용 2</p>
        <p>내용 3</p>
        <p>내용 4</p>
        <p>내용 5</p>
        <!-- 콤보박스 -->
        <select class="form-control">
          <option selected>상품을 선택해주세요</option>
          <option value="사과">사과</option>
          <option value="딸기">딸기</option>
          <option value="배">배</option>
        </select>
      </td>
    </tr>
  </table>
</div>
</body>
</html>
