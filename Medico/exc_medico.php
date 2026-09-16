<?php
include "conexao.php";

$mnome        = $_POST["f_nome"];
$mcrm         = $_POST["f_crm"];
$mdtnasc      = $_POST["f_dtnasc"];
$mespecialidade = (int) $_POST["f_especialidade"];
$erro = false;

if (empty($mnome)) {
    echo "<b>NOME</b> não informado!";
    $erro = true;
}
if (empty($mcrm)) {
    echo "<b>CRM</b> não informado!";
    $erro = true;
}

if ($erro) {
    echo "<br>O formulário apresenta erros, favor corrigir...";
} else {
    $mnome   = mysqli_real_escape_string($conexao, $mnome);
    $mcrm    = mysqli_real_escape_string($conexao, $mcrm);
    $mdtnasc = mysqli_real_escape_string($conexao, $mdtnasc);

    $sql = "INSERT INTO medicos (nome, crm, dtnascimento, especialidade) VALUES ('$mnome', '$mcrm', '$mdtnasc', $mespecialidade)";
    mysqli_query($conexao, $sql) or die("Erro na inserção de dados!");

    $ultimocod = mysqli_insert_id($conexao);
    echo "<b>Médico</b> inserido com sucesso!<br>";

    $foto = $_FILES["f_foto"];
    if (!empty($foto["name"])) {
        if ($foto["type"] != 'image/jpeg') {
            echo "<b>Formato de arquivo inválido! Necessário .JPEG</b><br>";
        } else {
            $arquivo = "imagens/" . $ultimocod . ".jpg";
            if (file_exists($arquivo)) {
                unlink($arquivo);
            }
            move_uploaded_file($foto["tmp_name"], $arquivo);
            echo "<b>Foto inserida com sucesso!</b><br>";
        }
    } else {
        echo "<b>Nenhuma foto enviada.</b><br>";
    }
}

mysqli_close($conexao);
?>
<p><a href="adm_med.php">Retornar</a></p>