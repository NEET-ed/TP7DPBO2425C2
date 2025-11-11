CREATE DATABASE db_clinic;
USE db_clinic;

CREATE TABLE pasien (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    tanggal_lahir DATE NOT NULL,
    alamat VARCHAR(255),
    telepon VARCHAR(15)
);

CREATE TABLE dokter (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_dokter VARCHAR(100) NOT NULL,
    spesialisasi VARCHAR(50) NOT NULL,
    nomor_izin VARCHAR(20) UNIQUE,
    slot_pasien INT DEFAULT 0 
);

CREATE TABLE kunjungan (
    id_kunjungan INT AUTO_INCREMENT PRIMARY KEY,
    id_pasien INT NOT NULL,
    id_dokter INT NOT NULL,
    tanggal_kunjungan DATETIME NOT NULL,
    diagnosis TEXT,
    FOREIGN KEY (id_pasien) REFERENCES pasien(id) ON DELETE CASCADE,
    FOREIGN KEY (id_dokter) REFERENCES dokter(id) ON DELETE RESTRICT
);


INSERT INTO pasien (nama, tanggal_lahir, alamat, telepon) VALUES
('Ahmad Fauzi', '1985-03-14', 'Jl. Merpati No. 23, Jakarta', '081234567890'),
('Siti Aminah', '1992-07-21', 'Jl. Kenanga No. 11, Bandung', '081345678901'),
('Budi Santoso', '1978-01-09', 'Jl. Cendrawasih No. 5, Surabaya', '081298765432'),
('Dewi Lestari', '2000-11-02', 'Jl. Anggrek No. 45, Yogyakarta', '082134567890'),
('Rizky Ramadhan', '1995-05-18', 'Jl. Melati No. 12, Medan', '081355667788'),
('Nina Kartika', '1989-09-30', 'Jl. Teratai No. 99, Semarang', '082166778899'),
('Hendra Wijaya', '1980-12-25', 'Jl. Sudirman No. 88, Palembang', '081277889900'),
('Tina Sari', '1998-04-17', 'Jl. Mawar No. 33, Bogor', '081233445566'),
('Eko Prasetyo', '1993-06-05', 'Jl. Diponegoro No. 9, Malang', '082199988877'),
('Lina Hartati', '1987-10-12', 'Jl. Kamboja No. 4, Denpasar', '081288776655');

INSERT INTO dokter (nama_dokter, spesialisasi, nomor_izin, slot_pasien) VALUES
('dr. Andi Wijaya', 'Umum', 'DOK001', 10),
('dr. Rina Marlina', 'Penyakit Dalam', 'DOK002', 8),
('dr. Bima Prakoso', 'Anak', 'DOK003', 12),
('dr. Siti Handayani', 'Kandungan', 'DOK004', 6),
('dr. Fajar Ramli', 'Bedah', 'DOK005', 5),
('dr. Lestari Purnama', 'Kulit dan Kelamin', 'DOK006', 7),
('dr. Arif Nugroho', 'Saraf', 'DOK007', 4),
('dr. Maya Hapsari', 'THT', 'DOK008', 9),
('dr. Rudi Setiawan', 'Gigi', 'DOK009', 11),
('dr. Dian Kurnia', 'Mata', 'DOK010', 6);

INSERT INTO kunjungan (id_pasien, id_dokter, tanggal_kunjungan, diagnosis) VALUES
(1, 1, '2025-11-05 09:30:00', 'Demam dan batuk ringan'),
(2, 2, '2025-11-06 10:00:00', 'Hipertensi ringan'),
(3, 5, '2025-11-06 14:15:00', 'Luka pada pergelangan tangan'),
(4, 4, '2025-11-07 11:00:00', 'Pemeriksaan kehamilan rutin'),
(5, 3, '2025-11-08 08:45:00', 'Demam pada anak'),
(6, 6, '2025-11-08 13:30:00', 'Ruam kulit'),
(7, 7, '2025-11-09 15:00:00', 'Sakit kepala dan pusing'),
(8, 8, '2025-11-09 09:00:00', 'Infeksi telinga'),
(9, 9, '2025-11-10 10:45:00', 'Tambal gigi berlubang'),
(10, 10, '2025-11-10 16:20:00', 'Iritasi mata ringan'),
(1, 2, '2025-11-11 09:15:00', 'Kontrol tekanan darah'),
(5, 1, '2025-11-11 10:00:00', 'Pilek dan batuk berulang');
