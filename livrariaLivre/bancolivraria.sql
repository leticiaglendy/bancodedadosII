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
        dataCadastro datetime, 
        primary key(id_cliente)
        );
        
create table livro
	(
		id_livro int(5) auto_increment,
        ISBN int(13) not null,
        titulo varchar(50) not null,
        autor varchar(40),
        editora varchar(15),
        genero varchar(50),
        preco decimal(10,2),
        primary key(id_livro)
        );

create table pedido
	(
		id_pedido int(5) auto_increment,
        id_cliente int(5),
        id_livro int(5),
        descricao varchar(11) not null,
        dataPedido varchar(11) not null,
        quantidadeItens int(5) not null,
        primary key(id_pedido),
        foreign key(id_cliente) references cliente(id_cliente),
        foreign key(id_livro) references livro(id_livro)
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
        dataEmissaoNF datetime,
        primary key(id_pagamento),
        foreign key(id_pedido) references pedido(id_pedido),
        foreign key(id_cliente) references cliente(id_cliente)
        );
        
show tables;

-- insert das tabelas

insert into cliente (nome, endereco, email, CPF, telefone, dataCadastro)
values
('Beatriz Martins', 'Rua das Oliveiras, 808, Campinas, SP', 'beatriz.martins@example.com', '123.456.789-01', '(19) 92345-6789', '2024-09-11'),
('Eduardo Lima', 'Av. Brasil, 909, São José dos Campos, SP', 'eduardo.lima@example.com', '234.567.890-12', '(12) 93456-7890', '2024-09-12'),
('Juliana Costa', 'Rua das Andorinhas, 1010, São Bernardo do Campo, SP', 'juliana.costa@example.com', '345.678.901-23', '(11) 96789-0123', '2024-09-13'),
('Pedro Gonçalves', 'Rua dos Girassóis, 1111, Santo André, SP', 'pedro.goncalves@example.com', '456.789.012-34', '(11) 91234-5678', '2024-09-14'),
('Sofia Almeida', 'Av. Getúlio Vargas, 1212, Osasco, SP', 'sofia.almeida@example.com', '567.890.123-45', '(11) 92345-6789', '2024-09-15'),
('Ricardo Nascimento', 'Rua das Palmeiras, 1313, Guarulhos, SP', 'ricardo.nascimento@example.com', '678.901.234-56', '(11) 93456-7890', '2024-09-16'),
('Camila Oliveira', 'Rua do Bosque, 1414, Ribeirão Preto, SP', 'camila.oliveira@example.com', '789.012.345-67', '(16) 96789-0123', '2024-09-17'),
('Bruno Andrade', 'Rua do Comércio, 1515, Bauru, SP', 'bruno.andrade@example.com', '890.123.456-78', '(14) 91234-5678', '2024-09-18'),
('Tatiane Rodrigues', 'Av. Independência, 1616, Marília, SP', 'tatiane.rodrigues@example.com', '901.234.567-89', '(14) 92345-6789', '2024-09-19'),
('Daniela Vieira', 'Rua das Acácias, 1717, São Carlos, SP', 'daniela.vieira@example.com', '012.345.678-90', '(16) 93456-7890', '2024-09-20'),
('Marcos Ferreira', 'Rua das Laranjeiras, 1818, Campinas, SP', 'marcos.ferreira@example.com', '123.456.789-11', '(19) 96543-2109', '2024-09-21'),
('Fernanda Pinto', 'Av. da Liberdade, 1919, São Paulo, SP', 'fernanda.pinto@example.com', '234.567.890-22', '(11) 97654-3210', '2024-09-22'),
('Roberto Silva', 'Rua dos Jasmins, 2020, Santos, SP', 'roberto.silva@example.com', '345.678.901-33', '(13) 94567-8901', '2024-09-23'),
('Patrícia Almeida', 'Rua das Acácias, 2121, Mogi das Cruzes, SP', 'patricia.almeida@example.com', '456.789.012-44', '(11) 93456-7890', '2024-09-24'),
('Thiago Costa', 'Av. das Nações, 2222, São Bernardo do Campo, SP', 'thiago.costa@example.com', '567.890.123-55', '(11) 91234-5678', '2024-09-25'),
('Juliana Campos', 'Rua dos Lírios, 2323, Sorocaba, SP', 'juliana.campos@example.com', '678.901.234-66', '(15) 92345-6789', '2024-09-26'),
('André Oliveira', 'Rua dos Pinheiros, 2424, São José dos Campos, SP', 'andre.oliveira@example.com', '789.012.345-77', '(12) 93456-7890', '2024-09-27'),
('Viviane Almeida', 'Av. do Sol, 2525, Atibaia, SP', 'viviane.almeida@example.com', '890.123.456-88', '(11) 94567-8901', '2024-09-28'),
('Eduardo Martins', 'Rua das Hortências, 2626, Jundiaí, SP', 'eduardo.martins@example.com', '901.234.567-99', '(11) 95678-9012', '2024-09-29'),
('Samantha Ribeiro', 'Rua das Flores, 2727, Americana, SP', 'samantha.ribeiro@example.com', '012.345.678-10', '(19) 96789-0123', '2024-09-30'),
('Rafael Souza', 'Rua dos Cardos, 2828, Bertioga, SP', 'rafael.souza@example.com', '123.456.789-22', '(13) 97890-1234', '2024-10-01'),
('Marcela Lima', 'Av. Aclimação, 2929, Praia Grande, SP', 'marcela.lima@example.com', '234.567.890-33', '(13) 96543-2109', '2024-10-02'),
('Gustavo Ferreira', 'Rua dos Jardins, 3030, Guarujá, SP', 'gustavo.ferreira@example.com', '345.678.901-44', '(13) 93456-7890', '2024-10-03'),
('Camila Nunes', 'Av. Carlos Gomes, 3131, São Vicente, SP', 'camila.nunes@example.com', '456.789.012-55', '(13) 91234-5678', '2024-10-04'),
('Leonardo Martins', 'Rua do Lago, 3232, Cotia, SP', 'leonardo.martins@example.com', '567.890.123-66', '(11) 94567-8901', '2024-10-05'),
('Larissa Costa', 'Rua das Palmeiras, 3333, Carapicuíba, SP', 'larissa.costa@example.com', '678.901.234-77', '(11) 95678-9012', '2024-10-06'),
('Felipe Rodrigues', 'Rua do Bosque, 3434, Taboão da Serra, SP', 'felipe.rodrigues@example.com', '789.012.345-88', '(11) 96789-0123', '2024-10-07'),
('Ana Carolina', 'Av. Paulista, 3535, São Paulo, SP', 'ana.carolina@example.com', '890.123.456-99', '(11) 97890-1234', '2024-10-08'),
('Jorge Lima', 'Rua dos Girassóis, 3636, São Caetano do Sul, SP', 'jorge.lima@example.com', '901.234.567-10', '(11) 98901-2345', '2024-10-09'),
('Isabela Oliveira', 'Rua das Acácias, 3737, São João da Boa Vista, SP', 'isabela.oliveira@example.com', '012.345.678-21', '(19) 94567-8901', '2024-10-10'),
('Roberta Pereira', 'Rua das Orquídeas, 3838, Bauru, SP', 'roberta.pereira@example.com', '123.456.789-32', '(14) 93456-7890', '2024-10-11');


