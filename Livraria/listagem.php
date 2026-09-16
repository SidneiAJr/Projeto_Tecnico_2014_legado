<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Listagem de Livros</title>
</head>
<body>

<table width="141" height="111" border="2">
  <tr>
    <td>Livraria Paluminio - Listagem de Livros</td>
  </tr>
</table>

<?php
// CORRIGIDO: estava mysqli_connect sem incluir arquivo de conexao — adicionado conexao propria
$conexao = mysqli_connect("localhost", "root", "") or die("Falha ao conectar com MySQL!");
$bd      = mysqli_select_db($conexao, "livros") or die("Falha ao selecionar banco de dados livros!");

// CORRIGIDO: estava $_get (minusculo) em vez de $_GET
// CORRIGIDO: logica estava invertida — verificava $busca antes de $ctg sem nem declarar $busca
$ctg   = isset($_GET["ctg"])      ? $_GET["ctg"]      : null;
$busca = isset($_POST["f_busca"]) ? $_POST["f_busca"] : null;

if (isset($ctg) && is_numeric($ctg)) {
    // CORRIGIDO: sql original era "where titulo n=$nivel" — sem sentido, corrigido para categoria
    $sql = "SELECT codigo, titulo, preco, categoria, descricao FROM livros WHERE categoria=$ctg ORDER BY titulo";
} elseif (isset($busca)) {
    $sql = "SELECT codigo, titulo, preco, categoria, descricao FROM livros WHERE titulo LIKE '%" . $busca . "%' ORDER BY titulo";
} else {
    // CORRIGIDO: estava "Order By titulos" (com S) — corrigido para titulo
    $sql = "SELECT codigo, titulo, preco, categoria, descricao FROM livros ORDER BY titulo";
}

$res   = mysqli_query($conexao, $sql) or die("Falha ao selecionar livros!");
$total = mysqli_num_rows($res);

if ($total == 0) {
    // CORRIGIDO: estava <b>nenhum<\b> — barra invertida nao fecha tag HTML
    echo "<b>Nenhum</b> livro encontrado!";
} else {
    while ($linha = mysqli_fetch_row($res)) {
        // CORRIGIDO: switch estava usando $linha[2] (que e preco) — corrigido para $linha[3] (categoria)
        switch ($linha[3]) {
            case 1: $catTexto = "Banco de Dados"; break;
            case 2: $catTexto = "Web";             break;
            case 3: $catTexto = "Graficos";        break;
            case 4: $catTexto = "Programacao";     break;
            case 5: $catTexto = "HTML";             break;
            case 6: $catTexto = "Javascript";       break;
            default: $catTexto = "Outros";
        }
?>
<table width="711" height="175" border="2">
  <tr>
    <td width="113" rowspan="5">
      <!-- Imagem da capa do livro, se existir -->
      <?php
        $capa = "images/" . $linha[0] . ".jpg";
        if (file_exists($capa)) {
            echo '<img src="' . $capa . '" width="100" height="130" alt="capa" />';
        } else {
            echo '(sem capa)';
        }
      ?>
    </td>
    <td>Codigo</td>
    <td><?php echo $linha[0]; ?></td>
  </tr>
  <tr>
    <td>Titulo</td>
    <td><?php echo $linha[1]; ?></td>
  </tr>
  <tr>
    <td>Descricao</td>
    <td><?php echo $linha[4]; ?></td>
  </tr>
  <tr>
    <td>Categoria</td>
    <td><?php echo $catTexto; ?></td>
  </tr>
  <tr>
    <td>Preco</td>
    <td>R$ <?php echo number_format($linha[2], 2, ',', '.'); ?></td>
  </tr>
</table>
<p>&nbsp;</p>
<?php
    } // fim while
} // fim else

mysqli_close($conexao);
?>

<p><a href="index.html">Retornar</a></p>
<p>&nbsp;</p>
</body>
</html>