$(function(){
	$($(".regWork")).click(function(){
		registWork();
	});
	$($(".lisWork")).click(function(){
		getListWork();
	});
	$($(".delWork")).click(function(){
		delWork();
	});
	$(".ediWork").click(function(){
		if($("#workationOption").val() ==0){
			alert("워케이션 장비 옵션을 선택해주세요");
		}
		else{
			$.ajax("workationOption/list",{
				method: "GET",
				
				success: result => {
					for(let i=0; i<result.length; i++){
						const obj = result[i];
						if($("#workationOption").val() == obj.workationOptionId){
							$(".workationName").val(obj.workationName);
							$(".priceWork").val(obj.price);
							$(".detailWork").val(obj.detail);
						}
					}
				},
				error: (xhr, result) => console.log(123)
			});
		}
	});
	$("#addWorkModal .editWork").click(function() {
	    const item = {
	    		workationName: $(`#addWorkModal .workationName`).val(),
	    		price: $(`#addWorkModal .priceWork`).val(),
	    		detail: $(`#addWorkModal .detailWork`).val()
	    };
	    
		$("#addWorkModal input").val("");

	    $.ajax("workationOption/edit/"+$("#workationOption").val(), {
	        method: "POST",
	        contentType: "application/json",
	        dataType: "json",
	        data: JSON.stringify(item),
	        success: result => {
				if(result==1){
					alert("수정되었습니다");
					getListWork();
				}else{
					alert("수정에 실패하였습니다.\n 관리자에 문의하세요")
				}
			}, 
	        error: xhr => alert(`오류 발생: ${xhr.statusText}`)
	    })

	    $("#addWorkModal").modal("hide");
	})
});
function registWork(){
	if($("input[name='workationName']").val()!="" && $("input[name='priceWork']").val()!="" && $("input[name='detailWork']").val() != ""){
		var item ={
			workationName :$("input[name='workationName']").val(),
			price :$("input[name='priceWork']").val(),
			detail :$("input[name='detailWork']").val()
		}
		$.ajax("workationOption/regist",{
			method: "POST",
			contentType: "application/json",
			dataType: "json",
			data: JSON.stringify(item),
			success: result => {
				alert("등록성공!");
				getListWork();
			},
			error: (xhr, result) => console.log(123)
		});
	}else{
		alert("워케이션장비 옵션 설정을 정확히 입력해 주세요");
	}
}
//비동기로 데이터 가져오기!
function getListWork(){
	$.ajax("workationOption/list",{
		method: "GET",
		
		success: result => {
			$("#workationOption").empty(); //비우기!
			
			for(let i=0; i<result.length; i++){
				const obj = result[i];
				$("#workationOption").append("<option value='"+ obj.workationOptionId+"'>"+ obj.workationName +"("+obj.price+")"+"</option>");
			}
		},
		error: (xhr, result) => console.log(123)
	});
}
//비동기로 삭제하기!!
function delWork(){
	
	if(confirm("삭제하실래요?")){
		$.ajax("workationOption/del/"+$("#workationOption").val(),{
			method: "GET",
			success: result => {
				if(result==1){
					alert("삭제되었습니다");
					getListWork();
				}else{
					alert("삭제에 실패하였습니다.\n 관리자에 문의하세요")
				}
			},
			error: (xhr, result) => alert("삭제에 실패하였습니다. 삭제할 워케이션장비 옵션을 선택해주세요")
		});
	}
}