insert into livro(ISBN, titulo, autor, editora, genero,preco)
values
('978-0-06-112008-4', 'O Sol é Para Todos', 'Harper Lee', 'J.B. Lippincott & Co.', 'Ficção', 39.90),
('978-0-452-28423-4', '1984', 'George Orwell', 'Harcourt Brace', 'Distopia', 29.90),
('978-0-14-243723-0', 'Dom Quixote', 'Miguel de Cervantes', 'Penguin Classics', 'Clássico', 49.90),
('978-0-15-601219-5', 'O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Harcourt', 'Infantil', 19.90),
('978-0-618-00222-8', 'O Senhor dos Anéis', 'J.R.R. Tolkien', 'Houghton Mifflin', 'Fantasia', 89.90),
('978-0-14-143951-8', 'Orgulho e Preconceito', 'Jane Austen', 'Penguin Classics', 'Romance', 24.90),
('978-0-14-044795-3', 'A Morte de Ivan Ilitch', 'Lev Tolstói', 'Penguin Classics', 'Drama', 14.90),
('978-0-618-00221-1', 'O Hobbit', 'J.R.R. Tolkien', 'Houghton Mifflin', 'Fantasia', 34.90),
('978-0-452-28424-1', 'A Revolução dos Bichos', 'George Orwell', 'Harcourt Brace', 'Fábula', 24.90),
('978-0-06-235765-8', 'Os Sete Maridos de Evelyn Hugo', 'Taylor Jenkins Reid', 'Atria Books', 'Romance', 39.90),
('978-0-385-53725-7', 'A Garota no Trem', 'Paula Hawkins', 'Riverhead Books', 'Suspense', 29.90),
('978-0-385-50420-0', 'O Código Da Vinci', 'Dan Brown', 'Doubleday', 'Thriller', 34.90),
('978-0-552-16739-7', 'A Menina que Roubava Livros', 'Markus Zusak', 'Knopf', 'Drama', 29.90),
('978-0-385-53323-7', 'O Poder do Hábito', 'Charles Duhigg', 'Random House', 'Autoajuda', 32.90),
('978-0-14-044919-2', 'A Arte da Guerra', 'Sun Tzu', 'Penguin Classics', 'Estratégia', 18.90),
('978-0-06-109781-0', 'A Casa dos Espíritos', 'Isabel Allende', 'Alfred A. Knopf', 'Romance', 29.90),
('978-0-425-17028-5', 'O Silêncio dos Inocentes', 'Thomas Harris', 'St. Martin’s Press', 'Thriller', 24.90),
('978-0-06-233722-3', 'O Lobo de Wall Street', 'Jordan Belfort', 'Bantam Books', 'Biografia', 39.90),
('978-0-349-41909-5', 'Entre o Amor e o Silêncio', 'Beth O’Leary', 'Quercus', 'Romance', 34.90),
('978-0-553-29698-3', 'O Diário de Anne Frank', 'Anne Frank', 'Viking Press', 'Autobiografia', 22.90),
('978-0-06-112241-5', 'O Alquimista', 'Paulo Coelho', 'HarperOne', 'Ficção', 27.90),
('978-0-307-88724-0', 'O Clube do Livro do Fim da Vida', 'Will Schwalbe', 'Knopf', 'Memórias', 29.90),
('978-85-04-06168-5', 'A Vida Invisível de Eurídice Gusmão', 'Martha Batalha', 'Companhia das Letras', 'Romance', 39.90),
('978-0-451-52923-5', 'O Homem Mais Rico da Babilônia', 'George S. Clason', 'Penguin', 'Finanças', 21.90),
('978-0-19-953552-2', 'A Abadia de Northanger', 'Jane Austen', 'Oxford University Press', 'Romance', 19.90),
('978-0-14-044915-4', 'O Príncipe', 'Nicolau Maquiavel', 'Penguin Classics', 'Política', 17.90),
('978-0-00-752274-3', 'O Último Desejo', 'Andrzej Sapkowski', 'Gollancz', 'Fantasia', 32.90),
('978-0-307-73929-6', 'O Cemitério de Praga', 'Umberto Eco', 'HarperCollins', 'Histórico', 34.90),
('978-0-307-45454-6', 'Os Homens que Não Amavam as Mulheres', 'Stieg Larsson', 'Knopf', 'Thriller', 29.90),
('978-0-553-10354-0', 'A Guerra dos Tronos', 'George R.R. Martin', 'Bantam Books', 'Fantasia', 39.90),
('978-85-566-5420-2', 'O Último Guardião de Deus', 'Luis Pimentel', 'Editora Novo Século', 'Ficção', 34.90),
('978-0-06-088328-7', 'Cem Anos de Solidão', 'Gabriel García Márquez', 'Harper & Row', 'Realismo Mágico', 49.90),
('978-0-453-15015-2', 'A Longa Cabana', 'Liane Moriarty', 'Flatiron Books', 'Ficção', 29.90),
('978-0-14-312354-3', 'A Garota que Você Deixou Para Trás', 'Jojo Moyes', 'Penguin Books', 'Romance', 34.90),
('978-0-06-231063-5', 'A Rainha Vermelha', 'Victoria Aveyard', 'HarperTeen', 'Fantasia', 29.90),
('978-1-250-05701-2', 'Big Little Lies', 'Liane Moriarty', 'Flatiron Books', 'Ficção', 39.90),
('978-0-06-256014-8', 'The Silent Patient', 'Alex Michaelides', 'Celadon Books', 'Thriller', 34.90),
('978-1-9848-3002-1', 'Where the Crawdads Sing', 'Delia Owens', 'Putnam', 'Drama', 32.90),
('978-0-06-287747-8', 'Normal People', 'Sally Rooney', 'Hogarth', 'Romance', 29.90),
('978-1-9848-2567-5', 'The Night Circus', 'Erin Morgenstern', 'Anchor', 'Fantasia', 37.90),
('978-0-06-297750-7', 'Anxious People', 'Fredrik Backman', 'Atria Books', 'Ficção', 31.90),
('978-0-307-47725-6', 'Educated', 'Tara Westover', 'Random House', 'Memórias', 34.90),
('978-0-06-249662-7', 'The Tattooist of Auschwitz', 'Heather Morris', 'HarperCollins', 'Histórico', 29.90),
('978-1-250-27508-8', 'The Last House on Needless Street', 'Catriona Ward', 'Macmillan', 'Suspense', 29.90),
('978-0-593-12442-4', 'The Guncle', 'Steven Rowley', 'Putnam', 'Romance', 28.90),
('978-1-5387-0890-4', 'The Book Thief', 'Markus Zusak', 'Knopf', 'Drama', 31.90),
('978-1-250-21632-7', 'The Invisible Life of Addie LaRue', 'V.E. Schwab', 'Tor Books', 'Fantasia', 34.90),
('978-0-593-12485-1', 'The Maidens', 'Alex Michaelides', 'Celadon Books', 'Thriller', 33.90),
('978-1-250-26365-8', 'The Paris Library', 'Janet Skeslien Charles', 'Atria Books', 'Histórico', 31.90),
('978-0-06-290721-1', 'Little Fires Everywhere', 'Celeste Ng', 'Penguin Press', 'Drama', 28.90),
('978-0-316-55653-7', 'The Seven Husbands of Evelyn Hugo', 'Taylor Jenkins Reid', 'Atria Books', 'Romance', 35.90);

