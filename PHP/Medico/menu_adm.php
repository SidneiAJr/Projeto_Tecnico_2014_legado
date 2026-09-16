<?php
session_start();
if ($_SESSION['loginok'] != 'ok') {
    header('location: erro.html');
    exit;
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8" />
    <title>Menu Administrativo</title>
</head>
<body>
<table width="396" border="1">
    <tr>
        <td><img src="imagens/avatar.png" width="144" height="119" /></td>
        <td>Clínica Médica Avalia - Menu Administrativo</td>
    </tr>
    <tr>
        <td>
            <p><a href="form_inc_med.php">Incluir novo médico</a></p>
            <p><a href="adm_med.php">Administrar médicos</a></p>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <p><a href="form_inc_esp.php">Incluir Especialidade</a></p>
            <p><a href="adm_esp.php">Administrar Especialidade</a></p>
            <p><a href="index.php">Retornar</a></p>
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
</body>
</html>