<?php
date_default_timezone_set('America/El_Salvador');
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class MOrder extends CI_Model {

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
    public function getCoverages() {
        $this->db->select('IdCoverage, '
                . 'Name, '
                . 'IdAgency');
        $this->db->from('Coverage');
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
                . 'Price, '
                . 'SauceQuantity, '
                . 'Garniture, '
                . 'Options');
        $this->db->from('Products');
        $this->db->where('IdCategory', $idCategory);
        $this->db->where('State', 0);
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
            $consulta = $this->db->query('SELECT "T0"."IdProduct", "T0"."NameProduct", "T0"."Dscription", "T0"."Sauce", "T0"."Price", "T1"."IdCategory", "T1"."NameCategory", "T1"."Bunch", "T0"."State" 
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

    public function insertOrder($numero, $nombre, $direccion, $comentarios, $sucursal, $total, $referencia, $email,$charge, $dscnt) {
        try {
            $data = array(
                "NumberClient" => $numero,
                "NameClient" => $nombre,
                "DirectionClient" => $direccion,
                "Comments" => $comentarios,
                "IdAgency" => $sucursal,
                "CreationDate" => date("Y-m-d"),
                "IdStatus" => 0,
                "CreationTime" => date("H:i:s"),
                "Total" => $total,
                "IdUsuario" => $this->session->userdata('usaurio'),
                "NumRef" => $referencia,
                "email" => $email,
                "ChargeForService" => $charge,
                "Dscnt" => $dscnt
            );
            $this->db->insert('Order', $data);
            $insert_id = $this->db->insert_id();
        } catch (Exception $ex) {
            $ex->getMessage();
        }
        return $insert_id;
    }

    public function insertOrderDetail($IdProduct, $Quantity, $UnitPrice, $IdOrder, $Comment) {
        try {
            $data = array(
                "IdProduct" => $IdProduct,
                "Quantity" => $Quantity,
                "UnitPrice" => $UnitPrice,
                "IdOrder" => $IdOrder,
                "Comment" => $Comment
            );
            $this->db->insert('DetailOrder', $data);
            $insert_id = $this->db->insert_id();
            //$data['IdDetail'] = $insert_id;
        } catch (Exception $ex) {
            $ex->getMessage();
        }
        return $insert_id;
    }
public function insertOrderDetailSauces($IdSauce, $IdSpicy, $IdDetail, $vegetables) {
        try {
            $data = array(
                "IdDetail" => $IdDetail,
                "IdSauce" => $IdSauce,
                "IdSpicy" => $IdSpicy,
                "Vegetables" => $vegetables
            );
            $this->db->insert('DetailSauces', $data);
            $insert_id = $this->db->insert_id();
        } catch (Exception $ex) {
            $ex->getMessage();
        }
        return $insert_id;
    }
    public function searchClient($number) {
        try {
            $this->db->select('NumberClient, '
                    . 'NameClient, '
                    . 'DirectionClient, '
                    . 'IdAgency, '
                    . 'email,'
                    . 'ChargeForService,'
                    . 'Dscnt');
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
        $criterio = '';
        switch ($option) {
            case 0:
                $criterio = '"T0"."NumberClient" LIKE \'%'.$filter.'%\'';
                break;
            case 1:
                $criterio = '"T0"."NameClient" LIKE \'%'.$filter.'%\'';
                break;
            case 2:
                $criterio = '"T0"."DirectionClient" LIKE \'%'.$filter.'%\'';
                break;
            case 3:
                $criterio = '"T0"."IdOrder" = '.$filter;
                break;
            default:
                $criterio = '"T0"."IdOrder" = '.$filter;
        }
        try {
            $consulta = $this->db->query('SELECT 
  "T0"."IdOrder", 
  "T0"."NumberClient", 
  "T0"."NameClient", 
  "T0"."DirectionClient", 
  "T0"."Comments", 
  "T0"."IdAgency", 
  "T0"."CreationDate", 
  "T0"."Total", 
  "T1"."StatusDescription", 
  "T2"."Nombre"
FROM "Order" "T0", "Motorizados" "T2", "Status" "T1"
WHERE "T0"."IdStatus" = "T1"."IdStatus" AND "T0"."IdMotorizado" = "T2"."IdMotorizado" AND '.$criterio.'
ORDER BY
  "T0"."IdOrder" ASC;');
            if ($consulta != null) {
                $resultado = $consulta->result();
            }
            return $resultado;
        } catch (Exception $exc) {
            return $exc->getTraceAsString();
        }
    }

}
