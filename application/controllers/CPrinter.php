<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class CPrinter extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $data["test"]=$this->input->get('Id');
        $this->load->view('Comanda',$data);
    }

}
