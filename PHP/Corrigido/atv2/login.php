<?php
include "conexao.php";
session_start();
$usuario = $_POST["f_usuario"];
$senha   = $_POST["f_senha"]; // CORRIGIDO: era f_usuario
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
        header('location:admlivros.PHP');
    } else {
        header('location:erro.html');
    }
}
?>
<table width="712" height="93" border="2">
  <tr>
    <td width="182" rowspan="2"><img src="images/9.jpg" width="176" height="140" /></td>
    <td width="512">Livraria Paluminio</td>
  </tr>
  <tr>
    <td>
      <form method="post" action="login.php">
        <p><strong>Usuario: <input type="text" name="f_usuario" /></strong></p>
        <p><strong>Senha: <input type="password" name="f_senha" /></strong>
          <input type="submit" value="OK" />
        </p>
      </form>
    </td>
  </tr>
</table>
