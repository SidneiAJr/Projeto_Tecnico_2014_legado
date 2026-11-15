<?php
session_start();
if ($_SESSION['loginok'] != 'ok') {
    header('location:erro.html');
    exit;
}
include "conexao.php";
$idaluno = isset($_GET["cod"]) ? $_GET["cod"] : null;
if (!isset($idaluno)) {
    echo "Aluno nao informado!";
} elseif (!is_numeric($idaluno)) {
    echo "Parametro invalido!";
} else {
    $sql = "SELECT * FROM alunos WHERE id = ?";
    $stmt = mysqli_prepare($conexao, $sql);
    mysqli_stmt_bind_param($stmt, "i", $idaluno);
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
    if (mysqli_num_rows($res) == 0) {
        echo "Aluno nao localizado!";
    } else {
        $sql = "DELETE FROM alunos WHERE id = ?"; // CORRIGIDO: prepared statement
        $stmt = mysqli_prepare($conexao, $sql);
        mysqli_stmt_bind_param($stmt, "i", $idaluno);
        mysqli_stmt_execute($stmt); // CORRIGIDO: faltava ; antes do echo
        echo "Aluno excluido com sucesso!";
    }
}
mysqli_close($conexao); // CORRIGIDO: era mysqli_close($close)
?>
