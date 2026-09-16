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
<title>Excluir Aluno</title>
</head>
<body>

<table width="712" height="93" border="2">
  <tr>
    <td width="182" rowspan="2"><img src="images/9.jpg" width="176" height="140" /></td>
    <td width="512">Livraria Paluminio - Excluir Aluno</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<p>
<?php
$idaluno = isset($_GET["cod"]) ? $_GET["cod"] : null;

if (!isset($idaluno)) {
    echo "Aluno nao informado!";
} elseif (!is_numeric($idaluno)) {
    echo "Parametro invalido!";
} else {
    include "conexao.php";

    // Verifica se o aluno existe antes de excluir
    $sql   = "SELECT * FROM alunos WHERE id=$idaluno";
    $res   = mysqli_query($conexao, $sql) or die("Erro ao selecionar aluno!");
    $total = mysqli_num_rows($res);

    if ($total == 0) {
        echo "Aluno nao localizado!";
    } else {
        $sql = "DELETE FROM alunos WHERE id=$idaluno";
        // CORRIGIDO: faltava ponto e virgula depois do mysqli_query
        mysqli_query($conexao, $sql) or die("Erro ao excluir aluno!");
        echo "<b>Aluno</b> excluido com sucesso!";

        // Remove a foto tambem, se existir
        $fotoCaminho = "imagens/" . $idaluno . ".jpg";
        if (file_exists($fotoCaminho)) {
            unlink($fotoCaminho);
        }
    }

    // CORRIGIDO: estava mysqli_close($close) — variavel errada
    mysqli_close($conexao);
}
?>
</p>

<p><a href="listagem_alunos.php">Voltar para a lista</a></p>

<table width="711" height="181" border="2">
  <tr>
    <td>
      <ul>
        <li><a href="listagem.php">Listar Todos os Produtos</a><br /><br /></li>
        <li><a href="listagem.php?ctg=1">Listar Livros de Banco de Dados</a><br /><br /></li>
        <li><a href="listagem.php?ctg=2">Listar Livros de Web</a><br /><br /></li>
        <li><a href="listagem.php?ctg=3">Listar Livros de Graficos</a><br /><br /></li>
        <li><a href="listagem.php?ctg=4">Listar Livros de Programacao</a><br /><br /></li>
        <li><a href="listagem.php?ctg=5">Listar Livros de HTML</a><br /><br /></li>
        <li><a href="listagem.php?ctg=6">Listar Livros de Javascript</a><br /><br /></li>
      </ul>
      <a href="index.html">Retornar</a>
    </td>
  </tr>
</table>

<p>&nbsp;</p>
</body>
</html>