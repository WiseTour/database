/* SCRIPT PARA TESTES */

USE WiseTour;

INSERT INTO informacao_contato_cadastro (email, telefone, nome, fidelizado)
VALUES ('contato@wisetour.com.br', '11999999999', 'WiseTour Turismo Ltda.', 'sim');

INSERT INTO endereco (cep, tipo_logradouro, nome_logradouro, numero, complemento, bairro, cidade, fk_uf_sigla)
VALUES ('01001000', 'Avenida', 'Paulista', 1000, 'Conj. 101', 'Bela Vista', 'São Paulo', 'SP');

INSERT INTO empresa (cnpj, fk_informacao_contato_cadastro, fk_endereco, fk_uf_sigla)
VALUES ('12345678000199', 1, 1, 'SP');

INSERT INTO usuario (email, senha, permissao) VALUES
('admin', 'admin123', 'wisetour'),
('leonardo.sardinha@outlook.com', 'urubu100', 'admin'),
('ian.medeiros@outlook.com', 'urubu100', 'padrao'),
('luana.liriel@outlook.com', 'urubu100', 'admin'),
('kenner.lima@outlook.com', 'urubu100', 'padrao'),
('phelipe.bruione@outlook.com', 'urubu100', 'admin'),
('samara.damaceno@outlook.com', 'urubu100', 'padrao');

INSERT INTO funcionario (nome, cargo, telefone, fk_cnpj, fk_informacao_contato_cadastro, fk_uf_sigla, fk_endereco, fk_usuario) VALUES
('Leonardo Sardinha', 'Desenvolvedor Back-end', '11911111111', '12345678000199', 1, 'SP', 1, 2),
('Ian Medeiros', 'Product Owner', '11922222222', '12345678000199', 1, 'SP', 1, 3),
('Luana Liriel', 'Desenvolvedor Front-end', '11933333333', '12345678000199', 1, 'SP', 1, 4),
('Kenner Lima', 'Analista de Dados', '11944444444', '12345678000199', 1, 'SP', 1, 5),
('Phelipe Bruione', 'Scrum Master', '11955555555', '12345678000199', 1, 'SP', 1, 6),
('Samara Damaceno', 'Analista de Negócios', '11966666666', '12345678000199', 1, 'SP', 1, 7);

UPDATE configuracao_slack 
SET canal_padrao = '#leonardo-alertas', ativo = 'sim' where fk_usuario = 2;

select * from configuracao_slack;
select * from tipo_notificacao_dados;
select * from preferencia_visualizacao_dashboard order by fk_usuario;
select * from informacao_contato_cadastro;
