<?php
include("conex.php");
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Locadores</title>
    <link rel="stylesheet" href="teste.css">
</head>
<body>
    <div class="a">
        <table>
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Endereço</th>
                    <th>Email</th>
                    <th>Telefone</th>
                    <th>CPF</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $sql = "SELECT * FROM locador";
                $resultado = $con->query($sql);
                if ($resultado->num_rows > 0) {
                    while ($locar = $resultado->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>" . htmlspecialchars($locar['nome'])      . "</td>";
                        echo "<td>" . htmlspecialchars($locar['endereco'])  . "</td>";
                        echo "<td>" . htmlspecialchars($locar['email'])     . "</td>";
                        echo "<td>" . htmlspecialchars($locar['telefone'])  . "</td>";
                        // CORRIGIDO: colspan era 4, mas a tabela tem 5 colunas
                        echo "<td>" . htmlspecialchars($locar['cpf'])       . "</td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='5'>Nenhum locador encontrado.</td></tr>";
                }
                $con->close();
                ?>
            </tbody>
        </table>
    </div>
</body>
</html>