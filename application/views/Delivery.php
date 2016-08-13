<?php
//include APPPATH.'controllers/WebClientPrint.php';
//
//use Neodynamic\SDK\Web\WebClientPrint;
//use Neodynamic\SDK\Web\Utils;
?>
<!DOCTYPE html>
<html>
    <head>
<?php $this->load->helper('url'); ?>
        <meta charset="UTF-8">
        <title>Delivery</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap -->          
        <link href="../appearance/css/flatly-bootstrap.min.css" rel="stylesheet">
        <script src="../appearance/js/jquery-2.2.3.min.js"></script>
        <script src="../appearance/js/bootstrap.min.js"></script>
        <link href="../appearance/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <script src="../appearance/js/common.js"></script>
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
                <div class="col-md-12">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Pedido</th>
                                <th>Numero</th>
                                <th>Nombre</th>
                                <th>Direccion</th>
                                <th>Total</th>
                                <th>Pago</th>
                                <th>Comentarios</th>
                                <th>Estado</th>
                                <th>Motorizado</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="OrderList">
                            <?php
                            echo $Pedidos;
                            ?>

                        </tbody>
                    </table>
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
                                        <th>Salsa - Picante</th>
                                        <th>Cantidad</th>
                                        <th>Precio</th>
                                        <th>Comentarios</th>
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
            <div id="viewDispatchModal" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Guardar</h4>
                        </div>
                        <div class="modal-body">
                            <h3 class="text-center">¿Desea aplicar los cambios en la orden #<mark id="OrderNumber"></mark> ? </h3>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success" onclick="despachar()">Sí</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../appearance/js/entregas.js"></script>
        <div id="Something" style="visibility: hidden"></div>
        <?php
//Specify the ABSOLUTE URL to the php file that will create the ClientPrintJob obj
        //echo WebClientPrint::createScript(Utils::getRoot() . '/TEST.php');
        ?>
    </body>
</html>
