create DATABASE  atividadeBD;

USE atividadeBD;

create table Login(
 id_login int primary key auto_increment, 
 email varchar(200),
 senha varchar(10)
 );
 
CREATE TABLE cadastroFilho (
    id_Filho INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    diagnostico VARCHAR(255),
    medicamento VARCHAR(255),
    tratamentos VARCHAR(255)
);

CREATE TABLE cadastroResponsavel (
    id_cadastro_Responsavel INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    rg VARCHAR(20) NOT NULL,
    responsavel VARCHAR(100),
    email varchar(100),
    senha varchar(100),
    id_filho INT,
    FOREIGN KEY (id_filho) REFERENCES cadastroFilho(id_filho) 
);

create table Tarefas (
	id int primary key auto_increment,
    nomeTarefa varchar (255),
    horario varchar (255),
    nivelDificuldade int,
    comentario text,
    nota int,
    dataTarefa datetime,
    id_cadastro_Responsavel int,
    id_Filho int,
    foreign key (id_cadastro_Responsavel) references cadastroResponsavel(id_cadastro_Responsavel),
    foreign key (id_Filho) references cadastroFilho(id_Filho)
    );
    
CREATE TABLE Dados_Sociais (
    id_Dados_Sociais INT PRIMARY KEY AUTO_INCREMENT,
    cad_unico VARCHAR(20),
    crea VARCHAR(20),
    bolsa_familia BOOLEAN,
    loas BOOLEAN,
    beneficios VARCHAR(255),
    id_Filho INT,
    foreign key (id_Filho) references cadastroFilho(id_Filho)
    );

CREATE TABLE Medico (
    id_Medico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
    crm VARCHAR(20) NOT NULL UNIQUE,
    localizacao VARCHAR(255),
    id_filho int,
    foreign key (id_Filho) references cadastroFilho(id_Filho)
    );

create table Atividades (
  id_atividade int primary key auto_increment,
  nome_atividade varchar (100) not null,
  data_atividade date,
  local_atividade varchar (200),
  id_cadastro_Responsavel int,
  id_filho int,
  foreign key (id_cadastro_Responsavel) references cadastroResponsavel(id_cadastro_Responsavel),
  foreign key (id_Filho) references cadastroFilho(id_Filho)
    );
    
/* login*/
INSERT INTO Login (email, senha) VALUES
    ('ana.silva@gmail.com', 'senha123'),
    ('mariana.oliveira@yahoo.com', 'seguro456'),
    ('carlos.souza@hotmail.com', 'acesso789'),
    ('fernanda.lima@gmail.com', 'login001'),
    ('juliana.santos@gmail.com', 'minha1234');

INSERT INTO cadastroFilho (nome, data_nascimento, diagnostico, medicamento, tratamentos) VALUES
('Lucas Silva', '2015-01-15', 'Alergia', 'Antialérgico', 'Consulta mensal'),
('Maria Oliveira', '2016-02-20', 'Asma', 'Broncodilatador', 'Inalação semanal'),
('Pedro Santos', '2014-03-10', 'Diabetes', 'Insulina', 'Consulta trimestral'),
('Ana Costa', '2013-04-05', 'Autismo', 'Não se aplica', 'Terapia semanal'),
('Rafael Almeida', '2017-05-25', 'Hipertensão', 'Antipertensivo', 'Monitoramento mensal');

INSERT INTO cadastroResponsavel (nome, data_nascimento, endereco, cpf, rg, id_Filho) VALUES
('Ana Silva', '1985-05-15', 'Rua das Flores, 123', '123.456.789-00', 'MG-12.345.678', 1),
('João Pereira', '1990-08-20', 'Avenida Brasil, 456', '988.654.321-00', 'SP-23.456.789', 2),
('Maria Oliveira', '1988-11-10', 'Travessa da Esperança, 789', '321.654.987-00', 'RJ-34.567.890', 3),
('Carlos Santos', '1995-04-05', 'Rua do Sol, 101', '456.789.123-00', 'RS-45.678.901', 4),
('Fernanda Costa', '1975-02-25', 'Rua da Paz, 202', '654.321.987-00', 'BA-56.789.012', 5);

