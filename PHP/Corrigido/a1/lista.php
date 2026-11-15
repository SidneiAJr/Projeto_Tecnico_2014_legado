<?php
$conexao = mysqli_connect("localhost", "root", "") or die("falha ao conectar com Mysql");
mysqli_select_db($conexao, "Bd164f") or die("falha ao selecionar banco de dados");
$nivel = isset($_GET["n"]) ? $_GET["n"] : null; // CORRIGIDO: $_GET maiusculo
if (!is_null($nivel) && is_numeric($nivel)) {
    $sql = "SELECT id, nome, nivel FROM alunos WHERE nivel = ? ORDER BY nome";
    $stmt = mysqli_prepare($conexao, $sql);
    mysqli_stmt_bind_param($stmt, "i", $nivel);
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
} else {
    $busca = isset($_POST["f_busca"]) ? $_POST["f_busca"] : "";
    if (!empty($busca)) {
        $sql = "SELECT id, nome, nivel FROM alunos WHERE nome LIKE ? ORDER BY nome";
        $stmt = mysqli_prepare($conexao, $sql);
        $like = "%$busca%";
        mysqli_stmt_bind_param($stmt, "s", $like);
        mysqli_stmt_execute($stmt);
        $res = mysqli_stmt_get_result($stmt);
    } else {
        $sql = "SELECT id, nome, nivel FROM alunos ORDER BY nome";
        $res = mysqli_query($conexao, $sql) or die("falha ao selecionar alunos!");
    }
}
$total = mysqli_num_rows($res);
if ($total == 0) {
    echo "<b>Nenhum</b> aluno encontrado";
} else {
    while ($linha = mysqli_fetch_row($res)) {
        $nivel_txt = "";
        switch ($linha[2]) {
            case 1: $nivel_txt = "Ed. Basica"; break;
            case 2: $nivel_txt = "Ens. Fundamental"; break;
            case 3: $nivel_txt = "Ensino Medio"; break;
            case 4: $nivel_txt = "Tecnico"; break;
        }
        echo "<p>Codigo: {$linha[0]} | Nome: {$linha[1]} | Nivel: $nivel_txt</p>";
    }
}
mysqli_close($conexao);
?>
