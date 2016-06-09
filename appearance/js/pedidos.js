var codigo;
var indice = 0;
function agregarItemMenu(item){
    codigo = item.id;
    console.log(codigo);
};
function showPaymentCash(fila){
    codigo = fila.id;
    console.log(codigo);
    console.log("Cash");
    $("#FormaDePago").modal('toggle');
};
function showPaymentOnline(fila){
    codigo = fila.id;
    console.log(codigo);
    $("#FormaDePago").modal('toggle');
};


function searchClient(event){
  var tecla = event.keyCode || event.which;
    if (tecla === 9) {
        //event.preventDefault();
        console.log("Tecla Tab");
    }
};
$(".itemMenu").submit(function(event) {
    event.preventDefault();
    var $form = $(this);
    var nameItem = $form.find(".itemName").html();
    var typeSalsa = $form.find("select[name='typeSalsa']").val();
    var salsa = $form.find("select[name='typeSalsa'] option:selected").text();
    var nivelHot = $form.find("select[name='nivelHot']").val();
    var nivel = $form.find("select[name='nivelHot'] option:selected").text();
    var quantity = $form.find("input[name='Quantity']").val();
    var precio = $form.find(".itemPrice").html();
    
  var fila = '<tr id="itemDetail'+indice+'">';
  fila += '<td class="Dscription">'+nameItem+'</td>';
    if (typeSalsa !== null) {
        fila += '<td class="salsa'+typeSalsa+'">'+salsa+'</td>';
    }else {
        fila += '<td class="salsa"></td>';
    }
  fila += '<td class="picante'+nivelHot+'">'+nivel+'</td>';
  fila += '<td class="cantidad'+quantity+'">'+quantity+'</td>';
  fila += '<td class="Price">'+precio+'</td>';
  fila +='<td class="Acciones"><button id="itemDEL' + indice + '" onclick="eliminarItem(this)" title="Eliminar Item" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> </button></td>';
  fila +="</tr>";
  $('#detailOrder').append(fila);
    indice++;
});
function eliminarItem(fila){
    var codeDetail = fila.id.substring(7);
   console.log(codeDetail);
    
    
};

