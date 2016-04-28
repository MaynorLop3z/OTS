<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
class Empresas extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->database();
    }
    
    
    public function getEmpresas() {
        $this->db->select('IdEmpresa, '
                . 'Nombre, '
                . 'BDName');
        $this->db->from('Empresas');
        $consulta = $this->db->get();
        $resultado = $consulta->result();
        return $resultado;
    }
}
