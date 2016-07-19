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
        <script src="../appearance/js/common.js"></script>
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
                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-primary">
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
                        <div class="panel panel-primary">
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
                                        <div class="panel-group" id="accordionCat" role="tablist" aria-multiselectable="true">
                                            <?php
                                            foreach ($Categorias as $cat) {
                                                echo $cat;
                                            }
                                            ?>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading" role="tab" id="headingThree">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        Paso #3 - Metodo de Pago
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                <div class="panel-body">
                                    <div id="paymentCash" onclick="showPaymentCash(this)" title="Pago Efectivo" class="btn btn-warning btn-lg"> <i class="fa fa-money fa-3x"></i> <h3>Pago Efectivo</h3></div>
                                    <div id="paymentOnline" onclick="showPaymentOnline(this)" title="Pago Tarjeta" class="btn btn-warning btn-lg"> <i class="fa fa-cc-visa fa-3x"></i> <h3>Pago Tarjeta</h3></div>                                        
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- MODAL EFECTIVO -->
                    <div id="FormaDePagoEfectivo" class="modal fade" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog  modal-lg">
                            <div class="modal-content">
                                <div class="container-fluid ">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <form id="frmPagoEfectivo" action="" class="form-horizontal" method="post" >
                                        <fieldset>
                                            <legend class="modal-header">
                                                Pago en efectivo:
                                            </legend>
                                            <div class="form-group">
                                                <label for="PagoCashComment" class="col-lg-3 control-label">¿Necesitara cambio?</label>
                                                <div class="col-lg-9">
                                                    <textarea cols="40" rows="5" class="form-control" name="Comentarios" id="PagoCashComment" placeholder="Comentarios acerca del pago" required></textarea>
                                                </div>
                                            </div>

                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                                <button type="reset" onclick="" class="btn btn-warning" name="Limpiar">Limpiar</button>
                                                <button type="submit" class="btn btn-primary">Guardar Datos</button>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- MODAL TARJETA -->
                    <div class="modal fade" id="FormaDePagoTarjeta" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="container-fluid ">
                                    <form id="frmPagoTarjeta" action="" class="form-horizontal" method="post" >
                                        <fieldset>
                                            <legend class="modal-header">
                                                Pago en efectivo:
                                            </legend>
                                            <div class="form-group">
                                                <label for="PagoTarjetaReferencia" class="col-lg-3 control-label">Nombre:</label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" name="numref" id="PagoTarjetaReferencia" placeholder="Numero de referencia" maxlength="100" required>
                                                </div>
                                            </div>

                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                                <button type="reset" onclick="" class="btn btn-default" name="Limpiar">Limpiar</button>
                                                <button type="submit" class="btn btn-primary">Guardar Datos</button>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--                    Modal Numero PEDIDO-->
                    <div id="modalPedidoExitoso" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">PEDIDO CREADO</h4>
                                </div>
                                <div class="modal-body">
                                    <h3 class="text-center">NUMERO DE PEDIDO: <mark id="OrderNumber"></mark></h3>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Aceptar</button>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!--MODAL DE BUSQUEDA-->
                    <div id="modalPedidoBusqueda" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content ">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">Buscar Pedido</h4>
                                </div>
                                <div class="modal-body">
                                    <form action="Orders/buscarPedido/" method="POST" class="form-inline" id="searchOrderBy">
                                        <div class="form-group">
                                            <label for="filtertype" class=" control-label">Tipo de filtro:</label>
                                            <select class="form-control" name="tipofiltro" id="codefilter">
                                                <option value="0">Numero de Telefono</option>
                                                <option value="1">Nombre Cliente</option>
                                                <option value="2">Direccion</option>
                                                <option value="3">Numero de Pedido</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="filtertext" class="control-label">filtro:</label>
                                            <input type="text" class="form-control" name="filtro" id="filtertext" placeholder="detalle de filtro" maxlength="100" required>
                                        </div>
                                        <button type="submit" class="btn btn-info"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> Buscar Pedido</button>
                                    </form>
                                    <br>
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Pedido</th>
                                                <th>Numero</th>
                                                <th>Nombre</th>
                                                <th>Direccion</th>
                                                <th>Total</th>
                                                <th>Comentarios</th>
                                                <th>Estado</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="listaPedidos">
                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Aceptar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="viewDetailModal" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="ModalTittleView">Detalle del Pedido</h4>
                                </div>
                                <div class="modal-body">
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Item</th>
                                                <th>Salsa</th>
                                                <th>Picante</th>
                                                <th>Cantidad</th>
                                                <th>Precio</th>
                                            </tr>
                                        </thead>
                                        <tbody id="OrderDetail">
                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Aceptar</button>
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
                                <button onclick="showbuscarPedido()" title="buscarPedido" class="btn btn-success"><span class="glyphicon glyphicon-search"></span>  BUSCAR PEDIDO</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../appearance/js/pedidos.js"></script>
    </body>
</html>
