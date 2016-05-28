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
//$(".itemMenu").submit(function(event) {
//    event.preventDefault();
//    var $form = $(this);
//    var nivelHot = $form.find("select[name='nivelHot']").val();
//    var nameItem = $form.find("select[name='nivelHot']").toString();
//    var typeSalsa = $form.find("select[name='typeSalsa']").val();
//    var quantity = $form.find("select[name='Quantity']").val();
//    console.log(nivelHot);
//    console.log($form);
//    console.log(nameItem);
//    console.log(typeSalsa);
//    console.log(quantity);
//    
//    
//});

