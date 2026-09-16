<?php
include("conex.php");
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Selecionar Livro</title>
    <link rel="stylesheet" href="teste.css">
</head>
<body>
    <div class="a">
        <form method="GET" action="">
            <label for="livro">Escolha um livro:</label>
            <select name="livro_id" id="livro">
                <option value="">Selecione</option>
                <?php
                $sql = "SELECT id, titulo FROM livros";
                $resultado = $con->query($sql);
                while ($livro = $resultado->fetch_assoc()) {
                    echo "<option value='{$livro['id']}'>{$livro['titulo']}</option>";
                }
                ?>
            </select>
            <button type="submit">Buscar</button>

            <?php
            if (isset($_GET['livro_id']) && $_GET['livro_id'] !== "") {
                // CORRIGIDO: uso de prepared statement; antes era concatenação direta (SQL injection)
                $livroId = $_GET['livro_id'];
                $stmt = $con->prepare("SELECT * FROM livros WHERE id = ?");
                $stmt->bind_param("i", $livroId);
                $stmt->execute();
                $resultadoDetalhes = $stmt->get_result();

                if ($resultadoDetalhes->num_rows > 0) {
                    $livro = $resultadoDetalhes->fetch_assoc();
                    echo "<h2>Detalhes do Livro</h2>";
                    echo "Título: "     . htmlspecialchars($livro['titulo'])     . "<br>";
                    echo "Autor: "      . htmlspecialchars($livro['nome_autor']) . "<br>";
                    echo "Lançamento: " . htmlspecialchars($livro['lancamento']) . "<br>";
                    echo "Gênero: "     . htmlspecialchars($livro['genero'])     . "<br>";
                } else {
                    echo "Livro não encontrado.";
                }
                $stmt->close();
            }
            $con->close();
            ?>
        </form>
    </div>
</body>
</html>