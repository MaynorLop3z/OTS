function showAddProduct() {
    $("#AddProductModal").modal('toggle');
}
;

$("#frmAddProduct").submit(function(event) {
    event.preventDefault();
    var $form = $(this), nombre = $form.find("input[name='nombre']").val()
            , descripcion = $form.find("textarea[name='descripcion']").val()
            , salsa = $form.find("select[name='salsa']").val()
            , precio = $form.find("input[name='precio']").val()
            , categoria = $form.find("select[name='categoria']").val()
            , url = $form.attr("action");
    var posting = $.post(url, {nombre:nombre, descripcion:descripcion, salsa:salsa, precio:precio, categoria:categoria});
    posting.done(function(data) {
        if (data !== null) {
            var obj = jQuery.parseJSON(data);
            var fila = '<tr id="product' + obj.IdProducto + '">';
            fila = fila + '<td class="NombreProducto">' + obj.NameProduct + '</td>';
            fila = fila + '<td class="DescripcionProducto">' + obj.Dscription + '</td>';
            fila = fila + '<td class="SalsaProducto">' + obj.Sauce + '</td>';
            fila = fila + '<td class="PrecioProducto">' + obj.Price + '</td>';
            fila = fila + '<td class="CategoriaProducto">' + obj.IdCategory + '</td>';
            fila = fila + '<td class="EstadoProducto">' + obj.State + '</td>';
            fila = fila + '<td class="gestion_Producto">';
            fila = fila + '<button id="proEDIT' + obj.IdProducto + '" onclick="showEditarProduct(this)" title="Editar Producto" class="btn_modificar_alum btn btn-info"><span class="glyphicon glyphicon-pencil"></span> </button>';
            fila = fila + '<button id="proDELT' + obj.IdProducto + '" onclick="showEliminarProduct(this)" title="Eliminar Producto" class="btn_eliminar_alum btn btn-danger"><span class="glyphicon glyphicon-trash"></span></button>';
            fila = fila + '</td></tr>';
            $('#tblProductos > tbody').append(fila);
            $("#AddProductModal").modal('toggle');
            $form.find("input[name='nombre']").val("");
            $form.find("textarea[name='descripcion']").val("");
            $form.find("input[name='precio']").val("");
        }
    });
    posting.fail(function(xhr, textStatus, errorThrown) {
         alert("error" + xhr.responseText);
     });
    
});