drop database if exists estoque;
create database estoque;

use estoque;

drop table if exists usuarios;
drop table if exists cargos;
drop table if exists empresas;
drop table if exists produtos;
drop table if exists clientes;
drop table if exists clientes_produtos;
drop table if exists usuarios_produtos;

create table cargos (
    id_cargo integer not null primary key auto_increment,
    cargo varchar(255)
);

desc cargos;

create table usuarios (
    id_usuario integer not null primary key auto_increment,
    nome_usuario varchar(255),
    endereco_usuario varchar(255),
    id_cargo integer,
    foreign key (id_cargo) references cargos (id_cargo)
);

desc usuarios;

create table empresas (
    id_empresa integer not null primary key auto_increment,
    nome_empresa varchar(255)
);

desc empresas;

create table produtos (
    id_produto integer not null primary key auto_increment,
    nome_produto varchar(255),
    preco_compra float,
    preco_venda float,
    quantidade integer,
    id_empresa integer,
    foreign key (id_empresa) references empresas (id_empresa)
);

desc produtos;

create table clientes (
    id_cliente integer not null primary key auto_increment,
    nome_cliente varchar(255),
    cpf_cnpj_cliente varchar(255),
    endereco_cliente varchar(255)
);

desc clientes;

create table clientes_produtos (
    id_cliente integer,
    id_produto integer,
    foreign key (id_cliente) references clientes (id_cliente),
    foreign key (id_produto) references produtos (id_produto)
);

desc clientes_produtos;

create table usuarios_produtos (
    id_usuario integer,
    id_produto integer,
    foreign key (id_usuario) references usuarios (id_usuario),
    foreign key (id_produto) references produtos (id_produto)
);

desc usuarios_produtos;

insert into cargos (cargo) values
('Vendedor'),
('Secretario'),
('Gerente'),
('Diretor');

select * from cargos;

insert into usuarios (nome_usuario, endereco_usuario, id_cargo) values
('Felipe', 'Rua A, 46', 1),
('Gabriel', 'Rua B, 152', 4),
('Isabela', 'Rua C, 42', 1),
('Ana Paula ', 'Rua D, 876', 3),
('Willian', 'Rua E, 654', 2);

select * from usuarios;

insert into empresas (nome_empresa) values
('Motorola'),
('Samsung'),
('Iphone');

select * from empresas;

insert into produtos (nome_produto, preco_compra, preco_venda, quantidade, id_empresa) values
('Moto G82', 950, 3800, 25, 1),
('Moto G52', 720, 1480, 45, 1),
('Galaxy S20', 850, 1800, 50, 2),
('Galaxy S22', 2300, 4500, 32, 2),
('Iphone 13', 4000, 7899, 15, 3),
('Iphone 12', 3000, 6899, 7, 3);

select * from produtos;

insert into clientes (nome_cliente, cpf_cnpj_cliente, endereco_cliente) values
('Francisco', 'xxx.xxx.xxx-xx', 'Avenida Brasil, 356'),
('Rosana', 'xxx.xxx.xxx-xx', 'Avenida Comendador Franco, 1556'),
('Marcio', 'xxx.xxx.xxx-xx', 'Marechal Floriano Peixoto, 31');

select * from clientes;

insert into clientes_produtos (id_cliente, id_produto) values
    (
        (SELECT id_cliente FROM clientes WHERE clientes.nome_cliente = 'Francisco'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Galaxy S20')         
    ),
    (
        (SELECT id_cliente FROM clientes WHERE clientes.nome_cliente = 'Francisco'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Galaxy S22')         
    ),
    (
        (SELECT id_cliente FROM clientes WHERE clientes.nome_cliente = 'Rosana'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Moto G82')         
    ),
    (
        (SELECT id_cliente FROM clientes WHERE clientes.nome_cliente = 'Marcio'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Iphone 13')         
    );

select * from clientes_produtos;

insert into usuarios_produtos (id_usuario, id_produto) values
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Felipe'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Moto G82')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Felipe'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Moto G52')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Felipe'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Galaxy S20')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Felipe'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Galaxy S22')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Felipe'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Iphone 13')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Felipe'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Iphone 12')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Gabriel'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Moto G82')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Gabriel'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Moto G52')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Gabriel'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Galaxy S20')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Gabriel'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Galaxy S22')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Gabriel'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Iphone 13')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Gabriel'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Iphone 12')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Isabela'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Moto G82')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Isabela'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Moto G52')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Isabela'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Galaxy S20')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Isabela'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Galaxy S22')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Isabela'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Iphone 13')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Isabela'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Iphone 12')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Ana Paula'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Moto G82')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Ana Paula'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Moto G52')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Ana Paula'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Galaxy S20')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Ana Paula'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Galaxy S22')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Ana Paula'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Iphone 13')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Ana Paula'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Iphone 12')         
    );
    

