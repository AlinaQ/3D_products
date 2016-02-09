<?php


function loadScripts() {

$scripts = array('DBconnector.php',
                 'Messages.php',
                 'Parameters.php',
                 'ProductManager.php',
                 'ShoppingCartManager.php',
                 'Utils.php');

    $subDir = "src";

    foreach($scripts as $script) {
        require_once($subDir . DIRECTORY_SEPARATOR. $script);
    }

}




?>
