<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8" />
    <title>Lista de Médicos</title>
</head>
<body>
<?php
include "conexao.php";

if (!empty($_POST["f_busca"])) {
    $busca = mysqli_real_escape_string($conexao, $_POST["f_busca"]);
    $sql = "SELECT codigo, nome, crm, dtnascimento, especialidade FROM medicos WHERE nome LIKE '%$busca%' ORDER BY nome";
} elseif (!empty($_GET["n"])) {
    $nivel = (int) $_GET["n"];
    $sql = "SELECT codigo, nome, crm, dtnascimento, especialidade FROM medicos WHERE especialidade=$nivel ORDER BY nome";
} else {
    $sql = "SELECT codigo, nome, crm, dtnascimento, especialidade FROM medicos ORDER BY nome";
}

$res   = mysqli_query($conexao, $sql) or die("Falha ao selecionar médicos!");
$total = mysqli_num_rows($res);

if ($total == 0) {
    echo "<b>Nenhum</b> médico encontrado.";
} else {
    while ($linha = mysqli_fetch_row($res)) {
?>
<table width="456" border="1">
    <tr>
        <td><img src="imagens/<?php echo $linha[0]; ?>.jpg" width="195" height="151" /></td>
        <td colspan="2">CLÍNICA MÉDICA AVALIA</td>
    </tr>
    <tr>
        <td>Código</td>
        <td><?php echo $linha[0]; ?></td>
    </tr>
    <tr>
        <td>Médico</td>
        <td><?php echo $linha[1]; ?></td>
    </tr>
    <tr>
        <td>CRM</td>
        <td><?php echo $linha[2]; ?></td>
    </tr>
    <tr>
        <td>Dt. Nascimento</td>
        <td><?php echo $linha[3]; ?></td>
    </tr>
    <tr>
        <td>Especialidade</td>
        <td><?php echo $linha[4]; ?></td>
    </tr>
</table>
<br />
<?php
    }
}
mysqli_close($conexao);
?>
<p><a href="index.php">Retornar</a></p>
</body>
</html>