select * from usuarios_produtos;

SELECT
    "EXERCICIO 1" AS MESSAGE_LOG;

/*
1 - Com subselect, monte query traz o nome do cliente, a empresa do cliente, o nome do 
produto que o cliente consume, o telefone do cliente e a quantidade do produto em estoque 
- trazer para um conjunto de clientes (veja in) pelo nome. Deve haver um limit de 3 registros.
*/

select 
    (
        select 
            nome_cliente 
        from 
            clientes 
        where 
            id_cliente = (
                select 
                    id_cliente 
                from 
                    clientes_produtos 
                where 
                    clientes_produtos.id_produto = produtos.id_produto
                )

    ) as nome_cliente,
    produtos.nome_produto,
    produtos.preco_venda
from 
    produtos 
where 
    id_produto IN (
        select 
            id_produto 
        from 
            clientes_produtos
)
LIMIT
    3;

SELECT
    "EXERCICIO 2" AS MESSAGE_LOG;

/*
2 - Com subselect, monte query traz o nome do cliente, a empresa do cliente, 
o nome do produto que o cliente consume, o telefone do cliente e a quantidade 
do produto em estoque - trazer para um conjunto de clientes (veja in) pelo nome. 
Deve haver uma ordenação orientada pela quantidade de produtos sendo essa descendente.
*/

select 
    (
        select 
            nome_cliente 
        from 
            clientes 
        where 
            id_cliente = (
                select 
                    id_cliente 
                from 
                    clientes_produtos 
                where 
                    clientes_produtos.id_produto = produtos.id_produto
                )

    ) as nome_cliente,
    produtos.nome_produto,
    produtos.preco_compra,
    produtos.quantidade
from 
    produtos 
where 
    id_produto IN (
        select 
            id_produto 
        from 
            clientes_produtos
)
ORDER BY
    produtos.quantidade desc;

SELECT
    "EXERCICIO 3" AS MESSAGE_LOG;

/*
3 - Com inner join, monte query traz o nome do cliente,
a empresa do cliente, o nome do produto que o cliente consume, 
o telefone do cliente e a quantidade do produto em estoque 
- trazer para um conjunto de clientes (veja in) pelo nome. 
Deve haver uma ordenação orientada pelo preço de compra (do maior para o menor).
*/

SELECT 
    clientes.nome_cliente,
    clientes.cpf_cnpj_cliente,
    empresas.nome_empresa,
    produtos.nome_produto,
    produtos.preco_compra,
    produtos.quantidade
from
    clientes 
INNER JOIN clientes_produtos
    ON clientes.id_cliente = clientes_produtos.id_cliente
INNER JOIN produtos
    ON clientes_produtos.id_produto = produtos.id_produto
INNER JOIN empresas
    ON produtos.id_empresa = empresas.id_empresa
ORDER BY produtos.preco_compra DESC;

SELECT
    "EXERCICIO 4" AS MESSAGE_LOG;

/*
4 - Com left join, monte query traz o nome do cliente, 
a empresa do cliente, o nome do produto que o cliente consume, 
o telefone do cliente e a quantidade do produto em estoque 
- trazer para um conjunto de clientes (veja in) pelo nome. 
Deve haver uma ordenação orientada pelo preço de compra (do maior para o menor).
*/

SELECT 
    clientes.nome_cliente,
    clientes.cpf_cnpj_cliente,
    empresas.nome_empresa,
    produtos.nome_produto,
    produtos.preco_compra,
    produtos.quantidade
from
    clientes 
LEFT JOIN clientes_produtos
    ON clientes.id_cliente = clientes_produtos.id_cliente
LEFT JOIN produtos
    ON clientes_produtos.id_produto = produtos.id_produto
LEFT JOIN empresas
    ON produtos.id_empresa = empresas.id_empresa
ORDER BY produtos.preco_compra DESC;
