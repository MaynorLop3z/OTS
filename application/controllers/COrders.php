<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class COrders extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('MOrder');
        $this->load->library(array('session'));
    }

    public function index() {
        try {
//            $this->session->userdata('indices');
            if ($this->session->userdata('indices') == 2) {
                $cantidadCategorias = 0;
                $categorias = $this->MOrder->getCategorias();
                $allCategories[$cantidadCategorias] = '';
                foreach ($categorias as $cat) {
                    $allCategories[$cantidadCategorias] = ' <div class="panel panel-info">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordionCat" href="#collapseCaterogia' . $cantidadCategorias . '" aria-expanded="true" aria-controls="collapseCaterogia' . $cantidadCategorias . '">
          ' . $cat->NameCategory . '
        </a>
      </h4>
    </div>
    <div id="collapseCaterogia' . $cantidadCategorias . '" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">';
                    $productos = $this->MOrder->getProductCatetory($cat->IdCategory);
                    $clearfix = 0;
                    $detalleProductos = '';
                    foreach ($productos as $prod) {
                        //$allProducts[$cantidadProductos] = $this->generarProducto($prod->IdProduct, $prod->NameProduct, $prod->Sauce, $prod->Dscription, $prod->Price);
                        $detalleProductos .= $this->generarProducto($prod->IdProduct, $prod->NameProduct, $prod->Sauce, $prod->Dscription, $prod->Price, $prod->SauceQuantity);
                        $clearfix++;
                        if ($clearfix == 3) {
                            $clearfix = 0;
                            $detalleProductos .= '<div class="clearfix"></div>';
                        }
                    }
                    $allCategories[$cantidadCategorias] .= $detalleProductos;
                    $allCategories[$cantidadCategorias] .= '</div></div></div>';
                    $cantidadCategorias++;
                }
                $data['Categorias'] = $allCategories;
                $data['Sucursales'] = $this->getSucursales();
                $this->load->view('Orders', $data);
            } else {
                $this->load->helper('url');
                Redirect('Login');
            }
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

    public function generarHotSpicy($indice) {
        $nivelHot = '<select class="form-control" name="nivelHot' . $indice . '">';

        $niveles = json_decode(json_encode($this->MOrder->getNivelHot()), true);
        foreach ($niveles as $nivel) {
            $nivelHot .= '<option value="' . $nivel['IdSpicy'] . '">' . $nivel['NameSpicy'] . '</option>';
        }
        $nivelHot .= '</select>';
        return $nivelHot;
    }

    public function generarSauceTypes($indice) {
        $sauceTypes = '<select class="form-control" name="typeSalsa' . $indice . '">';
        $salsas = json_decode(json_encode($this->MOrder->getTiposSalsa()), true);
        foreach ($salsas as $salsa) {
            $sauceTypes .= '<option value="' . $salsa['IdSauce'] . '">' . $salsa['NameSauce'] . '</option>';
        }
        $sauceTypes .= '</select>';
        return $sauceTypes;
    }

    public function generarProducto($id, $name, $sauce, $dscription, $price, $sauceQuantity) {
        $producto = '<form method="POST" action="" class="itemMenu" id="pro' . $id . '"><div class="col-sm-6 col-md-4">';
        $producto .= '<h3 class="itemName">' . $name . '</h3>';
        if ($sauce == 't') {
            $producto .= '<table class="table table-bordered table-hover table-striped"><thead><tr><th>Salsa</th><th>Picante</th></tr></thead><tbody class="saucedetail">';
            for ($index = 0; $index < $sauceQuantity; $index++) {
                $producto .= '<tr>';
                $producto .= '<td>' . $this->generarSauceTypes($index) . '</td>';
                $producto .= '<td>' . $this->generarHotSpicy($index) . '</td>';
                $producto .= '</tr>';
            }
            $producto .= '</tbody></table>';
        }
        $producto .= '<div class="input-group"><div class="input-group-addon">Cantidad</div><input type="number" class="form-control" name="Quantity" min="1" max="50" value="1"></div><br>';
        $producto .= '<textarea name="ordrComment" class="form-control" rows="2" maxlength="30" placeholder="Comentarios"></textarea>';
        $producto .= 'Precio:  <strong class="itemPrice">' . $price . '</strong><br>';
        $producto .= '<button type="submit" class=" btn btn-success" name="Aceptar">Agregar</button>';
        $producto .= '</div></form>';
        return $producto;
    }

    public function getSucursales() {
        $Sucursales = '<select class="form-control" name="Restaurante" id="codagency">';
        $agencies = $this->MOrder->getAgencies();
        foreach ($agencies as $agency) {
            $Sucursales .= '<option value="' . $agency->IdAgency . '">' . $agency->Name . '</option>';
        }
        $Sucursales .= '</select>';
        return $Sucursales;
    }

    public function crearPedido() {
        try {
            if ($this->input->post()) {
                $numero = $this->input->post('numberClient');
                $nombre = $this->input->post('nameClient');
                $direccion = $this->input->post('directionClient');
                $comentarios = $this->input->post('comments');
                $sucursal = $this->input->post('agency');
                $productos = $this->input->post('items');
                $total = $this->input->post('total');
                $referencia = $this->input->post('referencia');
                $idOrder = $this->MOrder->insertOrder($numero, $nombre, $direccion, $comentarios, $sucursal, $total, $referencia);
                foreach ($productos as $producto) {
                    $idItem = $this->MOrder->insertOrderDetail($producto['producto'], $producto['cantidad'], $producto['precio'], $idOrder,$producto['comentarios']);
                    if (isset($producto['salsas'])) {
                        $salsas = $producto['salsas'];
                        foreach ($salsas as $salsa) {
                            $this->MOrder->insertOrderDetailSauces($salsa['idSalsa'], $salsa['idPicante'], $idItem);
                        }
                    }
                }
                echo $idOrder;
            }
        } catch (Exception $ex) {
            echo json_encode($ex);
        }
    }

    public function crearPedidoDetalle() {
        try {
            if ($this->input->post()) {
                $idproducto = $this->input->post('numberClient');
                $idsalsa = $this->input->post('nameClient');
                $idpicante = $this->input->post('directionClient');
                $cantidad = $this->input->post('comments');
                $precio = $this->input->post('agency');
                $orden = $this->input->post('orden');
                $arrayData = $this->MOrder->insertOrder($idproducto, $idsalsa, $idpicante, $cantidad, $precio, $orden);
                echo json_encode($arrayData);
            }
        } catch (Exception $ex) {
            echo json_encode($ex);
        }
    }

    public function searchClient() {
        try {
            if ($this->input->post()) {
                $numero = $this->input->post('numberClient');
                $arrayData = $this->MOrder->searchClient($numero);
                echo json_encode($arrayData);
            }
        } catch (Exception $ex) {
            echo json_encode($ex);
        }
    }

    public function buscarPedido() {
        $Orders = '';
        try {
            if ($this->input->post()) {
                $option = $this->input->post('numberOption');
                $filter = $this->input->post('filtertext');
                $pedidos = $this->MOrder->getDeliveriesBy($option, $filter);
                foreach ($pedidos as $pedido) {
                    $Orders .= '<tr id="' . $pedido->IdOrder . '">';
                    $Orders .='<td>' . $pedido->IdOrder . '</td><td>' . $pedido->NumberClient . '</td>';
                    $Orders .='<td>' . $pedido->NameClient . '</td><td>' . $pedido->DirectionClient . '</td>';
                    $Orders .='<td>' . $pedido->StatusDescription . '</td><td>' . $pedido->Nombre . '</td>';
                    $Orders .='<td>$ ' . $pedido->Total . '</td><td>' . $pedido->Comments . '</td>';
                    $Orders .= '<td>'
                            . '<button id="viewDetail' . $pedido->IdOrder . '" onclick="viewDetail(this)" title="Ver Detalle" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> </button>'
                            . '</td>';
                    $Orders .='</tr>';
                }
            }
        } catch (Exception $ex) {
            $Orders = json_encode($ex);
        }
        echo $Orders;
    }

}