insert into pedido(id_cliente, id_livro, descricao, datapedido, quantidadeItens)
values
(1, 5, 'Promoção de Setembro', '2024-09-01', 4),
(2, 12, 'Edição Especial', '2024-09-02', 3),
(3, 23, 'Lançamento Novo', '2024-09-03', 2),
(4, 30, 'Coleção Completa', '2024-09-04', 6),
(5, 7, 'Desconto Exclusivo', '2024-09-05', 5),
(6, 18, 'Livro Popular', '2024-09-06', 1),
(7, 22, 'Melhor Compra', '2024-09-07', 8),
(8, 9, 'Oferta Limitada', '2024-09-08', 3),
(9, 15, 'Novidade Literária', '2024-09-09', 7),
(10, 28, 'Top Vendas', '2024-09-10', 4),
(11, 3, 'Reedição Exclusiva', '2024-09-11', 6),
(12, 21, 'Desconto de Fim de Ano', '2024-09-12', 2),
(13, 14, 'Promoção de Outono', '2024-09-13', 5),
(14, 37, 'Lançamento Imperdível', '2024-09-14', 3),
(15, 20, 'Compra Especial', '2024-09-15', 8),
(16, 8, 'Livro Recomendado', '2024-09-16', 4),
(17, 25, 'Oferta de Mercado', '2024-09-17', 2),
(18, 10, 'Edição Limitada', '2024-09-18', 7),
(19, 26, 'Novidade do Mês', '2024-09-19', 1),
(20, 32, 'Coleção Literária', '2024-09-20', 6),
(21, 13, 'Oferta Exclusiva', '2024-09-21', 3),
(22, 27, 'Desconto Especial', '2024-09-22', 5),
(23, 19, 'Compra do Mês', '2024-09-23', 8),
(24, 33, 'Promoção Anual', '2024-09-24', 4),
(25, 11, 'Reedição Especial', '2024-09-25', 7),
(26, 24, 'Lançamento Novo', '2024-09-26', 2),
(27, 50, 'Promoção do Ano', '2024-09-27', 6),
(28, 17, 'Desconto de Aniversário', '2024-09-28', 3),
(29, 39, 'Ofertas Imperdíveis', '2024-09-29', 8),
(30, 46, 'Livro Recomendado', '2024-09-30', 5),
(1, 4, 'Oferta Especial', '2024-10-01', 2),
(2, 38, 'Desconto Exclusivo', '2024-10-02', 4),
(3, 45, 'Promoção Literária', '2024-10-03', 6),
(4, 6, 'Coleção de Fim de Ano', '2024-10-04', 3),
(5, 40, 'Novidade Imperdível', '2024-10-05', 7),
(6, 16, 'Reedição de Clássico', '2024-10-06', 5),
(7, 48, 'Compra de Aniversário', '2024-10-07', 2),
(8, 43, 'Livro de Destaque', '2024-10-08', 8),
(9, 47, 'Edição Especial', '2024-10-09', 3),
(10, 49, 'Oferta Exclusiva', '2024-10-10', 4);

