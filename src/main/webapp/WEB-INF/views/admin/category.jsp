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
$(function(){
	$($(".reg")).click(function(){
		regist();
	});
	$($(".lis")).click(function(){
		getList();
	});
	$($(".del")).click(function(){
		del();
	});
	$(".edi").click(function(){
		if($("select").val() ==0){
			alert("ROOM_TYPE을 선택해주세요");
		}
		else{
			$.ajax("roomOption/list",{
				method: "GET",
				
				success: result => {
					for(let i=0; i<result.length; i++){
						const obj = result[i];
						if($("select").val() == obj.roomOptionId){
							$(".roomType").val(obj.roomType);
							$(".price").val(obj.price);
							$(".detail").val(obj.detail);
						}
					}
				},
				error: (xhr, result) => console.log(123)
			});
		}
	});
	$("#addModal .edit").click(function() {
	    const item = {
	    		roomType: $(`#addModal .roomType`).val(),
	    		price: $(`#addModal .price`).val(),
	    		detail: $(`#addModal .detail`).val()
	    };
	    
		$("#addModal input").val("");

	    $.ajax("roomOption/edit/"+$("select").val(), {
	        method: "POST",
	        contentType: "application/json",
	        dataType: "json",
	        data: JSON.stringify(item),
	        success: result => {
				if(result==1){
					alert("수정되었습니다");
					getList();
				}else{
					alert("수정에 실패하였습니다.\n 관리자에 문의하세요")
				}
			}, 
	        error: xhr => alert(`오류 발생: ${xhr.statusText}`)
	    })

	    $("#addModal").modal("hide");
	})
});
function regist(){
	var item ={
		roomType :$("input[name='room_type']").val(),
		price :$("input[name='price']").val(),
		detail :$("input[name='detail']").val()
	}
	$.ajax("roomOption/regist",{
		method: "POST",
		contentType: "application/json",
		dataType: "json",
		data: JSON.stringify(item),
		success: result => {
			alert("등록성공!");
		},
		error: (xhr, result) => console.log(123)
	});
}
//비동기로 데이터 가져오기!
function getList(){
	$.ajax("roomOption/list",{
		method: "GET",
		
		success: result => {
			$("select").empty(); //비우기!
			
			for(let i=0; i<result.length; i++){
				const obj = result[i];
				$("select").append("<option value='"+ obj.roomOptionId+"'>"+ obj.roomType +"("+obj.price+")"+"</option>");
			}
		},
		error: (xhr, result) => console.log(123)
	});
}
//비동기로 삭제하기!!
function del(){
	
	if(confirm($("select").val()+"를 삭제하실래요?")){
		$.ajax("roomOption/del/"+$("select").val(),{
			method: "GET",
			success: result => {
				if(result==1){
					alert("삭제되었습니다");
					getList();
				}else{
					alert("삭제에 실패하였습니다.\n 관리자에 문의하세요")
				}
			},
			error: (xhr, result) => alert("삭제에 실패하였습니다. 삭제할 ROOM_TYPE을 선택해주세요")
		});
	}
}

</script>
<style>
button {
	background-color: #F7F9FA;
	 border: 1px solid #efefef; 
}
.mai{
	width: 300px;
	margin-top: 7%;
	margin-left: 9.5%;
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
<div class="mai">
	<div>
		<h2>ROOM_TYPE 옵션</h2>
		<div class="mb-3">
			<label class="form-label">room_type</label>
			<input type ="text" name="room_type" placeholder="room_type입력" class="form-control"/>
	 	</div>
	 	<div class="mb-3">
			<label class="form-label">price</label>
			<input type ="number" name="price" placeholder="price 입력" class="form-control"/>
	 	</div>
	 	<div class="mb-3">
			<label class="form-label">detail</label>
			<input type ="text" name="detail" placeholder="설명 입력" class="form-control"/>
	 	</div>
		
		
		<button class="reg">등록</button>
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

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>