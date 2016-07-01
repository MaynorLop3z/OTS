<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Usuarios extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    public function Login($username, $password) {
        try {
            $this->db->where('Alias', $username);
            $this->db->where('Password', $password);
            $q = $this->db->get('Usuarios');

            if ($q->num_rows() > 0) {
                $userLogin = $q->row();
                return $userLogin;
            } else {
                return null;
            }
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

    public function getUsers() {
        try {
            $consulta = $this->db->query('SELECT 
  "T0"."IdUsuario", 
  "T0"."Nombre", 
  "T0"."Alias", 
  "T0"."Password", 
  "T0"."IdRol", 
  "T2"."RolName",
  "T0"."IdAgency", 
  "T1"."Name"
FROM 
  "Usuarios" "T0"
  JOIN "Agency" "T1" ON "T0"."IdAgency" = "T1"."IdAgency"
  JOIN "Rol" "T2" ON "T0"."IdRol" = "T2"."IdRol";');
            if ($consulta != null) {
                $resultado = $consulta->result();
            }
            return $resultado;
        } catch (Exception $exc) {
            return $exc->getTraceAsString();
        }
    }

    public function insertUser($Nombre, $Alias, $Password, $IdRol, $IdAgency) {
        try {
            $data = array(
                'Nombre' => $Nombre,
                'Alias' => $Alias,
                'Password' => $Password,
                'IdRol' => $IdRol,
                'IdAgency' => $IdAgency
            );
            $this->db->insert('Usuarios', $data);
            $insert_id = $this->db->insert_id();
            $data['IdUsuario'] = $insert_id;
        } catch (Exception $ex) {
            $ex->getMessage();
        }
        return $data;
    }

    public function deleteUser($IdUsuario) {
        $eliminado = false;
        try {
            $this->db->delete('Usuarios', array('IdUsuario' => $IdUsuario));
            if ($this->db->affected_rows() == 1) {
                $eliminado = true;
            }
        } catch (Exception $ex) {
            $ex->getMessage();
        }
        return $eliminado;
    }

    public function updateUser($Nombre, $Alias, $Password, $IdRol, $IdAgency, $IdUsuario) {
        try {
            $data = array(
                'Nombre' => $Nombre,
                'Alias' => $Alias,
                'Password' => $Password,
                'IdRol' => $IdRol,
                'IdAgency' => $IdAgency
            );
            $this->db->where('IdUsuario', $IdUsuario);
            $this->db->update('Usuarios', $data);
            $data['IdUsuario'] = $IdUsuario;
        } catch (Exception $ex) {
            $ex->getMessage();
        }
        return $data;
    }

}
