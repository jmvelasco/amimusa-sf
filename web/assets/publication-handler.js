(function ( $ ) {
    $.fn.addMusa = function( params ) {
        var musa = $.extend({
            id: 0,
            name: ""
        }, params );

        var musasListObj = $("#musasid_list") || $("#musasid_list-mobile");
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
        return musasListObj.val();
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

        $("#mobileWrapper #musas").html($("#mobileWrapper #musas").html() + h4.outerHTML);
        $("#desktopWrapper #musas").html($("#desktopWrapper #musas").html() + h4.outerHTML);
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

        $("#mobileWrapper #musas-list").html($("#mobileWrapper #musas-list").html() + h4.outerHTML);
        $("#desktopWrapper #musas-list").html($("#desktopWrapper #musas-list").html() + h4.outerHTML);
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
                    
                    if ('none' == $("#mobileWrapper").css('display')) {
                        var musasListContainer = $("#desktopWrapper #musas-list");
                    } else {
                        var musasListContainer = $("#mobileWrapper #musas-list");
                    }
                    
                    var musasIds = musasListContainer.addMusa({id: returnData, name: musa});
                    $("#mobileWrapper #musasid_list-mobile").val(musasIds);
                    $("#desktopWrapper #musasid_list").val(musasIds);

                    $("#form_save").prop('disabled', false);
                    $(":submit").removeAttr("disabled");
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    console.log('search-musa', data, errorThrown);
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


$("#formWrapper").on('click', '#formSubmit', function(e){
    
    const title = $("#title").val();
    const writting = $("#writting").val();
    const musasid_list = $("#musasid_list").val();

    console.log(title, writting, musasid_list);

    if ($.trim(title) == '') {
        $("#title").focus();
        return alert("Por favor, pon un títlo al escrito.");
    }
    if ($.trim(writting) == '') {
        $("#writting").focus();
        return alert("Vaya, parece que has olvidado escribir algo.");
    }
    if (musasid_list.length == 0) {
        $("#writting").focus();
        return alert("Por favor, indica tu musa.");
    }  

    $("#new").submit();

});

$("#formWrapper").on('click', '#formMobileSubmit', function(e){
    
    const title = $("#title-mobile").val();
    const writting = $("#writting-mobile").val();
    const musasid_list = $("#musasid_list-mobile").val();

    console.log(title, writting, musasid_list);

    if ($.trim(title) == '') {
        $("#title").focus();
        return alert("Por favor, pon un títlo al escrito.");
    }
    if ($.trim(writting) == '') {
        $("#writting").focus();
        return alert("Vaya, parece que has olvidado escribir algo.");
    }
    if (musasid_list.length == 0) {
        $("#writting").focus();
        return alert("Por favor, indica tu musa.");
    }  

    $("#new-mobile").submit();

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
    var musasListObj = $("#musasid_list") || $("#musasid_list-mobile");
    var musasIdsArr = musasListObj.val().split(",");

    // Actualizar el campo donde se registrar los ids de las musas
    var pos = $.inArray(musaId, musasIdsArr);
    if (-1 != pos) {
        musasIdsArr = jQuery.grep(musasIdsArr, function(value) {
            return value != musaId;
        });
    }
    musasIdsArr = musasIdsArr.filter( val => (val != ""));

    musasListObj.val(musasIdsArr.join(","));
    $("#desktopWrapper #musasid_list").val(musasListObj.val());
    $("#mobileWrapper #musasid_list-mobile").val(musasListObj.val());
    // Eliminar elemento del DOM
    $(this).parents('h4').remove();

    
});
/*
$("#mobileWrapper").on('blur', '#form_title', function(e){
    $("#desktopWrapper #form_title").val($(this).val());
});

$("#desktopWrapper").on('blur', '#form_title', function(e){
    $("#mobileWrapper #form_title").val($(this).val());
});

$("#mobileWrapper").on('blur', '#form_body', function(e){
    $("#desktopWrapper #form_body").val($(this).val());
});

$("#desktopWrapper").on('blur', '#form_body', function(e){
    $("#mobileWrapper #form_body").val($(this).val());
});
*/
