<?php

require_once('init.php');
loadScripts();

    $data = array("status" => "not set!");

    if(Utils::isGET()) {
        $pm = new ProductManager();
        $rows = $pm->listProducts();

        $html = "";
        foreach($rows as $row) {
            $sku = $row['SKU'];
            $price = $row['item_price'];
            $desc = $row['description'];
			$img = $row['img'];
            $html .= "  <div class='col-md-3 col-sm-6 hero-feature'>
						<div class='thumbnail'>
						<img class='product1' alt='' width='800' height='500' src='$img'></img>
						<div class='caption'>
                        <h3 data-sku-desc='$sku'>$desc</h3>
                        <input data-sku-qty='$sku' type='number' value='1' min='1' max='10' step='1'/>
                        <p data-sku-price='$sku'>$price</p>
						
                        <input class='btn btn-primary' data-sku-add='$sku' type='button' value='Add to Cart'/>
					  </div>
					  </div>
                      </div>";
        }
        echo $html;
        return;

    } else {
        $data = array("status" => "error", "msg" => "Only GET allowed.");

    }

    echo json_encode($data, JSON_FORCE_OBJECT);

?>
