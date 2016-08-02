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
        $pdf = new PDF('P', 'cm', array(21.5, 27.9));
        $pdf->setTotal(125.35);
        $pdf->setClientName('Maynor Lopez');
        $pdf->setDateFac(date('d-m-Y G:i:s'));
        $pdf->setDirection('Residencial Arizona, Senda Maya #23');
        $pdf->AddPage();
        $pdf->SetFont('Times', 'B', 16);
        $pdf->Cell(5, 5, 'Hola, Mundo!');
        $pdf->Output();
    }

    public function printBill() {
        $IdPedido = $this->input->get('Id');
        $this->load->model('MDelivery');
        $this->load->library('pdf');
        $pdf = new PDF('P', 'cm', array(21.5, 27.9));
        $Orders = $this->MDelivery->getOrder($IdPedido);
        foreach ($Orders as $Order) {
            $pdf->setTotal($Order->Total);
            $pdf->setClientName($Order->NameClient);
            $pdf->setDateFac(date('d-m-Y G:i:s'));
            $pdf->setDirection($Order->DirectionClient);
            $pdf->AddPage();
            $pdf->SetFont('Times', 'B', 10);
            $detalles = $this->MDelivery->getDetalleOrder($IdPedido);
            foreach ($detalles as $detalle) {
                $pdf->Cell(1, 2, $detalle->Quantity, 0, 0, 'L');
                $pdf->Cell(7, 2, $detalle->NameProduct, 0, 0, 'L');
                $pdf->Cell(2, 2, $detalle->UnitPrice, 0, 0, 'L');
                $pdf->Cell(2, 2, ($detalle->Quantity * $detalle->UnitPrice), 0, 0, 'L');
                $salsas = $this->MDelivery->getDetalleSalsas($detalle->IdDetail);
                foreach ($salsas as $salsa) {
                    $pdf->Ln(0.5);
                    $pdf->Cell(1, 2, '', 0, 0, 'L');
                    $pdf->Cell(7, 2, '--' . $salsa->NameSauce . ' - ' . $salsa->NameSpicy, 0, 0, 'L');
                    $pdf->Cell(2, 2, '', 0, 0, 'L');
                    $pdf->Cell(2, 2, '', 0, 0, 'L');
                }
                $pdf->Ln(0.5);
            }
        }
        $pdf->Output();
    }
}
