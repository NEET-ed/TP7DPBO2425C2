<?php
require_once 'config/db.php';

class Pasien {
    private $db;

    public function __construct() {
        $this->db = (new Database())->conn;
    }

    public function getAllPasien() {
        $stmt = $this->db->query("SELECT * FROM pasien");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function addPasien($id_pasien){
        $stmt = $this->db->query("SELECT * FROM pasien");

    }
}
?>