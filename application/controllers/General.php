<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class General extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }
    public function logout(){
        session_destroy();
    }
}