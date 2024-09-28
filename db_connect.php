<?php


$host = 'localhost'; 
$db = 'nazwa_bazy_danych'; 
$user = 'uzytkownik'; 
$pass = 'haslo'; 


$conn = new mysqli($host, $user, $pass, $db);


if ($conn->connect_error) {
    die("Połączenie nieudane: " . $conn->connect_error);
}
?>
