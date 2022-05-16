<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/mainHeader.jsp"></jsp:include>
<jsp:include page="./include/header.jsp"></jsp:include>
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
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

<script>

$(function(){
	const swiper = new Swiper('.swiper', {
		
		slidesPerView: 4,
		spaceBetween: 10,
		  // Optional parameters
		  loop: true,

		  // If we need pagination
		  pagination: {
		    el: '.swiper-pagination',
		  },

		  // Navigation arrows
		  navigation: {
		    nextEl: '.swiper-button-next',
		    prevEl: '.swiper-button-prev',
		  },

		  // And if we need scrollbar
		  scrollbar: {
		    el: '.swiper-scrollbar',
		  },
	});
});
</script>
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
	
	<div class="station_set" style="height: 700px;">
	<h2>워케이션 상품 </h2>
	<ul class="swiper">
		 <!-- Additional required wrapper -->
		 <div class="swiper-wrapper">
			 <c:if test="${workationList.size() < 1 }">
			 	<li style="margin-left: 5%;">등록된 워케이션 상품이 없습니다.</li>
			 </c:if>
			<c:forEach items="${workationList}" var="item">
				<li class="swiper-slide"><a href="/reserv/${item.room.roomId }"><img src="/upload/${item.images[0].uuid }_${item.images[0].filename}" width="250px" height="250px;">
				<p class="title" style="color: #FE7F2D;">${item.productName}</p>${item.productExplanation }
				<p class="contents">${item.productName}+ ${item.workationName}</p></a></li>
			</c:forEach>
		</div>
		<!-- If we need navigation buttons -->
	  <div class="swiper-button-prev"></div>
	  <div class="swiper-button-next"></div>
	</ul>
	</div>
	
	<div class="album_set">
		<h2>추천 여행지</h2>
			<div class="album_slider" style="display: flex;">
			<div id="map" style="width: 50%; height: 70vh;"></div>
			<div style="width: 50%; height: 70vh; overflow: scroll; overflow-x: hidden">
					<ul>
						<c:if test="${roomList.size() < 1 }">
						 	<li>등록된 호텔이 없습니다.</li>
						 </c:if>
						<c:forEach items="${roomList}" var="item" varStatus="status">
							<li>
								<div class="roomProduct" style="background: #DDDDFF; color: black; cursor: pointer;" data-order="${status.index}" data-latitude="${item.latitude}" data-longitude="${item.longitude}" data-loc="${item.loc }" data-filename="/upload/${item.images[0].uuid }_${item.images[0].filename}" data-roomid="${item.roomId }">
									<div style="display: inline-block; font-size: 18px; background-color: white;"><img src="/upload/${item.images[0].uuid }_${item.images[0].filename}" width="250px" height="150px" align="left" alt="이미지를 등록해주세요." style="margin-right: 2%;"><p style="margin-top: 2%;">${item.content }</p></div>
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
	<jsp:include page="./include/footer.jsp"></jsp:include>
	<script src="/resources/js/indexJs.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_8yKsXYYJXoyYWaOuCrkov92vKIv0afM&callback=initMap&region=kr"></script>
		<script src="/resources/js/mapgo.js"></script>
</body>
</html>