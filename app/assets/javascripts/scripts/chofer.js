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
                    console.log("/chofer/atender/"+ response.model.id)
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
        }
    };



    tChofer.searchRace();

});
