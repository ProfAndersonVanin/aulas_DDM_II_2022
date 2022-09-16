<?php
    $DSN = "mysql:host=localhost;dbname=projeto;charset=utf8";
    $USUARIO = "root";
    $SENHA = "";

    try {
        $conexao = new PDO($DSN,$USUARIO,$SENHA);
        //echo "Conectou com sucesso!";
    } catch (PDOException $erro) {
        echo $erro->getMessage();
        exit;
    }
?>