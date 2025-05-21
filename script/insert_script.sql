USE WiseTour;

INSERT IGNORE INTO Unidade_Federativa_Brasil (sigla, unidade_federativa, regiao)
VALUES
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

INSERT INTO Informacao_Contato_Cadastro (
    email,
    telefone,
    nome,
    fidelizado
) VALUES (
    'wisetour@outlook.com',
    '11999999999',
    'WiseTour',
    'Sim'
);

INSERT INTO Empresa (
  cnpj, nome_fantasia, razao_social, fk_informacao_contato_cadastro,
  cep, tipo_logradouro, nome_logradouro, numero, complemento,
  bairro, cidade, fk_uf_sigla
) VALUES (
  '12345678000199', 'WiseTour', 'WiseTour Tecnologia em Dados Ltda', 1,
  '01001000', 'Avenida', 'Paulista', 1000, 'Conjunto 101',
  'Bela Vista', 'São Paulo', 'SP'
);

INSERT INTO Funcionario (nome, cargo, telefone, fk_cnpj, fk_informacao_contato_cadastro, fk_uf_sigla) VALUES
('Leonardo Sardinha', 'Analista de Sistemas', '11911111111', '12345678000199', 1, 'SP'),
('Ian Medeiros', 'Gestor de Projetos', '11922222222', '12345678000199', 1, 'SP'),
('Luana Liriel', 'Analista de Dados', '11933333333', '12345678000199', 1, 'SP'),
('Kenner Lima', 'Desenvolvedor Backend', '11944444444', '12345678000199', 1, 'SP'),
('Phelipe Bruione', 'Desenvolvedor Frontend', '11955555555', '12345678000199', 1, 'SP'),
('Samara Damaceno', 'Coordenadora', '11966666666', '12345678000199', 1, 'SP');

INSERT INTO Usuario (fk_funcionario, email, senha, permissao) VALUES
(null, 'admin', 'admin123', 'admin'),
(1, 'leonardo.sardinha@outlook.com', 'urubu100', 'padrão'),
(2, 'ian.medeiros@outlook.com', 'urubu100', 'padrão'),
(3, 'luana.liriel@outlook.com', 'urubu100', 'padrão'),
(4, 'kenner.lima@outlook.com', 'urubu100', 'padrão'),
(5, 'phelipe.bruione@outlook.com', 'urubu100', 'padrão'),
(6, 'samara.damaceno@outlook.com', 'urubu100', 'padrão');


INSERT INTO Log_Categoria (categoria) VALUES
('Erro'),
('Aviso'),
('Sucesso');

INSERT INTO Etapa (etapa) VALUES
('Extração'),
('Tratamento'),
('Carregamento');
