<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="/resources/css/images/mbtiLogo.png" />
<link href="https://fonts.googleapis.com/css2?family=Chango&display=swap" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/common.css" type="text/css">

<header>
 <!-- 네비게이션 바 -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">
                <img src="/resources/css/images/MBTI.png" alt="" width="30" height="30" style="border-radius: 50%;" class="d-inline-block align-text-top">
                <strong style="margin-right: 3%;"><a style="color: black;" href="/">MBTIW</a></strong>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-0 mb-lg-0">
                    <li class="nav-item">
                    	<form>                    	
                       		<input style="padding: 0 1em; border: 1px solid gray; height: 38px; width: 100%; border-radius: 30px;" size="20" type="text" value="${keyword }" placeholder="제주 워케이션 상품 최저가!" name ="keyword">
                    	</form>
                    </li>
                </ul>
                <ul class="navbar-nav">
                 	<li class="nav-item">
				    	 <a class="nav-link" href="">마이페이지</a>
                    </li>
                    <li class="nav-item">
                       	<a class="nav-link" href="">고객샌터</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

</header>