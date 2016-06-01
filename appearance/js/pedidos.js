var codigo;
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
    var nivelHot = $form.find("select[name='nivelHot']").val();
    var nivel = $form.find("select[name='nivelHot'] option:selected").text();
    var nameItem = $form.find(".itemName").html();
    var typeSalsa = $form.find("select[name='typeSalsa']").val();
    var salsa = $form.find("select[name='typeSalsa'] option:selected").text();
    var quantity = $form.find("select[name='Quantity']").val();
    var precio = $form.find("select[name='Quantity'] option:selected").text().substring(5);
    
  var fila = "<tr>";
  fila += '<td class="Dscription">'+nameItem+'</td>';
  fila += '<td class="salsa'+typeSalsa+'">'+salsa+'</td>';
  fila += '<td class="picante'+nivelHot+'">'+nivel+'</td>';
  fila += '<td class="cantidad'+quantity+'">'+quantity+'</td>';
  fila += '<td class="Price">'+precio+'</td>';
  fila +="</tr>";
  $('#detailOrder').append(fila);
    
});

