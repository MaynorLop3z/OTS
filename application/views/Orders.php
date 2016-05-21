<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <?php $this->load->helper('url'); ?>
        <meta charset="UTF-8">
        <title>Pedidos</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap -->          
        <link href="../appearance/css/paper-bootstrap.min.css" rel="stylesheet">
        <script src="../appearance/js/jquery-2.2.3.min.js"></script>
        <script src="../appearance/js/bootstrap.min.js"></script>
        <script src="../appearance/js/pedidos.js"></script>
        <link href="../appearance/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body style="padding-top: 110px;">
        <div class="container-fluid">
            <div class="row">
                <nav class="navbar navbar-default navbar-fixed-top">
                    <div class="container-fluid">
                        <img src="../appearance/images/image3344.png" class="navbar-form navbar-left img-responsive" alt="Buffalo Wings"/>
                        <p class="navbar-text navbar-right">
                            <button type="button" class="btn btn-link">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-user fa-stack-1x fa-inverse"></i>
                                </span>
                                <?= $this->session->userdata('nombreUser'); ?>
                            </button>
                            <button type="button" class="btn btn-link">
                                <i class="fa fa-sign-out fa-2x" aria-hidden="true"></i>Logout
                            </button>
                        </p>
                    </div>
                </nav>

            </div>
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <form method="POST" action="" accept-charset="UTF-8" role="form">
                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            Paso #1 - Datos del Cliente
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                    <div class="panel-body">
                                        <!--<div class="row">-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="ClientNumber" class="col-sm-2 control-label">Telefono:</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="ClientNumber" placeholder="Numero de telefono">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ClientName" class="col-sm-2 control-label">Nombre:</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="ClientName" placeholder="Nombre del cliente">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="ClientDirection" class="col-sm-2 control-label">Direccion:</label>
                                                <div class="col-sm-10">
                                                    <textarea id="ClientDirection" class="form-control" rows="3" placeholder="Direccion de entrega"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <!--</div>-->
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingTwo">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            Paso #2 - Agregar elementos del menu
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                    <div class="panel-body">
                                        <table class="table">
                                            <tr>
                                                <td>
                                                    <div class="col-md-6">
                                                        <img src="../appearance/images/sshot-15.png" class="img-responsive" alt="Buffalo Wings"/>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox"> Check me out
                                                            </label>
                                                        </div>
                                                        <select class="form-control">
                                                            <option>Atomica</option>
                                                            <option>911</option>
                                                            <option>Tradicional</option>
                                                            <option>BBQ</option>
                                                            <option>Hawaiana</option>
                                                        </select>
                                                        <h4><span class="label label-primary">$5.79 C/Orden</span></h4>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="col-md-6">
                                                        <img src="../appearance/images/sshot-15.png" class="img-responsive" alt="Buffalo Wings"/>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox"> Check me out
                                                            </label>
                                                        </div>
                                                        <select class="form-control">
                                                            <option>Atomica</option>
                                                            <option>911</option>
                                                            <option>Tradicional</option>
                                                            <option>BBQ</option>
                                                            <option>Hawaiana</option>
                                                        </select>
                                                        <h4><span class="label label-primary">$5.79 C/Orden</span></h4>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="col-md-6">
                                                        <img src="../appearance/images/sshot-15.png" class="img-responsive" alt="Buffalo Wings"/>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox"> Check me out
                                                            </label>
                                                        </div>
                                                        <select class="form-control">
                                                            <option>Atomica</option>
                                                            <option>911</option>
                                                            <option>Tradicional</option>
                                                            <option>BBQ</option>
                                                            <option>Hawaiana</option>
                                                        </select>
                                                        <h4><span class="label label-primary">$5.79 C/Orden</span></h4>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingThree">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                            Paso #3 - Metodo de Pago
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                    <div class="panel-body">
                                        <div id="paymentCash" onclick="showPaymentCash(this)" title="Pago en Efectivo" class="btn btn-warning btn-lg"> <i class="fa fa-money fa-3x"></i> <h3>Pago en Efectivo</h3></div>
                                        <div id="paymentOnline" onclick="showPaymentOnline(this)" title="Pago en Linea" class="btn btn-warning btn-lg"> <i class="fa fa-cc-visa fa-3x"></i> <h3>Pago Online</h3></div>                                        
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingThree">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseThree">
                                            Paso #4 - Verificacion de Datos del Cliente
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                    <div class="panel-body">
                                        <div class="col-md-6">
                                            <strong class="col-md-2">Nombre:</strong>
                                            <p id="nombreCliente" class="col-md-10"></p>
                                        </div>
                                        <div class="col-md-6">
                                            <strong class="col-md-2">Direccion:</strong>
                                            <p id="DireccionCliente" class="col-md-10"></p>
                                        </div>
                                        <div class="col-md-12">
                                            <table class="table table-bordered table-hover table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>Nombre</th>
                                                        <th>Precio (USD)</th>
                                                        <th>Cantidad</th>
                                                        <th>Subtotal (USD)</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Alitas con salsa atomica</td>
                                                        <td>5.99</td>
                                                        <td>1</td>
                                                        <td>5.99</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Alitas con salsa hawaiana</td>
                                                        <td>5.99</td>
                                                        <td>2</td>
                                                        <td>11.89</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Vegetales Extra</td>
                                                        <td>1.99</td>
                                                        <td>3</td>
                                                        <td>5.97</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success btn-block"><h4>Crear Pedido</h4></button>
                    </form>
                    <!-- Modal -->
                    <div class="modal fade" id="FormaDePago" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Datos de Pago</h4>
                                </div>
                                <div class="modal-body">
                                    <form method="POST">
                                        <div class="radio-inline">
                                            <label>
                                                <input type="radio" name="Factura" value="FAC" />
                                                Consumidor Final
                                            </label>
                                        </div>
                                        <div class="radio-inline">
                                            <label>
                                                <input type="radio" name="Factura" value="CCF"> 
                                                Credito Fiscal
                                            </label>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">

                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                    <button type="button" class="btn btn-primary">Guardar Datos</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
    </body>
</html>
