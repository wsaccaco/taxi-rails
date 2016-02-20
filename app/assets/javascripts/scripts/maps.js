// Toggle Function


$(document).on('ready page:load', function () {
    map = new GMaps({
      el: '#map',
      lat: -12.043333,
      lng: -77.028333,
      click : function( e ){
          marker.setPosition(e.latLng)
          $("input[name=search_geo_end]").val(e.latLng.lat() + ", " + e.latLng.lng());
      }
    });
    
    var marker = map.addMarker({
      lat: 0,
      lng: 0,
      icon: "http://maps.google.com/mapfiles/ms/icons/blue-dot.png",
      draggable:true
    });
    
    tMaps = {
        geolocation : function(){
            GMaps.geolocate({
              success: function(position) {
                  if ($("input[name=search_geo_start]").length != 0) {
                      $("input[name=search_geo_start]").val(position.coords.latitude +", "+ position.coords.longitude);
                  }

                map.addMarker({
                  lat: position.coords.latitude,
                  lng: position.coords.longitude,
                  icon : "http://maps.google.com/mapfiles/ms/icons/red-dot.png",
                  draggable:true
                });

                map.setCenter(position.coords.latitude, position.coords.longitude);

              },
              error: function(error) {
                alert('Geolocation failed: '+error.message);
              },
              not_supported: function() {
                alert("Your browser does not support geolocation");
              }
            });            
        }
    }
    
});
