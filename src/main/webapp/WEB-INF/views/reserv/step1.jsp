<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<label> CHECKIN<input type="date" name="check_in">
					</label> <label> CHECKOUT<input type="date" name="check_out">
					</label>
				</div>
				<h2>객실리스트</h2>
				<table class="tableInfo">
					<tr>
						<th>룸 옵션</th>
						<td>
							<div class="mt-2">
								<select name="room_type" class="form-select">
									<option value="디럭스">디럭스</option>
									<option value="프리미어">프리미어</option>
									<option value="스위트">스위트</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th>침대 옵션</th>
						<td>
							<div class="mt-2">
								<select name="max_number" class="form-select">
									<option value="3">3인용</option>
									<option value="4">4인용</option>
									<option value="2">트윈</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th>프로모션</th>
						<td>
							<div class="mt-2">
								<select name="service_name" class="form-select">
									<option value="">조식 미포함</option>
									<option value="조식포함">조식포함</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th>워케이션 옵션</th>
						<td>
							<div class="mt-2">
								<label>3D프린터</label><input type="checkbox" name="workation_name" value="3D프린터">
								<label>개발용 pc</label><input type="checkbox" name="workation_name" value="개발용 pc">
							</div>
						</td>
					</tr>
				</table>
				<button>예약</button>
			</form>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>