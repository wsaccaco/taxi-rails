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

                }

            });

        }
        
    };


    tChofer.getPasajero();
    tChofer.searchRace();

});
