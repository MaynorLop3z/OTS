<?php

require('fpdf.php');

class PDF extends FPDF {

    private $totalFac, $clientFac, $dateFac, $dirFac;

// Cabecera de página
    function Header() {
        //$this->SetY(35);
        // Arial bold 15
        $this->SetFont('Arial', 'B', 12);
        // Movernos a la derecha
//        $this->Cell(8);
        // Título
        $this->Cell(4, 3, $this->clientFac, 0, 0, 'C');
        $this->Cell(5, 3, $this->dateFac, 0, 0, 'C');
        // Salto de línea
       $this->Ln(2);
    }

// Pie de página
    function Footer() {
        // Posición: a 1,5 cm del final
        $this->SetY(-5);
        // Arial italic 8
        $this->SetFont('Arial', 'I', 10);
        // Número de página
        $this->MultiCell(7, 5, $this->dirFac);
        $this->MultiCell(7, 5, '$ '.$this->totalFac); 
    }

    function setTotal($total) {
        $this->totalFac = $total;
    }

    function setDateFac($fecha) {
        $this->dateFac = $fecha;
    }

    function setClientName($nombre) {
        $this->clientFac = $nombre;
    }

    function setDirection($dir) {
        $this->dirFac = $dir;
    }

}
