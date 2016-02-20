// Toggle Function


$(document).on('ready page:load', function () {

    function lo_encontre(id){

        $.post("/service/loencontre", {search_taxi_id : id}, function (u) {
            if (u.status == "success") {
                if( null == u.service ){
                    return;
                }else{

                    window.location.href = "/pasajero/abordar/"+ u.service.id;
                }
            }
        })
    }

    tPasajero = {
        cloking : function (desde) {

            var ms = moment().diff(moment(new Date(desde).toString()), "DD/MM/YYYY HH:mm:ss");
            var d = moment.duration(ms);
            $(".viaje-timer").html(d._data.hours + ':' + d._data.minutes + ':'+ d._data.seconds );
            $(".viaje-precio").html( (( d._data.hours * 60 + d._data.minutes ) * 1.00).toFixed(2) )

        },
        searchTaxi : function(){
            var str = $( "form[name='search_taxi']" ).serialize();
            $.post("pasajero/buscar_taxi", str, function ( response ) {
                if (response.status == "success") {

                    setInterval(function(){lo_encontre(response.search_taxi.id)}, 3000);

                    $('.progress-bar')
                        .animate({ width: '100%' }, {
                            duration: 60000,
                            complete : function () {
                                $(this).css({width : '0%'})
                            }
                        });

                }
            });

        },
        getChofer : function () {

            var that = this;

            if ( $("#pasasjero_abordar").length == 0) return;

            var params = {
                id : $("#service_id").val()
            };

            $.get("/chofer/getChofer", params, function ( response ) {

                if (response.status == "success") {

                    var template = $('#template').html();

                    Mustache.parse(template);   // optional, speeds up future uses
                    var rendered = Mustache.render(template, response);
                    $("#pasasjero_abordar").html( rendered );

                    setInterval(function () {
                        tService.verifica('pasajero')
                    } , 3000);

                }

            });

        },
        abordar : function () {

            var params = {
                id : $("#service_id").val(),
                serv_status : 'CARRERA'
            };

            $.post("/service/update", params, function ( response ) {

                if (response.status == 'success') {
                    window.location.reload();
                }

            });
        },
        verifica : function () {
            if ( $("#pasajero_search_taxi").length == 0) return;
            $.get('/pasajero/verifica',{}, function (u) {
                if (u.search_taxi != null) {
                    window.location.href = "/pasajero/abordar/"+ u.service.id;
                }

            })
        }
    };

    tPasajero.getChofer();
    tPasajero.verifica();

});
