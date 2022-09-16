<?php
    include_once 'conexao.php';

    $email = $_POST['email'];
    $senha = $_POST['senha'];

    //echo "Postou $email e senha: $senha";

    $sql_verifica = "SELECT * FROM usuarios WHERE email_usuario = :EMAIL AND senha_usuario = :SENHA";
    $stmt_verifica = $conexao->prepare($sql_verifica);

    $stmt_verifica->bindParam(':EMAIL',$email);
    $stmt_verifica->bindParam(':SENHA',$senha);
    $stmt_verifica->execute();

    if($stmt_verifica->rowCount()>0){
        $usuario = array();

        while ($dados = $stmt_verifica->fetch(PDO::FETCH_OBJ)) {
            $usuario[] = array("ID"=>$dados->id,"NOME"=>$dados->nome_usuario,"EMAIL"=>$dados->email_usuario);
        }

        echo json_encode($usuario);
    }

?>
