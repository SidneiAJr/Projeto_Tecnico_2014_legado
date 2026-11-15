<?php
session_start();
if ($_SESSION['loginok'] != 'ok') {
    header('location:erro.html');
    exit;
}
include "conexao.php";
$idlivro = isset($_GET["cod"]) ? $_GET["cod"] : null; // CORRIGIDO: variavel consistente
if (!isset($idlivro)) {
    echo "Livro nao informado!";
} elseif (!is_numeric($idlivro)) {
    echo "Parametro invalido!";
} else {
    $sql = "SELECT * FROM livros WHERE codigo = ?";
    $stmt = mysqli_prepare($conexao, $sql);
    mysqli_stmt_bind_param($stmt, "i", $idlivro);
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
    if (mysqli_num_rows($res) == 0) {
        echo "Livro nao localizado!";
    } else {
        $sql = "DELETE FROM livros WHERE codigo = ?"; // CORRIGIDO: tabela e campo certos
        $stmt = mysqli_prepare($conexao, $sql);
        mysqli_stmt_bind_param($stmt, "i", $idlivro);
        mysqli_stmt_execute($stmt); // CORRIGIDO: faltava ;
        echo "Livro excluido com sucesso!";
    }
}
mysqli_close($conexao); // CORRIGIDO: era mysqli_close($close)
?>
