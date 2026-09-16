<?php
session_start();
if ($_SESSION['loginok'] != 'ok') {
    header('location: erro.html');
    exit();
}
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Lista de Alunos</title>
<script type="text/javascript">
// CORRIGIDO: nome da função estava diferente entre a declaração e a chamada (ConfirmaExclusaoRegistro vs confirmaExclusaoregistro)
function confirmaExclusaoRegistro() {
    return confirm("Confirma a exclusão deste aluno?");
}
</script>
</head>
<body>
<?php
include "conexao.php";
$sql   = "SELECT id, nome FROM alunos ORDER BY nome";
$res   = mysqli_query($conexao, $sql) or die("Falha ao selecionar alunos!");
$total = mysqli_num_rows($res);

if ($total == 0) {
    echo "<b>Nenhum</b> aluno encontrado!";
} else {
    while ($linha = mysqli_fetch_row($res)) {
?>
<table width="712" border="2">
  <tr>
    <td width="182" rowspan="2"><img src="images/9.jpg" width="176" height="140" /></td>
    <td width="512">Livraria Paluminio</td>
  </tr>
  <tr>
    <td>
      <p>Código: <?php echo $linha[0]; ?></p>
      <p>Nome: <?php echo $linha[1]; ?></p>
      <!-- CORRIGIDO: onclick chamava nome errado da função -->
      <a href="exc_aluno.php?cod=<?php echo $linha[0]; ?>"
         onclick="return confirmaExclusaoRegistro();">Excluir</a>
      &nbsp;
      <!-- CORRIGIDO: tag <a> estava sem fechar o atributo href antes do <img> -->
      <a href="alt_aluno.php?cod=<?php echo $linha[0]; ?>">
          <img src="images/pencil.png" width="16" height="16" border="0"/>
      </a>
    </td>
  </tr>
</table>
<?php
    }
}
mysqli_close($conexao);
?>
<table width="711" border="2">
  <tr>
    <td>
      <ul>
        <li><a href="listagem.php">Listar Todos os Produtos</a></li>
        <li><a href="listagem.php?ctg=1">Listar Livros de Banco de Dados</a></li>
        <li><a href="listagem.php?ctg=2">Listar Livros de Web</a></li>
        <li><a href="listagem.php?ctg=3">Listar Livros de Gráficos</a></li>
        <li><a href="listagem.php?ctg=4">Listar Livros de Programação</a></li>
        <li><a href="listagem.php?ctg=5">Listar Livros de HTML</a></li>
        <li><a href="listagem.php?ctg=6">Listar Livros de Javascript</a></li>
      </ul>
      <a href="index.html">Retornar</a>
    </td>
  </tr>
</table>
</body>
</html>