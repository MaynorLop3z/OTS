var codigo;
var indice = 0;
function agregarItemMenu(item) {
    codigo = item.id;
    console.log(codigo);
}
;
function showPaymentCash(fila) {
    codigo = fila.id;
    console.log(codigo);
    console.log("Cash");
    $("#FormaDePago").modal('toggle');
}
;
function showPaymentOnline(fila) {
    codigo = fila.id;
    console.log(codigo);
    $("#FormaDePago").modal('toggle');
}
;


function searchClient(event) {
    var tecla = event.keyCode || event.which;
    if (tecla === 9) {
        //event.preventDefault();
        console.log("Tecla Tab");
        $('#telefonoCliente').html($('#ClientNumber').val());
    }
}
;
function setClient(event) {
    var tecla = event.keyCode || event.which;
    if (tecla === 9) {
        $('#nombreCliente').html($('#ClientName').val());
        console.log("Tecla Tab");
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
//$('#ClientDirection').keydown(function (e) {
//    var tecla = e.keyCode || e.which;
//    if (tecla === 9) {
//        $('#DireccionCliente').html($('#ClientDirection').text());
//    }
//});
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
    console.log(idForm);
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
    $("#detailOrder tr").each(function (index)
    {
        var producto = 0, salsa = 0, picante = 0, cantidad = 0;
        producto = $(this).find("td").eq(0).attr('class').substring(10);
        salsa = $(this).find("td").eq(1).attr('class').substring(5);
        picante = $(this).find("td").eq(2).attr('class').substring(7);
        cantidad = $(this).find("td").eq(3).html();
        console.log(producto + ' - ' + salsa + ' - ' + picante + ' - ' + cantidad);
//        $(this).children("td").each(function (index2) {
//            console.log($(this).attr('class') + '-' + $(this).html());
//        });
    });
    var dir = $('#DireccionCliente').html();
    var tel = $('#telefonoCliente').html();
    var name = $('#nombreCliente').html();
    var commen = "TEST";
    var agency = $("#codagency").val();
    crearPedido(name, tel, dir, commen, agency);
    limpiarCampos();
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
    alert('Salir');
});


function crearPedido(nameClient, numberClient, directionClient, comments, agency) {
    var url = "Orders/crearPedido/";
    var posting = $.post(url, {numberClient: numberClient, nameClient: nameClient, directionClient: directionClient, comments: comments, agency: agency});
    posting.done(function (data) {
        var obj = jQuery.parseJSON(data);
        console.log(obj.IdOrder);
    });
    posting.fail(function (xhr, textStatus, errorThrown) {
        alert("error" + xhr.responseText);
    });
}