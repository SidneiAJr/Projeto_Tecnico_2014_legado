<?php
// CORRIGIDO: conexão estava em arquivo separado mas sendo usada aqui — incluído corretamente
include("conex.php");
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bem vindo ao Sistema de Biblioteca</title>
    <link rel="stylesheet" href="teste.css">
</head>
<body>
    <div class="b">
        <a href="lista_livros.php">Listar Livros</a>
        <a href="lista_locagem.php">Listar Locagem</a>
        <a href="insere_novo.php">Inserir Novos Livros</a>
        <a href="verifica_locador.php">Verifica Locador</a>
    </div>
    <div class="c">
        <a href="lista_livro_seletor.php">Listar Livros (Seletor)</a>
    </div>
</body>
</html>