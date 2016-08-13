<?php
include APPPATH . 'controllers/WebClientPrint.php';

use Neodynamic\SDK\Web\WebClientPrint;
use Neodynamic\SDK\Web\Utils;
use Neodynamic\SDK\Web\DefaultPrinter;
//use Neodynamic\SDK\Web\InstalledPrinter;
use Neodynamic\SDK\Web\PrintFile;
use Neodynamic\SDK\Web\ClientPrintJob;

// Process request
// Generate ClientPrintJob? only if clientPrint param is in the query string
//$urlParts = parse_url($_SERVER['REQUEST_URI']);
//if (isset($urlParts['query'])) {
///$rawQuery = $urlParts['query'];
//parse_str($rawQuery, $qs);
//if (isset($qs[WebClientPrint::CLIENT_PRINT_JOB])) {
//IMPORTANT: For Windows clients, Adobe Reader needs to be installed at the client side
//$useDefaultPrinter = ($qs['useDefaultPrinter'] === 'checked');
//$printerName = urldecode($qs['printerName']);
//the PDF file to be printed, supposed to be in files folder
$filePath = $nombreArchivo;
//create a temp file name for our PDF file...
$fileName = uniqid() . '.pdf';
//Create a ClientPrintJob obj that will be processed at the client side by the WCPP
$cpj = new ClientPrintJob();
//Create a PrintFile object with the PDF file
$cpj->printFile = new PrintFile($filePath, $fileName, null);

$cpj->clientPrinter = new DefaultPrinter();

//Send ClientPrintJob back to the client
ob_start();
ob_clean();
echo $cpj->sendToClient();
ob_end_flush();
exit();
//}
//}
?>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        echo WebClientPrint::createScript(Utils::getRoot() . '/TEST.php');
        $script = ob_get_contents();
        echo $script;
        ?>
        <!--<script src="http://webclientprintphp.azurewebsites.net/WebClientPrint.php?WEB_CLIENT_PRINT&amp;2.0.2016.219&amp;1471104023.6424&amp;u=aHR0cDovL3dlYmNsaWVudHByaW50cGhwLmF6dXJld2Vic2l0ZXMubmV0L0RlbW9QcmludEZpbGVQcm9jZXNzLnBocA==" type="text/javascript"></script>-->
<!--        <script>jsWebClientPrint.print();</script>-->
    </body>
</html>
