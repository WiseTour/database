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


-- 2. Informação de contato
INSERT INTO Informacao_Contato_Cadastro (
    email, telefone, nome, fidelizado
) VALUES (
    'contato@wisetour.com.br', '11934483566', 'joão', 'Sim'
);

-- 3. Empresa
INSERT INTO Empresa (
  cnpj, nome_fantasia, razao_social, fk_informacao_contato_cadastro,
  cep, tipo_logradouro, nome_logradouro, numero, complemento,
  bairro, cidade, fk_uf_sigla
) VALUES (
  '12345678000199', 'WiseTour', 'WiseTour Tecnologia em Dados Ltda', 1,
  '01001000', 'Avenida', 'Paulista', 1000, 'Conjunto 101',
  'Bela Vista', 'São Paulo', 'SP'
);

-- 4. Funcionários (sem FKs)
INSERT INTO Funcionario (
    nome, cargo, telefone, fk_cnpj, fk_informacao_contato_cadastro, fk_uf_sigla
) VALUES
('Leonardo Sardinha', 'Analista de Sistemas', '11934483566', '12345678000199', 1, 'SP'),
('Juliana Alves', 'Gerente de Projetos', '11934483566', '12345678000199', 1, 'SP');

-- 5. Usuários com TODAS as FKs
INSERT INTO Usuario (
    fk_funcionario, fk_cnpj, fk_uf_sigla, fk_informacao_contato_cadastro, email, senha, permissao
) VALUES
(1, '12345678000199', 'SP', 1, 'leonardo.sardinha@outlook.com', 'urubu100', 'Padrão'),
(1, '12345678000199', 'SP', 1, 'juliana.alves@outlook.com', 'admin123', 'Admin');

INSERT INTO Log_Categoria (categoria) VALUES
('Erro'),
('Aviso'),
('Sucesso');

INSERT INTO Etapa (etapa) VALUES
('Extração'),
('Tratamento'),
('Carregamento');
