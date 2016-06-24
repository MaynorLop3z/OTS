<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Orders extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Order');
        $this->load->library(array('session'));
    }

    public function index() {
        try {
//            $this->session->userdata('indices');
            if ($this->session->userdata('indices') == 2) {
                $cantidadProductos = 0;
                $categorias = $this->Order->getCategorias();
                $allProducts[$cantidadProductos] = '';
                foreach ($categorias as $cat) {
                    $productos = $this->Order->getProductCatetory($cat->IdCategory);
                    foreach ($productos as $prod) {
                        $allProducts[$cantidadProductos] = $this->generarProducto($prod->IdProduct, $prod->NameProduct, $prod->Sauce, $prod->Dscription, $prod->Price);
                        $cantidadProductos++;
                    }
                }
                $data['Productos'] = $allProducts;
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

    public function generarHotSpicy() {
        $nivelHot = 'Nivel de Picante:<br><select class="form-control" name="nivelHot">';

        $niveles = json_decode(json_encode($this->Order->getNivelHot()), true);
        foreach ($niveles as $nivel) {
            $nivelHot .= '<option value="' . $nivel['IdSpicy'] . '">' . $nivel['NameSpicy'] . '</option>';
        }
        $nivelHot .= '</select>';
        return $nivelHot;
    }

    public function generarSauceTypes() {
        $sauceTypes = 'Tipo de Salsa:<br><select class="form-control" name="typeSalsa">';
        $salsas = json_decode(json_encode($this->Order->getTiposSalsa()), true);
        foreach ($salsas as $salsa) {
            $sauceTypes .= '<option value="' . $salsa['IdSauce'] . '">' . $salsa['NameSauce'] . '</option>';
        }
        $sauceTypes .= '</select>';
        return $sauceTypes;
    }

    public function generarProducto($id, $name, $sauce, $dscription, $price) {
        $producto = '<form method="POST" action="" class="itemMenu" id="pro' . $id . '"><div class="col-sm-6 col-md-4">';
        $producto .= '<h3 class="itemName">' . $name . '</h3>';
        if ($sauce == 't') {
            $producto .= $this->generarSauceTypes();
            $producto .= $this->generarHotSpicy();
        }
        $producto .= 'Cantidad:<input type="number" class="form-control" name="Quantity" min="1" max="50" value="1"><br>';
        $producto .= 'Precio:<strong class="itemPrice">' . $price . '</strong><br>';
        $producto .= '<button type="submit" class=" btn btn-success" name="Aceptar">Agregar</button>';
        $producto .= '</div></form>';
        return $producto;
    }

    public function getSucursales() {
        $Sucursales = '<select class="form-control" name="Restaurante" id="codagency">';
        $agencies = $this->Order->getAgencies();
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
                $idOrder = $this->Order->insertOrder($numero, $nombre, $direccion, $comentarios, $sucursal, $total, $referencia);
                foreach ($productos as $producto) {
                    $this->Order->insertOrderDetail($producto['producto'], $producto['salsa'], $producto['picante'], $producto['cantidad'], $producto['precio'], $idOrder);
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
                $arrayData = $this->Order->insertOrder($idproducto, $idsalsa, $idpicante, $cantidad, $precio, $orden);
                echo json_encode($arrayData);
            }
        } catch (Exception $ex) {
            echo json_encode($ex);
        }
    }
    
    public function searchClient(){
        try {
            if ($this->input->post()) {
                $numero = $this->input->post('numberClient');
                $arrayData = $this->Order->searchClient($numero);
                echo json_encode($arrayData);
            }
        } catch (Exception $ex) {
            echo json_encode($ex);
        }
    }
    
    public function buscarPedido(){
        $Orders = '';
        try {
            if ($this->input->post()) {
                $option = $this->input->post('numberOption');
                $filter = $this->input->post('filtertext');
                $pedidos = $this->Order->getDeliveriesBy($option,$filter);
                foreach ($pedidos as $pedido) {
                    $Orders .= '<tr id="' . $pedido->IdOrder . '">';
                    $Orders .='<td>' . $pedido->IdOrder . '</td><td>' . $pedido->NumberClient . '</td>';
                    $Orders .='<td>' . $pedido->NameClient . '</td><td>' . $pedido->DirectionClient . '</td>';
                    $Orders .='<td>$ ' . $pedido->Total . '</td><td>' . $pedido->Comments . '</td>';
                    if ($pedido->Status == 1) {
                        $Orders .='<td>Pendiente</td>';
                    } else {
                        $Orders .='<td>Despachado</td>';
                    }
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
