<?php

include 'WebClientPrint.php';

use Neodynamic\SDK\Web\WebClientPrint;
use Neodynamic\SDK\Web\Utils;
//http://www.neodynamic.com/Products/Help/WebClientPrintPHP2.0/index.html
//http://www.neodynamic.com/products/printing/raw-data/php/
defined('BASEPATH') OR exit('No direct script access allowed');

class CPrinter extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $data["test"] = $this->input->get('Id');
        $this->load->view('Comanda', $data);
    }

}
