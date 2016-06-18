function viewDetail(boton) {
    var codigo = boton.id.substring(10);
    var url = "Deliveries/viewDetailOrder/";
    var posting = $.post(url, {codigo: codigo});
    posting.done(function (data) {
        $("#ModalTittleView").html("Detalle del Pedido #" + codigo);

        var obj = jQuery.parseJSON(data);
        console.log(obj);
        var tabla = "";
        for (x in obj) {
            tabla += '<tr>';
            tabla += '<td>' + obj[x].nameproduct + '</td>';
            if (obj[x].namesauce) {
              tabla += '<td>' + obj[x].namesauce + '</td>';  
            }else {
                tabla += '<td></td>';
            }
            if (obj[x].namespicy) {
              tabla += '<td>' + obj[x].namespicy + '</td>';  
            }else {
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
        console.log(xhr.responseText);
        alert("error" + xhr.responseText);
    });

}
;