CREATE DATABASE IF NOT EXISTS WiseTour;

USE WiseTour;

/* ETL */
CREATE TABLE origem_dados (
id_origem_dados INT PRIMARY KEY AUTO_INCREMENT,
titulo_arquivo_fonte VARCHAR(255) UNIQUE NOT NULL,
edicao VARCHAR(45) NOT NULL,
orgao_emissor VARCHAR(45) NOT NULL
);

CREATE TABLE pais (
id_pais INT PRIMARY KEY AUTO_INCREMENT,
pais VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE unidade_federativa_brasil (
sigla CHAR(2) PRIMARY KEY,
unidade_federativa VARCHAR(45) NOT NULL UNIQUE,
regiao VARCHAR(45)
);

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

CREATE TABLE perfil_estimado_turistas (
id_perfil_estimado_turistas INT AUTO_INCREMENT,
fk_pais_origem INT,
fk_uf_entrada CHAR(2),
ano INT NOT NULL,
mes INT NOT NULL,
quantidade_turistas INT NOT NULL,
genero VARCHAR(45),
faixa_etaria VARCHAR(45),
via_acesso VARCHAR(45) NOT NULL,
composicao_grupo_familiar VARCHAR(45),
fonte_informacao_viagem VARCHAR(45),
servico_agencia_turismo INT,
motivo_viagem VARCHAR(45) NOT NULL,
motivacao_viagem_lazer VARCHAR(45),
gasto_media_percapita_em_dolar DOUBLE NOT NULL,
CONSTRAINT FOREIGN KEY (fk_pais_origem) REFERENCES pais (id_pais),
CONSTRAINT FOREIGN KEY (fk_uf_entrada) REFERENCES unidade_federativa_brasil (sigla),
PRIMARY KEY (id_perfil_estimado_turistas, fk_pais_origem, fk_uf_entrada)
);

CREATE TABLE destino (
fk_perfil_estimado_turistas INT,
fk_pais_origem INT,
fk_uf_destino CHAR(2),
fk_uf_entrada CHAR(2),
permanencia_media DOUBLE NOT NULL,
CONSTRAINT FOREIGN KEY (fk_pais_origem) REFERENCES pais (id_pais),
    CONSTRAINT FOREIGN KEY (fk_perfil_estimado_turistas, fk_pais_origem, fk_uf_entrada)
        REFERENCES perfil_estimado_turistas (id_perfil_estimado_turistas, fk_pais_origem, fk_uf_entrada),
CONSTRAINT FOREIGN KEY (fk_uf_destino) REFERENCES unidade_federativa_brasil (sigla),
PRIMARY KEY (fk_perfil_estimado_turistas, fk_pais_origem, fk_uf_destino, fk_uf_entrada)
);

CREATE TABLE perfil_estimado_turista_origem (
    fk_origem_dados INT,
    fk_perfil_estimado_turistas INT,
    fk_pais_origem INT,
    fk_uf_entrada CHAR(2),
    data_coleta DATE NOT NULL,
    CONSTRAINT FOREIGN KEY (fk_origem_dados) REFERENCES origem_dados (id_origem_dados),
    CONSTRAINT FOREIGN KEY (fk_perfil_estimado_turistas, fk_pais_origem, fk_uf_entrada)
        REFERENCES perfil_estimado_turistas (id_perfil_estimado_turistas, fk_pais_origem, fk_uf_entrada),
    PRIMARY KEY (fk_origem_dados, fk_perfil_estimado_turistas, fk_pais_origem, fk_uf_entrada)
);

/* LOG */

CREATE TABLE etapa (
    id_etapa INT PRIMARY KEY,
    etapa VARCHAR(45) NOT NULL UNIQUE,
    CONSTRAINT chk_etapa CHECK (etapa IN ('extracao', 'tratamento', 'transformacao', 'carregamento', 'conexao_s3', 'finalizacao', 'inicializacao'))
);

INSERT INTO etapa (id_etapa, etapa) VALUES
(1, 'inicializacao'),
(2, 'conexao_s3'),
(3, 'extracao'),
(4, 'tratamento'),
(5, 'transformacao'),
(6, 'carregamento'),
(7, 'finalizacao');

CREATE TABLE log_categoria (
id_log_categoria INT PRIMARY KEY AUTO_INCREMENT,
categoria VARCHAR(45) NOT NULL UNIQUE,
CONSTRAINT chk_categoria CHECK (categoria IN('erro', 'aviso', 'sucesso', 'info'))
);

INSERT INTO log_categoria (id_log_categoria, categoria) VALUES
(1, 'erro'),
(2, 'aviso'),
(3,'sucesso'),
(4,'info');

CREATE TABLE log (
id_log INT AUTO_INCREMENT,
fk_log_categoria INT NOT NULL,
fk_etapa INT,
fk_origem_dados INT,
fk_perfil_estimado_turistas INT,
fk_pais_origem INT,
fk_uf_entrada CHAR(2),
mensagem TEXT NOT NULL,
data_hora DATETIME NOT NULL,
CONSTRAINT FOREIGN KEY (fk_origem_dados, fk_perfil_estimado_turistas, fk_pais_origem, fk_uf_entrada)
REFERENCES perfil_estimado_turista_origem (fk_origem_dados, fk_perfil_estimado_turistas, fk_pais_origem, fk_uf_entrada),
CONSTRAINT FOREIGN KEY (fk_log_categoria) REFERENCES log_categoria (id_log_categoria),
CONSTRAINT FOREIGN KEY (fk_etapa) REFERENCES etapa (id_etapa),
PRIMARY KEY (id_log, fk_log_categoria, fk_etapa)
);

/* USUÁRIO */
CREATE TABLE usuario (
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
email VARCHAR(255) NOT NULL UNIQUE,
senha CHAR(12) NOT NULL,
permissao VARCHAR(45) NOT NULL,
CONSTRAINT chk_permissao CHECK (permissao IN ('admin', 'padrao', 'wisetour'))
);

/* CONFIGURACOES E PREFERÊNCIAS DASHBOARD E SLACK */
CREATE TABLE tela_dashboard (
id_tela_dashboard INT PRIMARY KEY AUTO_INCREMENT,
tela VARCHAR(13) NOT NULL,
CONSTRAINT chk_tela CHECK (tela IN ('sazonalidade', 'perfilTurista', 'panoramaGeral'))
);

INSERT INTO tela_dashboard (tela) VALUES
('panoramaGeral'),
('perfilTurista'),
('sazonalidade');


CREATE TABLE preferencia_visualizacao_dashboard (
fk_tela_dashboard INT,
fk_usuario INT,
ativo CHAR(3) NOT NULL,
CONSTRAINT chk_ativo_preferencias_visualizacao_dashboard CHECK (ativo IN ('sim', 'nao')),
CONSTRAINT FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario),
CONSTRAINT FOREIGN KEY (fk_tela_dashboard) REFERENCES tela_dashboard (id_tela_dashboard),
PRIMARY KEY (fk_tela_dashboard, fk_usuario)
);

