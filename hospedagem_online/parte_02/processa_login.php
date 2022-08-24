<?php
    include 'conexao.php';

    $email = $_POST['email'];
    $senha = $_POST['senha'];

    $consulta = $conexao->query("SELECT * FROM usuarios WHERE email_usuario ='$email' AND senha_usuario ='$senha'");
    
    // Pega o Id do usuário
    $linha = mysqli_fetch_assoc($consulta);
    $id_usuario = $linha["id"];


    if(mysqli_num_rows($consulta)==0){
        echo "usuario_incorreto";
    }else{
        //echo "usuario_ok";
        //echo "Usuario: $id_usuario";
        header('Location: mostra_clientes.php?id='.$id_usuario);
    }
?>




