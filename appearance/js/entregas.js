function viewDetail(boton) {
    var codigo = boton.id.substring(10);
    var url = "CDeliveries/viewDetailOrder/";
    var posting = $.post(url, {codigo: codigo});
    posting.done(function (data) {
        $("#ModalTittleView").html("Detalle del Pedido #" + codigo);
        $("#OrderDetail").html(data);
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
    var url = "CDeliveries/dispatchOrder/";
    var hora = getHoraActual();
    var status = $('#IdEstado'+codigo).val();
    var motorizado = $('#IdMotorizado'+codigo).val();
//    console.log(codigo);
//    console.log(status);
//    console.log(motorizado);
    var posting = $.post(url, {codigo: codigo, hora: hora, status: status, motorizado: motorizado});
    posting.done(function (data) {
        if (status === 4) {
//            console.log(status);
            $('#OrderList').find('#' + codigo).fadeOut("slow");
            $('#OrderList').find('#' + codigo).remove();
        }
        $("#viewDispatchModal").modal('toggle');
    });
    posting.fail(function (xhr, textStatus, errorThrown) {
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
    var url = "CDeliveries/syncPedingOrders/";
    var posting = $.post(url, {estado: "pendiente"});
    posting.done(function (data) {
        $('#OrderList').html(data);
    });
    posting.fail(function (xhr, textStatus, errorThrown) {
        alert("error" + xhr.responseText);
    });
    setTimeout("updatePending()", 30000);
};
updatePending();

function Selecciona(IdOrder, IdStatus, IdMotorizado) {
    $('#IdEstado'+IdOrder).val(IdStatus);
    $('#IdMotorizado'+IdOrder).val(IdMotorizado);
//    console.log(IdOrder);
//    console.log(IdStatus);
//    console.log(IdMotorizado);
}
;
function printComanda(fila){
    //window.print();
    window.open('CPrinter/');
};