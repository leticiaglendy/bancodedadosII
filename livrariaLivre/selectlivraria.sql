SELECT * FROM livraria.cliente;

-- Usuarios cadastrados no Banco
select nome, dataCadastro from cliente;

select * from cliente
where id_cliente >20 and id_cliente<31
order by nome asc;

select id_cliente, nome, email, sexo, dataCadastro from cliente
where not sexo = 'masculino'
order by nome desc;