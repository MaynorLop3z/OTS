<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Administration extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }
    
    public function index() {
        try {
            if ($this->session->userdata('indices') == 1) {
                $this->load->model('Order');
                $data['Categorias']= $this->Order->getCategorias();
                $data['Productos']= $this->Order->getALLProductos();
                $this->load->model('Usuarios');
                $data['Usuarios']= $this->Usuarios->getUsers();
                $this->load->view('Administration', $data);
            } else {
                $this->load->helper('url');
                Redirect('Login');
            }
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }
    
}
//"IdUsuario" serial NOT NULL,
//  "Nombre" character varying(30) NOT NULL,
//  "Alias" character varying(15) NOT NULL,
//  "Password" character varying(15),
//  "IdRol" integer NOT NULL,
//  "IdAgency" integer,