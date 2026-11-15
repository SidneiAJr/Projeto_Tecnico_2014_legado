<?php
include "conexao.php";
session_start();
$usuario = $_POST["f_usuario"];
$senha   = $_POST["f_senha"];
$sql = "SELECT * FROM tab_usuario WHERE usu_login = ?";
$stmt = mysqli_prepare($conexao, $sql);
mysqli_stmt_bind_param($stmt, "s", $usuario);
mysqli_stmt_execute($stmt);
$res = mysqli_stmt_get_result($stmt);
if (mysqli_num_rows($res) == 0) {
    header('location:erro.html');
} else {
    $linha = mysqli_fetch_row($res);
    if ($linha[1] == $senha) {
        $_SESSION['loginok'] = 'ok';
        header('location:menuadm.php');
    } else {
        header('location:erro.html');
    }
}
?>
<form method="post" action="login.php">
  <p><strong>Usuario:</strong> <input type="text" name="f_usuario" /></p>
  <p><strong>Senha:</strong> <input type="password" name="f_senha" /></p> <!-- CORRIGIDO: era type="text" -->
  <p><input type="submit" value="OK" /></p>
</form>