CREATE TABLE configuracao_slack (
  id_configuracao_slack INT,
  fk_usuario INT,
  webhook_canal_padrao VARCHAR(255) NULL,
  ativo CHAR(3) NOT NULL,
  CONSTRAINT chk_ativo CHECK (ativo IN ('sim', 'nao')),
  CONSTRAINT fk_config_usuario FOREIGN KEY (fk_usuario) REFERENCES usuario(id_usuario),
  PRIMARY KEY (id_configuracao_slack, fk_usuario)
);

CREATE TABLE tipo_notificacao_dados (
fk_etapa INT,
fk_configuracao_slack INT,
fk_usuario INT,
CONSTRAINT FOREIGN KEY (fk_etapa) REFERENCES etapa (id_etapa),
CONSTRAINT FOREIGN KEY (fk_configuracao_slack, fk_usuario) REFERENCES configuracao_slack (id_configuracao_slack, fk_usuario),
PRIMARY KEY (fk_etapa, fk_configuracao_slack, fk_usuario)
);

DELIMITER $$

CREATE TRIGGER after_insert_usuario
AFTER INSERT ON usuario
FOR EACH ROW
BEGIN
  -- Verifica se a permissão do usuário NÃO é 'wisetour'
  IF NEW.permissao <> 'wisetour' THEN

    -- Inserir preferências de visualização do dashboard (todas como 'sim')
    INSERT INTO preferencia_visualizacao_dashboard (fk_tela_dashboard, fk_usuario, ativo)
    SELECT td.id_tela_dashboard, NEW.id_usuario, 'sim'
    FROM tela_dashboard td;

    -- Inserir configuração do Slack com id igual ao id do usuário
    INSERT INTO configuracao_slack (id_configuracao_slack, fk_usuario, webhook_canal_padrao, ativo)
    VALUES (NEW.id_usuario, NEW.id_usuario, NULL, 'nao');

    -- Inserir tipos de notificações para cada etapa com a configuração do Slack recém-criada
    INSERT INTO tipo_notificacao_dados (fk_etapa, fk_configuracao_slack, fk_usuario)
    SELECT e.id_etapa, NEW.id_usuario, NEW.id_usuario
    FROM etapa e;

  END IF;
