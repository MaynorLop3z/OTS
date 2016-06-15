<!DOCTYPE html>
<html>
    <head>
        <?php $this->load->helper('url'); ?>
        <meta charset="UTF-8">
        <title>Pedidos</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap -->          
        <link href="../appearance/css/flatly-bootstrap.min.css" rel="stylesheet">
        <script src="../appearance/js/jquery-2.2.3.min.js"></script>
        <script src="../appearance/js/bootstrap.min.js"></script>

        <link href="../appearance/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <img src="../appearance/images/logo.png" class="navbar-form navbar-left img-responsive" alt="Buffalo Wings"/>
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="#">
                                <h4> <i class="fa fa-user fa-1x" aria-hidden="true"></i><?= $this->session->userdata('nombreUser'); ?></h4>
                                </a>
                            </li>
                            <li>
                                <a href="login" id="logout">
                                    <h4> <i class="fa fa-sign-out fa-1x" aria-hidden="true"></i>  Salir</h4>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>

            </div>
            <div class="row">
                <div class="col-md-8">
                    <!--<form method="POST" action="" accept-charset="UTF-8" role="form">-->
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
                                                <input type="text" class="form-control" id="ClientNumber" placeholder="Numero de telefono" onkeydown="searchClient(event)">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="ClientName" class="col-sm-2 control-label">Nombre:</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="ClientName" placeholder="Nombre del cliente" onkeydown="setClient(event)">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="ClientDirection" class="col-sm-2 control-label">Direccion:</label>
                                            <div class="col-sm-10">
                                                <textarea id="ClientDirection" class="form-control" rows="3" placeholder="Direccion de entrega" onkeydown="setClientDir(event)"></textarea>
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
                                    <div class="row">
                                        <!--                                        <form method="POST" action="" class="itemMenu">
                                                                                    <div class="col-sm-6 col-md-4">
                                                                                        <h3 class="itemName">Chunks</h3>
                                                                                        <p>Tipo de Salsa:<br>
                                                                                            <select class="form-control" name="typeSalsa">
                                                                                                <option>La adictiva</option>
                                                                                                <option>Teriyaki</option>
                                                                                                <option>Ajo Parmesano</option>
                                                                                                <option>Wok Plum</option>
                                                                                                <option>Hawaiana</option>
                                                                                            </select>
                                                                                            Nivel de Picante:<br>
                                                                                            <select class="form-control" name="nivelHot">
                                                                                                <option value="1">La que no pica</option>
                                                                                                <option value="2">La picante</option>
                                                                                                <option value="3">La suicida</option>
                                                                                                <option value="4">La atomica</option>
                                                                                                <option value="5">La 911</option>
                                                                                            </select>
                                                                                            Cantidad:<br>
                                                                                            <select class="form-control" name="Quantity">
                                                                                                <option value="7.95">10 - $7.95</option>
                                                                                                <option value="15.70">20 - $15.70</option>
                                                                                                <option value="23.45">30 - $23.45</option>
                                                                                            </select>
                                                                                        </p>
                                                                                        <button type="submit" class=" btn btn-success" name="Aceptar">Agregar</button>
                                                                                    </div>
                                                                                </form>-->
                                        <?php
                                        $clearfix = 0;
                                        foreach ($Productos as $producto) {
                                            echo $producto;
                                            $clearfix++;
                                            if ($clearfix == 3) {
                                                $clearfix = 0;
                                                echo '<div class="clearfix"></div>';
                                            }
                                        }
                                        ?>
                                    </div>
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
                    </div>
                    <!--<button type="submit" class="btn btn-success btn-block"><h4>Crear Pedido</h4></button>-->
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
                <div class="col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="login-header">Datos del pedido</h4>
                        </div>
                        <div class="panel-body">
                            <div class="col-md-12">
                                <strong class="col-md-2">Telefono:</strong>
                                <p id="telefonoCliente" class="col-md-10"></p>
                            </div>
                            <div class="col-md-12">
                                <strong class="col-md-2">Nombre:</strong>
                                <p id="nombreCliente" class="col-md-10"></p>
                            </div>
                            <div class="col-md-12">
                                <strong class="col-md-2">Direccion:</strong>
                                <p id="DireccionCliente" class="col-md-10"></p>
                            </div>
                            <div class="col-md-12">
                                <table class="table table-bordered table-hover table-striped">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Salsa</th>
                                            <th>Picante</th>
                                            <th>Cantidad</th>
                                            <th>Precio</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="detailOrder">
<!--                                        <tr>
                                            <td>Alitas</td>
                                            <td>Hawaina</td>
                                            <td>Picante</td>
                                            <td>10</td>
                                            <td>7.95</td>
                                        </tr>-->
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-12">
                                <h4><span class="label label-info">
                                        <strong>Total: $</strong>
                                        <strong id="totalPedido">0.00</strong>
                                    </span></h4>
                            </div>
                            <div class="col-md-12">
                                <strong class="col-md-12">Restaurante:</strong>
                                <p id="RestaurantePedido" class="col-md-12">
                                    <?php
                                    echo $Sucursales;
                                    ?>
                                </p>
                                <button onclick="realizarPedido(this)" title="crearPedido" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span>  CREAR PEDIDO</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../appearance/js/pedidos.js"></script>
    </body>
</html>
