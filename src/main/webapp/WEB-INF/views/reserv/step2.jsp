<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/mainHeader.jsp"></jsp:include>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/reserv.css" type="text/css">
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
						<td>제주/5성급/호텔 </td>
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
						<td><a href="http://www.lottehotel.com/jeju" target="_blank">3D프린터, 개발용pc</a></td>
					</tr>
					<tr>
						<th>총객실수</th>
						<td>499</td>
					</tr>
				</tbody>
			</table>
			
			<h2>객실</h2>
			<form method="post" action="/reserv/${workation_id}/step2">
				<table class="tableInfo">
					<tbody>
						<tr>
							<th>check_in </th>
							<td><input type="date" value="<fmt:formatDate value="${reservation.check_in}" pattern="yyyy-MM-dd"/>" name="check_in" readonly></td>
						</tr>
						<tr>
							<th>check_out </th>
							<td><input type="date" value="<fmt:formatDate value="${reservation.check_out}" pattern="yyyy-MM-dd"/>" name="check_out" readonly></td>
						</tr>
						<tr>
							<th>예약구분</th>
							<td>확정예약</td>
						</tr>
						<tr>
							<th>호텔명</th>
							<td>롯데호텔 제주</td>
						</tr>
						<tr>
							<th>객실타입</th>
							<td><input type="text" value="${roomOption.roomType}" name="room_type" readonly></td>
						</tr>
						<tr>
							<th>침대 옵션</th>
							<td><input type="text" value="${room.maxNumber}" name="max_number" readonly></td>
						</tr>
						<tr>
							<th>프로모션</th>
							<td><input type="text" value="${serviceOption.serviceName}" name="service_name" placeholder="미포함" readonly></td>
						</tr>
						<tr>
							<th>워케이션 옵셥</th>
							<td><input type="text" value="${workationOption.workationName}" name="workation_name" placeholder="미포함" readonly></td>
						</tr>
					</tbody>
				</table>
				<h2>결제정보</h2>
				<table class="tableInfo">
					<tr>
						<th>상품 금액 </th>
						<td>431,200원</td>
					</tr>
					<tr>
						<th>옵션 금액 </th>
						<td>123,456원</td>
					</tr>
				</table>
				<div><h3>총 결제금액 <b style="color: red;">123,456,789원</b></h3></div>
				<h2>예약자 정보</h2>
				<table class="tableInfo">
					<tr>
						<th>예약자명</th>
						<td><input type="text" name="subscr_name"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="subscr_email"></td>
					</tr>
					<tr>
						<th>휴대폰 번호 </th>
						<td><input type="text" name="subscr_phone"></td>
					</tr>
					<tr>
						<th>전화번호(선택) </th>
						<td><input type="text" name="subscr_subPhone"></td>
					</tr>
				</table>
				<h2>이용동의</h2>
				<p style="font-size: 7px;">
				취소수수료<br>
				예약을 취소하실 경우, 해당 숙소의 취소 규정에 따라 각 입실일 별 
				취소수수료가 부과 됩니다.<br>
				<br>
					[객실1] (디럭스·더블·산전망 / 디럭스 마운틴 더블)<br>
					입실일 04월 05일 ~ 1박 기준
					- 입실 1일 전[04/04 (월)]17시까지 100% 환불<br>
					- 입실 당일[04/05 (화)]17시까지 0% 환불<br>
					- 취소가능 일은 인터파크투어 영업일 (일요일/공휴일 제외) <br>
					기준으로 산정되며,
					 취소마감시간 [평일17시 / 토요일10시] 이후 취소 시 에는 
					 다음날 취소된 것으로 인정됩니다.<br>
					- 취소수수료는 할인(쿠폰) 적용 전 객실 정상 판매금액을 
					기준으로 책정됩니다.<br>
				</p>
				<button>결제</button>
			</form>
		</div>
	</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>