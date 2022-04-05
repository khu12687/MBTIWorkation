<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/mainHeader.jsp"></jsp:include>
<meta charset="UTF-8">
<title>MBTIW</title>
<style>
.workationUl li img {
	width: 250px;
	height: 250px;
}

#mainInput {
	padding: 0 1em;
	border: 1px solid gray;
	height: 38px;
	border-radius: 30px;
}
</style>

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
	<div id="wrap">
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
						<li>로그인</li>
						<li>회원가입</li>
						<li>회사소개</li>
						<li>고객샌터</li>
					</ul>
				</div>
			</div>
			<div style="float: left; width: 100%;">
				<div style="text-align: center;">
					<img src="/resources/images/mainlogo.png">
				</div>
				<div style="float: right; margin-right: 10%;">
					<form>
						<input type="text" id="mainInput" size="30"
							placeholder="제주 워케이션 상품 최저가!" value="" name="keyword">
					</form>
				</div>
			</div>

		</div>
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
			<div>
				<div class="album_slider">
					<div style="text-align: center;">
						<div id="map" style="width: 100%; height: 50vh;"></div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="station_set" style="height: 700px;">
		<h2>워케이션 상품</h2>
		<ul class="workationUl">
			<li><img src="/resources/images/jeju.png">
				<p class="title">제주도 워케이션</p>
				<p class="contents">[설레는 봄] 김포-제주왕복항공권 + 렌터캠핑카 30일</p></li>
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
	<div id="footer">
		<div class="top_footer">
			<div class="inner">
				<ul>
					<li>이용약관</li>
					<li class="bold">위치기반서비스 이용약관</li>
					<li class="bold">개인정보처리방침</li>
					<li>청소년보호정책</li>
					<li>제휴/프로모션문의</li>
					<li>이메일주소무단수집거부</li>
					<li>파트너센터</li>
				</ul>
			</div>
		</div>
		<div class="bottom_footer">
			<div class="inner">
				<div class="copyright">
					<ul>
						<li><span>주소</span> 경기도 성남시 분당구 판교역로</li>
						<li><span>대표자</span> 김현우</li>
						<li><span>이메일</span> khu12687@naver.com</li>
					</ul>
					<p>© MBTIWORKATIN Company Corp.</p>
				</div>
				<div class="info">
					<ul>
						<li><span>고객센터</span> 0000-0000</li>
						<li>010-7256-1983 <span>(대표전화)</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_8yKsXYYJXoyYWaOuCrkov92vKIv0afM&callback=initMap&region=kr"></script>
	<script src="/resources/js/mapgo.js"></script>
</body>
</html>