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
        <title>Administracion</title>
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
                <div class="col-md-1"></div>
                <div class="col-md-10"><h1>Nombre empresa</h1></div>
                <div class="col-md-1"></div>
                
            </div>
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="productos" class="active"><a href="#productos" aria-controls="productos" role="tab" data-toggle="tab">Producto</a></li>
                        <li role="usuarios"><a href="#usuarios" aria-controls="usuarios" role="tab" data-toggle="tab">Usuarios</a></li>
                    </ul>
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="productos">Productos</div>
                        <div role="tabpanel" class="tab-pane fade" id="usuarios">Usuarios</div>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
        <?php
        // put your code here
        ?>
    </body>
</html>
