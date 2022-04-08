$(function(){
	$($(".reg1")).click(function(){
		registService();
	});
	$($(".lis1")).click(function(){
		getServiceList();
	});
	$($(".del1")).click(function(){
		delService();
	});
	$(".edi1").click(function(){
		if($(".service").val() ==0){
			alert("SERVICE이름을 선택해주세요");
		}
		else{
			$.ajax("serviceOption/list",{
				method: "GET",
				
				success: result => {
					for(let i=0; i<result.length; i++){
						const obj = result[i];
						if($(".service").val() == obj.serviceOptionId){
							$(".serviceName").val(obj.serviceName);
							$(".priceService").val(obj.price);
							$(".detailService").val(obj.detail);
						}
					}
				},
				error: (xhr, result) => console.log(123)
			});
		}
	});
	$("#addSerModal .edit1").click(function() {
	    const item = {
	    		serviceName: $(`#addSerModal .serviceName`).val(),
	    		price: $(`#addSerModal .priceService`).val(),
	    		detail: $(`#addSerModal .detailService`).val()
	    };
	    
		$("#addSerModal input").val("");

	    $.ajax("serviceOption/edit/"+$(".service").val(), {
	        method: "POST",
	        contentType: "application/json",
	        dataType: "json",
	        data: JSON.stringify(item),
	        success: result => {
				if(result==1){
					alert("수정되었습니다");
					getServiceList();
				}else{
					alert("수정에 실패하였습니다.\n 관리자에 문의하세요")
				}
			}, 
	        error: xhr => alert(`오류 발생: ${xhr.statusText}`)
	    })

	    $("#addSerModal").modal("hide");
	})
});
function registService(){
	if($("input[name='serviceName']").val()!="" && $("input[name='priceService']").val()!="" && $("input[name='detailService']").val() != ""){
		var item ={
			serviceName :$("input[name='serviceName']").val(),
			price :$("input[name='priceService']").val(),
			detail :$("input[name='detailService']").val()
		}
		$.ajax("serviceOption/regist",{
			method: "POST",
			contentType: "application/json",
			dataType: "json",
			data: JSON.stringify(item),
			success: result => {
				alert("등록성공!");
				getServiceList();
			},
			error: (xhr, result) => console.log(123)
		});
	}else{
		alert("SERVICE옵션 설정을 정확히 입력해 주세요");
	}
}
//비동기로 데이터 가져오기!
function getServiceList(){
	$.ajax("serviceOption/list",{
		method: "GET",
		
		success: result => {
			$(".service").empty(); //비우기!
			
			for(let i=0; i<result.length; i++){
				const obj = result[i];
				$(".service").append("<option value='"+ obj.serviceOptionId+"'>"+ obj.serviceName +"("+obj.price+")"+"</option>");
			}
		},
		error: (xhr, result) => console.log(123)
	});
}
//비동기로 삭제하기!!
function delService(){
	
	if(confirm("삭제하실래요?")){
		$.ajax("serviceOption/del/"+$(".service").val(),{
			method: "GET",
			success: result => {
				if(result==1){
					alert("삭제되었습니다");
					getServiceList();
				}else{
					alert("삭제에 실패하였습니다.\n 관리자에 문의하세요")
				}
			},
			error: (xhr, result) => alert("삭제에 실패하였습니다. 삭제할 ROOM_TYPE을 선택해주세요")
		});
	}
}