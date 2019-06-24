function initMap() {
  jQuery(function($){
    var map, map_center;

    var title = $('#name').text();

    var opts = {
      zoom: 16,
      mapTypeId: "roadmap"
    };

    map = new google.maps.Map(document.getElementById("map_canvas"), opts);

    var geocoder = new google.maps.Geocoder();

    var address = $('#name').text();

    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status === 'OK' && results[0]) {

        map_center = results[0].geometry.location;

        map.setCenter(map_center);

        var marker = new google.maps.Marker({
          map: map,
          position: map_center,
          animation: google.maps.Animation.DROP,
          title: title
        });

        var content;
          {
          content = '<div id="map_content"><p>' + title + '</p></div>';
        }

        var infowindow = new google.maps.InfoWindow({
          content: content,
        });

        google.maps.event.addListener(marker, 'click', function() {
          infowindow.open(map, marker);
        });
      } else {
        alert("住所から位置の取得ができませんでした。: " + status);
      }
    });
  });
}