insert into vendedor(nome, cargo, email, celular)
values
('Maria Lima', 'Vendedor', 'maria@ex.com', '2345-6789'),
('Fernanda', 'Vendedor', 'fernan@ex.com', '6789-0123'),
('Roberto', 'Vendedor', 'roberto@ex.com', '9012-3456'),
('Camila', 'Vendedor', 'camila@ex.com', '2345-6790'),
('Tatiane', 'Vendedor', 'tatiane@ex.com', '6789-0234'),
('Gustavo', 'Supervisor', 'gustavo@ex.com', '7890-1345'),
('Eduardo', 'Gerente', 'eduardo@ex.com', '9012-3567'),
('Sofia', 'Vendedor', 'sofia@ex.com', '0123-4678'),
('Marcos', 'Vendedor', 'marcos@ex.com', '3456-7902'),
('Juliana', 'Vendedor', 'juliana@ex.com', '6789-0235'),
('Amanda', 'Vendedor', 'amanda@ex.com', '0123-4679'),
('Pedro Souza', 'Vendedor', 'pedro@ex.com', '3456-7890'),
('Ana Costa', 'Vendedor', 'ana@ex.com', '4567-8901'),
('Carlos Lima', 'Vendedor', 'carlos@ex.com', '5678-9012'),
('Juliana', 'Vendedor', 'julia@ex.com', '8901-2345');

