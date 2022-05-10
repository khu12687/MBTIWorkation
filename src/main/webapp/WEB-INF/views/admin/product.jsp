<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:include page="../include/adminHeader.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/admin.css" type="text/css">
<style>
a{
	text-decoration: none;
	color: blue;
}
#map ,#mapImg{
	width: 400px;
	height: 30vh;
	display: inline-block;
	border: 1px solid #EBEBEB;
	border-radius: 8px;
}
</style>
<script>
var hotelVal;
$(function(){
	$(".room").change(function(){
		const clickVal = this.value;
		getHotelVal(clickVal);		
		$.ajax("../admin/room/item/"+clickVal,{
			method: "GET",
			success: result =>{
				if(result.images != undefined){
					getList(result);
				}else{
					alert("이미지를 등록해주세요");
				}
			},
			error: (xhr, result) => alert("오류발생")
		})
		
	});
	
	$(".btn").click(function(){
		//alert(hotelVal);
		//$("#productForm").submit();
		   const item = {
				   roomId: hotelVal,
		    		roomType: $("#roomType").val(),
		    		serviceName: $("#serviceName").val(),
		    		workationName: $("#workationName").val(),
		    		productName : $("#productName").val(),
		    		productExplanation: $("#productExplanation").val()
		    		
		    };
		    $.ajax("addProduct", {
		        method: "POST",
		        contentType: "application/json",
		        dataType: "json",
		        data: JSON.stringify(item),
		        success: result => {
					if(result==1){
						alert("워케이션 상품이 등록되었습니다.");
						getList();
					}else{
						alert("실패하였습니다.\n 관리자에 문의하세요")
					}
				}, 
		        error: xhr => alert(`오류 발생: ${xhr.statusText}`)
		    }) 
		
	});
	
})

function getHotelVal(clickVal){
	hotelVal = clickVal;
}

function getList(info){
	$.ajax("",{
		method: "GET",
		success: result => {
			$("#hotelInfo").empty(); 
			$("#hotelInfo").append("<h2>호텔 정보</h2>");
			$("#hotelInfo").append("<div class='infoWrap'><div style='background: white;'><table class='tableInfo'><tr><th>호텔</th><td>"+info.loc+"</td></tr></tr></table></div></div>");
			goMap(info);
			$("#mapImg").empty(); 
			$("#mapImg").append("<img src='/resources/images/"+info.images[0].filename+"'>");
			
		},
		error: (xhr, result) => console.log(123)
	});
}
function goMap(info){
	var lati = parseFloat(info.latitude);
	var longi = parseFloat(info.longitude);
	var loc = info.loc;
	var filename = info.images[0].filename;
	map = new google.maps.Map(document.getElementById('map'),{
		center: {lat: lati, lng: longi},
		zoom:13
	})

	const contentString =
	    '<div id="content">' +
	    '<img src="/resources/images/'+filename+'" width="700px;" height="500px;" alt="이미지를 등록해주세요">'+
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
	
}

</script>
</head>
<body>
<div style="float; display: flex; width: 100%;">
	<div class="mai">
		<p>
			<select class="room" multiple="multiple"></select>
		</p>
		<button class="lisRoom">목록</button>
		<button class="delRoom">삭제</button>
		<button class="ediRoom" data-bs-toggle="modal" data-bs-target="#addRoomModal">수정</button>
		<button class="addImg" data-bs-toggle="modal" data-bs-target="#addRoomImgModal">이미지등록</button>
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
							<label class="form-label">소개</label>
							<input type="text" class="content form-control">
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

		<!-- [시작] 등록 Modal -->
		<div class="modal fade" id="addRoomImgModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="addModalLabel">이미지등록</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"	aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form method="post" action="addImg" class="mt-4" enctype="multipart/form-data">
						 	<div class="mb-3"> 
								<label class="form-label">파일 첨부</label><span id="add_image" class="btn btn-outline-primary btn-sm">추가</span>
						 		<input type="file" name="productImg" class="form-control">
						 		<input type="hidden" value="" name="roomId">
						 	</div>
							<div style="float: right;">
							 	<button>이미지 등록</button>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"	data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- [끝] 등록 Modal -->
		
	</div>
</div>
<div class="mai">
	<div class="infoWrap">
		<div id="hotelInfo"></div>
	</div>
	<div style="display: flex;">
		<div id='map' style="display: none;"></div>
		<div id="mapImg"></div>
	</div>
	
	<div>
		<h2>옵션 추가</h2>
		<form id="productForm">
			<table class="tableInfo">
				<tr>
					<th>룸 옵션</th>
					<td>
						<div class="mt-2">
							<select name="roomType" class="form-select" id="roomType">
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
			<div><input type="text" size="40" name="productName" id="productName" placeholder="상품명을 입력해 주세요.ex)가고 싶은 섬 워케이션"></div>
			<div><input type="text" size="40" name="productExplanation" id="productExplanation" placeholder="설명ex)[울릉도/독도] 15박 16일 + 3D프린터"></div>
			<button class="btn btn-light" type="button">상품 등록</button>
		</form>
	</div>
	
</div>

<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_8yKsXYYJXoyYWaOuCrkov92vKIv0afM&callback=initMap&region=kr"></script>
<script src="/resources/js/mapgo.js"></script>
<script src="/resources/js/room.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>