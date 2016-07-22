<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $Alias = $this->input->post('UserAlias');
        $Password = $this->input->post('UserPass');
        if ($Alias != null && $Password != null) {
            $this->load->model('Usuarios');
            $UserData = $this->Usuarios->Login($Alias, $Password);
            if ($UserData != null) {
                $usuario_data = array('nombreUser' => $UserData->Nombre,'ipUser' => $this->input->ip_address(),'logueado' => TRUE, 'indices' => $UserData->IdRol, 'sucursal' => $UserData->IdAgency, 'usaurio' => $UserData->IdUsuario);
                $this->session->set_userdata($usuario_data);
                $this->load->helper('url');
                if ($UserData->IdRol == 2) {
                    Redirect('COrders');
                }
                if ($UserData->IdRol == 3) {
                    Redirect('Deliveries');
                }
                if ($UserData->IdRol == 1) {
                    Redirect('Administration');
                }
            } else {
                $data['ErrorLogin'] = '<div id="login_error" class="alert alert-danger" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Error!</strong> Usuario o contraseña no validos. </div>';
                $this->load->view('Login', $data);
            }
        } else {
            $data['ErrorLogin'] ='';
            $this->load->view('Login', $data);
        }
    }

}
