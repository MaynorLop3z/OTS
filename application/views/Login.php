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
        <title>Login</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap -->          
        <link href="../../appearance/css/flatly-bootstrap.min.css" rel="stylesheet">
        <script src="../appearance/js/jquery-2.2.3.min.js"></script>
        <script src="../appearance/js/bootstrap.min.js"></script>
        <link href="../appearance/css/login.css" rel="stylesheet">
        <link rel="stylesheet" href="../appearance/font-awesome/css/font-awesome.min.css">
        <script src="../appearance/js/jquery.interactive_bg.js"></script>
        <script src="../appearance/js/login.js"></script>
        <script src="../appearance/js/pedidos.js"></script>
    </head>
    <body>
        <div class="container wrapper bg" data-ibg-bg="../appearance/images/bg_login.jpg" >
            <div class="row vertical-offset-100" id="contenedor">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="login-header">Toma de Pedidos</h4>
                            <div class="row-fluid user-row">
                                <img src="../appearance/images/CallCenterIcon128.png" class="img-responsive" alt="Call Center"/>
                            </div>
                        </div>
                        <div class="panel-body">
                            <form method="POST" action="" accept-charset="UTF-8" role="form" class="form-signin">
                                <label class="panel-login col-md-12">
                                    <?= $ErrorLogin ?>
                                </label>
                                <div class="focusContainer">
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control"  placeholder="Usuario" name="UserAlias" id="UserAlias" required autofocus>
                                    </div>
                                </div>
                                <div class="focusContainer">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-key fa-fw" aria-hidden="true"></i></span>
                                        <input type="password" name="UserPass" id="UserPass" class="form-control"  placeholder="Contraseña"  required>
                                    </div>
                                </div>
                                <div class="focusContainer">
                                    <button type="submit" class="btn btn-success btn-block">Ingresar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>

    </body>
</html>
