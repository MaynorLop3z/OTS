<!DOCTYPE html>
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
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="usuarios" class="active"><a href="#usuarios" aria-controls="usuarios" role="tab" data-toggle="tab">Usuarios</a></li>
                        <li role="productos"><a href="#productos" aria-controls="productos" role="tab" data-toggle="tab">Producto</a></li>
                        <li role="salsas"><a href="#salsas" aria-controls="salsas" role="tab" data-toggle="tab">Salsas</a></li>
                        <li role="sucursales"><a href="#sucursales" aria-controls="sucursales" role="tab" data-toggle="tab">Sucursales</a></li>
                    </ul>
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="usuarios">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <button onclick="showAddUser()" title="agregarUsuario" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span>  Agregar Usuario</button><br>
                                    <table id="" class="table table-bordered table-striped table-hover table-responsive">
                                        <thead>
                                            <tr>
                                                <th>Nombre</th>
                                                <th>Alias</th>
                                                <th>Rol</th>
                                                <th>Sucursal</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead> 
                                        <tbody>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="productos">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <button onclick="showAddProduct()" title="agregarProducto" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span>  Agregar Producto</button><br>
                                    <table id="tblProductos" class="table table-bordered table-striped table-hover table-responsive">
                                        <thead>
                                            <tr>
                                                <th>Nombre</th>
                                                <th>Descripcion</th>
                                                <th>Salsa</th>
                                                <th>Precio</th>
                                                <th>Categoria</th>
                                                <th>Estado</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead> 
                                        <tbody>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="salsas">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <button onclick="showAddSauce()" title="agregarSalsa" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span>  Agregar Salsa</button><br>
                                    <table id="" class="table table-bordered table-striped table-hover table-responsive">
                                        <thead>
                                            <tr>
                                                <th>Nombre</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead> 
                                        <tbody>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="sucursales">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <button onclick="showAddAgency()" title="agregarSucursal" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span>  Agregar Sucursal</button><br>
                                    <table id="" class="table table-bordered table-striped table-hover table-responsive">
                                        <thead>
                                            <tr>
                                                <th>Nombre</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead> 
                                        <tbody>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
        <!--MODALES-->
        <div id="AddProductModal" class="modal fade" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog  modal-lg">
                <div class="modal-content">
                    <div class="container-fluid ">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <form id="frmAddProduct" action="Products/agregarProducto/" class="form-horizontal" method="post" >
                            <fieldset>
                                <legend class="modal-header">
                                    Agregar Producto:
                                </legend>
                                <div class="form-group">
                                    <label for="nombreProductoAdd" class="col-lg-3 control-label">Nombre:</label>
                                    <div class="col-lg-9">
                                        <input type="text" class="form-control" name="nombre" id="nombreProductoAdd" placeholder="Nombre del producto" maxlength="100" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="descripcionProductAdd" class="col-lg-3 control-label">Descripcion:</label>
                                    <div class="col-lg-9">
                                        <textarea cols="40" rows="5" class="form-control" name="descripcion" id="descripcionProductAdd" placeholder="Descripcion" required></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="salsaProductAdd" class="col-lg-3 control-label">¿Salsa?:</label>
                                    <div class="col-lg-9">
                                        <select class="form-control" name="salsa" id="salsaProductAdd">
                                            <option value="0">No Lleva</option>
                                            <option value="1">Lleva</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="precioProductoAdd" class="col-lg-3 control-label">Precio:</label>
                                    <div class="col-lg-9">
                                        <input type="text" class="form-control" name="precio" id="precioProductoAdd" placeholder="Precio del producto" maxlength="20" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="categoriaProductAdd" class="col-lg-3 control-label">Categoria:</label>
                                    <div class="col-lg-9">
                                        <select class="form-control" name="categoria" id="categoriaProductAdd">
                                            <?php
                                            foreach ($Categorias as $cat) {
                                                ?>
                                                <option value="<?= $cat->IdCategory ?>"><?= $cat->NameCategory ?></option>

                                                <?php
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" onclick="" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                    <button type="reset" onclick="" class="btn btn-warning" name="Limpiar">Limpiar</button>
                                    <button type="submit" onclick="" class="btn btn-primary" name="Save">Guardar Datos</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="../appearance/js/mantenimientos.js"></script>
    </body>
</html>
