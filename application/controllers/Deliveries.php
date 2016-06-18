<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Deliveries extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Delivery');
        $this->load->library(array('session'));
    }

    public function index() {
        try {
            if ($this->session->userdata('indices') == 3) {
                
                $data['Pedidos'] = $this->getPedingOrders();
                $this->load->view('Delivery', $data);
            } else {
                $this->load->helper('url');
                Redirect('login');
            }
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }
    public function getPedingOrders(){
        $Orders = '';
                $sucursal = $this->session->userdata('sucursal');
                $pedidos = $this->Delivery->listarDeliveries($sucursal);
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
                            . '<button id="Dispatch' . $pedido->IdOrder . '" onclick="viewDispatcher(this)" title="Despachar" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span> </button>'
                            . '<button id="viewDetail' . $pedido->IdOrder . '" onclick="viewDetail(this)" title="Ver Detalle" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> </button>'
                            . '</td>';
                    $Orders .='</tr>';
                }
                return $Orders;
    }

    public function viewDetailOrder() {
        try {
        if ($this->input->post()) {
            $codigo = $this->input->post('codigo');
            $detalles = $this->Delivery->getDetalleOrder($codigo);
            echo json_encode($detalles);
            }
        } catch (Exception $ex) {
            echo json_encode($ex);
        }
        
    }
    
    public function dispatchOrder(){
        try {
            if ($this->input->post()) {
                $codigo = $this->input->post('codigo');
                $hora = $this->input->post('hora');
                $arrayData = $this->Delivery->dispatchOrder($codigo, $hora);
                echo json_encode($arrayData);
            }
        } catch (Exception $ex) {
            echo json_encode($ex);
        }
    }

}
