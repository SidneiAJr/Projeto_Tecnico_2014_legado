<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8" />
    <title>Incluir Médico</title>
</head>
<body>
<form action="incMED.php" method="post" enctype="multipart/form-data">
    <p>Nome:<br />
        <input name="f_nome" type="text" size="50" />
    </p>
    <p>CRM:<br />
        <input name="f_crm" type="text" size="10" />
    </p>
    <p>Dt. Nascimento:<br />
        <input name="f_dtnasc" type="text" size="10" />
    </p>
    <p>Especialidade:<br />
        <select name="f_especialidade">
            <option value="1">Pediatria</option>
            <option value="2">Clínico Geral</option>
            <option value="3">Cardiologista</option>
            <option value="4">Neurologista</option>
        </select>
    </p>
    <p>Foto:<br />
        <input type="file" name="f_foto" />
    </p>
    <p>
        <input type="submit" value="Incluir" />
        <input type="reset" value="Limpar" />
    </p>
</form>
</body>
</html>