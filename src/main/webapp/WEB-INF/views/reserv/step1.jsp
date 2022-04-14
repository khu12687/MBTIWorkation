<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/mainHeader.jsp"></jsp:include>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/reserv.css" type="text/css">
<script>
$(function() {
	var optionPay = Number($("#optionPay").val());
	var totalHidden = Number($("#totalHidden").val());
	var checkIn = "9999-12-31";
	var checkOut = "9999-12-31";
	var diifDate = "";
	var dateDays = "";
	var date = new Date();
	var year = date.getFullYear();
	var month = (1+date.getMonth());
	month = month >= 10 ? month : '0' + month;
	var day = date.getDate();
	day = day >= 10 ? day : '0'+day;
	var parseDate = year+'-'+month+'-'+day;
	
	$("#check_in").attr("min",parseDate);
	$("#check_out").attr("min",parseDate);
	
	$("#check_in").change(function(){
		checkIn = new Date ($(this).val());
		$('#check_in').attr("readonly",true);
	})	
	
	$("#check_out").change(function(){
		checkOut = new Date ($(this).val());
				
		diifDate = checkOut.getTime() - checkIn.getTime();
		
		dateDays = (diifDate / (1000*3600*24));
		if(dateDays <= 0){
			alert("CHECKIN 날짜를 확인해 주세요.");
			
		}else if(dateDays>0 && dateDays<=10){
			$("#checkPay").text(50000);
			totalHidden += 50000;
			$("#totalPay").text(totalHidden);
			$('#check_out').attr("readonly",true);
		}else if(dateDays>10 && dateDays<=20){
			$("#checkPay").text(100000);
			totalHidden += 100000;
			$("#totalPay").text(totalHidden);
			$('#check_out').attr("readonly",true);
		}else{
			$("#checkPay").text(150000);
			totalHidden += 150000;
			$("#totalPay").text(totalHidden);
			$('#check_out').attr("readonly",true);
		}
		
	})	
	
	$("#roomType").change(function() {
		var roomTypePrice = $("#roomType option:checked").text();
		var rTP = roomTypePrice.split('+');
		var rTPF = rTP[1].split('원');
		optionPay += Number(rTPF[0]);
		totalHidden += Number(rTPF[0]);
		$("#optionPay").text(optionPay);
		$("#totalPay").text(totalHidden);
	})
	
	$("#maxNumber").change(function() {
		var maxNumberPrice = $("#maxNumber option:checked").text();
		var rTP = maxNumberPrice.split('+');
		var rTPF = rTP[1].split('원');
		optionPay += Number(rTPF[0]);
		totalHidden += Number(rTPF[0]);
		$("#optionPay").text(optionPay);
		$("#totalPay").text(totalHidden);
	})
	
	$("#serviceName").change(function() {
		var serviceName = $("#serviceName option:checked").text();
		var rTP = serviceName.split('+');
		var rTPF = rTP[1].split('원');
		optionPay += Number(rTPF[0]);
		totalHidden += Number(rTPF[0]);
		$("#optionPay").text(optionPay);
		$("#totalPay").text(totalHidden);
	})
	
	$("#workationName").change(function() {
		var workationName = $("#workationName option:checked").text();
		var rTP = workationName.split('+');
		var rTPF = rTP[1].split('원');
		optionPay += Number(rTPF[0]);
		totalHidden += Number(rTPF[0]);
		$("#optionPay").text(optionPay);
		$("#totalPay").text(totalHidden);
		$("#totalHidden").val(totalHidden);
	})
	
})
</script>
</head>
<body>
	<div class="infoWrap">
		<div style="background: white;">
			<h2>호텔 제주</h2>
			<img src="/resources/images/jeju.png" alt="상품이미지">
			<table class="tableInfo">
				<caption>호텔외관이미지 및 정보</caption>
				<tbody>
					<tr>
						<th>분류</th>
						<td>제주/5성급/호텔</td>
					</tr>
					<tr>
						<th>상품평</th>
						<td><p class="reviewsTxt">
								<a href="javascript:;" class="reviewsBtn">3933개</a>의 상품평
							</p></td>
					</tr>
					<tr>
						<th>주소</th>
						<td>제주 서귀포시 색달동 2812-4 <a href="javascript:;"
							class="textMapBtn">지도보기</a></td>
					</tr>
					<tr>
						<th>도로명주소</th>
						<td>제주특별자치도 서귀포시 중문관광로72번길 35</td>
					</tr>
					<tr>
						<th>지원워케이션장비(옵션)</th>
						<td><a href="http://www.lottehotel.com/jeju" target="_blank">3D프린터,
								개발용pc</a></td>
					</tr>
					<tr>
						<th>총객실수</th>
						<td>499</td>
					</tr>
				</tbody>
			</table>
			<h2>Special information</h2>
			<p>3월 31일 야외수영장 해온 리뉴얼 오픈!</p>
			<p>로그인 시, 회원한정 시크릿 특가</p>
			<p>야외수영장 및 그 외 부대업장 휴장일, 이용시간 확인 필수</p>
			<h2>객실검색</h2>
			<form method="post">
				<div>
					<label> CHECKIN<input type="date" name="checkIn" id="check_in">
					</label> <label> CHECKOUT<input type="date" name="checkOut" id="check_out">
					</label>
				</div>
				<h3>객실비용: <b id="checkPay">0</b></h3>
				<h2>객실리스트</h2>
				<table class="tableInfo">
					<tr>
						<th>룸 옵션</th>
						<td>
							<div class="mt-2">
								<select name="roomType" class="form-select" id="roomType">
									<c:forEach items="${roomOptionList }" var="item">
										<option value="${item.roomType}">${item.roomType} +${item.price}원</option>
									</c:forEach>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th>침대 옵션</th>
						<td>
							<div class="mt-2">
								<select name="maxNumber" class="form-select" id="maxNumber">
									<c:forEach items="${roomList }" var="item">
										<option value="${item.maxNumber}">${item.maxNumber} +${item.price}원</option>
									</c:forEach>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th>프로모션</th>
						<td>
							<div class="mt-2">
								<select name="serviceName" class="form-select" id="serviceName">
									<c:forEach items="${serviceOptionList }" var="item">
										<option value="${item.serviceName}">${item.serviceName} +${item.price}원</option>
									</c:forEach>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th>워케이션 옵션</th>
						<td>
							<div class="mt-2">
								<select name="workationName" class="form-select" id="workationName">
									<c:forEach items="${workationOptionList }" var="item">
										<option value="${item.workationName}">${item.workationName} +${item.price}원</option>
									</c:forEach>
								</select>
							</div>
						</td>
					</tr>
				</table>
				<input type="hidden" value="290000" id="totalHidden" name="totalPay">
				<h3>총 옵션금액: <b id="optionPay">0</b></h3>
				<h3>총 결제금액: <b style="color: red;" id="totalPay">290000</b></h3>
				
				<button class="btn btn-light">예약</button>
			</form>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>