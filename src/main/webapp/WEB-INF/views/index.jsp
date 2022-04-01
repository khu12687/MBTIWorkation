<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/mainHeader.jsp"></jsp:include>
<meta charset="UTF-8">
<title>MBTIW</title>
<style>

</style>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_8yKsXYYJXoyYWaOuCrkov92vKIv0afM&callback=initMap&region=kr"></script>
<script>

function initMap() {
	const mapOptions = {
		    zoom: 8,
		    center: { lat: 36.321655 ,lng: 127.378953 },
 	 };
    map = new google.maps.Map(document.getElementById("map"), mapOptions);

    const marker = new google.maps.Marker({
      position: { lat: 36.321655, lng: 127.378953 },
      map: map,
    });
    const infowindow = new google.maps.InfoWindow({
      content: "<p>Marker Location:" + marker.getPosition() + "</p>",
    });
    google.maps.event.addListener(marker, "click", () => {
      infowindow.open(map, marker);
    });
  }
function backgClick(){
	alert("ha");
	
}
function goTest(event){
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
                    <ul class="util">
                        <li>로그인</li>
                        <li>회원가입</li>
                        <li>회사소개</li>
                        <li>고객샌터</li>
                    </ul>
    			    <div style="float: left; width: 100%;">
    			    	<div>
    			    		<img src="/resources/images/mainlogo.png">
    			    	</div>
                      	<div>                        
	                    	<form>                    	
	                       		<input style="padding: 0 1em; border: 1px solid gray; height: 38px; width: 30%; border-radius: 30px;" size="10" type="text" value="${keyword }" placeholder="제주 워케이션 상품 최저가!" name ="keyword">
	                    	</form>
                        </div>
                        <div>
                        	ㅂㅂ
                       </div>
                    </div>
                </div>
            </div>
            <div class="bottom_header" style="margin-top: 2%;">
                <div class="inner">
                    <ul class="menu">
                        <li>항공</li>
                        <li>숙박</li>
                        <li>제주도</li>
                        <li>국내여행</li>
                    </ul>
           
                </div>
            </div>
        </div>
                <div class="t_mini_banner">
                    <div class="inner">
                        <h2 >MBTI 유형별 여행</h2>
                        
                    </div>
                </div>
                <div class="album_set">
                    <h2>추천 여행지</h2>
                    <div>
                        <div class="album_slider">
                       		<div style="text-align: center; background-image: url(/resources/images/background.png);">		
		 					 <div id="map" style="width:80%; height: 50vh; display: inline-block;"></div>
							</div>
                            </div>
                            <div class="btn_next">
                                <img src="img/slick-next.png">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="station_set">
                    <h2>STATION</h2>
                    <ul>
                        <li>
                            <img src="img/ico_stat_01.png">
                            <p class="title">인디스웨이</p>
                            <p class="contents">인디음악으로 향하는길 </p>
                        </li>
                        <li>
                            <img src="img/ico_stat_02.png">
                            <p class="title">정기고의 SOULBY SEL</p>
                            <p class="contents">KRNB 뮤직 토크쇼</p>
                        </li>
                        <li>
                            <img src="img/ico_stat_03.png">
                            <p class="title">POPCAST</p>
                            <p class="contents">글로벌 뮤직 트렌드 & 이슈</p>
                        </li>
                        <li>
                            <img src="img/ico_stat_04.png">
                            <p class="title">SMing</p>
                            <p class="contents">With SM ENTERTAINMENT</p>
                        </li>
                        <div class="space"></div>
                    </ul>
                </div>
                <div class="f_mini_banner"></div>
                <div class="board_set">
                    <div class="inner">
                        <h2>공지사항</h2>
                        <p>개인정보처리방침 개정 안내</p>
                        <ul>
                            <li class="date">2021-08-25</li>
                            <li class="more">MORE</li>
                            <div class="space"></div>
                        </ul>
                        <div class="space"></div>
                    </div>
                </div>
            </div>
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
                        <div class="space"></div>
                    </ul>
                </div>
            </div>
            <div class="bottom_footer">
                <div class="inner">
                    <div class="f_logo">
                        <img src="img/logo_btm.png">
                    </div>
                    <div class="copyright">
                        <ul>
                            <li>
                                <span>주소</span>
                                경기도 성남시 분당구 판교역로 235 4층
                            </li>
                            <li>
                                <span>대표자</span>
                                이제욱
                            </li>
                            <li>
                                <span>이메일</span>
                                musicake@kakao.com
                            </li>
                        </ul>
                        <p>
                            © Musicake Company Corp.
                        </p>
                    </div>
                    <div class="info">
                        <ul>
                            <li>
                                <span>고객센터</span>
                                1877-8000
                            </li>
                            <li>
                                070-8100-1000 <span>(인터넷 무료전화)</span>
                            </li>
                            <div class="space"></div>
                        </ul>
                    </div>
                    <div class="space"></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>