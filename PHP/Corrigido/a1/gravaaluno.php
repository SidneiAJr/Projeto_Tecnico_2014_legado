<?php
session_start();
if ($_SESSION['loginok'] != 'ok') {
    header('location:erro.html');
    exit;
}
include "conexao.php";
$mnome  = $_POST["f_nome"];
$mnivel = $_POST["f_nivel"];
$erro = false;
if (empty($mnome)) {
    echo "<b>NOME</b> nao informado!";
    $erro = true;
}
if ($erro) {
    echo "<br>O formulario apresenta erros, favor corrigir...";
} else {
    $sql = "INSERT INTO Alunos (nome, nivel) VALUES (?, ?)"; // CORRIGIDO: prepared statement
    $stmt = mysqli_prepare($conexao, $sql);
    mysqli_stmt_bind_param($stmt, "si", $mnome, $mnivel);
    if (mysqli_stmt_execute($stmt)) {
        echo "<b>Aluno</b> inserido com sucesso!";
        $ultimocod = mysqli_insert_id($conexao);
        $foto = $_FILES["f_foto"];
        if (!empty($foto["name"])) {
            if ($foto["type"] != 'image/jpeg') {
                echo "<b>Formato invalido! Necessario .JPEG</b><br>";
            } else {
                $arquivo = "imagem/" . $ultimocod . ".jpg";
                if (file_exists($arquivo)) unlink($arquivo);
                if (move_uploaded_file($foto["tmp_name"], $arquivo)) { // CORRIGIDO: move_uploaded_file
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
