<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Deliveries extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }
    public function index() {
        try {
            $this->load->view('Delivery');
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }
}