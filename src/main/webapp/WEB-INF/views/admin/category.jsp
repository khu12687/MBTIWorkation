<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:include page="../include/adminHeader.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/admin.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap css-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap icon css-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">
<script>

</script>
<style>
button {
	background-color: #F7F9FA;
	 border: 1px solid #efefef; 
}
.mai{
	width: 400px;
	margin: 5%;
	border : 1px solid #EBEBEB;
	border-radius: 8px;
	overflow: hidden;
	color: black;
	font-weight: bolder;
	
}
lable{
	font-size: 16px;
	
}
select{
	width: 100%;
}

</style>
</head>
<body>
<div style="float: left; display: flex; width: 100%;">
	<div class="mai">
		<div>
			<div class="mb-3">
				<label class="form-label"><h2>ROOM_TYPE 옵션</h2></label>
				<input type ="text" name="room_type" placeholder="ex) 디럭스" class="form-control"/>
		 	</div>
		 	<div class="mb-3">
				<label class="form-label"><h2>PRICE</h2></label>
				<input type ="number" name="price" placeholder="ex) 10000" class="form-control"/>
		 	</div>
		 	<div class="mb-3">
				<label class="form-label"><h2>상세정보</h2></label>
				<input type ="text" name="detail" placeholder="설명 입력" class="form-control"/>
		 	</div>
			<button class="reg" style="width: 100%;">등록</button>
		</div>
		<p>
			<select id="roomOption" multiple="multiple"></select>
		</p>
		<button class="lis">목록</button>
		<button class="del">삭제</button>
		<button class="edi" data-bs-toggle="modal" data-bs-target="#addModal">수정</button>
	 	<!-- [시작] 등록 Modal -->
		<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="addModalLabel">수정</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"	aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="mb-3">
							<label class="form-label">ROOM_TYPE</label>
					 		<input type="text" class="roomType form-control">
					 	</div>
					 	<div class="mb-3">
							<label class="form-label">가격</label>
							<input type="number" class="price form-control">
					 	</div>
					 	<div class="mb-3">
							<label class="form-label">설명</label>
							<input type="text" class="detail form-control">
					 	</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"	data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary edit">수정</button>
					</div>
				</div>
			</div>
		</div>
		<!-- [끝] 등록 Modal -->
	</div>
	<div class="mai">
		<div>
		 	<div class="mb-3">
				<label class="form-label"><h2>SERVICE 이름</h2></label>
				<input type ="text" name="serviceName" placeholder="ex) 조식포함" class="form-control"/>
		 	</div>
		 	<div class="mb-3">
				<label class="form-label"><h2>PRICE</h2></label>
				<input type ="number" name="priceService" placeholder="ex) 20000" class="form-control"/>
		 	</div>
			<div class="mb-3">
				<label class="form-label"><h2>상세정보</h2></label>
				<input type ="text" name="detailService" placeholder="설명 입력" class="form-control"/>
		 	</div>
			<button class="reg1" style="width: 100%;">등록</button>
		</div>
		<p>
			<select class="service" multiple="multiple"></select>
		</p>
		<button class="lis1">목록</button>
		<button class="del1">삭제</button>
		<button class="edi1" data-bs-toggle="modal" data-bs-target="#addSerModal">수정</button>
	 	<!-- [시작] 등록 Modal -->
		<div class="modal fade" id="addSerModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="addModalLabel">수정</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"	aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="mb-3">
							<label class="form-label">SERVICE 이름</label>
					 		<input type="text" class="serviceName form-control" >
					 	</div>
					 	<div class="mb-3">
							<label class="form-label">가격</label>
							<input type="number" class="priceService form-control" >
					 	</div>
					 	<div class="mb-3">
							<label class="form-label">설명</label>
							<input type="text" class="detailService form-control" >
					 	</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"	data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary edit1">수정</button>
					</div>
				</div>
			</div>
		</div>
		<!-- [끝] 등록 Modal -->
	</div>
</div>

<div style="float: left; display: flex; width: 100%;">
	<div class="mai">
		<div>
			<div class="mb-3">
				<label class="form-label"><h2>(방관리)지역</h2></label>
				<input type ="text" name="loc" placeholder="ex)제주도 돌하르방" class="form-control"/>
		 	</div>
		 	<div class="mb-3">
				<label class="form-label"><h2>최대인원수</h2></label>
				<input type ="text" name="maxNumber" placeholder="3~4인용" class="form-control"/>
		 	</div>
		 	<div class="mb-3">
				<label class="form-label"><h2>총개수</h2></label>
				<input type ="text" name="num" placeholder="10" class="form-control"/>
		 	</div>
		 	<div class="mb-3">
				<label class="form-label"><h2>가격</h2></label>
				<input type ="text" name="priceRoom" placeholder="30000" class="form-control"/>
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
	<div class="mai">
		<div>
			<div class="mb-3">
				<label class="form-label"><h2>워케이션장비 옵션</h2></label>
				<input type ="text" name="room_type" placeholder="room_type입력" class="form-control"/>
		 	</div>
		 	<div class="mb-3">
				<label class="form-label"><h2>PRICE</h2></label>
				<input type ="number" name="price" placeholder="price 입력" class="form-control"/>
		 	</div>
		 	<div class="mb-3">
				<label class="form-label"><h2>상세정보</h2></label>
				<input type ="text" name="detail" placeholder="설명 입력" class="form-control"/>
		 	</div>
			<button class="reg" style="width: 100%;">등록</button>
		</div>
		<p>
			<select multiple="multiple"></select>
		</p>
		<button class="lis">목록</button>
		<button class="del">삭제</button>
		<button class="edi" data-bs-toggle="modal" data-bs-target="#addModal">수정</button>
	 	<!-- [시작] 등록 Modal -->
		<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="addModalLabel">수정</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"	aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="mb-3">
							<label class="form-label">ROOM_TYPE</label>
					 		<input type="text" class="roomType form-control">
					 	</div>
					 	<div class="mb-3">
							<label class="form-label">가격</label>
							<input type="number" class="price form-control">
					 	</div>
					 	<div class="mb-3">
							<label class="form-label">설명</label>
							<input type="text" class="detail form-control">
					 	</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"	data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary edit">수정</button>
					</div>
				</div>
			</div>
		</div>
		<!-- [끝] 등록 Modal -->
	</div>
</div>
<script src="/resources/js/room.js"></script>
<script src="/resources/js/roomType.js"></script>
<script src="/resources/js/service.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>