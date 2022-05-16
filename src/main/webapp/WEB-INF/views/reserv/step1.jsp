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
<script src="/resources/js/step1.js"></script>
<style>
h2{
	margin-bottom: 7%;
}
</style>
</head>
<body>
	<div class="infoWrap">
		<div style="background: white;">
			<h2>${room.loc }</h2>
			<img src="/resources/images/${room.images[0].filename }" alt="상품이미지">
			<table class="tableInfo">
				<caption>호텔외관이미지 및 정보</caption>
				<tbody>
					<tr>
						<th>분류</th>
						<td>${room.loc} /5성급/호텔</td>
					</tr>
					<tr>
						<th>상품평</th>
						<td><p class="reviewsTxt">
								<a href="javascript:;" class="reviewsBtn">3933개</a>의 상품평
							</p></td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${room.loc }<a href="javascript:;"
							class="textMapBtn">지도보기</a></td>
					</tr>
					<tr>
						<th>도로명주소</th>
						<td>${room.loc }</td>
					</tr>
					<tr>
						<th>지원워케이션장비(옵션)</th>
						<td><a href="http://www.lottehotel.com/jeju" target="_blank">
									<c:forEach items="${workationOptionList }" var="item" begin="1">
										${item.workationName}
									</c:forEach>
								</a></td>
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
				<h2>객실리스트</h2>
				<table class="tableInfo">
					<tr>
						<th>룸 옵션</th>
						<td>
							<div class="mt-2">
								<select name="roomType" class="form-select" id="roomType">
									<option value="미포함">미포함</option>
									<c:forEach items="${roomOptionList }" var="item">
										<option value="${item.roomType}">${item.roomType}(${item.maxNumber}) +${item.price}원</option>
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
									<option value="미포함">미포함</option>
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
									<option value="미포함">미포함</option>
									<c:forEach items="${workationOptionList }" var="item">
										<option value="${item.workationName}">${item.workationName} +${item.price}원</option>
									</c:forEach>
								</select>
							</div>
						</td>
					</tr>
				</table>
				<input type="hidden" value="${room.price }" id="totalHidden" name="totalPay">
				<h3>객실비용: <b id="checkPay">0</b></h3>
				<h3>총 옵션금액: <b id="optionPay">0</b></h3>
				<h3>총 결제금액: <b style="color: red;" id="totalPay">${room.price }</b></h3>
				
				<button class="btn btn-light">예약</button>
			</form>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>