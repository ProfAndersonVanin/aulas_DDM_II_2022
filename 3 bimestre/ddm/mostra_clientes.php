<?php
    include 'conexao.php';
    $id_usuario = $_GET['id'];
    //echo "Peguei o id do usuário: $id_usuario";
    // consulta em SQL que será executada na base de dados
    $sql = "SELECT clientes.id_cliente,clientes.nome_cliente, clientes.email_cliente,clientes.telefone_cliente
    FROM clientes,usuarios,usuario_cliente
    WHERE usuarios.id = usuario_cliente.fk_usuarios_id AND
    usuario_cliente.fk_clientes_id_cliente = clientes.id_cliente AND
    usuarios.id = '$id_usuario'";

    // armazena o resultado da consulta
    $resultado = mysqli_query($conexao, $sql);

    if (mysqli_num_rows($resultado) > 0) {
    // saída de dados de cada linha da tabela
    while($linha = mysqli_fetch_assoc($resultado)) {
        echo "ID do Cliente: " . $linha["id_cliente"]. "<br>";
        echo "Nome Cliente: " . $linha["nome_cliente"]. "<br>";
        echo "Email Cliente: " . $linha["email_cliente"]. "<br>";
        echo "Telefone Cliente: " . $linha["telefone_cliente"]. "<br>";
        echo "****************************************<br>";
    }
    } else {
        echo "0 resultados";
    }

    // Fechar a conexão
    mysqli_close($conexao);
?>




