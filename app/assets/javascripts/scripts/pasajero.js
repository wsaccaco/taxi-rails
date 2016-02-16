// Toggle Function


$(document).on('ready page:load', function () {

    tPasajero = {
        searchTaxi : function(){
            var str = $( "form[name='search_taxi']" ).serialize();
            $.post("pasajero/buscar_taxi", str, function ( response ) {
                if (response.status == "success") {

                    $('.progress-bar')
                        .animate({ width: '100%' }, {
                            duration: 60000,
                            complete : function () {
                                $(this).css({width : '0%'})
                            }
                        });

                }
            });

        }
    }

});
