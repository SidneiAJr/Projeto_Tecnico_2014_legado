<?php
session_start();
if ($_SESSION['loginok'] != 'ok') {
    header('location:erro.html');
    exit;
}
include "conexao.php";
$idmed = isset($_GET["cod"]) ? $_GET["cod"] : null; // CORRIGIDO: variavel consistente
if (!isset($idmed)) {
    echo "Medico nao informado!";
} elseif (!is_numeric($idmed)) {
    echo "Parametro invalido!";
} else {
    $sql = "SELECT * FROM medicos WHERE codigo = ?"; // CORRIGIDO: tabela e campo certos
    $stmt = mysqli_prepare($conexao, $sql);
    mysqli_stmt_bind_param($stmt, "i", $idmed);
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
    if (mysqli_num_rows($res) == 0) {
        echo "Medico nao localizado!";
    } else {
        $sql = "DELETE FROM medicos WHERE codigo = ?";
        $stmt = mysqli_prepare($conexao, $sql);
        mysqli_stmt_bind_param($stmt, "i", $idmed);
        mysqli_stmt_execute($stmt); // CORRIGIDO: faltava ;
        echo "Medico excluido com sucesso!";
    }
}
mysqli_close($conexao); // CORRIGIDO: era mysqli_close($close)
?>
