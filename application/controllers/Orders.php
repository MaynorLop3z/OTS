<?php
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Orders extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        try {
            $this->load->view('Orders'); 
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

}