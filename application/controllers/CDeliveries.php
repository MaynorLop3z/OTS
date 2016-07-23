<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class CDeliveries extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('MDelivery');
        $this->load->model('MOrder');
        $this->load->library(array('session'));
    }

    public function index() {
        try {
            if ($this->session->userdata('indices') == 3) {

                $data['Pedidos'] = $this->getPedingOrders();
//                $data['Sucursales'] = $this->getSucursales();
                $this->load->view('Delivery', $data);
            } else {
                $this->load->helper('url');
                Redirect('Login');
            }
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

    public function getPedingOrders() {
        $Orders = '';
        $IdStatus = 0;
        $IdMotorizado = 0;
        $sucursal = $this->session->userdata('sucursal');
        $pedidos = $this->MDelivery->listarDeliveries($sucursal);
        foreach ($pedidos as $pedido) {
            $Orders .= '<tr id="' . $pedido->IdOrder . '">';
            $Orders .='<td>' . $pedido->IdOrder . '</td><td>' . $pedido->NumberClient . '</td>';
            $Orders .='<td>' . $pedido->NameClient . '</td><td>' . $pedido->DirectionClient . '</td>';
            $Orders .='<td>$ ' . $pedido->Total . '</td>';
            if ($pedido->NumRef == '') {
                $Orders .= '<td>Efectivo</td>';
            } else {
                $Orders .= '<td>Tarjeta</td>';
            }
            $IdStatus = $pedido->IdStatus; //. $pedido->Comments
            $IdMotorizado = $pedido->IdMotorizado;
            $Orders .= '<td>' . $pedido->Comments . '</td>';
            $Orders .= '<td> <select class="form-control" name="Estado" id="IdEstado' . $pedido->IdOrder . '"> ' . $this->getStatusC($IdStatus) . '</td>';
            $Orders .= '<td> <select class="form-control" name="Motorizado" id="IdMotorizado' . $pedido->IdOrder . '">' . $this->getMotorizados($IdMotorizado) . '</td>';
            $Orders .= '<td>'
                    . '<button id="Dispatch' . $pedido->IdOrder . '" onclick="viewDispatcher(this)" title="Despachar" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span> </button>'
                    . '<button id="viewDetail' . $pedido->IdOrder . '" onclick="viewDetail(this)" title="Ver Detalle" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> </button>'
                    . '</td>';
            $Orders .='</tr>';
        }
        return $Orders;
    }

    public function syncPedingOrders() {
        $Orders = '';
        $IdStatus = 0;
        $IdMotorizado = 0;
        $sucursal = $this->session->userdata('sucursal');
        $pedidos = $this->MDelivery->listarDeliveries($sucursal);
        foreach ($pedidos as $pedido) {
            $Orders .= '<tr id="' . $pedido->IdOrder . '">';
            $Orders .='<td>' . $pedido->IdOrder . '</td><td>' . $pedido->NumberClient . '</td>';
            $Orders .='<td>' . $pedido->NameClient . '</td><td>' . $pedido->DirectionClient . '</td>';
            $Orders .='<td>$ ' . $pedido->Total . '</td>';
            if ($pedido->NumRef == '') {
                $Orders .= '<td>Efectivo</td>';
            } else {
                $Orders .= '<td>Tarjeta</td>';
            }
            $IdStatus = $pedido->IdStatus; //. $pedido->Comments
            $IdMotorizado = $pedido->IdMotorizado;
            $Orders .= '<td>' . $pedido->Comments . '</td>';
            $Orders .= '<td> <select class="form-control" name="Estado" id="IdEstado' . $pedido->IdOrder . '"> ' . $this->getStatusC($IdStatus) . '</td>';
            $Orders .= '<td> <select class="form-control" name="Motorizado" id="IdMotorizado' . $pedido->IdOrder . '">' . $this->getMotorizados($IdMotorizado) . '</td>';
            $Orders .= '<td>'
                    . '<button id="Dispatch' . $pedido->IdOrder . '" onclick="viewDispatcher(this)" title="Despachar" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span> </button>'
                    . '<button id="viewDetail' . $pedido->IdOrder . '" onclick="viewDetail(this)" title="Ver Detalle" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> </button>'
                    . '</td>';
            $Orders .='</tr>';
            $Orders .= '<script>';
            $Orders .= 'Selecciona(' . $pedido->IdOrder . ', ' .$IdStatus . ', ' .$IdMotorizado . ')';
            $Orders .= '</script>';
        }
        echo $Orders;
    }

    public function viewDetailOrder() {
        try {
            if ($this->input->post()) {
                $codigo = $this->input->post('codigo');
                $detalles = $this->MDelivery->getDetalleOrder($codigo);
                $tablabody = '';
                foreach ($detalles as $detalle) {
                    $tablabody .= '<tr>';
                    $tablabody .= '<td>' . $detalle->NameProduct . '</td>';
                    $salsas = $this->MDelivery->getDetalleSalsas($detalle->IdDetail);
                    $tablabody .= '<td><table class="table table-bordered table-condensed"><tbody>';
                    foreach ($salsas as $salsa) {
                     $tablabody .= '<tr>';
                     $tablabody .= '<td>' . $salsa->NameSauce . '</td>';
                     $tablabody .= '<td>' . $salsa->NameSpicy . '</td>';
                     $tablabody .= '</tr>';
                    }
                    $tablabody .= '</tbody></table></td>';
                    $tablabody .= '<td>' . $detalle->Quantity . '</td>';
                    $tablabody .= '<td>' . $detalle->UnitPrice . '</td>';
                    $tablabody .= '<td>' . $detalle->Comment . '</td>';
                    $tablabody .= '</tr>';
                }
                echo $tablabody;
            }
        } catch (Exception $ex) {
            echo json_encode($ex);
        }
    }

    public function getStatusC($IdStatus) {
        $Estados = '';
        $Status = $this->MDelivery->getStatus();
        foreach ($Status as $Estado) {
            $Estados .= '<option value="' . $Estado->IdStatus . '">' . $Estado->StatusDescription . '</option>';
        }
        $Estados .= '</select>';
        return $Estados;
    }

    public function getMotorizados($IdMotorizado) {
        $sucursal = $this->session->userdata('sucursal');
        $Motorizados = '';
        $Bikers = $this->MDelivery->getMotorizados($sucursal);
        foreach ($Bikers as $Motorizado) {
//            if ($Motorizado->IdMotorizado = $IdMotorizado) {
                $Motorizados .= '<option value="' . $Motorizado->IdMotorizado . '" >' . $Motorizado->Nombre . '</option>';
//            } else {
//                $Motorizados .= '<option value="' . $Motorizado->IdMotorizado . '" >' . $Motorizado->Nombre . '</option>';
//            }
        }
        $Motorizados .= '</select>';
        return $Motorizados;
    }

    public function dispatchOrder() {
        try {
            if ($this->input->post()) {
                $codigo = $this->input->post('codigo');
                $status = $this->input->post('status');
                $motorizado = $this->input->post('motorizado');
                $arrayData = $this->MDelivery->dispatchOrder($codigo, $status, $motorizado);
                echo json_encode($arrayData);
            }
        } catch (Exception $ex) {
            echo json_encode($ex);
        }
    }

}
