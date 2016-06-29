(function ( $ ) {
    $.fn.addMusa = function( params ) {
        var musa = $.extend({
            id: 0,
            name: ""
        }, params );

        var musasListObj = $("#form_musasid_list");
        var musasListIdsArr = musasListObj.val().split(",");

        if (-1 == musasListIdsArr.indexOf(musa.id)) {
            musasListIdsArr.push(musa.id);
            musasListObj.val(musasListIdsArr.join(","));
            $("#musas-list").renderMusa({id:musa.id, name: musa.name});

            var exists = false;
            $("#musas").find('.add-musa').each(function(i, v){
                if (musa.id == $(v).attr('id')) {
                    exists = true;
                }
            });

            if (!exists) {
                $("#musas").createMusa({id:musa.id, name: musa.name});
            }

        }
    };
}( jQuery ));

(function ( $ ) {
    $.fn.createMusa = function( params ) {
        var musa = $.extend({
            id: 0,
            name: ""
        }, params );

        var h4 = document.createElement("h4");
        var label = document.createElement("span");
        label.className = "label label-primary";
        var add = document.createElement("span");
        add.className = "glyphicon glyphicon-plus-sign add-musa";
        add.id = musa.id;
        label.innerHTML = musa.name + add.outerHTML;
        h4.style.marginLeft = "2px";
        h4.className = "pull-left";
        h4.appendChild(label);
        $("#musas").html($("#musas").html() + h4.outerHTML);
    };
}( jQuery ));

(function ( $ ) {
    $.fn.renderMusa = function( params ) {
        var musa = $.extend({
            id: 0,
            name: ""
        }, params );

        var h4 = document.createElement("h4");
        var label = document.createElement("span");
        label.className = "label";
        label.style.backgroundColor = "#1a82f7";
        var remove = document.createElement("span");
        remove.className = "glyphicon glyphicon-remove remove-musa";
        remove.id = musa.id;
        label.innerHTML = musa.name + remove.outerHTML;
        h4.style.marginLeft = "2px";
        h4.className = "pull-left";
        h4.appendChild(label);
        $("#musas-list").html($("#musas-list").html() + h4.outerHTML);
    };
}( jQuery ));

$('.musas').keypress(function(e){
    var musa = $(this).val().replace("\n","");

    if (13 == e.which) {
        if ('' != $.trim(musa)) {
            // Buscar si la musa ya ha sido añadida
            var data = {name : musa};
            $.ajax({
                type: "POST",
                url: "/search-musa/",
                data: data,
                success: function (returnData, dataType) {
                    $("#musas-list").addMusa({id: returnData, name: musa});
                    //$("#musas").createMusa({id: returnData, name: musa});
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert('Error : ' + errorThrown);
                }
            });


        }

    }
});

function cleanMusas() {
    // Mostrar todas las musas disponibles
    $("#musas").children().each(function(i, v){
        $(v).show();
    });
}

$('.musas').keyup(function(e){
    var musa = $(this).val();
    var musas = $("#musas").children();

    // Filtrar las musas disponibles
    jQuery.grep(musas, function( n, i ) {
        $(n).show();
        if (0 != $(n).text().indexOf(musa)) {
            $(n).hide();
        }
    });

    if (13 == e.which) {
        $(this).val("");
        // Mostrar todas las musas disponibles
        cleanMusas();

    }
});

$("#formWrapper").on('click', '.add-musa', function(e){
    if ($("#error-message")) $("#error-message").remove();
    var musaId = $(this).attr('id');
    var musa = $(this).parent().text();
    $("#musas-list").addMusa({id:musaId, name: musa});
    cleanMusas();
    $('.musas').val("");
});

$("#formWrapper").on('click', '.remove-musa', function(e){
    var musaId = $(this).attr('id');
    var musasListObj = $("#form_musasid_list");
    var musasIdsArr = musasListObj.val().split(",");

    // Actualizar el campo donde se registrar los ids de las musas
    var pos = $.inArray(musaId, musasIdsArr);
    if (-1 != pos) {
        musasIdsArr = jQuery.grep(musasIdsArr, function(value) {
            return value != musaId;
        });
    }
    musasListObj.val(musasIdsArr.join(","));
    // Eliminar elemento del DOM
    $(this).parents('h4').remove();
});

