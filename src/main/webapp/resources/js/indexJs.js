var container;
var box; 
var a=0.1; 
var targetX =0; 
var targetY =0; 
$(() =>{
    container = document.getElementById("container");
    createImg();
    createRect(); 
    setInterval("move()",25);
    
    $(".roomProduct").click(function(e){
   		 //데이타셋은 카멜표기법 적용안됨
    	var roomId = parseFloat(this.dataset.roomid);
		location.href="reserv/"+roomId;    	
    });
    
    $(".roomProduct").mouseover(function(e){
    	var lati = parseFloat(this.dataset.latitude);
    	var longi = parseFloat(this.dataset.longitude);
    	var loc = this.dataset.loc;
    	var filename = this.dataset.filename;
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
    	
    });
    
});
var gap=5; 
var count=0;
function createImg(){
    for(var a=0; a<2; a++){ 
        for(var i=0; i<4; i++){
            var img = document.createElement("img");
            img.src="/resources/images/i"+(count)+".png"; 
            img.style.cursor="pointer";
            img.style.width=140+"px";
            img.style.height=100+"px";
            img.style.position="absolute";
            img.style.left=i*(140+gap)+"px";
            img.style.top=a*(100+gap)+"px";
			img.dataset.column = count;
            img.addEventListener("click",function(){
                targetX=parseInt(this.style.left);
                targetY=parseInt(this.style.top);
                
                $("#mbtiproduct").children().remove();
                
	        	 mbtiImg = $('<img>',{
	        		 'src' : '/resources/images/mbti'+(this.dataset.column)+'.png'
	        	 });
        		 $("#mbtiproduct").append(mbtiImg);
        		 
        		 //워케이션 상품 바뀌게!! mbti별 this.dataset.column은 workation의 mbti_id 값과 같다
        		 //ajax으로
        		 $.ajax("mbtiProduct/"+(this.dataset.column),{
				method: "GET",
				
				success: result => {
					$(".swiper").empty();
					$(".swiper").append('<div class="swiper-wrapper">');
					$.each(result, function(i,item){
						$(".swiper").append(`<li class="swiper-slide"><a href="/reserv/${item.room.roomId }"><img src="/upload/${item.images[0].uuid }_${item.images[0].filename}" width="250px" height="250px;"><p class="title" style="color: #FE7F2D;">${item.productName}</p>${item.productExplanation }<p class="contents">${item.productName}+ ${item.workationName}</p></a></li>`);
					});
					$(".swiper").append('</div><div class="swiper-button-prev"></div><div class="swiper-button-next"></div>')
				},
				error: (xhr, result) => console.log(123)
			});
                
            });
            container.appendChild(img); //이미지를 컨테이너에 넣음 컨테이너 자식으로 img을 줌
            count++;
        }
    }
 }
 function createRect(){
    box = document.createElement("div");
    box.style.position ="absolute"; //이미지 위에 얹혀져야 하므로 중첩이 가능하게
    box.style.left=0+"px";
    box.style.top=0+"px";
    box.style.width=140+"px";
    box.style.height=90+"px";

    box.style.background="white";
    box.style.opacity=0.4; 

    container.appendChild(box);
 }
 function move(){  
    box.style.left=parseFloat(box.style.left)+a*(targetX-parseFloat(box.style.left))+"px";
    box.style.top=parseFloat(box.style.top)+a*(targetY-parseFloat(box.style.top))+"px";
 }