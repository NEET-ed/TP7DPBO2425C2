<?php
require_once 'config/db.php';

class Dokter {
    private $db;

    public function __construct() {
        $this->db = (new Database())->conn;
    }

    public function getAllBooks() {
        $stmt = $this->db->query("SELECT * FROM dokter");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function updatePatientSLot($id, $slot_pasien): mixed {
        $stmt = $this->db->prepare("UPDATE dokter SET slot_pasien = ? WHERE id = ?");
        return $stmt->execute([$slot_pasien, $id]);
    }
}
?>