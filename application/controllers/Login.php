<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Empresas');
    }

    public function index() {
        $idEmpresa = $this->input->post('UserAlias');
        if ($idEmpresa != null) {
            $this->load->view('administration');
        } else {
            $data['Empresas'] = $this->Empresas->getEmpresas();
            $this->load->view('login', $data);
        }
    }

}
