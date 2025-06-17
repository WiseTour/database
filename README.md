# 🗄️ WiseTour - Database 📊

Sistema de **banco de dados** para análise estratégica do setor de turismo internacional no Brasil.

---

## 📋 Visão Geral

O módulo Database do WiseTour é responsável por armazenar e organizar dados turísticos oficiais do governo brasileiro, fornecendo uma base estruturada para análise estratégica por agências de turismo.

### 🎯 Objetivo
Centralizar dados sobre turismo internacional ao Brasil, possibilitando análise detalhada de:
- **Chegadas de turistas internacionais** por nacionalidade e estado
- **Meios de transporte** utilizados para entrada no país
- **Distribuição geográfica e temporal** da demanda turística

---

## 🗂️ Estrutura do Repositório

```
database/
 ├── data/          -> Fontes originais de dados
 ├── mer/           -> Modelo Entidade-Relacionamento
 ├── script/        -> Scripts de criação do banco
 └── README.md      -> Documentação
```

---

## 🛠️ Tecnologias Utilizadas

| Tecnologia | Finalidade |
|------------|------------|
| **MySQL** | Banco de dados relacional |
| **SQL** | Criação e manipulação da base |
| **MER** | Modelagem da estrutura |

---

## 📊 Fontes de Dados Oficiais

### 🏛️ Ministério do Turismo - Governo Federal

**Estimativas de Chegadas de Turistas Internacionais:**
- 🔗 [Dataset oficial](https://dados.gov.br/dados/conjuntos-dados/estimativas-de-chegadas-de-turistas-internacionais-ao-brasil)

**Estudo da Demanda Turística Internacional:**
- 🔗 [Estudo completo](https://www.gov.br/turismo/pt-br/acesso-a-informacao/acoes-e-programas/observatorio/demanda-turistica/demanda-turistica-internacional-1)

---

## 🌐 Contexto no Projeto WiseTour

Este banco de dados faz parte do **ecossistema WiseTour**, sistema completo de análise de dados turísticos composto por:

### 📦 Módulos do Projeto

| Módulo | Descrição | Repositório |
|--------|-----------|-------------|
| **WiseTour Web** | Frontend + Backend da aplicação | [wise-tour](https://github.com/WiseTour/wise-tour) |
| **ETL** | Processamento de dados | [etl](https://github.com/WiseTour/etl) |
| **Database** | Modelagem e scripts do banco (este módulo) | [database](https://github.com/WiseTour/database) |
| **Shell Scripts** | Automação da infraestrutura AWS | [shell-scripts](https://github.com/WiseTour/shell-scripts) |

### 🎯 Público-Alvo
**Agências de turismo estrangeiro** que desejam estratégias baseadas em dados para:
- Segmentação de campanhas por nacionalidade
- Análise de sazonalidade turística
- Criação de pacotes personalizados
- Decisões orientadas por dados oficiais

---

## 📈 Fluxo de Dados

```
Dados Oficiais (Excel) → AWS S3 → ETL → MySQL → Dashboard WiseTour
```

1. **Governo** publica dados em Excel
2. **Arquivos** são armazenados no S3
3. **ETL** processa e carrega no banco
4. **Database** armazena dados estruturados
5. **Dashboard** consome informações
6. **Agências** tomam decisões estratégicas

---

## 🚀 Como Usar

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/WiseTour/database.git
   cd database
   ```

2. **Execute o script de criação:**
   ```sql
   mysql -u seu_usuario -p < script/create_database.sql
   ```

3. **Configure as conexões:**
   - Atualize as credenciais nos módulos que consomem o banco
   - Configure o processo ETL para popular os dados

---

## 💡 Motivação

Projeto desenvolvido após **visita técnica à Agaxtur Viagens** com o executivo **Ricardo Braga**, identificando necessidades reais do setor:

- ❌ **Alta concorrência** entre agências
- ❌ **Dificuldade na previsão de sazonalidade**
- ❌ **Falta de dados estruturados** para decisões

- ✅ **Solução:** Transformar dados públicos em **inteligência de mercado**

---

## 📄 Licença

Projeto acadêmico desenvolvido para o **Projeto Integrador da SPTECH School**.
Todos os direitos reservados aos autores e à instituição.

> **WiseTour Database — Base sólida para insights estratégicos do turismo brasileiro.**
