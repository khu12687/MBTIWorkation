<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/mainHeader.jsp"></jsp:include>
<jsp:include page="./include/header.jsp"></jsp:include>
<meta charset="UTF-8">
<title>MBTIW</title>
<style>
#container{
    width: 615px; /*이미지 공간 600 gap 공간 15 공간 총 415*/ 
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
    
    $(".roomProduct").mouseover(function(e){
    	//alert(this.dataset.order);
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
 //이미지를 따라다니는 사각형 생성!!
 function createRect(){
    box = document.createElement("div");
    box.style.position ="absolute"; //이미지 위에 얹혀져야 하므로 중첩이 가능하게
    box.style.left=0+"px";
    box.style.top=0+"px";
    box.style.width=140+"px";
    box.style.height=90+"px";

    box.style.background="blue";
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
			<div>
				<div>
					<img src="/resources/images/mainVacation.png" width="500px;" height="500px;">
					<h2>MBTI 유형별 여행</h2>
					<div>
						<div id="container"></div>
					</div>
					<div id="mbtiproduct">
						<img src="/resources/images/mbti0.png">
					</div>
				</div>
			</div>
		</div>
		<div class="album_set">
			<h2>추천 여행지</h2>
				<div class="album_slider" style="display: flex;">
				<div id="map" style="width: 70%; height: 70vh; margin-right: 2%;"></div>
				<div>
						<ul>
							<c:forEach items="${roomList}" var="item" varStatus="status">
								<li>
									<div class="roomProduct" style="width: 570px; height: 170px; background: white; color: black;" data-order="${status.index}">
										<img src="resources/images/background_spring.jpg" width="250px;" height="150px;">
										<div style="display: inline-block;">
											<div>${item.loc }</div>
											<div>${item.maxNumber }</div>
											<div>${item.price }</div>
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