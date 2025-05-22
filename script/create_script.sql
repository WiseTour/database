CREATE DATABASE IF NOT EXISTS WiseTour;

USE WiseTour;

CREATE TABLE unidade_federativa_brasil (
sigla CHAR(2) PRIMARY KEY,
unidade_federativa VARCHAR(45) NOT NULL UNIQUE,
regiao VARCHAR(45)
);

/* ETL */
CREATE TABLE fonte_dados (
id_fonte_dados INT PRIMARY KEY AUTO_INCREMENT,
titulo_arquivo_fonte VARCHAR(255) UNIQUE NOT NULL,
edicao VARCHAR(45) NOT NULL,
orgao_emissor VARCHAR(45) NOT NULL,
url_origem TEXT NOT NULL,
data_coleta DATE NOT NULL,
observacoes TEXT
);

CREATE TABLE pais (
id_pais INT PRIMARY KEY AUTO_INCREMENT,
pais VARCHAR(100) NOT NULL UNIQUE
);

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
gasto_media_percapita_em_reais DOUBLE NOT NULL,
CONSTRAINT FOREIGN KEY (fk_pais_origem) REFERENCES pais (id_pais),
CONSTRAINT FOREIGN KEY (fk_uf_entrada) REFERENCES unidade_federativa_brasil (sigla),
PRIMARY KEY (id_perfil_estimado_turistas, fk_pais_origem, fk_uf_entrada)
);

CREATE TABLE perfil_estimado_turista_fonte (
    fk_fonte INT,
    fk_perfil_estimado_turistas INT,
    fk_pais_origem INT,
    fk_uf_entrada CHAR(2),
    CONSTRAINT FOREIGN KEY (fk_fonte) REFERENCES fonte_dados (id_fonte_dados),
    CONSTRAINT FOREIGN KEY (fk_perfil_estimado_turistas, fk_pais_origem, fk_uf_entrada)
        REFERENCES perfil_estimado_turistas (id_perfil_estimado_turistas, fk_pais_origem, fk_uf_entrada),
    PRIMARY KEY (fk_fonte, fk_perfil_estimado_turistas, fk_pais_origem, fk_uf_entrada)
);

CREATE TABLE destinos (
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

/* LOG */

CREATE TABLE etapa (
id_etapa INT PRIMARY KEY AUTO_INCREMENT,
etapa VARCHAR(45) NOT NULL,
CONSTRAINT chk_etapa CHECK (etapa IN ('extracao', 'tratamento', 'carregamento'))
);

CREATE TABLE log_categoria (
id_log_categoria INT PRIMARY KEY AUTO_INCREMENT,
categoria VARCHAR(45) NOT NULL,
CONSTRAINT chk_categoria CHECK (categoria IN('erro', 'aviso', 'sucesso'))
);

CREATE TABLE log (
id_log INT AUTO_INCREMENT,
fk_fonte INT,
fk_log_categoria INT,
fk_etapa INT,
mensagem TEXT NOT NULL,
data_hora DATETIME NOT NULL,
quantidade_lida INT NULL,
quantidade_inserida INT NULL,
tabela_destino VARCHAR(45) NULL,
CONSTRAINT FOREIGN KEY (fk_fonte) REFERENCES fonte_dados (id_fonte_dados),
CONSTRAINT FOREIGN KEY (fk_log_categoria) REFERENCES log_categoria (id_log_categoria),
CONSTRAINT FOREIGN KEY (fk_etapa) REFERENCES etapa (id_etapa),
PRIMARY KEY (id_log, fk_fonte, fk_log_categoria, fk_etapa)
);

/* USUÁRIO */

CREATE TABLE usuario (
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
email VARCHAR(255) NOT NULL UNIQUE,
senha CHAR(12) NOT NULL,
permissao VARCHAR(45) NOT NULL,
CONSTRAINT chk_permissao CHECK (permissao IN ('admin', 'padrao', 'gerente'))
);

/* CONFIGURACOES E PREFERÊNCIAS DASHBOARD E SLACK */

CREATE TABLE configuracao_slack (
id_configuracao_slack INT AUTO_INCREMENT,
fk_usuario INT,
slack_user_id VARCHAR(45) NULL,
slack_username VARCHAR(255) NULL,
canal_padrao VARCHAR(255) NULL,
ativo CHAR(3) NOT NULL,
CONSTRAINT chk_ativo CHECK (ativo IN ('sim', 'nao')),
CONSTRAINT FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario),
PRIMARY KEY (id_configuracao_slack, fk_usuario)
);

