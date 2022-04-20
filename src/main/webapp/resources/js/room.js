$(function(){
	$($(".regRoom")).click(function(){
		registRoom();
	});
	$($(".lisRoom")).click(function(){
		getRoomList();
	});
	$($(".delRoom")).click(function(){
		delRoom();
	});
	$(".ediRoom").click(function(){
		if($(".room").val() ==0){
			alert("SERVICE이름을 선택해주세요");
		}
		else{
			$.ajax("room/list",{
				method: "GET",
				
				success: result => {
					for(let i=0; i<result.length; i++){
						const obj = result[i];
						if($(".room").val() == obj.roomId){
							$(".loc").val(obj.loc);
							$(".maxNumber").val(obj.maxNumber);
							$(".num").val(obj.num);
							$(".priceRoom").val(obj.price);
							$(".latitude").val(obj.latitude);
							$(".longitude").val(obj.longitude);
						}
					}
				},
				error: (xhr, result) => console.log(123)
			});
		}
	});
	$("#addRoomModal .editRoom").click(function() {
	    const item = {
	    		loc: $(`#addRoomModal .loc`).val(),
	    		maxNumber: $(`#addRoomModal .maxNumber`).val(),
	    		num: $(`#addRoomModal .num`).val(),
	    		price: $(`#addRoomModal .priceRoom`).val(),
	    		latitude: $(`#addRoomModal .latitude`).val(),
	    		longitude: $(`#addRoomModal .longitude`).val()
	    };
	    
		$("#addRoomModal input").val("");

	    $.ajax("room/edit/"+$(".room").val(), {
	        method: "POST",
	        contentType: "application/json",
	        dataType: "json",
	        data: JSON.stringify(item),
	        success: result => {
				if(result==1){
					alert("수정되었습니다");
					getRoomList();
				}else{
					alert("수정에 실패하였습니다.\n 관리자에 문의하세요")
				}
			}, 
	        error: xhr => alert(`오류 발생: ${xhr.statusText}`)
	    })

	    $("#addRoomModal").modal("hide");
	})
});
function registRoom(){
	alert($("input[name='latitude']").val());
	if($("input[name='loc']").val()!="" && $("input[name='maxNumber']").val()!="" && $("input[name='num']").val() != "" && $("input[name='priceRoom']").val() != ""){
		  const item = {
	    		loc: $("input[name='loc']").val(),
	    		maxNumber: $("input[name='maxNumber']").val(),
	    		num: $("input[name='num']").val(),
	    		price: $("input[name='priceRoom']").val(),
	    		latitude: $("input[name='latitude']").val(),
	    		longitude: $("input[name='longitude']").val()
	    };
		$.ajax("room/regist",{
			method: "POST",
			contentType: "application/json",
			dataType: "json",
			data: JSON.stringify(item),
			success: result => {
				alert("등록성공!");
				alert(item);
				getRoomList();
			},
			error: (xhr, result) => console.log(123)
		});
	}else{
		alert("Room 옵션 설정을 정확히 입력해 주세요");
	}
}
//비동기로 데이터 가져오기!
function getRoomList(){
	$.ajax("room/list",{
		method: "GET",
		
		success: result => {
			$(".room").empty(); //비우기!
			
			for(let i=0; i<result.length; i++){
				const obj = result[i];
				$(".room").append("<option value='"+ obj.roomId+"'>"+ obj.loc +"("+obj.maxNumber+")"+"</option>");
			}
		},
		error: (xhr, result) => console.log(123)
	});
}
//비동기로 삭제하기!!
function delRoom(){
	
	if(confirm("삭제하실래요?")){
		$.ajax("room/del/"+$(".room").val(),{
			method: "GET",
			success: result => {
				if(result==1){
					alert("삭제되었습니다");
					getRoomList();
				}else{
					alert("삭제에 실패하였습니다.\n 관리자에 문의하세요")
				}
			},
			error: (xhr, result) => alert("삭제에 실패하였습니다. 삭제할 ROOM을 선택해주세요")
		});
	}
}