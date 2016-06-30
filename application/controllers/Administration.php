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
