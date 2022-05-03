<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/mainHeader.jsp"></jsp:include>
<jsp:include page="./include/header.jsp"></jsp:include>
<meta charset="UTF-8">
<title>MBTIW</title>
<style>
#container{
    width: 615px; 
    height: 215px;
    margin: auto;
    position: relative; /*자식떄문에.. 명시*/
    text-align: center;
}
</style>
<script src="/resources/js/indexJs.js"></script>
</head>
<body>
		<div class="t_mini_banner">
		<img src="/resources/images/workationImg.jpg" height="900px">
			<h2>MBTI 유형별 워케이션</h2>
			<div>
				<div id="container"></div>
			</div>
			<div id="mbtiproduct" style="background: #F67D7C; height: 400px;">
				<img src="/resources/images/mbti0.png" width="700px;" height="400px;">
			</div>
		</div>
		<div class="album_set">
			<h2>추천 여행지</h2>
				<div class="album_slider" style="display: flex;">
				<div id="map" style="width: 50%; height: 70vh;"></div>
				<div style="width: 50%; height: 70vh; overflow: scroll; overflow-x: hidden">
						<ul>
							<c:forEach items="${roomList}" var="item" varStatus="status">
								<li>
									<div class="roomProduct" style="background: #94CFC9; color: black; cursor: pointer;" data-order="${status.index}" data-latitude="${item.latitude}" data-longitude="${item.longitude}" data-loc="${item.loc }" data-filename="${item.images[0].filename}">
										<div style="display: inline-block; font-size: 18px; background-color: #8BDAEB;"><img src="resources/images/${item.images[0].filename}" width="250px" height="150px" align="left" style="margin-right: 2%;"><p style="margin-top: 2%;">${item.content }</p></div>
										<div>
											<div>${item.loc }</div>
											<div style="float: right; background: #"><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.price }" />원</div>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
				</div>
				</div>
		</div>
	<div class="station_set" style="height: 700px;">
		<h2>워케이션 상품</h2>
		<ul class="workationUl">
			<li><a href="/reserv/1"><img src="/resources/images/jeju.png">
				<p class="title" style="color: #FE7F2D;">제주도 워케이션</p>
				<p class="contents">[설레는 봄] 김포-제주왕복항공권 + 렌터캠핑카 30일</p></li></a>
			<li><img src="/resources/images/dokdo.png">
				<p class="title" style="color: #FCCA46;">가고 싶은 섬 워케이션</p>
				<p class="contents">[울릉도/독도] 15박 16일(KTX/BUS) + 3D프린터(렌트)</p></li>
			<li><img src="/resources/images/namdo.png">
				<p class="title" style="color: #FF5967;">남도섬힐링 워케이션</p>
				<p class="contents">여수 섬! 여수 낭도 &선암사 59박 60일 + 개발용 슈퍼컴퓨터(렌트)</p></li>
			<li><img src="/resources/images/gosung.png">
				<p class="title" style="color: #579C87;">고성 워케이션</p>
				<p class="contents">[화진포, 능파대, 아야진해변, 청간정] 15박 16일 +개발용
					듀얼모니터,pc(렌트)</p></li>
		</ul>
	</div>
	<jsp:include page="./include/footer.jsp"></jsp:include>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_8yKsXYYJXoyYWaOuCrkov92vKIv0afM&callback=initMap&region=kr"></script>
		<script src="/resources/js/mapgo.js"></script>
</body>
</html>