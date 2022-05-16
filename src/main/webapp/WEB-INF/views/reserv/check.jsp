<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/mainHeader.jsp"></jsp:include>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/reserv.css" type="text/css">
<style>
#map {
	width: 650px;
	height: 40vh;
	display: inline-block;
	border: 1px solid #EBEBEB;
	border-radius: 8px;
}
</style>
<script>
$(function(){
	$($(".getReserv")).click(function(){
		const item = {
				reservationId : $("#reservId").val()
		}
		$.ajax("",{
			method: "POST",
			contentType: "application/json",
			dataType: "json",
			data: JSON.stringify(item),
			success: result =>{
				getList(result);
			},
			error: (xhr, result) => alert("등록된 예약이 없습니다")
		})
		
	});
	
	$($(".getReservNumber")).click(function(){
		const item = {
				phone : $("#phone").val()
		}
		$.ajax("getReservNumber",{
			method: "POST",
			contentType: "application/json",
			dataType: "json",
			data: JSON.stringify(item),
			success: result =>{
				alert("예약번호 : "+result[0].reservationId);
			},
			error: (xhr, result) => alert("등록된 헨드폰 번호가 없거나 예약이 없습니다.")
		})
		
	});
	
});

function del(){
	const item = {
			reservationId : $("#reservId").val()
	}
	$.ajax("del",{
		method: "POST",
		contentType: "application/json",
		dataType: "json",
		data: JSON.stringify(item),
		success: result =>{
			alert("예약이 취소 되었습니다.");
			$("#reserInfo").empty(); 
			$("#map").empty();
			$("#reserInfo").append("<h2>예약이 취소 되었습니다.</h2>");
			$("#reserInfo").append("<a href='/'>확인</a>");
		},
		error: (xhr, result) => alert("실패")
	})
	
}

function getList(info){
	$.ajax("",{
		method: "GET",
		
		success: result => {
			$("#reserInfo").empty(); 
			$("#reserInfo").append("<h2>예약이 확인 되었습니다.</h2>");
			$("#reserInfo").append("<div class='infoWrap'><div style='background: white;'><h2>객실</h2><table class='tableInfo'><tr><th>호텔</th><td>"+info.room.loc+"</td></tr><tr><th>객실타입</th><td>"+info.roomOption.roomType+"</td></tr><tr><th>인원수</th><td>"+info.roomOption.maxNumber+"</td></tr><tr><th>프로모션</th><td>"+info.serviceOption.serviceName+"</td></tr><tr><th>워케이션 옵셥</th><td>"+info.workationOption.workationName+"</td></tr></table><h2>결제정보</h2><table class='tableInfo'><tr><th>가격 </th><td>"+info.totalPay+"원</td></tr><tr><th>CHECKIN </th><td>"+info.checkIn+"</td></tr><tr><th>CHECKOUT </th><td>"+info.checkOut+"</td></tr></table><h2>예약자 정보</h2><table class='tableInfo'><tr><th>예약자명</th><td><input type='text' value='${sessionScope.member.name}' readonly></td></tr><tr><th>이메일</th><td><input type='email' value='${sessionScope.member.id}' readonly></td></tr><tr><th>휴대폰 번호 </th><td><input type='text' value='${sessionScope.member.phone}' readonly></td></tr><tr><th>전화번호(선택) </th><td><input type='text' value='${sessionScope.member.phone}' readonly></td></tr></table><h2>이용동의</h2><p style='font-size: 7px;'>취소수수료<br>예약을 취소하실 경우, 해당 숙소의 취소 규정에 따라 각 입실일 별 취소수수료가 부과 됩니다.<br><br>[객실1] (디럭스·더블·산전망 / 디럭스 마운틴 더블)<br>입실일 04월 05일 ~ 1박 기준- 입실 1일 전[04/04 (월)]17시까지 100% 환불<br>- 입실 당일[04/05 (화)]17시까지 0% 환불<br>- 취소가능 일은 인터파크투어 영업일 (일요일/공휴일 제외) <br>기준으로 산정되며,취소마감시간 [평일17시 / 토요일10시] 이후 취소 시 에는 다음날 취소된 것으로 인정됩니다.<br>- 취소수수료는 할인(쿠폰) 적용 전 객실 정상 판매금액을 기준으로 책정됩니다.<br></p><a href='/'>확인</a></div></div>");
			$("#reserInfo").append("<div onclick='del()' style='cursor:pointer;'>예약취소"+"</div>");
			goMap(info);
		},
		error: (xhr, result) => console.log(123)
	});
}
function goMap(info){
	var lati = parseFloat(info.room.latitude);
	var longi = parseFloat(info.room.longitude);
	var loc = info.room.loc;
	map = new google.maps.Map(document.getElementById('map'),{
		center: {lat: lati, lng: longi},
		zoom:13
	})

	const marker = new google.maps.Marker({
	    position: { lat: lati ,lng: longi },
	    map,
	    title:loc,
	    label: loc
	  });
	
}

</script>
</head>
<body>
	<div style="height: 2000px; text-align: center;">
		<div class="infoWrap">
			<h2>예약확인</h2>
			<table class="tableInfo">
				<tr>
					<th>예약번호</th>
					<td><input type="number" name="reservationId" id="reservId">
						<button class="btn btn-light getReserv">확인</button></td>
				</tr>
				<tr>
					<th>예약번호를 잊으셨나요?</th>
					<td><input type="text" name="phone" id="phone">
						<button class="btn btn-light getReservNumber">확인</button></td>
				</tr>
			</table>
			<div id="reserInfo"></div>
		</div>
		<div id='map'></div>
	</div>

	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_8yKsXYYJXoyYWaOuCrkov92vKIv0afM&callback=initMap&region=kr"></script>
	<script src="/resources/js/mapgo.js"></script>
</body>
</html>