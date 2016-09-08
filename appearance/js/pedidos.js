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
        var url = "COrders/searchClient/";
        var posting = $.post(url, {numberClient: telefono});
        posting.done(function (data) {
            var obj = jQuery.parseJSON(data);
            if (obj.length > 0) {
                $('#nombreCliente').html(obj[0].NameClient);
                $('#DireccionCliente').html(obj[0].DirectionClient);
                $('#ClientName').val(obj[0].NameClient);
                var dirseg = obj[0].DirectionClient.split(", ");
                $('#ClientNumberHouse').val(dirseg[3].substring(1));
                $('#ClientPassage').val(dirseg[2]);
                $('#ClientStreet').val(dirseg[1]);
                $('#ClientZone').val(dirseg[0]);
                $("#codagency").val(obj[0].IdAgency);
                $("#ClientMail").val(obj[0].email);
                //$('#ClientDirection').val(obj[0].DirectionClient);
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
    var comment = $form.find("textarea[name='ordrComment']").val();
    var precio = $form.find(".itemPrice").html();
    var quantitySauce = $form.find(".saucedetail tr").length;
    var garniture = $form.find("select[name='garniture']").val();
    var fila = '<tr id="itemDetail' + indice + '" class="itemORDR">';
    fila += '<td class="Dscription' + idForm + '">' + nameItem + '</td>';
    if (quantitySauce > 0) {
        fila += '<td class="salsa1"><table class="table table-bordered table-condensed"><tbody>';
        for (var j = 0; j < quantitySauce; j++) {
            fila += '<tr class="tr' + j + '">';
            fila += '<td class="salsaNum' + $form.find("select[name='typeSalsa" + j + "']").val() + '">' + $form.find("select[name='typeSalsa" + j + "'] option:selected").text() + '</td>';
            fila += '<td class="picanteNum' + $form.find("select[name='nivelHot" + j + "']").val() + '">' + $form.find("select[name='nivelHot" + j + "'] option:selected").text() + '</td>';
            var opciones = $form.find("select[name='opciones" + j + "']").val();
            if (opciones) {
                fila += '<td class="vegetales' + $form.find("select[name='garniture" + j + "']").val() + '">' + $form.find("select[name='garniture" + j + "'] option:selected").text() + " - " + opciones + '</td>';
            } else {
                fila += '<td class="vegetales' + $form.find("select[name='garniture" + j + "']").val() + '">' + $form.find("select[name='garniture" + j + "'] option:selected").text() + '</td>';
            }

            fila += '</tr>';
        }
        fila += '</tbody></table></td>';
    } else {
        fila += '<td class="salsa0"></td>';
    }
    fila += '<td class="cantidad">' + quantity + '</td>';
    fila += '<td class="Price">' + precio + '</td>';
    if (garniture && quantitySauce > 0) {
        fila += '<td class="comentariosItem">' + comment + ' - ' + garniture + '</td>';
    } else {
        fila += '<td class="comentariosItem">' + comment + '</td>';
    }

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
    $('#subTotalPedido').html(total.toFixed(2));
    var cargo = document.getElementById("cargoEnvio").checked ? 1.45 : 0.00;
    total += cargo;
    var dsc = total * $("[name=descuento]:checked").val();
    total -= dsc;
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
        var producto = 0, cantidad = 0, precio = 0;
        producto = $(this).find("td").eq(0).attr('class').substring(10);
        cantidad = $(this).find(".cantidad").html();
        precio = $(this).find(".Price").html();
        var comentarios = $(this).find(".comentariosItem").html();
        var salsas = new Array();
        for (var i = 0; i < $(this).find(".salsa1 tr").length; i++) {
            var idSalsa = $(this).find(".salsa1 .tr" + i + " td").eq(0).attr('class').substring(8);
            var idPicante = $(this).find(".salsa1 .tr" + i + " td").eq(1).attr('class').substring(10);
            var vegetables = $(this).find(".salsa1 .tr" + i + " td").eq(2).html();
            var salsaItem = {idSalsa: idSalsa, idPicante: idPicante, vegetables: vegetables};
            salsas[i] = salsaItem;
        }
        var item = {producto: producto, cantidad: cantidad, precio: precio, salsas: salsas, comentarios: comentarios};
        items[index] = item;
    });
    //console.log(items);
    //var dir = $('#DireccionCliente').html();
    var tel = $('#telefonoCliente').html();
    var name = $('#nombreCliente').html();
    var commen = $('#PagoCashComment').val();
    commen += "     " + $('#ClientComment').val();
    var total = $('#subTotalPedido').html();
    //total += 1.45;
    var discount = total * $('input[name="descuento"]').val();
    var agency = $("#codagency").val();
    var house = $('#ClientNumberHouse').val();
    var pasaje = $('#ClientPassage').val();
    var calle = $('#ClientStreet').val();
    var zona = $('#ClientZone').val();
    var email = $('#ClientMail').val();
    var cargoEnvio = document.getElementById("cargoEnvio").checked ? 1.45 : 0.00;
    if (zona || house || pasaje || calle) {
        var dir = zona + ', ' + calle + ', ' + pasaje + ', #' + house;
        if (tel || name) {
            if (items.length > 0) {
                if (comprobarpago() === 1) {
                    crearPedido(name, tel, dir, commen, agency, items, total, email, cargoEnvio, discount);
                } else {
                    alert("Falta Definir informacion de pago");
                }

            } else {
                alert("Debe agregar elementos del menu al pedido.");
            }

        } else {
            alert("Debe especificar todos los datos del cliente");
        }
    } else {
        alert("Debe especificar todos los campos de la direccion");
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
    //$('#ClientDirection').val('');
    $('#ClientNumber').val('');
    $('#ClientName').val('');
    $('#ClientNumberHouse').val('');
    $('#ClientPassage').val('');
    $('#ClientStreet').val('');
    $('#ClientZone').val('');
    $('#ClientMail').val('');
    pagoTarjeta = 0;
    pagoEfectivo = 0;
    comentarios = "";
    $('#PagoTarjetaReferencia').val('');
    $('#PagoCashComment').val('');
    $('#cargoEnvio').prop("checked", true);
    $('input[name="descuento"]').val(0);
    
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
function crearPedido(nameClient, numberClient, directionClient, comments, agency, items, total, email, cargoEnvio, discount) {
    var url = "COrders/crearPedido/";
    var posting = $.post(url, {numberClient: numberClient, nameClient: nameClient, directionClient: directionClient, comments: comments, agency: agency, items: items, total: total, referencia: $('#PagoTarjetaReferencia').val(), email: email, cargo: cargoEnvio, discount: discount});
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

$("#cargoEnvio").change(function () {
    console.log(document.getElementById("cargoEnvio").checked ? 1.45 : 0.00);
   calcularTotal()
});

$("[name=descuento]").change(function () {
    console.log($("[name=descuento]:checked").val());
    calcularTotal()
});