insert into pagamento(id_pedido, id_cliente, formaPagamento, notaFiscal, celular, dataEmissaoNF)
values
(1, 1, 'Cartão de Crédito', 100001, '1234-5678', '2024-09-01 10:00:00'),
(2, 2, 'Boleto', 100002, '2345-6789', '2024-09-02 11:15:00'),
(3, 3, 'Débito', 100003, '3456-7890', '2024-09-03 12:30:00'),
(4, 4, 'Pix', 100004, '4567-8901', '2024-09-04 13:45:00'),
(5, 5, 'Cartão de Crédito', 100005, '5678-9012', '2024-09-05 14:00:00'),
(6, 6, 'Boleto', 100006, '6789-0123', '2024-09-06 15:30:00'),
(7, 7, 'Débito', 100007, '7890-1234', '2024-09-07 16:15:00'),
(8, 8, 'Pix', 100008, '8901-2345', '2024-09-08 17:00:00'),
(9, 9, 'Cartão de Crédito', 100009, '9012-3456', '2024-09-09 18:45:00'),
(10, 10, 'Boleto', 100010, '0123-4567', '2024-09-10 19:30:00'),
(11, 11, 'Débito', 100011, '1234-5679', '2024-09-11 20:15:00'),
(12, 12, 'Pix', 100012, '2345-6780', '2024-09-12 21:00:00'),
(13, 13, 'Cartão de Crédito', 100013, '3456-7891', '2024-09-13 22:45:00'),
(14, 14, 'Boleto', 100014, '4567-8902', '2024-09-14 23:30:00'),
(15, 15, 'Débito', 100015, '5678-9013', '2024-09-15 10:00:00'),
(16, 16, 'Pix', 100016, '6789-0124', '2024-09-16 11:15:00'),
(17, 17, 'Cartão de Crédito', 100017, '7890-1235', '2024-09-17 12:30:00'),
(18, 18, 'Boleto', 100018, '8901-2346', '2024-09-18 13:45:00'),
(19, 19, 'Débito', 100019, '9012-3457', '2024-09-19 14:00:00'),
(20, 20, 'Pix', 100020, '0123-4568', '2024-09-20 15:30:00'),
(21, 21, 'Cartão de Crédito', 100021, '1234-5670', '2024-09-21 16:15:00'),
(22, 22, 'Boleto', 100022, '2345-6781', '2024-09-22 17:00:00'),
(23, 23, 'Débito', 100023, '3456-7892', '2024-09-23 18:45:00'),
(24, 24, 'Pix', 100024, '4567-8903', '2024-09-24 19:30:00'),
(25, 25, 'Cartão de Crédito', 100025, '5678-9014', '2024-09-25 20:15:00'),
(26, 26, 'Boleto', 100026, '6789-0125', '2024-09-26 21:00:00'),
(27, 27, 'Débito', 100027, '7890-1236', '2024-09-27 22:45:00'),
(28, 28, 'Pix', 100028, '8901-2347', '2024-09-28 23:30:00'),
(29, 29, 'Cartão de Crédito', 100029, '9012-3458', '2024-09-29 10:00:00'),
(30, 30, 'Boleto', 100030, '0123-4569', '2024-09-30 11:15:00');
