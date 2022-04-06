<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://fonts.googleapis.com/css2?family=Chango&display=swap" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>MBTIW</title>
<div id="header">
	<div class="top_header">
		<div class="inner">
			<ul class="site">
				<li>개인</li>
				<li>기업</li>
			</ul>
			<div class="inner">
				<ul class="menu">
					<li>항공</li>
					<li>숙박</li>
					<li>제주도</li>
					<li>국내여행</li>
				</ul>
			</div>
			<ul class="util">
				<li><a href="/member/login">로그인</a></li>
				<li><a href="/member/regist">회원가입</a></li>
				<li>회사소개</li>
				<li>고객샌터</li>
			</ul>
		</div>
	</div>
	<div style="float: left; width: 100%;">
		<div style="text-align: center;">
			<a href="/"><img src="/resources/images/mainlogo.png"></a>
			<div >
				<form>
					<input type="text" id="mainInput" size="30"
						placeholder="제주 워케이션 상품 최저가!" value="" name="keyword">
				</form>
			</div>
		</div>
	</div>

</div>
