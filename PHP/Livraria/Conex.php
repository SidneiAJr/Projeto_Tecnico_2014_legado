<?php
// CORRIGIDO: mysql_connect() foi removido do PHP 7+; substituído por mysqli
$conexao = mysqli_connect("localhost", "root", "", "bd164f")
    or die("Falha ao conectar com MySQL");
?>