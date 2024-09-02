create database livraria;
use livraria;
create table cliente
	(
		id_cliente int(5) auto_increment,
        nome varchar (11) not null,
        endereco varchar(20),
        email varchar(20),
        CPF varchar(11) not null,
        telefone varchar(14),
        Data_cadastro datetime, 
        primary key(id_cliente)
        );

create table pedido
	(
		id_pedido int(5) auto_increment,
        id_cliente int(5),
        descricao varchar(11) not null,
        datapedido varchar(11) not null,
        primary key(id_pedido),
        foreign key(id_cliente) references cliente(id_cliente)
        );
        
create table vendedor
	(
		id_vendedor int(5) auto_increment,
        nome varchar(11) not null,
        cargo varchar(20),
        email varchar(20),
        celular varchar(14),
        primary key(id_vendedor)
        );
        
create table pagamento
	(
		id_pagamento int(10) auto_increment,
        id_pedido int(5),
        id_cliente int(5),
        formaPagamento varchar(11) not null,
        notaFiscal int(20),
        celular varchar(14),
        dataemissaoNF datetime,
        primary key(id_pagamento),
        foreign key(id_pedido) references pedido(id_pedido),
        foreign key(id_cliente) references cliente(id_cliente)
        );
        
        create table livro
	(
		id_livro int(5) auto_increment,
        ISBN int(13) not null,
        nomeLivro varchar(40) not null,
        autor varchar(40),
        editora varchar(15),
        primary key(id_livro)
        );
        
show tables;
