<?php

//require_once('./DBConnector.php');

//$um = new ProductManager();

// Facade
class ProductManager {

    private $db;

    public function __construct() {
        $this->db = DBConnector::getInstance();
    }

    public function listProducts() {
        $sql = "SELECT SKU, item_price, description, img FROM product";
        $rows = $this->db->query($sql);
        return $rows;
    }

    public function findProduct($SKU) {
        $params = array(":sku" => $SKU);
        $sql = "SELECT SKU, item_price, description, img FROM product WHERE SKU = :sku";

        $rows = $this->db->query($sql, $params);
        if(count($rows) > 0) {
            return $rows[0];
        }

        return null;
    }
    
//INSERT INTO DATABASE    
        public function updateUserFirstName($login, $newFirstName) {
        $sql = "UPDATE user SET first_name = '$newFirstName' WHERE user_name = '$login'";
        $affectedRows = $this->db->affectRows($sql);
        return $affectedRows;
    }

    public function deleteUser($login) {
        $sql = "DELETE FROM user WHERE user_name = '$login'";
        $affectedRows = $this->db->affectRows($sql);
        return $affectedRows;
    }

    public function addUser($firstName, $lastName, $userName) {

        $sql = "INSERT INTO product (SKU, item_price, description, img)
            VALUES ('d', 'f', 'd', 'g')";
        $affectedRows = $this->db->affectRows($sql);
        return $affectedRows;
    }


}

?>
