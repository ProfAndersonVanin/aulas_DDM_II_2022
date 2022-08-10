CREATE DATABASE projeto;
USE projeto;

CREATE TABLE usuarios (
    id int PRIMARY KEY AUTO_INCREMENT,
    nome_usuario varchar(255),
    email_usuario varchar(255),
    senha_usuario varchar(255),
    tipo_usuario int
);

CREATE TABLE clientes (
    id_cliente int PRIMARY KEY AUTO_INCREMENT,
    nome_cliente varchar(255),
    email_cliente varchar(255),
    telefone_cliente varchar(255)
);

CREATE TABLE usuario_cliente (
    fk_usuarios_id int,
    fk_clientes_id_cliente int
);
 
ALTER TABLE usuario_cliente ADD CONSTRAINT FK_usuario_cliente_1
    FOREIGN KEY (fk_usuarios_id)
    REFERENCES usuarios (id)
    ON DELETE RESTRICT;
 
ALTER TABLE usuario_cliente ADD CONSTRAINT FK_usuario_cliente_2
    FOREIGN KEY (fk_clientes_id_cliente)
    REFERENCES clientes (id_cliente)
    ON DELETE SET NULL;