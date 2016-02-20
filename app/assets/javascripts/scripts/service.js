// Toggle Function


$(document).on('ready page:load', function () {

    function pasajero( service ){
        var interval = null;
        if ( service.serv_status == 'CARRERA' ){
            $(".panel-footer .abordar").remove()
        }

        if (service.serv_status == "CARRERA") {
            interval = setInterval(function(){tPasajero.cloking(service.serv_datetime_start)}, 1000)
        }

        if (service.serv_status == "TERMINADO") {
            clearInterval( interval );
            var ms = moment(service.serv_time).diff(moment(new Date(service.serv_datetime_start).toString()), "DD/MM/YYYY HH:mm:ss");
            var d = moment.duration(ms);
            $(".viaje-timer").html(d._data.hours + ':' + d._data.minutes + ':'+ d._data.seconds );
            $(".viaje-precio").html( service.serv_precio.toFixed(2) )
            $(".chofer_botones").remove();
        }

    }

    function chofer( service ){
        var interval = null;

        if (service.serv_status == "CARRERA") {
            interval = setInterval(function(){tPasajero.cloking(service.serv_datetime_start)}, 1000)
            $(".btn-completar").show();
        }

        if (service.serv_status == "TERMINADO") {
            clearInterval( interval );
            var ms = moment(service.serv_time).diff(moment(new Date(service.serv_datetime_start).toString()), "DD/MM/YYYY HH:mm:ss");
            var d = moment.duration(ms);
            $(".viaje-timer").html(d._data.hours + ':' + d._data.minutes + ':'+ d._data.seconds );
            $(".viaje-precio").html( service.serv_precio.toFixed(2) )
            $(".chofer_botones").remove();
            $(".new_carre").show();
        }

    }

    tService = {
        verifica : function ( view ) {

            var params = {
                id : $("#service_id").val(),
            };

            $.get('/service/verifica', params, function (u) {

                if (view == "pasajero"){
                    pasajero(u.service)
                }

                if (view == "chofer"){
                    chofer(u.service);
                }

            })
        }
    };

});
