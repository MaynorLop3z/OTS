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
                . 'Status,'
                . 'Total');
        $this->db->from('Order');
        $this->db->where('IdAgency', $idAgency);
        $this->db->where('Status', 1);
        $this->db->where('CreationDate', date("Y-m-d"));
        $this->db->order_by("IdOrder", "desc");
        $consulta = $this->db->get();
        $resultado = $consulta->result();
        return $resultado;
    }
    public function getDetalleOrder($codigo) {
        try {
            $comando = 'SELECT * FROM getdetailorder ('.$codigo.');';
            $consulta = $this->db->query($comando);
            if ($consulta != null) {
                $resultado = $consulta->result();
            } else {
                
            }
            return $resultado;
        } catch (Exception $exc) {
            return $exc->getTraceAsString();
        }
    }
    
    public function dispatchOrder($codigo) {
        try {
            $data = array(
                'Status' => 2,
                'DispatchTime' => date("H:i:s")
            );
            $this->db->where('IdOrder', $codigo);
            $this->db->update('Order', $data);
        } catch (Exception $ex) {
            $ex->getMessage();
        }
        return $data;
    }

}
