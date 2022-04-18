<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/mainHeader.jsp"></jsp:include>
<jsp:include page="./include/header.jsp"></jsp:include>
<meta charset="UTF-8">
<title>MBTIW</title>
<script>
	function backgClick() {
		alert("ha");

	}
	function goTest(event) {
		alert("gg");
		event.stopPropagation();
	}
</script>
</head>
<body>
		<div class="t_mini_banner">
			<div>
				<div style="float: left;">
					<h2>MBTI 유형별 여행</h2>
					<div>
						<img src="/resources/images/workationMain.png" width="300px;" height="300px;">
					</div>
					<h2>스트레스 진단</h2>
					<div>
						<img src="/resources/images/str.jpg" width="300px;" height="300px;">
					</div>
				</div>
			</div>
		</div>
		<div class="album_set">
			<h2>추천 여행지</h2>
				<div class="album_slider" style="display: flex;">
				<div id="map" style="width: 70%; height: 60vh; margin-right: 2%;"></div>
				<div style="display: flex; flex-direction: column; margin: 1%;">
					<div><img src="resources/images/workation1.png"></div>
					<div>
						<ul>
							<li>
								<div style="width: 570px; height: 170px; background: white; color: black;">
									<img src="resources/images/background_spring.jpg" width="250px;" height="150px;">
									<div style="display: inline-block;">
										<div>제주도</div>
										<div>멋져요</div>
										<div style="float: right;">120000</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				</div>
		</div>
	<div class="station_set" style="height: 700px;">
		<h2>워케이션 상품</h2>
		<ul class="workationUl">
			<li><a href="/reserv/1"><img src="/resources/images/jeju.png">
				<p class="title">제주도 워케이션</p>
				<p class="contents">[설레는 봄] 김포-제주왕복항공권 + 렌터캠핑카 30일</p></li></a>
			<li><img src="/resources/images/dokdo.png">
				<p class="title">가고 싶은 섬 워케이션</p>
				<p class="contents">[울릉도/독도] 15박 16일(KTX/BUS) + 3D프린터(렌트)</p></li>
			<li><img src="/resources/images/namdo.png">
				<p class="title">남도섬힐링 워케이션</p>
				<p class="contents">여수 섬! 여수 낭도 &선암사 59박 60일 + 개발용 슈퍼컴퓨터(렌트)</p></li>
			<li><img src="/resources/images/gosung.png">
				<p class="title">고성 워케이션</p>
				<p class="contents">[화진포, 능파대, 아야진해변, 청간정] 15박 16일 +개발용
					듀얼모니터,pc(렌트)</p></li>
		</ul>
	</div>
	<div class="f_mini_banner">
		<h2>사전 인증 이벤트</h2>
	</div>
<jsp:include page="./include/footer.jsp"></jsp:include>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_8yKsXYYJXoyYWaOuCrkov92vKIv0afM&callback=initMap&region=kr"></script>
	<script src="/resources/js/mapgo.js"></script>
</body>
</html>