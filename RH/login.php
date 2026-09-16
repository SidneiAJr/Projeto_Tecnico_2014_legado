<?php
include('conex.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $usuario = $_POST['usuario'];
    $senha   = $_POST['senha'];

    // CORRIGIDO: uso de prepared statement; original concatenava variáveis direto na query
    $stmt = $conn->prepare("SELECT * FROM usuarios WHERE usuario = ?");
    $stmt->bind_param("s", $usuario);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();

        // CORRIGIDO: comparação de senha — usando password_verify() para senhas com hash
        // Se o banco ainda armazena senha sem hash, troque por: if ($senha == $user['senha'])
        if (password_verify($senha, $user['senha'])) {
            session_start();
            $_SESSION['loginok'] = 'ok';
            header("Location: info.php");
            exit();
        } else {
            echo "Senha incorreta.";
        }
    } else {
        echo "Usuário não encontrado.";
    }
    $stmt->close();
}
?>