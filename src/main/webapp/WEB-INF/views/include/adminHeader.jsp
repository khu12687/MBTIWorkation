<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
</head>
<body>
<div class="topnav">
  <a class="active" href="/admin/index">Home</a>
  <a href="/admin/category">카테고리 관리</a>
  <a href="/admin/product/list">상품관리</a>
  <a href="/admin/member/index">회원정보</a>
  <a href="/admin/order/index">결제정보</a>
  <a href="/admin/cs/index">고객센터</a>
  <a>${sessionScope.admin.name}님 로그인 중</a>
  <a href="/admin/logout">로그아웃</a>
  
</div>
</body>
</html>