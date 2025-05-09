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

INSERT INTO Usuario (email, senha, permissao)
VALUES ('admin', 'admin123', 'admin'),
('leonardo.sardinha@outlook.com', 'urubu100', 'padrao'),
('ian.medeiros@outlook.com', 'urubu100', 'padrao'),
('luana.liriel@outlook.com', 'urubu100', 'padrao'),
('kenner.lima@outlook.com', 'urubu100', 'padrao'),
('phelipe.bruione@outlook.com', 'urubu100', 'padrao'),
('samara.damaceno@outlook.com', 'urubu100', 'padrao');


INSERT INTO Informacao_Contato_Cadastro (
    email,
    telefone,
    nome,
    fidelizado
) VALUES (
    'wisetour@outlook.com',
    '000000000',
    'WiseTour',
    'Sim'
);

INSERT INTO Log_Categoria (categoria) VALUES
('Erro'),
('Aviso'),
('Sucesso');

INSERT INTO Etapa (etapa) VALUES
('Extração'),
('Tratamento'),
('Carregamento');
