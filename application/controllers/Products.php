<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Products extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Productos');
    }
    
    public function agregarProducto() {
        try {
            if ($this->input->post()) {
                $NameProduct = $this->input->post('nombre');
                $Dscription = $this->input->post('descripcion');
                $Type = 2;
                $Sauce = $this->input->post('salsa');
                $Price = $this->input->post('precio'); 
                $IdCategory = $this->input->post('categoria');
                $arrayData = $this->Productos->insertProduct($NameProduct, $Dscription, $Type, $Sauce, $Price, $IdCategory);
                echo json_encode($arrayData);
            }
        } catch (Exception $ex) {
            echo json_encode($ex);
        }
    }
    
    
    public function actualizarProducto() {
        try {
            if ($this->input->post()) {
                $IdProduct = $this->input->post('codigo');
                $NameProduct = $this->input->post('nombre');
                $Dscription = $this->input->post('descripcion');
                $Type = 2;
                $Sauce = $this->input->post('salsa');
                $Price = $this->input->post('precio'); 
                $IdCategory = $this->input->post('categoria');
                $arrayData = $this->Productos->updateProduct($NameProduct, $Dscription, $Type, $Sauce, $Price, $IdCategory, $IdProduct);
                echo json_encode($arrayData);
            }
        } catch (Exception $ex) {
            echo json_encode($ex);
        }
    }
    
    
    
    public function eliminarProducto() {
        try {
            if ($this->input->post()) {
                $codigo = $this->input->post('codigo');
                $arrayData = $this->Productos->deleteProduct($codigo);
                echo json_encode($arrayData);
            }
        } catch (Exception $ex) {
            echo json_encode($ex);
        }
    }
}
