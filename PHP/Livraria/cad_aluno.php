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
<title>Cadastrar Aluno</title>
</head>
<body>

<table width="712" height="93" border="2">
  <tr>
    <td width="182" rowspan="2"><img src="images/9.jpg" width="176" height="140" /></td>
    <td width="512">Livraria Paluminio - Cadastrar Aluno</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<?php
// Processa somente se veio POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $mnome  = $_POST["f_nome"];
    $mnivel = $_POST["f_nivel"];
    $erro   = false;

    if (empty($mnome)) {
        echo "<b>NOME</b> nao informado!<br>";
        $erro = true;
    }

    if ($erro) {
        echo "<br>O formulario apresenta erros, favor corrigir...<br>";
    } else {
        include "conexao.php";

        // CORRIGIDO: "value" estava escrito como "vlaue" em varias options
        // CORRIGIDO: estava "insert Into Alunos(nome,nivel)value" — faltava o 'S' em VALUES
        $sql = "INSERT INTO alunos (nome, nivel) VALUES ('$mnome', $mnivel)";
        mysqli_query($conexao, $sql) or die("Erro na insercao de dados!");
        echo "<b>Aluno</b> inserido com sucesso!<br>";

        // Processa foto
        $foto = $_FILES["f_foto"];
        if (!empty($foto["name"])) {
            if ($foto["type"] != 'image/jpeg') {
                echo "<b>Formato de arquivo invalido! Necessario .JPEG</b><br>";
            } else {
                // CORRIGIDO: estava "move_uploade_file" (erro de digitacao)
                $ultimocod = mysqli_insert_id($conexao);
                $arquivo   = "imagens/" . $ultimocod . ".jpg";
                if (file_exists($arquivo)) {
                    unlink($arquivo);
                }
                move_uploaded_file($foto["tmp_name"], $arquivo);
                echo "<b>Foto inserida com sucesso!</b><br>";
            }
        } else {
            echo "<b>Nenhuma foto enviada.</b><br>";
        }

        mysqli_close($conexao);
    }
}
?>

<!-- CORRIGIDO: havia dois forms aninhados (form3 e outro sem id) — unificado com enctype multipart -->
<!-- CORRIGIDO: action estava com aspas erradas: action="gravaluno.php method="post" -->
<!-- CORRIGIDO: <otion> sem 'p' na primeira option -->
<!-- CORRIGIDO: value+ em vez de value= no submit -->
<!-- CORRIGIDO: vlaue= em vez de value= nas options -->
<table width="711" border="2">
  <tr>
    <td>
      <form action="cad_aluno.php" method="post" enctype="multipart/form-data" name="form1" id="form1">

        <p>Nome do aluno:<br />
          <input name="f_nome" type="text" required="required"
                 placeholder="Favor informar o nome" size="50" />
        </p>

        <p>Nivel de ensino:<br />
          <select name="f_nivel" id="f_nivel">
            <option value="1">Educacao Infantil</option>
            <option value="2">Ensino Fundamental</option>
            <option value="3">Ensino Medio</option>
            <option value="4">Tecnico</option>
          </select>
        </p>

        <p>Foto do aluno (opcional, somente .jpg):<br />
          <input type="file" name="f_foto" id="f_foto" />
        </p>

        <p>
          <input type="submit" value="Incluir" />
          <input type="reset"  value="Limpar" />
        </p>

      </form>
    </td>
  </tr>
</table>

<table width="711" height="181" border="2">
  <tr>
    <td>
      <div id="menu">
        <ul>
          <li><a href="listagem.php">Listar Todos os Produtos</a><br /><br /></li>
          <li><a href="listagem.php?ctg=1">Listar Livros de Banco de Dados</a><br /><br /></li>
          <li><a href="listagem.php?ctg=2">Listar Livros de Web</a><br /><br /></li>
          <li><a href="listagem.php?ctg=3">Listar Livros de Graficos</a><br /><br /></li>
          <li><a href="listagem.php?ctg=4">Listar Livros de Programacao</a><br /><br /></li>
          <li><a href="listagem.php?ctg=5">Listar Livros de HTML</a><br /><br /></li>
          <li><a href="listagem.php?ctg=6">Listar Livros de Javascript</a><br /><br /></li>
        </ul>
      </div>
      <a href="index.html">Retornar</a>
    </td>
  </tr>
</table>

<p>&nbsp;</p>
</body>
</html>