END$$

DELIMITER ;

DELIMITER ;


/* EMPRESA */

CREATE TABLE informacao_contato_cadastro (
  id_informacao_contato_cadastro INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL,
  telefone VARCHAR(11) NOT NULL,
  nome VARCHAR(255) NOT NULL,
  fidelizado VARCHAR(255) DEFAULT 'nao',
  CONSTRAINT chk_fidelizado CHECK (fidelizado IN ('sim', 'nao'))
);

CREATE TABLE historico_contato (
id_historico_contato INT AUTO_INCREMENT,
fk_informacao_contato_cadastro INT,
data_contato DATE NOT NULL,
anotacoes TEXT NOT NULL,
responsavel VARCHAR(255) NOT NULL,
CONSTRAINT FOREIGN KEY (fk_informacao_contato_cadastro) REFERENCES informacao_contato_cadastro (id_informacao_contato_cadastro),
PRIMARY KEY (id_historico_contato, fk_informacao_contato_cadastro)
);

CREATE TABLE endereco (
id_endereco INT AUTO_INCREMENT UNIQUE,
cep CHAR(8) NOT NULL,
tipo_logradouro VARCHAR(45) NOT NULL,
nome_logradouro VARCHAR(45) NOT NULL,
numero INT NOT NULL,
complemento TEXT NULL,
bairro VARCHAR(100) NOT NULL,
cidade VARCHAR(100) NOT NULL,
fk_uf_sigla CHAR(2),
CONSTRAINT FOREIGN KEY (fk_uf_sigla) REFERENCES unidade_federativa_brasil (sigla),
PRIMARY KEY (id_endereco, fk_uf_sigla)
);

CREATE TABLE empresa (
cnpj CHAR(14) UNIQUE,
nome_fanatasia VARCHAR(255),
razao_social VARCHAR(255),
fk_informacao_contato_cadastro INT,
fk_endereco INT,
fk_uf_sigla CHAR(2),
CONSTRAINT FOREIGN KEY (fk_informacao_contato_cadastro) REFERENCES informacao_contato_cadastro (id_informacao_contato_cadastro),
CONSTRAINT FOREIGN KEY (fk_endereco, fk_uf_sigla) REFERENCES endereco (id_endereco, fk_uf_sigla),
PRIMARY KEY (cnpj, fk_informacao_contato_cadastro, fk_uf_sigla, fk_endereco)
);

CREATE TABLE funcionario (
id_funcionario INT AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
cargo VARCHAR(70) NOT NULL,
telefone VARCHAR(11) NOT NULL,
fk_cnpj CHAR(14) NOT NULL,
fk_informacao_contato_cadastro INT,
fk_uf_sigla CHAR(2),
fk_endereco INT,
fk_usuario INT,
CONSTRAINT FOREIGN KEY (fk_cnpj, fk_informacao_contato_cadastro, fk_uf_sigla, fk_endereco) 
REFERENCES empresa (cnpj, fk_informacao_contato_cadastro, fk_uf_sigla, fk_endereco),
CONSTRAINT FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario),
PRIMARY KEY (id_funcionario, fk_cnpj, fk_informacao_contato_cadastro, fk_uf_sigla, fk_endereco, fk_usuario)
);

