<?php

//include 'WebClientPrint.php';
//
//use Neodynamic\SDK\Web\WebClientPrint;
//use Neodynamic\SDK\Web\Utils;
//http://www.neodynamic.com/Products/Help/WebClientPrintPHP2.0/index.html
//http://www.neodynamic.com/products/printing/raw-data/php/
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set('America/El_Salvador');

class CPrinter extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $this->load->library('pdf');
        $pdf = new PDF('P','cm',array(15,15));
        $pdf->setTotal(125.35);
        $pdf->setClientName('Maynor Lopez');
        $pdf->setDateFac(date('d-m-Y G:i:s'));
        $pdf->setDirection('Residencial Arizona, Senda Maya #23');
        $pdf->AddPage();
        $pdf->SetFont('Times', 'B', 16);
        $pdf->Cell(5, 5, 'Hola, Mundo!');
        $pdf->Output();
    }

    public function getComanda() {
        $IdPedido = $this->input->get('Id');
        $this->load->model('MDelivery');
        $comanda = '';
        $Orders = $this->MDelivery->getOrder($IdPedido);
        foreach ($Orders as $Order) {
            $comanda .= $Order->NameClient . '                                      ' . date('d-m-Y G:i:s') . '<br><br><br>';
            $detalles = $this->MDelivery->getDetalleOrder($IdPedido);
            foreach ($detalles as $detalle) {
                $comanda .= $detalle->Quantity . '            ' . $detalle->NameProduct . '           ' . $detalle->UnitPrice . '          ' . ($detalle->Quantity * $detalle->UnitPrice) . '<br>';
                $salsas = $this->MDelivery->getDetalleSalsas($detalle->IdDetail);
                foreach ($salsas as $salsa) {
                    $comanda .='           --' . $salsa->NameSauce . ' - ' . $salsa->NameSpicy . '<br>';
                }
            }
            $comanda .='<br><br><br>';
            $comanda .='        ' . $Order->DirectionClient . '                     $' . $Order->Total;
        }
        $data['comanda'] = $comanda;
        $this->load->view('Comanda', $data);
    }

}
