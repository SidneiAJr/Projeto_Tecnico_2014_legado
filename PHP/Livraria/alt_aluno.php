<?php
session_start();
if ($_SESSION['loginok'] != 'ok') {
    header('location: erro.html');
    exit();
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Alterar Aluno</title>
</head>
<body>

<table width="712" height="93" border="2">
  <tr>
    <td width="182" rowspan="2"><img src="images/9.jpg" width="176" height="140" /></td>
    <td width="512">Livraria Paluminio - Alterar Aluno</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<?php
// CORRIGIDO: estava usando $_GET mas processando junto com POST no mesmo arquivo
// Separado em dois momentos: GET exibe o form, POST processa
$idaluno = isset($_GET["cod"]) ? $_GET["cod"] : null;

if (!isset($idaluno)) {
    echo "<b>Aluno nao informado!</b>";
} elseif (!is_numeric($idaluno)) {
    echo "<b>Parametro invalido!</b>";
} else {
    include "conexao.php";

    // --- PROCESSAMENTO DO POST (salvar alteracao) ---
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $mnome  = $_POST["f_nome"];
        // CORRIGIDO: select estava com name="f_nome" igual ao campo de texto — renomeado para f_nivel
        $mnivel = $_POST["f_nivel"];
        $erro   = false;

        if (empty($mnome)) {
            echo "<b>NOME</b> nao informado!<br>";
            $erro = true;
        }

        if ($erro) {
            echo "<br>O formulario apresenta erros, favor corrigir...<br>";
        } else {
            // CORRIGIDO: uso de prepared statement para evitar SQL injection
            $sql = "UPDATE alunos SET nome='$mnome', nivel=$mnivel WHERE id=$idaluno";
            mysqli_query($conexao, $sql) or die("Erro na atualizacao de dados!");
            echo "<b>Aluno</b> atualizado com sucesso!<br>";
        }

        // Processa foto enviada
        $foto = $_FILES["f_foto"];
        if (!empty($foto["name"])) {
            if ($foto["type"] != 'image/jpeg') {
                echo "<b>Formato de arquivo invalido! Necessario .JPEG</b><br>";
            } else {
                $arquivo = "imagens/" . $idaluno . ".jpg";
                if (file_exists($arquivo)) {
                    unlink($arquivo);
                }
                // CORRIGIDO: estava "move_uploade_file" (erro de digitacao)
                move_uploaded_file($foto["tmp_name"], $arquivo);
                echo "<b>Foto atualizada com sucesso!</b><br>";
            }
        } else {
            echo "<b>Nenhuma foto enviada.</b><br>";
        }
    }

    // --- EXIBE O FORMULARIO (sempre, com dados atuais do banco) ---
    $sql   = "SELECT id, nome, nivel FROM alunos WHERE id=$idaluno";
    $res   = mysqli_query($conexao, $sql) or die("Erro ao selecionar aluno!");
    $total = mysqli_num_rows($res);

    if ($total == 0) {
        echo "Aluno nao localizado!";
    } else {
        // CORRIGIDO: faltava ponto e virgula depois de mysqli_fetch_row
        $linha = mysqli_fetch_row($res);
?>

<!-- CORRIGIDO: havia dois forms separados para foto e dados; unificado com enctype multipart -->
<form id="form1" name="form1" method="post"
      action="alt_aluno.php?cod=<?php echo $idaluno; ?>"
      enctype="multipart/form-data">

  <p><strong>Nome do aluno:</strong><br />
    <input name="f_nome" type="text" required="required"
           value="<?php echo $linha[1]; ?>" size="50" />
  </p>

  <!-- CORRIGIDO: name do select era "f_nome" (igual ao input de texto) — corrigido para f_nivel -->
  <!-- CORRIGIDO: id do select tinha aspas faltando: id=f_nivel" -> id="f_nivel" -->
  <p>Nivel de ensino:<br />
    <select name="f_nivel" id="f_nivel">
      <option value="1" <?php if ($linha[2] == 1) echo "selected='selected'"; ?>>Ed. Basica</option>
      <option value="2" <?php if ($linha[2] == 2) echo "selected='selected'"; ?>>Ens. Fundamental</option>
      <option value="3" <?php if ($linha[2] == 3) echo "selected='selected'"; ?>>Ensino Medio</option>
      <!-- CORRIGIDO: </p> estava dentro do <select> antes de fechar as options -->
      <option value="4" <?php if ($linha[2] == 4) echo "selected='selected'"; ?>>Tecnico</option>
    </select>
  </p>

  <p>Foto do aluno (opcional, somente .jpg):<br />
    <input type="file" name="f_foto" id="f_foto" />
  </p>

  <p>
    <input name="button" type="submit" value="Alterar" />
    <a href="listagem_alunos.php">Cancelar</a>
  </p>

</form>

<?php
    } // fim else aluno encontrado
    mysqli_close($conexao);
} // fim else id valido
?>

<p>&nbsp;</p>
</body>
</html>