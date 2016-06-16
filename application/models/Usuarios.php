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
             $userLogin=$q->row();
                return $userLogin;   
                
            } else {
                return null;
            }
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }
}