<?php
session_start();
if ($_SESSION['loginok'] != 'ok') {
    header('location:erro.html');
    exit;
}
include "conexao.php";
$mnome       = isset($_POST["f_nome"])         ? $_POST["f_nome"]         : ""; // CORRIGIDO: campos certos
$mcrm        = isset($_POST["f_crm"])          ? $_POST["f_crm"]          : "";
$mdtnasc     = isset($_POST["f_dtnasc"])       ? $_POST["f_dtnasc"]       : "";
$mespecialidade = isset($_POST["f_especialidade"]) ? $_POST["f_especialidade"] : 0;
$erro = false;
if (empty($mnome)) {
    echo "<b>NOME</b> nao informado!";
    $erro = true;
}
if ($erro) {
    echo "<br>O formulario apresenta erros, favor corrigir...";
} else {
    $sql = "INSERT INTO medicos (nome, crm, dtnascimento, especialidade) VALUES (?, ?, ?, ?)"; // CORRIGIDO: tabela e campos certos
    $stmt = mysqli_prepare($conexao, $sql);
    mysqli_stmt_bind_param($stmt, "sssi", $mnome, $mcrm, $mdtnasc, $mespecialidade);
    if (mysqli_stmt_execute($stmt)) {
        echo "<b>Medico</b> inserido com sucesso!";
        $ultimocod = mysqli_insert_id($conexao);
        $foto = $_FILES["f_foto"];
        if (!empty($foto["name"])) {
            if ($foto["type"] != 'image/jpeg') {
                echo "<b>Formato invalido! Necessario .JPEG</b><br>";
            } else {
                $arquivo = "Imagens/" . $ultimocod . ".jpg";
                if (file_exists($arquivo)) unlink($arquivo);
                if (move_uploaded_file($foto["tmp_name"], $arquivo)) { // CORRIGIDO: era move_uploade_file
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
