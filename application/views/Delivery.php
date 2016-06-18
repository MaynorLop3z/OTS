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
                <div class="col-md-1">
                </div>
                <div class="col-md-10">
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
            <div id="viewDispatchModal" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">Despachar</h4>
                                </div>
                                <div class="modal-body">
                                    <h3 class="text-center">Se despachara el pedido #<mark id="OrderNumber"></mark>. <br> ¿Desea Continuar</h3>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-success" onclick="despachar()">Aceptar</button>
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </div>
        </div>
<script src="../appearance/js/entregas.js"></script>
    </body>
</html>
