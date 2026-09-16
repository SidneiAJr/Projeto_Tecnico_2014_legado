<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8" />
    <title>Clínica Médica Avalia - Menu Inicial</title>
</head>
<body>
<table width="596" border="1">
    <tr>
        <td><img src="imagens/avatar.png" width="163" height="83" /></td>
        <td>CLÍNICA MÉDICA AVALIA - MENU INICIAL</td>
    </tr>
    <tr>
        <td><a href="listaMED.php">LISTAR TODOS OS MÉDICOS</a></td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <form method="post" action="listaMED.php">
                <p><strong>Buscar Médico:</strong>
                    <input type="text" name="f_busca" />
                    <input type="submit" value="OK" />
                </p>
            </form>
        </td>
        <td>
            <form method="post" action="login.php">
                <p><strong>Usuário:</strong>
                    <input type="text" name="f_usuario" />
                </p>
                <p><strong>Senha:</strong>
                    <input type="password" name="f_senha" />
                </p>
                <p>
                    <input type="submit" value="OK" />
                    <input type="reset" value="Limpar" />
                </p>
            </form>
        </td>
    </tr>
</table>
</body>
</html>