CREATE TABLE tipo_notificacao_dados (
fk_log_categoria INT,
fk_configuracao_slack INT,
fk_usuario INT,
CONSTRAINT FOREIGN KEY (fk_log_categoria) REFERENCES log_categoria (id_log_categoria),
CONSTRAINT FOREIGN KEY (fk_configuracao_slack, fk_usuario) REFERENCES configuracao_slack (id_configuracao_slack, fk_usuario),
PRIMARY KEY (fk_log_categoria, fk_configuracao_slack, fk_usuario)
);

CREATE TABLE preferencias_visualizacao_dashboard (
id_preferencias_visualizacao_dashboard INT AUTO_INCREMENT,
fk_usuario int,
ativo CHAR(3) NOT NULL,
CONSTRAINT chk_ativo_preferencias_visualizacao_dashboard CHECK (ativo IN ('sim', 'nao')),
CONSTRAINT FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario),
PRIMARY KEY (id_preferencias_visualizacao_dashboard, fk_usuario)
);

CREATE TABLE tela_dashboard (
id_tela_dashboard INT AUTO_INCREMENT,
fk_preferencias_visualizacao_dashboard INT,
fk_usuario INT,
tela VARCHAR(13) NOT NULL,
ativo CHAR(3) NOT NULL,
CONSTRAINT chk_tela CHECK (tela IN ('sazonalidade', 'perfilTurista', 'panoramaGeral')),
CONSTRAINT chk_ativo_tela_dashboard CHECK (ativo IN ('sim', 'nao')),
CONSTRAINT FOREIGN KEY (fk_preferencias_visualizacao_dashboard, fk_usuario) REFERENCES preferencias_visualizacao_dashboard (id_preferencias_visualizacao_dashboard, fk_usuario),
PRIMARY KEY (id_tela_dashboard, fk_preferencias_visualizacao_dashboard, fk_usuario)
);

/* EMPRESA */

CREATE TABLE informacao_contato_cadastro (
id_informacao_contato_cadastro INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(255) NOT NULL,
telefone VARCHAR(11) NOT NULL,
nome VARCHAR(255) NOT NULL,
fidelizado VARCHAR(255),
CONSTRAINT chk_fidelizado CHECK (fidelizado IN ('sim', 'nao'))
);

CREATE TABLE historico_contato (
id_historico_contato INT PRIMARY KEY AUTO_INCREMENT,
data_contato DATE NOT NULL,
anotacoes TEXT NOT NULL,
responsavel VARCHAR(255) NOT NULL,
fk_informacao_contato_cadastro INT,
CONSTRAINT FOREIGN KEY (fk_informacao_contato_cadastro) REFERENCES informacao_contato_cadastro (id_informacao_contato_cadastro)
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
fk_informacao_contato_cadastro INT,
fk_endereco INT,
fk_uf_sigla CHAR(2),
CONSTRAINT FOREIGN KEY (fk_informacao_contato_cadastro) REFERENCES informacao_contato_cadastro (id_informacao_contato_cadastro),
CONSTRAINT FOREIGN KEY (fk_uf_sigla) REFERENCES unidade_federativa_brasil (sigla),
CONSTRAINT FOREIGN KEY (fk_endereco) REFERENCES endereco (id_endereco),
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
CONSTRAINT FOREIGN KEY (fk_endereco, fk_cnpj, fk_informacao_contato_cadastro, fk_uf_sigla) REFERENCES empresa (fk_endereco, cnpj, fk_informacao_contato_cadastro, fk_uf_sigla),
CONSTRAINT FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario),
PRIMARY KEY (id_funcionario, fk_cnpj, fk_informacao_contato_cadastro, fk_uf_sigla, fk_endereco, fk_usuario)
);

