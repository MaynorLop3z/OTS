<?php

date_default_timezone_set('America/El_Salvador');
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class MDelivery extends CI_Model {

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
                . 'IdStatus,'
                . 'IdMotorizado,'
                . 'Total, '
                . 'NumRef');
        $this->db->from('Order');
        $this->db->where('IdAgency', $idAgency);
        $this->db->where('IdStatus <', 4);
        $this->db->where('CreationDate', date("Y-m-d"));
        $this->db->order_by("IdOrder", "desc");
        $consulta = $this->db->get();
        $resultado = $consulta->result();
        return $resultado;
    }
    public function getOrder($idOrder) {
        $this->db->select('NameClient, '
                . 'DirectionClient, '
                . 'Comments, '
                . 'Total');
        $this->db->from('Order');
        $this->db->where('IdOrder', $idOrder);
        $consulta = $this->db->get();
        $resultado = $consulta->result();
        return $resultado;
    }

    public function getDetalleOrder($codigo) {
        try {
            $comando = 'SELECT 
  "DetailOrder"."IdDetail", 
  "Products"."NameProduct", 
  "DetailOrder"."Quantity", 
  "DetailOrder"."UnitPrice", 
  "DetailOrder"."Comment"
FROM "Products", "DetailOrder"
WHERE "DetailOrder"."IdProduct" = "Products"."IdProduct" AND "DetailOrder"."IdOrder" = ' . $codigo . '
ORDER BY "DetailOrder"."IdDetail" ASC;';
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
    public function getDetalleSalsas($codigo) {
        try {
            $comando = 'SELECT 
  "T1"."NameSauce", 
  "T2"."NameSpicy",
  "T0"."Vegetables"
FROM 
  "DetailSauces" "T0", "Sauce" "T1", "Spicy" "T2"
WHERE 
  "T0"."IdSauce" = "T1"."IdSauce" AND
  "T0"."IdSpicy" = "T2"."IdSpicy" AND "T0"."IdDetail" = '.$codigo.'
ORDER BY
  "T0"."IdDSauces" ASC;';
            $consulta = $this->db->query($comando);
            if ($consulta != null) {
                $resultado = $consulta->result();
            }
            return $resultado;
        } catch (Exception $exc) {
            return $exc->getTraceAsString();
        }
    }

    public function dispatchOrder($codigo, $status, $motorizado) {
        try {
            $data = array(
                'IdStatus' => $status,
                'IdMotorizado' => $motorizado,
                'DispatchTime' => date("H:i:s")
            );
            $this->db->where('IdOrder', $codigo);
            $this->db->update('Order', $data);
        } catch (Exception $ex) {
            $ex->getMessage();
        }
        return $data;
    }

    public function getStatus() {
        $this->db->select('IdStatus, '
                . 'StatusDescription');
        $this->db->from('Status');
        $this->db->where('IdStatus >',0);
        $consulta = $this->db->get();
        $resultado = $consulta->result();
        return $resultado;
    }

    public function getMotorizados($Sucursal) {
        $this->db->select('IdMotorizado, '
                . 'Nombre');
        $this->db->from('Motorizados');
        $this->db->where("IdAgency", $Sucursal);
        $this->db->or_where("IdAgency", 0);
        $consulta = $this->db->get();
        $resultado = $consulta->result();
        return $resultado;
    }

}
