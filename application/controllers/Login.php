<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Empresas');
    }

    public function index() {
        $IdEmpresa = $this->input->post('sEmpresas');
        $Alias = $this->input->post('UserAlias');
        $Password = $this->input->post('UserPass');
        if ($IdEmpresa != null && $Alias != null && $Password != null) {
            $this->load->model('Usuarios');
            $UserData = $this->Usuarios->Login($Alias, $Password);
            if ($UserData != null) {
                $usuario_data = array('nombreUser' => $UserData->Nombre,'ipUser' => $this->input->ip_address(),'logueado' => TRUE);
                $this->session->set_userdata($usuario_data);
//                $this->load->view('Orders');
                $this->load->helper('url');
                Redirect('Orders');
            } else {
                $data['Empresas'] = $this->Empresas->getEmpresas();
                $data['ErrorLogin'] = '<div id="login_error" class="alert alert-danger" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Error!</strong> Usuario o contraseña no validos. </div>';
                $this->load->view('login', $data);
            }
        } else {
            $data['Empresas'] = $this->Empresas->getEmpresas();
            $data['ErrorLogin'] ='';
            $this->load->view('login', $data);
        }
    }

}
