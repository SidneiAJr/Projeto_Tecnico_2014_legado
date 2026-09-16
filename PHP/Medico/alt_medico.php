<?php
include "conexao.php";

$idmed = isset($_GET["cod"]) ? (int) $_GET["cod"] : 0;

if ($idmed == 0) {
    echo "Médico não informado!";
    exit;
}

$sql = "SELECT codigo, nome, crm, dtnascimento, especialidade FROM medicos WHERE codigo=$idmed";
$res = mysqli_query($conexao, $sql) or die("Erro ao selecionar médico!");

if (mysqli_num_rows($res) == 0) {
    echo "Médico não localizado!";
    exit;
}

$linha = mysqli_fetch_row($res);
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8" />
    <title>Alterar Médico</title>
</head>
<body>
<form action="salvar_alt_med.php" method="post" enctype="multipart/form-data">
    <input type="hidden" name="f_codigo" value="<?php echo $linha[0]; ?>" />
    <p>Nome:<br />
        <input name="f_nome" type="text" size="50" value="<?php echo $linha[1]; ?>" />
    </p>
    <p>CRM:<br />
        <input name="f_crm" type="text" size="10" value="<?php echo $linha[2]; ?>" />
    </p>
    <p>Dt. Nascimento:<br />
        <input name="f_dtnasc" type="text" size="10" value="<?php echo $linha[3]; ?>" />
    </p>
    <p>Especialidade:<br />
        <select name="f_especialidade">
            <option value="1" <?php if ($linha[4]==1) echo 'selected'; ?>>Pediatria</option>
            <option value="2" <?php if ($linha[4]==2) echo 'selected'; ?>>Clínico Geral</option>
            <option value="3" <?php if ($linha[4]==3) echo 'selected'; ?>>Cardiologista</option>
            <option value="4" <?php if ($linha[4]==4) echo 'selected'; ?>>Neurologista</option>
        </select>
    </p>
    <p>Foto:<br />
        <input type="file" name="f_foto" />
    </p>
    <p>
        <input type="submit" value="Salvar" />
        <input type="reset" value="Limpar" />
    </p>
</form>
<?php mysqli_close($conexao); ?>
</body>
</html>