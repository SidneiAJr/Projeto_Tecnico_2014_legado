<?php
$conexao = mysqli_connect("localhost", "root", "") or die("falha ao conectar com Mysql");
mysqli_select_db($conexao, "clinicadodb") or die("falha ao selecionar banco");
$busca = isset($_POST["f_busca"]) ? $_POST["f_busca"] : "";
if (!empty($busca)) {
    $sql = "SELECT codigo, nome, crm, dtnascimento, especialidade FROM medicos WHERE nome LIKE ?"; // CORRIGIDO: SELECT e tabela certos
    $stmt = mysqli_prepare($conexao, $sql);
    $like = "%$busca%";
    mysqli_stmt_bind_param($stmt, "s", $like);
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
} else {
    $sql = "SELECT codigo, nome, crm, dtnascimento, especialidade FROM medicos ORDER BY nome"; // CORRIGIDO: faltava SELECT
    $res = mysqli_query($conexao, $sql) or die("falha ao selecionar medicos!");
}
$total = mysqli_num_rows($res);
if ($total == 0) {
    echo "<b>Nenhum</b> medico encontrado";
} else {
    while ($linha = mysqli_fetch_row($res)) {
?>
<table width="456" border="1">
  <tr><td colspan="2">CLINICA MEDICA AVALIA</td></tr>
  <tr><td>Codigo</td><td><?php echo $linha[0]; ?></td></tr>
  <tr><td>Medico</td><td><?php echo $linha[1]; ?></td></tr>
  <tr><td>CRM</td><td><?php echo $linha[2]; ?></td></tr>
  <tr><td>Dt Nascimento</td><td><?php echo $linha[3]; ?></td></tr>
  <tr><td>Especialidade</td><td><?php echo $linha[4]; ?></td></tr>
</table>
<?php
    }
}
mysqli_close($conexao);
?>
