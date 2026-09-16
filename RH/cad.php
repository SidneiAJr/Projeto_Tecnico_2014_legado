<?php
include('conex.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nome      = $_POST['nome'];
    $sobrenome = $_POST['sobrenome'];
    $email     = $_POST['email'];
    $senha     = $_POST['senha'];
    $telefone  = $_POST['telefone'];
    $usuario   = $_POST['usuario'];

    // CORRIGIDO: senha com hash antes de salvar no banco
    $senha_hash = password_hash($senha, PASSWORD_DEFAULT);

    // CORRIGIDO: original usava $conn mas arquivo sem hash usava variável diferente — padronizado para $conn
    $stmt = $conn->prepare("INSERT INTO usuarios (nome, sobrenome, email, senha, telefone, usuario) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssss", $nome, $sobrenome, $email, $senha_hash, $telefone, $usuario);

    if ($stmt->execute()) {
        echo "Cadastro realizado com sucesso!";
    } else {
        echo "Erro ao cadastrar usuário: " . $stmt->error;
    }
    $stmt->close();
}
?>