SELECT * FROM livraria.cliente;

-- Usuarios cadastrados no Banco
select nome, dataCadastro from cliente;

select * from cliente
where id_cliente >20 and id_cliente<31
order by nome asc;

select id_cliente, nome, email, sexo, dataCadastro from cliente
where not sexo = 'masculino'
order by nome desc;

-- select de últimos cadastros
select nome, dataCadastro from cliente
where dataCadastro > '2024-09-20'
order by dataCadastro desc;

-- select de titulo dos livro cadastrados na tabela livro
select id_livro, ISBN, titulo from livro
order by id_livro asc;

-- livros por pedido
select  id_pedido, livro.id_livro, livro.titulo, descricao 
from pedido
inner join
livro on livro.id_livro = pedido.id_livro;

select * from pedido;

-- Distinct / Quais os diferentes tipos de pagamento 
select distinct descricao from pedido;
select distinct formaPagamento from pagamento;

-- Not/ Quem são os vendedores da livraria? Quantos pedidos acima de 5 Itens?
select * from vendedor
where cargo not in ('supervisor', 'gerente');

select * from pedido
where not quantidadeItens < 6
order by id_pedido;

-- Top/ Sintaxe top em mySQL é LIMIT/ Quantos pedidos com 3 itens? (select de apenas 5)
SELECT * FROM pedido
WHERE quantidadeItens = '3'
LIMIT 5;

-- count
use livraria;
select count(*) from pedido;

select count(*) from pagamento
where formaPagamento = 'boleto'; 

select COUNT(id_livro)
from livro
where preco > 29.90;

select * from livro
where preco between 29.90 and 39.90;

select titulo, genero, editora
from livro
where genero = 'ficção' and editora = 'flatiron books';

select titulo, genero, editora
from livro
where genero = 'drama' or editora = 'penguin classics';

-- seleciona todos os livros que terminam com determinada letra
select id_livro, titulo from livro
where titulo LIKE '%a';
