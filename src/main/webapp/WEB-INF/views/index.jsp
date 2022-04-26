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
<script>
var container;
var box; 
var a=0.1; 
var targetX =0; 
var targetY =0; 
$(() =>{
    container = document.getElementById("container");
    createImg();
    createRect(); 
    setInterval("move()",25);
    
    $(".roomProduct").click(function(e){
		location.href="reserv/1";    	
    });
    
    $(".roomProduct").mouseover(function(e){
    	var lati = parseFloat(this.dataset.latitude);
    	var longi = parseFloat(this.dataset.longitude);
    	var loc = this.dataset.loc;
    	var filename = this.dataset.filename;
    	map = new google.maps.Map(document.getElementById('map'),{
    		center: {lat: lati, lng: longi},
    		zoom:13
    	})
    	const contentString =
    	    '<div id="content">' +
    	    '<img src="/resources/images/'+filename+'" width="700px;" height="500px;">'+
    	    '<p><a href="/reserv/1">' +
    	    loc+"</a> " +
    	    "</p>" +
    	    "</div>";
    	  
   		const infowindow = new google.maps.InfoWindow({
   			content: contentString,
   		});

    	const marker = new google.maps.Marker({
    	    position: { lat: lati ,lng: longi },
    	    map,
    	    title:loc,
    	    label: loc
    	  });
    	
    	marker.addListener("click", () => {
    	    infowindow.open({
    	      anchor: marker,
    	      map,
    	      shouldFocus: false,
    	    });
    	  });
    	
    });
    
});
var gap=5; 
var count=0;
function createImg(){
    for(var a=0; a<2; a++){ 
        for(var i=0; i<4; i++){
            var img = document.createElement("img");
            img.src="/resources/images/i"+(count)+".png"; 
            img.style.cursor="pointer";
            img.style.width=140+"px";
            img.style.height=100+"px";
            img.style.position="absolute";
            img.style.left=i*(140+gap)+"px";
            img.style.top=a*(100+gap)+"px";
			img.dataset.column = count;
            img.addEventListener("click",function(){
                targetX=parseInt(this.style.left);
                targetY=parseInt(this.style.top);
                
                $("#mbtiproduct").children().remove();
                
	        	 mbtiImg = $('<img>',{
	        		 'src' : '/resources/images/mbti'+(this.dataset.column)+'.png'
	        	 });
        		 $("#mbtiproduct").append(mbtiImg);
                
            });
            container.appendChild(img); //이미지를 컨테이너에 넣음 컨테이너 자식으로 img을 줌
            count++;
        }
    }
 }
 function createRect(){
    box = document.createElement("div");
    box.style.position ="absolute"; //이미지 위에 얹혀져야 하므로 중첩이 가능하게
    box.style.left=0+"px";
    box.style.top=0+"px";
    box.style.width=140+"px";
    box.style.height=90+"px";

    box.style.background="white";
    box.style.opacity=0.6; 

    container.appendChild(box);
 }
 function move(){  
    box.style.left=parseFloat(box.style.left)+a*(targetX-parseFloat(box.style.left))+"px";
    box.style.top=parseFloat(box.style.top)+a*(targetY-parseFloat(box.style.top))+"px";
 }
</script>
</head>
<body>
		<div class="t_mini_banner">
			<img src="/resources/images/mainVacation.png" width="700px;" height="500px;">
			<h2>MBTI 유형별 여행</h2>
			<div>
				<div id="container"></div>
			</div>
			<div id="mbtiproduct">
				<img src="/resources/images/mbti0.png" width="700px;" height="500px;">
			</div>
		</div>
		<div class="album_set">
			<h2>추천 여행지</h2>
				<div class="album_slider" style="display: flex;">
				<div id="map" style="width: 70%; height: 70vh; margin-right: 2%;"></div>
				<div style="width: 70%; height: 70vh;">
						<ul>
							<c:forEach items="${roomList}" var="item" varStatus="status">
								<li>
									<div class="roomProduct" style="width: 570px; height: 170px; background: white; color: black; cursor: pointer;" data-order="${status.index}" data-latitude="${item.latitude}" data-longitude="${item.longitude}" data-loc="${item.loc }" data-filename="${item.images[0].filename}">
										<img src="resources/images/${item.images[0].filename}" width="250px;" height="150px;">
										<div style="display: inline-block;">
											<div>${item.loc }</div>
											<div>${item.num }</div>
											<div><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.price }" />원</div>
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
<jsp:include page="./include/footer.jsp"></jsp:include>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_8yKsXYYJXoyYWaOuCrkov92vKIv0afM&callback=initMap&region=kr"></script>
		<script src="/resources/js/mapgo.js"></script>
</body>
</html>