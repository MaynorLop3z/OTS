<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Deliveries extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->library(array('session'));
    }
    public function index() {
        try {
            if ($this->session->userdata('indices') == 3) {
                $this->load->view('Delivery');
            }
            else {
                $this->load->helper('url');
                 Redirect('login');
            }
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }
}