var codigo;
var indice = 0;
var nit = "";
var nrc = "";
var comentarios = "";
function agregarItemMenu(item) {
    codigo = item.id;
}
;
function showPaymentCash(fila) {
    codigo = fila.id;
    $("#FormaDePagoEfectivo").modal('toggle');
}
;
function showPaymentOnline(fila) {
    codigo = fila.id;
    $("#FormaDePagoTarjeta").modal('toggle');
}
;


function searchClient(event) {
    var tecla = event.keyCode || event.which;
    if (tecla === 9) {
        $('#telefonoCliente').html($('#ClientNumber').val());
        var telefono = $('#ClientNumber').val();
        var url = "Orders/searchClient/";
        var posting = $.post(url, {numberClient: telefono});
        posting.done(function (data) {
            var obj = jQuery.parseJSON(data);
            if (obj.length > 0) {
                $('#nombreCliente').html(obj[0].NameClient);
                $('#DireccionCliente').html(obj[0].DirectionClient);
                $('#ClientName').val(obj[0].NameClient);
                $('#ClientDirection').val(obj[0].DirectionClient);
            }
        });
        posting.fail(function (xhr, textStatus, errorThrown) {
            alert("error" + xhr.responseText);
        });
    }
}
;
function setClient(event) {
    var tecla = event.keyCode || event.which;
    if (tecla === 9) {
        $('#nombreCliente').html($('#ClientName').val());
    }
}
;
function setClientDir(event) {
    var tecla = event.keyCode || event.which;
    if (tecla === 9) {
        $('#DireccionCliente').html($('#ClientDirection').val());
    }
}
;
$(".itemMenu").submit(function (event) {
    event.preventDefault();
    var $form = $(this);
    var idForm = $form.attr('id').substring(3);
    var nameItem = $form.find(".itemName").html();
    var typeSalsa = $form.find("select[name='typeSalsa']").val();
    var salsa = $form.find("select[name='typeSalsa'] option:selected").text();
    var nivelHot = $form.find("select[name='nivelHot']").val();
    var nivel = $form.find("select[name='nivelHot'] option:selected").text();
    var quantity = $form.find("input[name='Quantity']").val();
    var precio = $form.find(".itemPrice").html();
    var fila = '<tr id="itemDetail' + indice + '">';
    fila += '<td class="Dscription' + idForm + '">' + nameItem + '</td>';
    if (typeSalsa) {
        fila += '<td class="salsa' + typeSalsa + '">' + salsa + '</td>';
    } else {
        fila += '<td class="salsa0"></td>';
    }
    if (nivelHot) {
        fila += '<td class="picante' + nivelHot + '">' + nivel + '</td>';
    } else {
        fila += '<td class="picante0"></td>';
    }
    fila += '<td class="cantidad">' + quantity + '</td>';
    fila += '<td class="Price">' + precio + '</td>';
    fila += '<td class="Acciones"><button id="itemDEL' + indice + '" onclick="eliminarItem(this)" title="Eliminar Item" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> </button></td>';
    fila += "</tr>";
    $('#detailOrder').append(fila);
    indice++;
    calcularTotal();
});
function calcularTotal() {
    var total = 0;
    $("#detailOrder tr").each(function (index)
    {
        var cantidad = $(this).find(".cantidad").html();
        var precio = $(this).find(".Price").html();
        total += cantidad * precio;
    });
    $('#totalPedido').html(total.toFixed(2));
}
;
function eliminarItem(fila) {
    var codeDetail = fila.id.substring(7);
    $('#detailOrder').find('#itemDetail' + codeDetail).fadeOut("slow");
    $('#detailOrder').find('#itemDetail' + codeDetail).remove();
    calcularTotal();
}
;

function realizarPedido(PEDIDO) {
    var items = new Array();
    $("#detailOrder tr").each(function (index)
    {
        var producto = 0, salsa = 0, picante = 0, cantidad = 0, precio = 0;
        producto = $(this).find("td").eq(0).attr('class').substring(10);
        salsa = $(this).find("td").eq(1).attr('class').substring(5);
        picante = $(this).find("td").eq(2).attr('class').substring(7);
        cantidad = $(this).find("td").eq(3).html();
        precio = $(this).find("td").eq(4).html();
        var item = {producto: producto, salsa: salsa, picante: picante, cantidad: cantidad, precio: precio};
        items[index] = item;
    });

    var dir = $('#DireccionCliente').html();
    var tel = $('#telefonoCliente').html();
    var name = $('#nombreCliente').html();
    var commen = "TEST";
    var agency = $("#codagency").val();
    if (dir || tel || name) {
        if (items.length > 0) {
            var actual = new Date();
            var fecha = actual.toJSON();
            var hora = calcularHoraActual();
            crearPedido(name, tel, dir, commen, agency, items, fecha, hora);
            limpiarCampos();
        } else {
            alert("Debe agregar elementos del menu al pedido.");
        }

    } else {
        alert("Debe especificar todos los campos");
    }
}
;
function limpiarCampos() {
    $("#detailOrder").html('');
    $('#DireccionCliente').html('');
    $('#nombreCliente').html('');
    $('#telefonoCliente').html('');
    $('#totalPedido').html('0.00');
    $('#ClientDirection').val('');
    $('#ClientNumber').val('');
    $('#ClientName').val('');
}
;


$('#logout').click(function () {
    var url = "General/logout/";
    var posting = $.post(url);
    posting.done(function (data) {
        console.log("Salida del sistema Exitosa.");
    });
    posting.fail(function (xhr, textStatus, errorThrown) {
        alert("error" + xhr.responseText);
    });
});


function crearPedido(nameClient, numberClient, directionClient, comments, agency, items, fecha, hora) {
    var url = "Orders/crearPedido/";
    var posting = $.post(url, {numberClient: numberClient, nameClient: nameClient, directionClient: directionClient, comments: comments, agency: agency, items: items, fecha: fecha, hora: hora});
    posting.done(function (data) {
        alert("Numero de pedido: " + data);
    });
    posting.fail(function (xhr, textStatus, errorThrown) {
        alert("error" + xhr.responseText);
    });
}
;
function calcularHoraActual() {
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