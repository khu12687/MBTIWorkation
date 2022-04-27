$(function() {
	var optionPay = Number($("#optionPay").val());
	var totalHidden = Number($("#totalHidden").val());
	var checkIn = "9999-12-31";
	var checkOut = "9999-12-31";
	var diifDate = "";
	var dateDays = "";
	var date = new Date();
	var year = date.getFullYear();
	var month = (1+date.getMonth());
	month = month >= 10 ? month : '0' + month;
	var day = date.getDate();
	day = day >= 10 ? day : '0'+day;
	var parseDate = year+'-'+month+'-'+day;
	
	$("#check_in").attr("min",parseDate);
	$("#check_out").attr("min",parseDate);
	
	$("#check_in").change(function(){
		checkIn = new Date ($(this).val());
		$('#check_in').attr("readonly",true);
	})	
	
	$("#check_out").change(function(){
		checkOut = new Date ($(this).val());
				
		diifDate = checkOut.getTime() - checkIn.getTime();
		
		dateDays = (diifDate / (1000*3600*24));
		if(dateDays <= 0){
			alert("CHECKOUT 날짜를 확인해 주세요.");
			$("#check_out").val(0);
		}else if(dateDays>0 && dateDays<=10){
			$("#checkPay").text(50000);
			totalHidden += 50000;
			$("#totalPay").text(totalHidden);
			$('#check_out').attr("readonly",true);
		}else if(dateDays>10 && dateDays<=20){
			$("#checkPay").text(100000);
			totalHidden += 100000;
			$("#totalPay").text(totalHidden);
			$('#check_out').attr("readonly",true);
		}else{
			$("#checkPay").text(150000);
			totalHidden += 150000;
			$("#totalPay").text(totalHidden);
			$('#check_out').attr("readonly",true);
		}
		
	})	
	
	$("#roomType").change(function() {
		var roomTypePrice = $("#roomType option:checked").text();
		var rTP = roomTypePrice.split('+');
		var rTPF = rTP[1].split('원');
		optionPay += Number(rTPF[0]);
		totalHidden += Number(rTPF[0]);
		$("#optionPay").text(optionPay);
		$("#totalPay").text(totalHidden);
	})
	
	$("#maxNumber").change(function() {
		var maxNumberPrice = $("#maxNumber option:checked").text();
		var rTP = maxNumberPrice.split('+');
		var rTPF = rTP[1].split('원');
		optionPay += Number(rTPF[0]);
		totalHidden += Number(rTPF[0]);
		$("#optionPay").text(optionPay);
		$("#totalPay").text(totalHidden);
	})
	
	$("#serviceName").change(function() {
		var serviceName = $("#serviceName option:checked").text();
		var rTP = serviceName.split('+');
		var rTPF = rTP[1].split('원');
		optionPay += Number(rTPF[0]);
		totalHidden += Number(rTPF[0]);
		$("#optionPay").text(optionPay);
		$("#totalPay").text(totalHidden);
	})
	
	$("#workationName").change(function() {
		var workationName = $("#workationName option:checked").text();
		var rTP = workationName.split('+');
		var rTPF = rTP[1].split('원');
		optionPay += Number(rTPF[0]);
		totalHidden += Number(rTPF[0]);
		$("#optionPay").text(optionPay);
		$("#totalPay").text(totalHidden);
		$("#totalHidden").val(totalHidden);
	})
	
})