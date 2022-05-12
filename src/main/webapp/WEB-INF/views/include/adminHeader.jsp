<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<style>
button {
	background-color: #F7F9FA;
	 border: 1px solid #efefef; 
}
.mai{
	width: 400px;
	margin: 5%;
	border : 1px solid #EBEBEB;
	border-radius: 8px;
	overflow: hidden;
	color: black;
	font-weight: bolder;
	
}
lable{
	font-size: 16px;
	
}
select{
	width: 100%;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap css-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap icon css-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">
</head>
<body>
<div class="topnav">
  <a class="active" href="/admin/index">Home</a>
  <a href="/admin/category">카테고리 관리</a>
  <a href="/admin/imgManage">호텔 관리</a>
  <a href="/admin/product">상품관리</a>
  <a href="/admin/memberInfo">회원정보</a>
  <a href="/admin/reservInfo">결제정보</a>
  <a>${sessionScope.admin.name}님 로그인 중</a>
  <a href="/admin/logout">로그아웃</a>
</div>
</body>
</html>