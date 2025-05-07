# Database WiseTour

Este repositório contém o banco de dados **WiseTour**, que inclui o **script de criação** do banco de dados, o **Modelo Entidade-Relacionamento (MER)** e as **fontes originais de dados** relacionadas à demanda turística internacional ao Brasil.

O processo de **ETL** (Extração, Transformação e Carga) é gerenciado em um repositório separado.

---

## 🌐 Fontes de Dados

### 1. **Estimativas de Chegadas de Turistas Internacionais ao Brasil**

Este conjunto de dados contém estimativas detalhadas sobre a chegada de turistas internacionais ao Brasil. As informações são fundamentais para entender a dinâmica do turismo no país.

- **Link para o conjunto de dados:**  
  [Estimativas de Chegadas de Turistas Internacionais ao Brasil](https://dados.gov.br/dados/conjuntos-dados/estimativas-de-chegadas-de-turistas-internacionais-ao-brasil)

---

### 2. **Estudo da Demanda Turística Internacional**

O estudo detalha a demanda turística internacional para o Brasil, com foco em identificar tendências de fluxo de turistas e seus fatores influentes.

- **Link para o estudo completo:**  
  [Estudo da Demanda Turística Internacional](https://www.gov.br/turismo/pt-br/acesso-a-informacao/acoes-e-programas/observatorio/demanda-turistica/demanda-turistica-internacional-1)

---

## 🛠️ Tecnologias Utilizadas

- **MySQL** (banco de dados relacional)
- **SQL** (para criação e manipulação da base de dados)
- **Modelo Entidade-Relacionamento (MER)** (para modelagem da estrutura do banco de dados)

---

## 🗂️ Conteúdo do Repositório

Este repositório contém:

- **Script de Criação do Banco de Dados**: Arquivos SQL para criação da base de dados.
- **Modelo Entidade-Relacionamento (MER)**: Diagrama de entidades e seus relacionamentos.
- **Fontes Originais**: Dados brutos utilizados para criar a base de dados.

O **processo ETL** para importar e transformar esses dados está localizado em um repositório separado. Para mais detalhes sobre o processo de ETL, consulte o repositório [WiseTour ETL](https://github.com/WiseTour/etl).

---

## 📊 Objetivo

O banco de dados **WiseTour** é projetado para centralizar dados sobre o turismo internacional ao Brasil, possibilitando uma análise detalhada da demanda turística. Ele serve como base para visualizações, relatórios e insights para o setor de turismo.

---

## 🚀 Como Usar

1. Clone este repositório para o seu ambiente local:
   ```bash
   git clone https://github.com/seu-usuario/wiseTour-database.git
