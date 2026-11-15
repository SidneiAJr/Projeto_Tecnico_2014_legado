<?php
session_start();
if ($_SESSION['loginok'] != 'ok') {
    header('location:erro.html');
    exit;
}
include "conexao.php";
$mnome      = isset($_POST["f_nome"])      ? $_POST["f_nome"]      : "";
$mcategoria = isset($_POST["f_categoria"]) ? $_POST["f_categoria"] : 0;
$erro = false;
if (empty($mnome)) {
    echo "<b>NOME</b> do livro nao informado!";
    $erro = true;
}
if ($erro) {
    echo "<br>O formulario apresenta erros, favor corrigir...";
} else {
    $sql = "INSERT INTO livros (titulo, categoria) VALUES (?, ?)"; // CORRIGIDO: prepared statement
    $stmt = mysqli_prepare($conexao, $sql);
    mysqli_stmt_bind_param($stmt, "si", $mnome, $mcategoria);
    if (mysqli_stmt_execute($stmt)) {
        echo "<b>Livro</b> inserido com sucesso!";
        $ultimocod = mysqli_insert_id($conexao);
        $foto = $_FILES["f_foto"]; // CORRIGIDO: era F_FOTO
        if (!empty($foto["name"])) {
            if ($foto["type"] != 'image/jpeg') {
                echo "<b>Formato invalido! Necessario .JPEG</b><br>";
            } else {
                $arquivo = "images/" . $ultimocod . ".jpg";
                if (file_exists($arquivo)) unlink($arquivo);
                if (move_uploaded_file($foto["tmp_name"], $arquivo)) { // CORRIGIDO: era $arquivo - (menos em vez de =)
                    echo "<b>Foto inserida com sucesso!</b><br>";
                }
            }
        } else {
            echo "<b>Nenhuma foto enviada.</b><br>";
        }
    } else {
        echo "Erro na insercao: " . mysqli_error($conexao);
    }
}
mysqli_close($conexao);
?>
