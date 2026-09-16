<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Lista de Alunos</title>
</head>
<body>

<table width="199" height="113" border="2">
  <tr>
    <td>
      <img src="imagem/icone.jpeg" width="76" height="66" />
      Escola XYZ
      <br />Lista de alunos:
    </td>
  </tr>
</table>

<?php
include "conexao.php";

// CORRIGIDO: estava $_get (minusculo) — PHP e case-sensitive, tem que ser $_GET
$nivel = isset($_GET["n"]) ? $_GET["n"] : null;

if (isset($nivel) && is_numeric($nivel)) {
    $sql = "SELECT id, nome, nivel FROM alunos WHERE nivel=$nivel ORDER BY nome";
} else {
    // CORRIGIDO: chaves de fechamento desbalanceadas no original (tres chaves sobrando no fim)
    $busca = isset($_POST["f_busca"]) ? $_POST["f_busca"] : null;
    if (isset($busca)) {
        $sql = "SELECT id, nome, nivel FROM alunos WHERE nome LIKE '%" . $busca . "%' ORDER BY nome";
    } else {
        $sql = "SELECT id, nome, nivel FROM alunos ORDER BY nome";
    }
}

$res   = mysqli_query($conexao, $sql) or die("Falha ao selecionar alunos!");
$total = mysqli_num_rows($res);

if ($total == 0) {
    // CORRIGIDO: estava <b>nenhum<\b> — barra invertida nao fecha tag HTML
    echo "<b>Nenhum</b> aluno encontrado!";
} else {
    while ($linha = mysqli_fetch_row($res)) {
?>
<table width="362" height="199" border="2">
  <tr>
    <!-- CORRIGIDO: src da imagem estava com aspas abertas nunca fechadas: src="imagem/<?php ... ?> width -->
    <td width="100" rowspan="3">
      <?php
        $fotoCaminho = "imagens/" . $linha[0] . ".jpg";
        if (file_exists($fotoCaminho)) {
            echo '<img src="' . $fotoCaminho . '" width="80" height="100" alt="foto" />';
        } else {
            echo '(sem foto)';
        }
      ?>
    </td>
    <td>Codigo: <?php echo $linha[0]; ?></td>
  </tr>
  <tr>
    <td>Nome: <?php echo $linha[1]; ?></td>
  </tr>
  <tr>
    <td>Nivel:
      <?php
      switch ($linha[2]) {
          case 1: echo "Ed. Basica";       break;
          case 2: echo "Ens. Fundamental"; break;
          case 3: echo "Ensino Medio";     break;
          case 4: echo "Tecnico";          break;
          default: echo "Nao informado";
      }
      ?>
    </td>
  </tr>
</table>
<?php
    } // fim while
} // fim else

mysqli_close($conexao);
?>

<p>&nbsp;</p>
</body>
</html>