var codigo;
var indice = 0;
var pagoTarjeta = 0;
var pagoEfectivo = 0;
var comentarios = "";
var refencia = "";
function agregarItemMenu(item) {
    codigo = item.id;
}
;
function showPaymentCash(fila) {
    if (pagoTarjeta === 0) {
        $("#FormaDePagoEfectivo").modal('toggle');

    } else {
        alert("Ya se establecio el pago con tarjeta como metodo de pago para el pedido actual");
    }
}
;
function showPaymentOnline(fila) {
    if (pagoEfectivo === 0) {
        $("#FormaDePagoTarjeta").modal('toggle');

    } else {
        alert("Ya se establecio el pago en efectivo como metodo de pago para el pedido actual");
    }


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
    var quantity = $form.find("input[name='Quantity']").val();
    var precio = $form.find(".itemPrice").html();
    var quantitySauce = $form.find(".saucedetail tr").length;
    var fila = '<tr id="itemDetail' + indice + '" class="itemORDR">';
    fila += '<td class="Dscription' + idForm + '">' + nameItem + '</td>';
    if (quantitySauce > 0) {
        fila += '<td class="salsa1">';
        for (var j = 0; j < quantitySauce; j++) {
            fila += '<table class="table table-bordered table-condensed"><tr>';
            fila += '<td class="salsaNum' + $form.find("select[name='typeSalsa" + j + "']").val() + '">' + $form.find("select[name='typeSalsa" + j + "'] option:selected").text() + '</td>';
            fila += '<td class="picanteNum' + $form.find("select[name='nivelHot" + j + "']").val() + '">' + $form.find("select[name='nivelHot" + j + "'] option:selected").text() + '</td>';
            fila += '</tr></table>';
        }
        fila += '</td>';
    } else {
        fila += '<td class="salsa0"></td>';
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
    $("#detailOrder .itemORDR").each(function (index)
    {
        var cantidad = $(this).find(".cantidad").html();
        var precio = $(this).find(".Price").html();
        //if (cantidad) {
            total += cantidad * precio;
        //}
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
    $("#detailOrder .itemORDR").each(function (index)
    {
        var producto = 0, salsa = 0, picante = 0, cantidad = 0, precio = 0;
        producto = $(this).find("td").eq(0).attr('class').substring(10);
//        salsa = $(this).find("td").eq(1).attr('class').substring(5);
//        picante = $(this).find("td").eq(2).attr('class').substring(7);
        cantidad = $(this).find("td").eq(3).html();
        precio = $(this).find("td").eq(4).html();
        var salsas = new Array();
        for (var i = 0; i < $(this).find(".salsa1 tr").length; i++) {
            var idSalsa = $(this).find(".salsa1 tr td").eq(0).attr('class').substring(8);
            var idPicante = $(this).find(".salsa1 tr td").eq(1).attr('class').substring(10);
            var salsaItem = {idSalsa:idSalsa, idPicante:idPicante};
            salsas[i] = salsaItem;
        }
        var item = {producto: producto, cantidad: cantidad, precio: precio, salsas:salsas};
        items[index] = item;
    });
console.log(items);
    var dir = $('#DireccionCliente').html();
    var tel = $('#telefonoCliente').html();
    var name = $('#nombreCliente').html();
    var commen = $('#PagoCashComment').val();
    var referencia = $('#PagoTarjetaReferencia').val();
    var total = $('#totalPedido').html();
    var agency = $("#codagency").val();
    if (dir || tel || name) {
        if (items.length > 0) {
            if (comprobarpago() === 1) {
                crearPedido(name, tel, dir, commen, agency, items, total, referencia);
            } else {
                alert("Falta Definir informacion de pago");
            }

        } else {
            alert("Debe agregar elementos del menu al pedido.");
        }

    } else {
        alert("Debe especificar todos los campos");
    }
}
;
function comprobarpago() {
    var comprobacion = 0;

    if (pagoTarjeta == !0) {
        if ($('#PagoTarjetaReferencia').val()) {
            comprobacion = 1;
        }
    }
    if (pagoEfectivo == !0) {
        if ($('#PagoCashComment').val()) {
            comprobacion = 1;
        }
    }
    return comprobacion;
}
function limpiarCampos() {
    $("#detailOrder").html('');
    $('#DireccionCliente').html('');
    $('#nombreCliente').html('');
    $('#telefonoCliente').html('');
    $('#totalPedido').html('0.00');
    $('#ClientDirection').val('');
    $('#ClientNumber').val('');
    $('#ClientName').val('');
    pagoTarjeta = 0;
    pagoEfectivo = 0;
    comentarios = "";
    $('#PagoTarjetaReferencia').val('');
    $('#PagoCashComment').val('');
}
;


$('#logout').click(function () {
    var url = "General/logout/";
    var posting = $.post(url);
    posting.done(function (data) {
    });
    posting.fail(function (xhr, textStatus, errorThrown) {
        //alert("error" + xhr.responseText);
    });
});


function crearPedido(nameClient, numberClient, directionClient, comments, agency, items, fecha, hora, total) {
    var url = "Orders/crearPedido/";
    var posting = $.post(url, {numberClient: numberClient, nameClient: nameClient, directionClient: directionClient, comments: comments, agency: agency, items: items, fecha: fecha, hora: hora, total: $('#totalPedido').html(), referencia: $('#PagoTarjetaReferencia').val()});
    posting.done(function (data) {
        $("#OrderNumber").html(data);
        $("#modalPedidoExitoso").modal('toggle');
        limpiarCampos();
    });
    posting.fail(function (xhr, textStatus, errorThrown) {
        alert("error" + xhr.responseText);
    });
}
;

function showbuscarPedido() {
    $("#modalPedidoBusqueda").modal('toggle');
}
;


$("#searchOrderBy").submit(function (event) {
    event.preventDefault();
    var $form = $(this), numberOption = $form.find("select[name='tipofiltro']").val(), filtertext = $form.find("input[name='filtro']").val(), url = $form.attr("action");
    var posting = $.post(url, {numberOption: numberOption, filtertext: filtertext});
    posting.done(function (data) {
        $('#listaPedidos').html(data);
    });
    posting.fail(function (xhr, textStatus, errorThrown) {
        alert("error" + xhr.responseText);
    });
});
$('#frmPagoEfectivo').submit(function (event) {
    event.preventDefault();
    pagoEfectivo = 1;
    $("#FormaDePagoEfectivo").modal('toggle');
});
$('#frmPagoTarjeta').submit(function (event) {
    event.preventDefault();
    pagoTarjeta = 1;
    $("#FormaDePagoTarjeta").modal('toggle');
});
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