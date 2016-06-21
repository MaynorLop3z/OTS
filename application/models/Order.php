<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Order extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    public function getNivelHot() {
        $this->db->select('IdSpicy, '
                . 'NameSpicy');
        $this->db->from('Spicy');
        $consulta = $this->db->get();
        $resultado = $consulta->result();
        return $resultado;
    }

    public function getTiposSalsa() {
        $this->db->select('IdSauce, '
                . 'NameSauce');
        $this->db->from('Sauce');
        $consulta = $this->db->get();
        $resultado = $consulta->result();
        return $resultado;
    }

    public function getCategorias() {
        $this->db->select('IdCategory, '
                . 'NameCategory, '
                . 'Bunch, '
                . 'SortIndex');
        $this->db->from('Category');
        $this->db->order_by('SortIndex ASC');
        $consulta = $this->db->get();
        $resultado = $consulta->result();
        return $resultado;
    }

    public function getProductCatetory($idCategory) {
        $this->db->select('IdProduct, '
                . 'NameProduct, '
                . 'Dscription, '
                . 'Sauce, '
                . 'Price');
        $this->db->from('Products');
        $this->db->where('IdCategory', $idCategory);
        $consulta = $this->db->get();
        $resultado = $consulta->result();
        return $resultado;
    }

    public function getAgencies() {
        $this->db->select('IdAgency, '
                . 'Name');
        $this->db->from('Agency');
        $consulta = $this->db->get();
        $resultado = $consulta->result();
        return $resultado;
    }

    public function getALLProductos() {
        try {
            $consulta = $this->db->query('SELECT "T0"."IdProduct", "T0"."NameProduct", "T0"."Dscription", "T0"."Sauce", "T0"."Price", "T1"."IdCategory", "T1"."NameCategory", "T1"."Bunch" 
                FROM "Products" "T0" 
                JOIN "Category" "T1" ON "T0"."IdCategory" = "T1"."IdCategory" 
                ORDER BY "T1"."SortIndex" ASC');
            if ($consulta != null) {
                $resultado = $consulta->result();
            } else {
                
            }
            return $resultado;
        } catch (Exception $exc) {
            return $exc->getTraceAsString();
        }
    }

    public function insertOrder($numero, $nombre, $direccion, $comentarios, $sucursal, $total) {
        try {
            $insert_id = 0;
            $data = array(
                "NumberClient" => $numero,
                "NameClient" => $nombre,
                "DirectionClient" => $direccion,
                "Comments" => $comentarios,
                "IdAgency" => $sucursal,
                "CreationDate" => date("Y-m-d"),
                "Status" => 1,
                "CreationTime" => date("H:i:s"),
                "Total" => $total,
                "IdUsuario" => $this->session->userdata('usaurio')
            );
            $this->db->insert('Order', $data);
            $insert_id = $this->db->insert_id();
        } catch (Exception $ex) {
            $ex->getMessage();
        }
        return $insert_id;
    }

    public function insertOrderDetail($IdProduct, $IdSauce, $IdSpicy, $Quantity, $UnitPrice, $IdOrder) {
        try {
            $data = array(
                "IdProduct" => $IdProduct,
                "IdSauce" => $IdSauce,
                "IdSpicy" => $IdSpicy,
                "Quantity" => $Quantity,
                "UnitPrice" => $UnitPrice,
                "IdOrder" => $IdOrder
            );
            $this->db->insert('DetailOrder', $data);
            $insert_id = $this->db->insert_id();
            $data['IdDetail'] = $insert_id;
        } catch (Exception $ex) {
            $ex->getMessage();
        }
        return $data;
    }

    public function searchClient($number) {
        try {
            $this->db->select('NumberClient, '
                    . 'NameClient, '
                    . 'DirectionClient');
            $this->db->from('Order');
            $this->db->where('NumberClient', $number);
            $this->db->order_by("IdOrder", "desc");
            $this->db->limit(1);
            $consulta = $this->db->get();
            $resultado = $consulta->result();
        } catch (Exception $ex) {
            $ex->getMessage();
        }
        return $resultado;
    }

    public function getDeliveriesBy($option, $filter) {
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
        switch ($option) {
            case 0:
                $this->db->like('NumberClient', $filter);
                break;
            case 1:
                $this->db->like('NameClient', $filter);
                break;
            case 2:
                $this->db->like('DirectionClient', $filter);
                break;
            case 3:
                $this->db->where('IdOrder', $filter);
                break;
            default:
                $this->db->where('IdOrder', $filter);
        }
        $this->db->where('CreationDate', date("Y-m-d"));
        $this->db->order_by("IdOrder", "desc");
        $consulta = $this->db->get();
        $resultado = $consulta->result();
        return $resultado;
    }

}
