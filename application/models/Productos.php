<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
class Productos extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->database();
    }
    
    public function insertProduct($NameProduct, $Dscription, $Type, $Sauce, $Price, $IdCategory) {
        try {
            $data = array(
                'NameProduct' => $NameProduct,
                'Dscription' => $Dscription,
                'Type' => $Type,
                'Sauce' => $Sauce,
                'Price' => $Price,
                'IdCategory' => $IdCategory
            );
            $this->db->insert('Productos', $data);
            $insert_id = $this->db->insert_id();
            $data['IdProducto'] = $insert_id;
        } catch (Exception $ex) {
            $ex->getMessage();
        }
        return $data;
    }
    
    
    public function deleteProduct($IdUsuario) {
        $eliminado = false;
        try {
        $this->db->delete('Usuarios', array('IdUsuario' => $IdUsuario));
        if ($this->db->affected_rows() == 1){
            $eliminado = true;
        }
        } catch (Exception $ex) {
            $ex->getMessage();
        }
        return $eliminado;
    }
    
    public function updateProduct($NameProduct, $Dscription, $Type, $Sauce, $Price, $IdCategory, $IdProduct) {
        try {
            $data = array(
                'NameProduct' => $NameProduct,
                'Dscription' => $Dscription,
                'Type' => $Type,
                'Sauce' => $Sauce,
                'Price' => $Price,
                'IdCategory' => $IdCategory
            );
            $this->db->where('IdProduct', $IdProduct);
            $this->db->update('Productos', $data);
            $data['IdProduct'] = $IdProduct;
        } catch (Exception $ex) {
            $ex->getMessage();
        }
        return $data;
    }
}