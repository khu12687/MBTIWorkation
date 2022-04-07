<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/mainHeader.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/login.css" type="text/css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
</head>
<body>
	<a href="/" style="width: 260px;; height: 47px; background: white;"><img src="/resources/images/mainlogo.png" style="width: 260px; height: 47px;"></a>
	<div id="login-button">
		<img
			src="https://dqcgrsy5v35b9.cloudfront.net/cruiseplanner/assets/img/icons/login-w-icon.png">
		</img>
	</div>
	<div id="container">
		<h1>Log In</h1>
		<span class="close-btn"> <img
			src="https://cdn4.iconfinder.com/data/icons/miu/22/circle_close_delete_-128.png"></img>
		</span>

		<form method="post">
			<input type="email" name="id" placeholder="E-mail"> <input
				type="password" name="password" placeholder="Password"> 
				<button>Log in</button>
			<div id="remember-container">
				<input type="checkbox" id="checkbox-2-1" class="checkbox"
					checked="checked" /> <span id="remember">Remember me</span> <span
					id="forgotten">Forgotten password</span>
			</div>
		</form>
	</div>

	<!-- Forgotten Password Container -->
	<div id="forgotten-container">
		<h1>Forgotten</h1>
		<span class="close-btn"> <img
			src="https://cdn4.iconfinder.com/data/icons/miu/22/circle_close_delete_-128.png"></img>
		</span>

		<form>
			<input type="email" name="id" placeholder="E-mail"> <a
				href="javascript:alert('새로운 비번')" class="orange-btn">Get new password</a>
		</form>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>
	<script src="/resources/js/login.js"></script>
</body>
</html>