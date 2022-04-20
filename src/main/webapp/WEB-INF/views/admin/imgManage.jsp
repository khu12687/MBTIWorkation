<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:include page="../include/adminHeader.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/admin.css" type="text/css">
</head>
<body>
<div style="float; display: flex; width: 100%;">
	<div class="mai">
		<div>
			<div class="mb-3">
				<label class="form-label">(방관리)지역</label>
				<input type ="text" name="loc" placeholder="ex)제주도 돌하르방" class="form-control"/>
		 	</div>
		 	<div class="mb-3">
				<label class="form-label">최대인원수</label>
				<input type ="text" name="maxNumber" placeholder="3~4인용" class="form-control"/>
		 	</div>
		 	<div class="mb-3">
				<label class="form-label">총개수</label>
				<input type ="text" name="num" placeholder="10" class="form-control"/>
		 	</div>
		 	<div class="mb-3">
				<label class="form-label">가격</label>
				<input type ="text" name="priceRoom" placeholder="30000" class="form-control"/>
		 	</div>
		 	<div class="mb-3">
				<label class="form-label">위도</label>
				<input type="text" name="latitude" class="form-control">
		 	</div>
		 	<div class="mb-3">
				<label class="form-label">경도</label>
				<input type="text" name="longitude" class="form-control">
		 	</div>
			<button class="regRoom" style="width: 100%;">등록</button>
		</div>
		<p>
			<select class="room" multiple="multiple"></select>
		</p>
		<button class="lisRoom">목록</button>
		<button class="delRoom">삭제</button>
		<button class="ediRoom" data-bs-toggle="modal" data-bs-target="#addRoomModal">수정</button>
	 	<!-- [시작] 등록 Modal -->
		<div class="modal fade" id="addRoomModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="addModalLabel">수정</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"	aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="mb-3">
							<label class="form-label">지역</label>
					 		<input type="text" class="loc form-control">
					 	</div>
					 	<div class="mb-3">
							<label class="form-label">최대 인원수</label>
							<input type="text" class="maxNumber form-control">
					 	</div>
					 	<div class="mb-3">
							<label class="form-label">총 개수</label>
							<input type="text" class="num form-control">
					 	</div>
					 	<div class="mb-3">
							<label class="form-label">가격</label>
							<input type="number" class="priceRoom form-control">
					 	</div>
					 	<div class="mb-3">
							<label class="form-label">위도</label>
							<input type="number" class="latitude form-control">
					 	</div>
					 	<div class="mb-3">
							<label class="form-label">경도</label>
							<input type="number" class="longitude form-control">
					 	</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"	data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary editRoom">수정</button>
					</div>
				</div>
			</div>
		</div>
		<!-- [끝] 등록 Modal -->
	</div>
	<div class="mai">
		<div>
			<div class="mb-3">
				<label class="form-label"><h2>이미지 등록</h2></label>
				<input type ="file" name="productImage"/>
		 	</div>
			<button class="regRoom" style="width: 100%;">등록</button>
		</div>
		<p>
			<select class="room" multiple="multiple"></select>
		</p>
		<button class="lisRoom">목록</button>
		<button class="delRoom">삭제</button>
		<button class="ediRoom" data-bs-toggle="modal" data-bs-target="#addRoomModal">수정</button>
	 	<!-- [시작] 등록 Modal -->
		<div class="modal fade" id="addRoomModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="addModalLabel">수정</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"	aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="mb-3">
							<label class="form-label">지역</label>
					 		<input type="text" class="loc form-control">
					 	</div>
					 	<div class="mb-3">
							<label class="form-label">최대 인원수</label>
							<input type="text" class="maxNumber form-control">
					 	</div>
					 	<div class="mb-3">
							<label class="form-label">총 개수</label>
							<input type="text" class="num form-control">
					 	</div>
					 	<div class="mb-3">
							<label class="form-label">가격</label>
							<input type="number" class="priceRoom form-control">
					 	</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"	data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary editRoom">수정</button>
					</div>
				</div>
			</div>
		</div>
		<!-- [끝] 등록 Modal -->
	</div>
</div>
<script src="/resources/js/room.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>