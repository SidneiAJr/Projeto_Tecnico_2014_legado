<?php
// CORRIGIDO: session_start() era necessário para verificar $_SESSION mas estava faltando
session_start();
if ($_SESSION['loginok'] != 'ok') {
    header('location: login.html');
    exit();
}

include('conex.php');

$sql    = "SELECT idchamado, repchamado, msg, res, info, horas FROM chamados";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chamados</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
    <h2>Chamados Registrados</h2>
    <?php
    if ($result->num_rows > 0) {
        echo "<table border='1' cellpadding='5'>";
        echo "<tr>
                <th>ID</th>
                <th>Representante</th>
                <th>Mensagem</th>
                <th>Resolução</th>
                <th>Informação</th>
                <th>Horário</th>
              </tr>";
        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['idchamado'])  . "</td>";
            echo "<td>" . htmlspecialchars($row['repchamado']) . "</td>";
            echo "<td>" . htmlspecialchars($row['msg'])        . "</td>";
            echo "<td>" . htmlspecialchars($row['res'])        . "</td>";
            echo "<td>" . htmlspecialchars($row['info'])       . "</td>";
            echo "<td>" . htmlspecialchars($row['horas'])      . "</td>";
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "<p>Não há chamados registrados no momento.</p>";
    }
    $conn->close();
    ?>
    <!-- CORRIGIDO: havia </body></html> duplicado no original -->
</body>
</html>