
$( document ).ready(function() {
    var map = L.map('map').setView([-12.103722877061777,  -76.96299092050782], 17);

    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
        maxZoom: 18,
        id: 'mapbox.streets-basic',
        accessToken: 'pk.eyJ1IjoiY2FtZWYiLCJhIjoiYjQ3NGI0YTE5NGI3OWYyNGZhMzFlMDI1NDE3MTI1NzAifQ.TuW75_HLjFL4k-qGZ_2CLg'
    }).addTo(map);

    var marker = L.marker([-12.103722877061777,  -76.96299092050782], {
        draggable : true
    });
        marker.addTo(map)
            .bindPopup('waldo');
        marker.on('click', function ( event ) {
            this.setPopupContent(event.latlng.toString())
            console.log( event.latlng.toString() )
        })


});