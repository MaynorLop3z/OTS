<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Delivery extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->database();
    }
public function listarDeliveries($idAgency) {
        $this->db->select('IdOrder, '
                . 'NumberClient, '
                . 'NameClient, '
                . 'DirectionClient, '
                . 'Comments, '
                . 'IdAgency, '
                . 'CreationDate, '
                . 'Status');
        $this->db->from('Order');
//        $this->db->where('IdAgency', $idAgency);
        $consulta = $this->db->get();
        $resultado = $consulta->result();
        return $resultado;
    }
    public function listarDiplomados() {
        try {
            $consulta = $this->db->query('SELECT "d"."CodigoDiplomado", "d"."NombreDiplomado", "d"."Descripcion", "d"."Estado", "cd"."NombreCategoriaDiplomado", "d"."Comentarios" FROM "Diplomados" "d" JOIN "CategoriaDiplomados" "cd" ON "d"."CodigoCategoriaDiplomado" = "cd"."CodigoCategoriaDiplomado"');
            if ($consulta != null) {
                $resultado = $consulta->result();
            } else {
                
            }
            return $resultado;
        } catch (Exception $exc) {
            return $exc->getTraceAsString();
        }
    }

}
