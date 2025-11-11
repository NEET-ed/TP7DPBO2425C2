<?php
require_once 'class/Dokter.php';
require_once 'class/Pasien.php';
require_once 'class/Kunjungan.php';

$book = new Dokter();
$member = new Pasien();
$kunjungan = new Kunjungan();

if (isset($_POST['borrow'])) {
    $kunjungan->borrowBook($_POST['book_id'], $_POST['member_id']);
}
if (isset($_GET['return'])) {
    $kunjungan->returnBook($_GET['return']);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistem Pendaftaran Klinik</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <?php include 'view/header.php'; ?>
    <main>
        <h2>Selamat Datang di Sistem Klinik</h2>
        <nav>
            <a href="?page=dokter">dokter</a> |
            <a href="?page=pasien">pasien</a> |
            <a href="?page=kunjungan">kunjungan</a>
        </nav>

        <?php
        if (isset($_GET['page'])) {
            $page = $_GET['page'];
            if ($page == 'dokter') include 'view/dokter.php';
            elseif ($page == 'pasien') include 'view/pasien.php';
            elseif ($page == 'kunjungan') include 'view/kunjungan.php';
        }
        ?>
    </main>
    <?php include 'view/footer.php'; ?>
</body>
</html>