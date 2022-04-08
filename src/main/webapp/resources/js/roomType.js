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
	if($("input[name='room_type']").val()!="" && $("input[name='price']").val()!="" && $("input[name='detail']").val() != ""){
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
				getList();
			},
			error: (xhr, result) => console.log(123)
		});
	}else{
		alert("ROOM옵션 설정을 정확히 입력해 주세요");
	}
}
//비동기로 데이터 가져오기!
function getList(){
	$.ajax("roomOption/list",{
		method: "GET",
		
		success: result => {
			$("#roomOption").empty(); //비우기!
			
			for(let i=0; i<result.length; i++){
				const obj = result[i];
				$("#roomOption").append("<option value='"+ obj.roomOptionId+"'>"+ obj.roomType +"("+obj.price+")"+"</option>");
			}
		},
		error: (xhr, result) => console.log(123)
	});
}
//비동기로 삭제하기!!
function del(){
	
	if(confirm("삭제하실래요?")){
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