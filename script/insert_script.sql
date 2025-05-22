USE WiseTour;

INSERT INTO etapa (etapa) VALUES
('extracao'),
('tratamento'),
('carregamento');

INSERT INTO log_categoria (categoria) VALUES
('erro'),
('aviso'),
('sucesso');

INSERT INTO unidade_federativa_brasil (sigla, unidade_federativa, regiao) VALUES
('AC', 'Acre', 'Norte'),
('AL', 'Alagoas', 'Nordeste'),
('AP', 'Amapá', 'Norte'),
('AM', 'Amazonas', 'Norte'),
('BA', 'Bahia', 'Nordeste'),
('CE', 'Ceará', 'Nordeste'),
('DF', 'Distrito Federal', 'Centro-Oeste'),
('ES', 'Espírito Santo', 'Sudeste'),
('GO', 'Goiás', 'Centro-Oeste'),
('MA', 'Maranhão', 'Nordeste'),
('MT', 'Mato Grosso', 'Centro-Oeste'),
('MS', 'Mato Grosso do Sul', 'Centro-Oeste'),
('MG', 'Minas Gerais', 'Sudeste'),
('PA', 'Pará', 'Norte'),
('PB', 'Paraíba', 'Nordeste'),
('PR', 'Paraná', 'Sul'),
('PE', 'Pernambuco', 'Nordeste'),
('PI', 'Piauí', 'Nordeste'),
('RJ', 'Rio de Janeiro', 'Sudeste'),
('RN', 'Rio Grande do Norte', 'Nordeste'),
('RS', 'Rio Grande do Sul', 'Sul'),
('RO', 'Rondônia', 'Norte'),
('RR', 'Roraima', 'Norte'),
('SC', 'Santa Catarina', 'Sul'),
('SP', 'São Paulo', 'Sudeste'),
('SE', 'Sergipe', 'Nordeste'),
('TO', 'Tocantins', 'Norte'),
('OF', 'Outras Unidades da Federação', null);

INSERT INTO informacao_contato_cadastro (email, telefone, nome, fidelizado)
VALUES ('contato@wisetour.com.br', '11999999999', 'WiseTour Turismo Ltda.', 'sim');

INSERT INTO endereco (cep, tipo_logradouro, nome_logradouro, numero, complemento, bairro, cidade, fk_uf_sigla)
VALUES ('01001000', 'Avenida', 'Paulista', 1000, 'Conj. 101', 'Bela Vista', 'São Paulo', 'SP');

INSERT INTO empresa (cnpj, fk_informacao_contato_cadastro, fk_endereco, fk_uf_sigla)
VALUES ('12345678000199', 1, 1, 'SP');

INSERT INTO usuario (email, senha, permissao) VALUES
('admin', 'admin123', 'admin'),
('leonardo.sardinha@outlook.com', 'urubu100', 'padrao'),
('ian.medeiros@outlook.com', 'urubu100', 'padrao'),
('luana.liriel@outlook.com', 'urubu100', 'padrao'),
('kenner.lima@outlook.com', 'urubu100', 'padrao'),
('phelipe.bruione@outlook.com', 'urubu100', 'padrao'),
('samara.damaceno@outlook.com', 'urubu100', 'padrao');

INSERT INTO funcionario (nome, cargo, telefone, fk_cnpj, fk_informacao_contato_cadastro, fk_uf_sigla, fk_endereco, fk_usuario) VALUES
('Leonardo Sardinha', 'Analista de Dados', '11911111111', '12345678000199', 1, 'SP', 1, 2),
('Ian Medeiros', 'Desenvolvedor Backend', '11922222222', '12345678000199', 1, 'SP', 1, 3),
('Luana Liriel', 'Analista de Negócios', '11933333333', '12345678000199', 1, 'SP', 1, 4),
('Kenner Lima', 'Dev Frontend', '11944444444', '12345678000199', 1, 'SP', 1, 5),
('Phelipe Bruione', 'Product Owner', '11955555555', '12345678000199', 1, 'SP', 1, 6),
('Samara Damaceno', 'UX Designer', '11966666666', '12345678000199', 1, 'SP', 1, 7);

INSERT INTO preferencias_visualizacao_dashboard (fk_usuario, ativo) VALUES
(2, 'sim'),
(3, 'sim'),
(4, 'sim'),
(5, 'sim'),
(6, 'sim'),
(7, 'sim');


INSERT INTO tela_dashboard (fk_preferencias_visualizacao_dashboard, fk_usuario, tela, ativo) VALUES

-- Usuário 2
(1, 2, 'sazonalidade', 'sim'),
(1, 2, 'perfilTurista', 'sim'),
(1, 2, 'panoramaGeral', 'sim'),

-- Usuário 3
(2, 3, 'sazonalidade', 'sim'),
(2, 3, 'perfilTurista', 'sim'),
(2, 3, 'panoramaGeral', 'sim'),

-- Usuário 4
(3, 4, 'sazonalidade', 'sim'),
(3, 4, 'perfilTurista', 'sim'),
(3, 4, 'panoramaGeral', 'sim'),

-- Usuário 5
(4, 5, 'sazonalidade', 'sim'),
(4, 5, 'perfilTurista', 'sim'),
(4, 5, 'panoramaGeral', 'sim'),

-- Usuário 6
(5, 6, 'sazonalidade', 'sim'),
(5, 6, 'perfilTurista', 'sim'),
(5, 6, 'panoramaGeral', 'sim'),

-- Usuário 7
(6, 7, 'sazonalidade', 'sim'),
(6, 7, 'perfilTurista', 'sim'),
(6, 7, 'panoramaGeral', 'sim');
