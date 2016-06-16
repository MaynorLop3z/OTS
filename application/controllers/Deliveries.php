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
                $Orders = '';
                $pedidos = $this->Delivery->listarDeliveries(1);
                foreach ($pedidos as $pedido) {
                    $Orders .= '<tr id="' . $pedido->IdOrder . '">';
                    $Orders .='<td>' . $pedido->NumberClient . '</td>';
                    $Orders .='<td>' . $pedido->NameClient . '</td>';
                    $Orders .='<td>' . $pedido->DirectionClient . '</td>';
                    $Orders .='<td>' . $pedido->Comments . '</td>';
                    if ($pedido->Status == 1) {
                        $Orders .='<td>Pendiente</td>';
                    }
                    else{
                       $Orders .='<td>Despachado</td>'; 
                    }
                    $Orders .= '<td><button id="Dispatch' . $pedido->IdOrder . '" onclick="despachar(this)" title="Despachar" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span> </button></td>';
                    $Orders .='</tr>';
                }
                $data['Pedidos'] = $Orders;
                $this->load->view('Delivery',$data);
            } else {
                $this->load->helper('url');
                Redirect('login');
            }
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

}
