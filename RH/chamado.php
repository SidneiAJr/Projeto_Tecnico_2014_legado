<?php
include('conex.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id     = $_POST['idchamado'];
    $rep    = $_POST['repchamado'];
    $msgcha = $_POST['msg'];
    $res    = "res";
    $info   = "info";
    // CORRIGIDO: $h era um array ['horas'], mas o bind_param esperava um inteiro — corrigido para 0
    $h = 0;

    // CORRIGIDO: bind_param tinha "sssssi" mas $h era array; agora é inteiro
    $stmt = $conn->prepare("INSERT INTO chamados (idchamado, repchamado, msg, res, info, horas) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sssssi", $id, $rep, $msgcha, $res, $info, $h);

    if ($stmt->execute()) {
        echo "Chamado aberto com sucesso!";
    } else {
        echo "Erro ao cadastrar: " . $stmt->error;
    }
    $stmt->close();
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Abrir Chamado</title>
</head>
<body>
    <h2>Abrir Chamado</h2>
    <form method="POST">
        <label>ID do Chamado: <input type="text" name="idchamado" required></label><br><br>
        <label>Representante: <input type="text" name="repchamado" required></label><br><br>
        <label>Mensagem: <textarea name="msg" required></textarea></label><br><br>
        <button type="submit">Enviar</button>
    </form>
    <a href="index.html">Voltar</a>
</body>
</html>