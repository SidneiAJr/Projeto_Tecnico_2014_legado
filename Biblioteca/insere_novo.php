<?php
include("conex.php");

// CORRIGIDO: $con vem do conex.php, estava tentando usar $conn (nome errado)
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $titulo     = $_POST['titulo'];
    $nome_autor = $_POST['nome_autor'];
    $lancamento = $_POST['lancamento'];
    $genero     = $_POST['genero'];

    // CORRIGIDO: uso de prepared statement para evitar SQL injection
    $stmt = $con->prepare("INSERT INTO livros (titulo, nome_autor, lancamento, genero) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssss", $titulo, $nome_autor, $lancamento, $genero);

    if ($stmt->execute()) {
        $mensagem = "Livro cadastrado com sucesso!";
    } else {
        $mensagem = "Erro ao cadastrar: " . $stmt->error;
    }
    $stmt->close();
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Livro</title>
    <link rel="stylesheet" href="teste.css">
</head>
<body>
    <div class="a">
        <h2>Cadastrar Novo Livro</h2>
        <?php if (isset($mensagem)) : ?>
            <p class="mensagem <?= strpos($mensagem, 'Erro') !== false ? 'erro' : '' ?>">
                <?= $mensagem ?>
            </p>
        <?php endif; ?>
        <form method="POST">
            <input type="text" name="titulo"     placeholder="Título do livro" required>
            <input type="text" name="nome_autor" placeholder="Nome do autor"   required>
            <input type="date" name="lancamento" required>
            <input type="text" name="genero"     placeholder="Gênero"          required>
            <button type="submit">Cadastrar</button>
        </form>
        <a href="index.php">Voltar</a>
    </div>
</body>
</html>