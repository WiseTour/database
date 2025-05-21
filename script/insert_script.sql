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
    'contato@wisetour.com.br', '(11) 3000-0000', 'joão', 'Sim'
);

-- 3. Empresa
INSERT INTO Empresa (
    cnpj, nome_fantasia, razao_social, data_abertura, natureza_juridica,
    porte, capital_social, opcao_mei, opcao_simples, opcao_simples_exclusao,
    opcao_mei_exclusao, situacao_cadastral, tipo, fk_informacao_contato_cadastro, fk_uf_sigla
) VALUES (
    '12345678000199', 'WiseTour Brasil', 'WiseTour Análise e Sistemas Ltda', '2020-01-10',
    'Sociedade Empresária Limitada', 'Pequeno', 50000.00, 'Não', 'Sim', NULL, NULL,
    'Ativa', 'Matriz', 1, 'SP'
);

-- 4. Funcionários (sem FKs)
INSERT INTO Funcionario (
    nome, cargo, data_admissao, salario
) VALUES
('Leonardo Sardinha', 'Analista de Sistemas', '2023-02-01', 5500.00),
('Juliana Alves', 'Gerente de Projetos', '2022-08-15', 7200.00);

-- 5. Usuários com TODAS as FKs
INSERT INTO Usuario (
    login, senha, permissao, fk_id_funcionario, fk_cnpj, fk_uf_sigla, fk_informacao_contato_cadastro
) VALUES
('leonardo.sardinha', 'senha123', 'ADMIN', 1, '12345678000199', 'SP', 1),
('juliana.alves', 'senha456', 'PADRAO', 2, '12345678000199', 'SP', 1);

INSERT INTO Log_Categoria (categoria) VALUES
('Erro'),
('Aviso'),
('Sucesso');

INSERT INTO Etapa (etapa) VALUES
('Extração'),
('Tratamento'),
('Carregamento');
