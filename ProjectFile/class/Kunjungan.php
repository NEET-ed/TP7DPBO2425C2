<?php
require_once 'config/db.php';

class KunJungan {
    private $db;

    public function __construct() {
        $this->db = (new Database())->conn;
    }

    public function getAllVisits() {
        $stmt = $this->db->query("SELECT kunjungan.*, dokter.nama, pasien.nama
                                  FROM kunjungan 
                                  JOIN dokter ON kunjungan.id_dokter = dokter.id 
                                  JOIN pasien ON kunjungan.id_pasien = pasien.id");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function patientVisit($id_dokter, $id_pasien) {
        $stmt = $this->db->prepare("INSERT INTO kunjungan (id_dokter, id_pasien, kunjungan_date) VALUES (?, ?, CURDATE())");
        $dokter = new Dokter();
        $dataKlinik = $this->db->query("SELECT slot_pasien FROM dokter WHERE id = $id_dokter")->fetch();
        if ($dataKlinik['stock'] > 0) {
            $dokter->updatePatientSlot($id_dokter, $dataKlinik['stock'] - 1);
            return $stmt->execute([$id_dokter, $id_pasien]);
        }
        return false;
    }

    public function patientFinish($id_kunjungan) {
        $stmt = $this->db->prepare("UPDATE kunjungan SET return_date = CURDATE() WHERE id = ?");
        $kunjungan = $this->db->query("SELECT id_dokter FROM kunjungan WHERE id = $id_kunjungan")->fetch();
        $dokter = new Dokter();
        $dataKlinik = $this->db->query("SELECT slot_pasien FROM dokter WHERE id = {$kunjungan['id_dokter']}")->fetch();
        $dokter->updatePatientSlot($kunjungan['id_dokter'], $dataKlinik['stock'] + 1);
        return $stmt->execute([$id_kunjungan]);
    }
}
?>