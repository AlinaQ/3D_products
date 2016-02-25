<?php

require_once('init2.php');
loadScripts();

    $data = array("status" => "not set!");

    if(Utils::isPOST()) {
        // post means either to delete or add a user
        $parameters = new Parameters("POST");

        $action = $parameters->getValue('action');
        $user_name = $parameters->getValue('username');

        //$data = array("action" => $action, "user_name" => $user_name);
        if($action == 'delete' && !empty($user_name)) {

            $um = new UserManager();
            $um->deleteUser($user_name);
            $data = array("status" => "success", "msg" => "User '$user_name' deleted.");
            echo json_encode($data, JSON_FORCE_OBJECT);
            return;

        } else if($action == 'update' && !empty($user_name)) {
            $newFirstName = $parameters->getValue('newFirstName');

            if(!empty($newFirstName)) {

                $um = new UserManager();
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
                $um = new UserManager();
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

    } else if(Utils::isGET()) {
        // get means get the list of users
        $um = new UserManager();
        $rows = $um->listUsers();
        $html = "";
        if($rows != null) {

            foreach($rows as $row) {
                $first_name = $row['first_name'];
                $last_name = $row['last_name'];
                $user_name = $row['user_name'];
                $html .= " <div class='col-md-3 col-sm-6 hero-feature'>
						<div class='thumbnail'>
						<img class='product1' alt='' width='800' height='500' src='$last_name'></img>
						<div class='caption'><h3>$first_name</h3>
                        <input type='number' value='1' min='1' max='10' step='1'/>
                        <p>$user_name</p>
						<input id='d-$user_name' class='delete btn btn-default' type='button' value='Delete'/>
                        <input id='u-$user_name' class='update btn btn-default' type='button' value='Update'/> <br/><br/>
                        <input class='btn btn-primary' type='button' value='Add to Cart'/>
						</div>
						</div>
						</div>";
                /*<div class='col-md-3 col-sm-6 hero-feature'>
						<div class='thumbnail'>
						<img class='product1' alt='' width='800' height='500' src='$last_name'></img>
						<div class='caption'><h3 data-sku-desc='$sku'>$first_name</h3>
                        <input data-sku-qty='$sku' type='number' value='1' min='1' max='10' step='1'/>
                        <p data-sku-price='$sku'>$user_name</p>
						<input id='d-$user_name' class='delete btn btn-default' type='button' value='Delete'/>
                        <input id='u-$user_name' class='update btn btn-default' type='button' value='Update'/> <br/><br/>
                        <input class='btn btn-primary' data-sku-add='$sku' type='button' value='Add to Cart'/>
						</div>
						</div>
						</div>
                */
            }
            echo $html;

        } else {
            // shouldn't be but ...
            echo 'The returned rows is "null". No user table perhaps?';
        }

        return;

    } else {
        $data = array("status" => "error", "msg" => "Only GET and POST allowed.");
        echo json_encode($data, JSON_FORCE_OBJECT);
    }



?>
