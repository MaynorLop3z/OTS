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
        <link href="../appearance/css/flatly-bootstrap.min.css" rel="stylesheet">
        <script src="../appearance/js/jquery-2.2.3.min.js"></script>
        <script src="../appearance/js/bootstrap.min.js"></script>
        <link href="../appearance/css/login.css" rel="stylesheet">
        <link rel="stylesheet" href="../appearance/font-awesome/css/font-awesome.min.css">
        <script src="../appearance/js/jquery.interactive_bg.js"></script>
        <script src="../appearance/js/login.js"></script>
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
                                <label class="panel-login">
                                    <div class="login_result"></div>
                                </label>
                                <div class="focusContainer">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-industry fa-fw" aria-hidden="true"></i></span>
                                        <select class="form-control" name="sEmpresas" id="sEmpresas">
                                            <?php
                                                foreach ($Empresas as $empresa) {
                                                    ?>
                                                    <option value="<?= $empresa->IdEmpresa ?>">
                                                        <?= $empresa->Nombre ?>
                                                    </option>
                                                    <?php
                                                }
                                                ?>
                                        </select>
                                    </div>
                                </div>
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
                    <!--                    <div class="login-container">
                                        </div>-->
                    <!--                    <h1>HELLO WORLD!!!</h1>
                                        <i class="fa fa-camera-retro fa-lg"></i> fa-lg
                                        <i class="fa fa-camera-retro fa-2x"></i> fa-2x
                                        <i class="fa fa-camera-retro fa-3x"></i> fa-3x
                                        <i class="fa fa-camera-retro fa-4x"></i> fa-4x
                                        <i class="fa fa-qrcode fa-5x"></i> fa-5x
                                        <i class="fa fa-cc-mastercard fa-5x"></i>
                                        <i class="fa fa-money fa-5x"></i>
                                        <i class="fa fa-github fa-5x"></i>
                                        <i class="fa fa-linux fa-5x"></i>
                                        <br>
                                        <a class="btn btn-default" href="path/to/settings">
                                            <i class="fa fa-cog" title="Settings" aria-hidden="true"></i>
                                            <span class="sr-only">Settings</span>
                                        </a>-->

                    <!--                    <a class="btn btn-danger" href="path/to/settings">
                                            <i class="fa fa-trash-o" title="Delete" aria-hidden="true"></i>
                                            <span class="sr-only">Delete</span>
                                        </a>
                    
                                        <a class="btn btn-primary" href="#navigation-main">
                                            <i class="fa fa-bars" aria-hidden="true" title="Skip to main navigation"></i>
                                            <span class="sr-only">Skip to main navigation</span>
                                        </a>-->

<!--                    <i class="fa fa-refresh fa-spin fa-3x fa-fw" aria-hidden="true"></i>
                    <span class="sr-only">Refreshing...</span>

                    <i class="fa fa-cog fa-spin fa-3x fa-fw" aria-hidden="true"></i>
                    <span class="sr-only">Saving. Hang tight!</span>-->

                    <!--                    <a href="path/to/shopping/cart" class="btn btn-primary">
                                            <i class="fa fa-shopping-cart" title="View 3 items in your shopping cart" aria-hidden="true"></i>
                                            <span class="sr-only">View 3 items in your shopping cart</span>
                                        </a>-->

<!--                    <i class="fa fa-battery-half" aria-hidden="true"></i>
                    <span class="sr-only">Battery level: 50%</span>
                    <span class="fa-stack fa-lg">
                        <i class="fa fa-square-o fa-stack-2x"></i>
                        <i class="fa fa-twitter fa-stack-1x"></i>
                    </span>-->
                    <!--                    fa-twitter on fa-square-o<br>
                                        <span class="fa-stack fa-lg">
                                            <i class="fa fa-circle fa-stack-2x"></i>
                                            <i class="fa fa-flag fa-stack-1x fa-inverse"></i>
                                        </span>-->
                    <!--                    fa-flag on fa-circle<br>
                                        <span class="fa-stack fa-lg">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-terminal fa-stack-1x fa-inverse"></i>
                                        </span>-->
                    <!--                    fa-terminal on fa-square<br>
                                        <span class="fa-stack fa-lg">
                                            <i class="fa fa-camera fa-stack-1x"></i>
                                            <i class="fa fa-ban fa-stack-2x text-danger"></i>
                                        </span>-->
                    <!--                    fa-ban on fa-camera
                                        <i class="fa fa-shield"></i> normal<br>
                                        <i class="fa fa-shield fa-rotate-90"></i> fa-rotate-90<br>
                                        <i class="fa fa-shield fa-rotate-180"></i> fa-rotate-180<br>
                                        <i class="fa fa-shield fa-rotate-270"></i> fa-rotate-270<br>
                                        <i class="fa fa-shield fa-flip-horizontal"></i> fa-flip-horizontal<br>
                                        <i class="fa fa-shield fa-flip-vertical"></i> fa-flip-vertical
                                        <div class="list-group">
                                            <a class="list-group-item" href="#"><i class="fa fa-home fa-fw" aria-hidden="true"></i>&nbsp; Home</a>
                                            <a class="list-group-item" href="#"><i class="fa fa-book fa-fw" aria-hidden="true"></i>&nbsp; Library</a>
                                            <a class="list-group-item" href="#"><i class="fa fa-pencil fa-fw" aria-hidden="true"></i>&nbsp; Applications</a>
                                            <a class="list-group-item" href="#"><i class="fa fa-cog fa-fw" aria-hidden="true"></i>&nbsp; Settings</a>
                                        </div>-->

                </div>
                <div class="col-md-3"></div>
            </div>
        </div>

    </body>
</html>
