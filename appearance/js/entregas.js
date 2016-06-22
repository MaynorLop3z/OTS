function viewDetail(boton) {
    var codigo = boton.id.substring(10);
    var url = "Deliveries/viewDetailOrder/";
    var posting = $.post(url, {codigo: codigo});
    posting.done(function (data) {
        $("#ModalTittleView").html("Detalle del Pedido #" + codigo);

        var obj = jQuery.parseJSON(data);
        var tabla = "";
        for (var x in obj) {
            tabla += '<tr>';
            tabla += '<td>' + obj[x].nameproduct + '</td>';
            if (obj[x].namesauce) {
                tabla += '<td>' + obj[x].namesauce + '</td>';
            } else {
                tabla += '<td></td>';
            }
            if (obj[x].namespicy) {
                tabla += '<td>' + obj[x].namespicy + '</td>';
            } else {
                tabla += '<td></td>';
            }

            tabla += '<td>' + obj[x].quantity + '</td>';
            tabla += '<td>' + obj[x].unitprice + '</td>';
            tabla += '</tr>';

        }
        $("#OrderDetail").html(tabla);
        $("#viewDetailModal").modal('toggle');
    });
    posting.fail(function (xhr, textStatus, errorThrown) {
        alert("error" + xhr.responseText);
    });

}
;

function viewDispatcher(boton) {
    var codigo = boton.id.substring(8);
    $("#OrderNumber").html(codigo);
    $("#viewDispatchModal").modal('toggle');
}

function despachar() {
    var codigo = $("#OrderNumber").html();
    var url = "Deliveries/dispatchOrder/";
    var hora = getHoraActual();
    var posting = $.post(url, {codigo: codigo, hora: hora});
    posting.done(function (data) {
        $('#OrderList').find('#' + codigo).fadeOut("slow");
        $('#OrderList').find('#' + codigo).remove();
        $("#viewDispatchModal").modal('toggle');
    });
    posting.fail(function (xhr, textStatus, errorThrown) {
        console.log(xhr.responseText);
        alert("error" + xhr.responseText);
    });
}
;

function getHoraActual() {
    var actual = new Date();
    var hours = actual.getHours(), minutes = actual.getMinutes(), seconds = actual.getSeconds();
    if (hours < 10) {
        hours = "0" + hours;
    }
    if (minutes < 10) {
        minutes = "0" + minutes;
    }
    if (seconds < 10) {
        seconds = "0" + seconds;
    }
    return hours + ':' + minutes + ':' + seconds;

}
;

var veces = 0;

function updatePending() {
    var url = "Deliveries/syncPedingOrders/";
    var posting = $.post(url, {estado: "pendiente"});
    posting.done(function (data) {
        $('#OrderList').html(data);
    });
    posting.fail(function (xhr, textStatus, errorThrown) {
        console.log(xhr.responseText);
        alert("error" + xhr.responseText);
    });
    setTimeout("updatePending()", 30000);
}
updatePending();