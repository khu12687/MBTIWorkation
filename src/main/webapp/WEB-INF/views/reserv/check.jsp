<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/mainHeader.jsp"></jsp:include>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/reserv.css" type="text/css">
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
		},
		error: (xhr, result) => alert("실패")
	})
	
}

function getList(info){
	$.ajax("",{
		method: "GET",
		
		success: result => {
			$("#reserInfo").empty(); //비우기!
			$("#reserInfo").append("<div>가격" +"("+info.totalPay+")"+"</div>");
			$("#reserInfo").append("<div>CHECKIN" +"("+info.checkIn+")"+"</div>");
			$("#reserInfo").append("<div>CHECKOUT" +"("+info.checkOut+")"+"</div>");
			$("#reserInfo").append("<div onclick='del()'>예약취소"+"</div>");
		},
		error: (xhr, result) => console.log(123)
	});
}

</script>
</head>
<body>
<div  style="height: 1000px;">
	<div class="infoWrap">
		<h2>예약확인</h2>
		<table class="tableInfo">
			<tr>
				<th>예약번호 </th>
				<td><input type="number" name="reservationId" id="reservId"><button class="btn btn-light getReserv">확인</button></td>
			</tr>
	</table>
	<div id="reserInfo">
	</div>
	</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>