// Toggle Function


$(document).on('ready page:load', function () {

    tChofer = {
        searchRace : function(){

            if ($("#atention").length == 0) return;

            $.get("/chofer/search_race", {}, function ( response ) {

                if (response.status == "success") {

                     var template = $('#template').html();

                     Mustache.parse(template);   // optional, speeds up future uses
                     var rendered = Mustache.render(template, response);
                     $("#atention").html( rendered );

                }
                
                if ( response.status == 'carrera'){
                    window.location.href = "/chofer/atender/"+ response.model.id;
                }

            });

        },
        accept_race : function ( me ) {

            var params = $( me ).parents("form").serialize();

            $.get("/chofer/accept_race", params, function ( response ) {

                if (response.status == "success") {

                    console.log( response );

                }

            });
        },
        
        getPasajero : function () {

            if ( $("#chofer_atender").length == 0) return;

            var params = {
                id : $("#service_id").val()
            };

            $.get("/pasajero/getPasajero", params, function ( response ) {

                if (response.status == "success") {

                    var template = $('#template').html();

                    Mustache.parse(template);   // optional, speeds up future uses
                    var rendered = Mustache.render(template, response);
                    $("#chofer_atender").html( rendered );
                    var pasajero = response.search_taxi.search_geo_start;
                    var destino = response.search_taxi.search_geo_end;
                    var coord_pasajero = pasajero.split(",");
                    var coord_destino = destino.split(",");

                    tMaps.geolocation();

                    map.addMarker({
                        lat: coord_pasajero[0],
                        lng: coord_pasajero[1],
                        icon : "http://maps.google.com/mapfiles/ms/icons/green-dot.png",
                        draggable:true
                    });
                    map.addMarker({
                        lat: coord_destino[0],
                        lng: coord_destino[1],
                        icon : "http://maps.google.com/mapfiles/ms/icons/blue-dot.png",
                        draggable:true
                    });
                    setInterval(function () {
                        tService.verifica('chofer')
                    }, 3000);


                }

            });

        },
        completar : function () {

            var params = {
                id : $("#service_id").val(),
                serv_status : 'TERMINADO'
            };

            $.post("/service/update", params, function ( response ) {

                if (response.status == 'success') {
                    window.location.reload();
                }

            });
        }
        
    };


    tChofer.getPasajero();
    var search_race = setInterval(tChofer.searchRace, 3000);

});
