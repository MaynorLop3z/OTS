<?php

require('fpdf.php');

class ComandaPrint extends FPDF {

    private $idOrder;

// Cabecera de página
    function Header() {
        $this->SetFont('Arial', 'B', 12);
        $this->Cell(0, 2, 'Orden #' . $this->idOrder, 0, 0, 'C');
        $this->Ln(0.5);
    }

    function IdOrder($id) {
        $this->idOrder = $id;
    }

}
