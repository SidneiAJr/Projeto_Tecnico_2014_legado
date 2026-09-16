<?php
include "conexao.php";

$usuario = $_POST["f_usuario"];
// CORRIGIDO: estava pegando f_usuario de novo em vez de f_senha
$senha   = $_POST["f_senha"];

// CORRIGIDO: query tinha erro de sintaxe ($'senha' em vez de '$senha') e usava mysql_query em vez de mysqli_query
$sql  = "SELECT * FROM tab_usuario WHERE usu_login = '$usuario'";
$res  = mysqli_query($conexao, $sql) or die("Erro ao tentar selecionar usuário");

if (mysqli_num_rows($res) == 0) {
    header('location: erro.html');
    exit();
} else {
    $linha = mysqli_fetch_row($res);
    // CORRIGIDO: $linha[0] é o id, a senha geralmente fica em outro índice — ajuste o índice conforme seu banco
    if ($linha[2] == $senha) {
        session_start();
        $_SESSION['loginok'] = 'ok';
        header('location: menuadm.php');
        exit();
    } else {
        header('location: erro.html');
        exit();
    }
}

mysqli_close($conexao);
?>