<?php
include("conex.php");
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Locações</title>
    <link rel="stylesheet" href="teste.css">
</head>
<body>
    <div class="a">
        <table>
            <thead>
                <tr>
                    <th>Locado Por</th>
                    <th>Nome do Livro</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $sql = "SELECT 
                            locador.nome AS nome_locador,
                            livros.titulo AS nome_livro
                        FROM locacao_livros
                        INNER JOIN locador ON locacao_livros.locador_id = locador.id
                        INNER JOIN livros  ON locacao_livros.livro_id   = livros.id";

                $resultado = $con->query($sql);
                if ($resultado->num_rows > 0) {
                    while ($locado = $resultado->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>" . htmlspecialchars($locado['nome_locador']) . "</td>";
                        echo "<td>" . htmlspecialchars($locado['nome_livro'])   . "</td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='2'>Nenhuma locação encontrada.</td></tr>";
                }
                $con->close();
                ?>
            </tbody>
        </table>
    </div>
</body>
</html>