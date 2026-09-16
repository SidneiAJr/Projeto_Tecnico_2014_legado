<?php
session_start();
if ($_SESSION['loginok'] != 'ok') {
    header('location: erro.html');
    exit;
}
include "conexao.php";

$sql = "SELECT codigo, nome, crm FROM medicos ORDER BY nome";
$res = mysqli_query($conexao, $sql) or die("Falha ao selecionar médicos!");
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8" />
    <title>Administrar Médicos</title>
</head>
<body>
<table width="420" border="1">
    <tr>
        <td><img src="imagens/avatar.png" width="149" height="143" /></td>
        <td colspan="2">CLÍNICA MÉDICA AVALIA - MENU ADMINISTRATIVO</td>
    </tr>
    <?php while ($linha = mysqli_fetch_row($res)) { ?>
    <tr>
        <td><?php echo $linha[1]; ?> (CRM: <?php echo $linha[2]; ?>)</td>
        <td><a href="exc_med.php?cod=<?php echo $linha[0]; ?>" onclick="return confirm('Confirma exclusão?');">Excluir</a></td>
        <td><a href="alt_med.php?cod=<?php echo $linha[0]; ?>"><img src="imagens/pencil.png" width="16" height="16" border="0" /></a></td>
    </tr>
    <?php } ?>
    <tr>
        <td><a href="form_inc_esp.php">Incluir especialidade</a></td>
        <td><a href="menuadm.php">Retornar</a></td>
        <td>&nbsp;</td>
    </tr>
</table>
<?php mysqli_close($conexao); ?>
</body>
</html>