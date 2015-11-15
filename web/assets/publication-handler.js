(function ( $ ) {
    $.fn.addMusa = function( params ) {
        var musa = $.extend({
            id: 0,
            name: ""
        }, params );


        $("#musas-list").renderMusa({id:musa.id, name: musa.name});

        $("#musas-like").html('');
        $("#musa").val('');
        var musasListObj = $("#form_musasid_list");
        var musasListId = musasListObj.val();
        if (musasListId != '') {
            musasListObj.val(musasListId + ',' + musa.id);
        } else {
            musasListObj.val(musa.id);
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
    var musa = $(this).val();
    var result = 100 * Math.random();

    if (13 == e.which) {
        $("#musas-list").addMusa({id:result, name: musa});
    }
});

$('.musas').keyup(function(e){
    var musa = $(this).val();
    var musas = $("#musas").children();

    jQuery.grep(musas, function( n, i ) {
        $(n).show();
        if (0 != $(n).text().indexOf(musa)) {
            $(n).hide();
        }
    });

    if (13 == e.which) {
        $(this).val("");
    }
});

$("#formWrapper").on('click', '.add-musa', function(e){
    if ($("#error-message")) $("#error-message").remove();
    var musaId = $(this).attr('id');
    var musa = $(this).parent().text();
    $("#musas-list").addMusa({id:musaId, name: musa});
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