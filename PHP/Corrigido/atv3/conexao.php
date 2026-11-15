<?php
$conexao = mysqli_connect("localhost", "root", "") or die("falha ao conectar com mysql");
$bd = mysqli_select_db($conexao, "clinicadodb") or die("falha ao selecionar banco de dados"); // CORRIGIDO: bd certo
?>
