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
        <link href="../appearance/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body style="padding-top: 100px;">
        <div class="container-fluid">
            <div class="row">
                <nav class="navbar navbar-default navbar-fixed-top">
                    <div class="container-fluid">
                        <img src="../appearance/images/image3344.png" class="navbar-form navbar-left img-responsive" alt="Buffalo Wings"/>
                        <p class="navbar-text navbar-right"><span class="fa-stack fa-lg">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-flag fa-stack-1x fa-inverse"></i>
                            </span>
                            Maynor Lopez
                            <i class="fa fa-sign-out fa-2x" aria-hidden="true"></i>Logout
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
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
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
                                        <button id="paymentCash" onclick="showPaymentCash(this)" title="Pago en Efectivo" class="btn btn-warning btn-lg"> <i class="fa fa-money fa-3x"></i> <h3>Pago en Efectivo</h3></button>
                                        <button id="paymentOnline" onclick="showPaymentOnline(this)" title="Pago en Linea" class="btn btn-warning btn-lg"> <i class="fa fa-cc-visa fa-3x"></i> <h3>Pago Online</h3></button>                                        
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
                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success btn-block"><h4>Crear Pedido</h4></button>
                    </form>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
    </body>
</html>