INSERT INTO Tarefas (nomeTarefa, horario, nivelDificuldade, comentario, nota, dataTarefa,id_cadastro_Responsavel, id_Filho) values
('Atividade de Leitura', '19:00', 2, 'A criança demonstrou interesse.', 8, '2024-11-24 19:00:00', 1, 1),
('Atividade de desenho', '15:30', 3, 'Desenhou com concentração.', 9, '2024-11-23 15:30:00', 2, 5),
('Exercício físico leve', '10:00', 4, 'Teve dificuldade em completar.', 6, '2024-11-22 10:00:00', 1, 2),
('Montar quebra-cabeça', '14:00', 3, 'Gostou da atividade.', 8, '2024-11-21 14:00:00', 2, 3),
('Lição de casa de matemática', '17:00', 5, 'Completou com ajuda.', 7, '2024-11-20 17:00:00', 4, 4);

INSERT INTO Dados_Sociais (cad_unico,crea, bolsa_familia, loas, beneficios, id_Filho) VALUES
('123456789012', 'CREA-SP-001', true, false, 'Isenção de tarifas públicas', 1),
('987654321098', 'CREA-RJ-002', false, true, 'Acompanhamento psicológico gratuito', 2),
('456789123456', 'CREA-MG-003', false ,false, 'Transporte público gratuito', 3),
('789456123789', 'CREA-CE-004', true, true, 'Nenhum benefício registrado', 4),
('321654987321', 'CREA-RS-005', true, false, 'Auxílio alimentação, desconto em medicamentos', 5);

INSERT INTO Medico (nome, especialidade, crm, localizacao,id_Filho) VALUES
('Dr. João da Silva', 'Pediatra', 'CRM-123456', 'São Paulo, SP',5),
('Dra. Ana Pereira', 'Cardiologista', 'CRM-654321', 'Rio de Janeiro, RJ', 3),
('Dr. Carlos Almeida', 'Neurologista', 'CRM-987654', 'Belo Horizonte, MG',2),
('Dra. Fernanda Costa', 'Dermatologista', 'CRM-456789', 'Curitiba, PR',1),
('Dra. Juliana Mendes', 'Oftalmologista', 'CRM-789123', 'Salvador, BA',4);

INSERT INTO Atividades (nome_atividade, data_atividade, local_atividade, id_filho) VALUES 
('Aula de Natação', '2024-11-24', 'Clube Recreativo São Paulo', 1 ),
('Sessão de Fonoaudiologia', '2024-11-25', 'Clínica Viva Voz', 2),
('Pintura com Tinta', '2024-11-26', 'Escola de Arte Criativa', 3),
('Passeio ao Parque', '2024-11-28', 'Parque Ibirapuera', 4),
('Sessão de Terapia Ocupacional', '2024-12-12', 'Clínica Viva Voz', 5);

/*Selecet para login de email e senha*/
select email, senha from Login
where senha ='senha123' and email= 'ana.silva@gmail.com';

/*Listar informações das mães cadastradas*/
SELECT id_cadastro_Responsavel, nome, email, data_nascimento, cpf
FROM cadastroResponsavel 
ORDER BY nome;

/*Seleciona o nome da tarefa, horário e nível de dificuldade de todas as tarefas*/
SELECT nomeTarefa, horario, nivelDificuldade FROM Tarefas;

/*Seleciona médicos que atendem um filho específico*/
SELECT nome, especialidade FROM Medico WHERE id_Filho = 4;

/*Seleciona os dados do filho e do responsável*/
SELECT f.nome AS nome_filho, r.nome AS nome_responsavel, f.diagnostico 
FROM cadastroFilho f
JOIN cadastroResponsavel r ON f.id_Filho = r.id_filho;

/*Listar todas as atividades realizadas por um usuário específico*/
select t.nomeTarefa, t.horario, t.dataTarefa, t.nota, f.nome
from cadastroFilho f
join Tarefas t on t.id_Filho = f.id_Filho
where f.id_filho = 3
order by t.dataTarefa desc;

/*Lista as atividades e programas */
SELECT a.id_atividade, a.nome_atividade, a.data_atividade
FROM Atividades AS a
WHERE a.data_atividade >= CURDATE()
ORDER BY a.data_atividade;

/*Seleciona todas as tarefas de um filho*/
SELECT t.nomeTarefa, t.dataTarefa FROM Tarefas t
WHERE t.id_Filho = 2;

/*Seleciona tarefas mais bem avaliadas*/
SELECT nomeTarefa, nota FROM Tarefas 
WHERE id_filho = 4 AND nota >= 6;

/*Seleciona atividades que ocorreram após uma data especifica*/
SELECT nome_atividade, data_atividade FROM Atividades 
WHERE data_atividade > '2024-11-01';





