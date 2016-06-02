<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Orders extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Order');
    }

    public function index() {
        try {
            $cantidadProductos = 0;
            $categorias = $this->Order->getCategorias();
            $allProducts[$cantidadProductos] = '';
            foreach ($categorias as $cat) {
                $productos = $this->Order->getProductCatetory($cat->IdCategory);
                foreach ($productos as $prod) {
                    
                    $cantidadProductos++;
                }
            }
            $this->load->view('Orders'); 
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }
    
    public function generarHotSpicy(){
        $nivelHot = 'Nivel de Picante:<br><select class="form-control" name="nivelHot">';
        
        $niveles = json_decode(json_encode($this->Order->getNivelHot()),true);
        foreach ($niveles as $nivel) {
           $nivelHot .= '<option value="'.$nivel['IdSpicy'].'">'.$nivel['NameSpicy'].'</option>';
        }
        $nivelHot .= '</select>';
        return $nivelHot;
    }
    
    public function generarSauceTypes(){
        $sauceTypes = 'Tipo de Salsa:<br><select class="form-control" name="typeSalsa">';
        $salsas = json_decode(json_encode($this->Order->getTiposSalsa()),true);
        foreach ($salsas as $salsa) {
            $sauceTypes .= '<option value="'.$salsa['IdSauce'].'">'.$salsa['NameSauce'].'</option>';
        }
        $sauceTypes .= '</select>';
    }
public function generarProducto($id,$name,$sauce,$dscription,$price){
    $producto = '<form method="POST" action="" class="itemMenu" id="pro'.$id.'"><div class="col-sm-6 col-md-4">';
    $producto .= '<h3 class="itemName">'.$name.'</h3>';
    if ($sauce == 't') {
        $producto .= generarSauceTypes();
        $producto .= generarHotSpicy();
    }
    $producto .= '<button type="submit" class=" btn btn-success" name="Aceptar">Agregar</button>';
    $producto .= '</div></form>';
}
}