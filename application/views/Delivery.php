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
                                <th>Numero</th>
                                <th>Nombre</th>
                                <th>Direccion</th>
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
        </div>

    </body>
</html>
