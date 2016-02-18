<?php

require_once('init.php');

loadScripts();

    $data = array("status" => "not set!");

        if(Utils::isPOST()) {
        // post means either to delete or add a user
        $parameters = new Parameters("POST");

        $action = $parameters->getValue('action');
        $user_name = $parameters->getValue('username');

        //$data = array("action" => $action, "user_name" => $user_name);
        if($action == 'delete' && !empty($user_name)) {

            $um = new ProductManager();
            $um->deleteUser($user_name);
            $data = array("status" => "success", "msg" => "User '$user_name' deleted.");
            echo json_encode($data, JSON_FORCE_OBJECT);
            return;

        } else if($action == 'update' && !empty($user_name)) {
            $newFirstName = $parameters->getValue('newFirstName');

            if(!empty($newFirstName)) {

                $um = new ProductManager();
                $count = $um->updateUserFirstName($user_name, $newFirstName);
                if($count > 0) {
                    $data = array("status" => "success", "msg" =>
                        "User '$user_name' updated with new first name ('$newFirstName').");
                } else {
                    $data = array("status" => "fail", "msg" =>
                        "User '$user_name' was NOT updated with new first name ('$newFirstName').");
                }
            } else {
                $data = array("status" => "fail", "msg" =>
                    "New user name must be present - value was '$newFirstName' for '$user_name'.");

            }
            echo json_encode($data, JSON_FORCE_OBJECT);
            return;

        } else if($action == 'add') {
            $newFirstName = $parameters->getValue('newFirstName');
            $newLastName = $parameters->getValue('newLastName');
            $newUserName = $parameters->getValue('newUserName');

            if(!empty($newFirstName) && !empty($newLastName) && !empty($newUserName)) {
                $data = array("status" => "success", "msg" => "User added.");
                $um = new ProductManager();
                $um->addUser($newFirstName, $newLastName, $newUserName);

            } else {
                $data = array("status" => "fail", "msg" => "First name, last name, and user name cannot be empty.");
            }
            echo json_encode($data, JSON_FORCE_OBJECT);
            return;

        }else {
            $data = array("status" => "fail", "msg" => "Action not understood.");
        }

        echo json_encode($data, JSON_FORCE_OBJECT);
        return;
            
            
            
            //GET.
            
            

    } else if(Utils::isGET()) {
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
