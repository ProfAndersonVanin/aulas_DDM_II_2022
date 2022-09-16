<?php
    include_once 'conexao.php';
    $id_usuario = $_POST['id'];
    //echo "Peguei o id do usuário: $id_usuario";
    // consulta em SQL que será executada na base de dados
    
    $sql_lista = "SELECT clientes.id_cliente,clientes.nome_cliente, clientes.email_cliente,clientes.telefone_cliente
    FROM clientes,usuarios,usuario_cliente
    WHERE usuarios.id = usuario_cliente.fk_usuarios_id AND
    usuario_cliente.fk_clientes_id_cliente = clientes.id_cliente AND
    usuarios.id = :ID";
    $stmt_verifica = $conexao->prepare($sql_lista);

    $stmt_verifica->bindParam(':ID',$id_usuario);
    $stmt_verifica->execute();

    $clientes = array();

    while ($dados = $stmt_verifica->fetch(PDO::FETCH_OBJ)) {
        $clientes[] = array("ID"=>$dados->id_cliente,"NOME"=>$dados->nome_cliente,"EMAIL"=>$dados->email_cliente,"TELEFONE"=>$dados->telefone_cliente);
    }

    echo json_encode($clientes);


?>