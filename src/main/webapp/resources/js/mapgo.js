var map;
function initMap() {
  	
	map = new google.maps.Map(
    document.getElementById('map'), {
      zoom: 13,
      center: { lat: 36.321655 ,lng: 127.378953 }
    });

  const marker = new google.maps.Marker({
    position: { lat: 36.321655 ,lng: 127.378953 },
    map: map,
    label: "대전 워케이션"
  });
  
	const infowindow = new google.maps.InfoWindow({
		content: "<p>Marker Location:" + marker.getPosition() + "</p>"
	});
	google.maps.event.addListener(marker, "click", () => {
		infowindow.open(map, marker);
	});
  
}