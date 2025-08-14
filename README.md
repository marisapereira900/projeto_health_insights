# Desafio Final: Solução de Dados para a "Health Insights Brasil"

## 1. Introdução

Este projeto simula uma solução de Engenharia de Dados para a **Health Insights Brasil**, uma startup que busca tornar os dados públicos de saúde (DataSUS) mais acessíveis e acionáveis. O objetivo foi projetar e implementar uma pipeline completa que ingere, transforma e modela dados do SINASC (Sistema de Informações sobre Nascidos Vivos) para criar uma fonte de dados confiável e pronta para análise.

A solução utiliza **Databricks** como plataforma de processamento e armazenamento, e **dbt** para gerenciar as transformações de dados.

## 2. Arquitetura da Solução

A arquitetura do projeto segue um padrão de Star Schema para modelagem dimensional, permitindo análises eficientes e escaláveis. A pipeline de dados é composta pelas seguintes etapas:

* **Fonte de Dados**: A base de dados bruta `sinasc_2022_sc` (DataSUS, referente a nascimentos em Santa Catarina em 2022).
* **Camada de Staging (dbt `staging`)**: Limpeza e padronização inicial dos dados. O modelo `stg_nascidos_vivos` seleciona as colunas relevantes e realiza transformações básicas.
* **Camada Intermediária (dbt `intermediate`)**: Junção e enriquecimento dos dados.
* **Camada de Marts (dbt `marts`)**: Construção do modelo dimensional (Star Schema), com a criação das tabelas de fato e dimensão prontas para consumo.

## 3. Tecnologias Utilizadas

* **Databricks**: Plataforma unificada de dados e IA.
* **Delta Lake**: Camada de armazenamento com transações ACID e otimizações de performance.
* **dbt (Data Build Tool)**: Ferramenta para gerenciar as transformações SQL.

## 4. Modelagem Dimensional e Transformações

O modelo segue o padrão Star Schema:

* **`fato_nascimento`**: Contém eventos de nascimento.
    * **Chave Primária (`nascimento_id`)**: Gerada com `dbt_utils.generate_surrogate_key`.
    * **Tratamento de Nulos**: Uso de `COALESCE` para valores padrão.
* **`dim_localidade`**: Informações sobre municípios.
* **`dim_tempo`**: Datas detalhadas dos nascimentos.

## 5. Qualidade dos Dados e Testes

Testes implementados no dbt:

* **`unique`**: Para chaves primárias.
* **`not_null`**: Para colunas críticas.
* **`accepted_values`**: Para validar domínios (ex.: `sexo`).

## 6. Recursos Avançados do Databricks (Delta Lake)

* **Histórico da Tabela**: `DESCRIBE HISTORY <nome_da_tabela>`.
* **Time Travel**: `SELECT * FROM <tabela> VERSION AS OF 0`.

## 7. Como Rodar o Projeto

1. **Instale** o dbt e o conector Databricks.
2. **Configure** o arquivo `profiles.yml` (veja seção 9).
3. **Execute**:
   ```bash
   dbt deps
   dbt run
   dbt test
   ```

## 8. Documentação

A documentação completa dos modelos, colunas e testes do projeto pode ser acessada através do dbt docs.

**[Link para o dbt docs gerado](http://localhost:8080)**

## 9. Acesso ao Servidor e Configuração

Para executar o projeto no mesmo ambiente:

1. Acesse o workspace do Databricks:  
   ```
   https://adb-<workspace-id>.<region>.azuredatabricks.net
   ```

2. Conecte-se ao SQL Warehouse ou Cluster configurado para este projeto.  

3. Configure o `profiles.yml` do dbt com os dados de conexão:

   ```yaml
   my_project:
     target: dev
     outputs:
       dev:
         type: databricks
         catalog: hive_metastore
         schema: default
         host: https://adb-<workspace-id>.<region>.azuredatabricks.net
         http_path: /sql/1.0/warehouses/<warehouse-id>
         token: <seu-personal-access-token>
   ```

4. Certifique-se de que as tabelas de dados brutos (`sinasc_2022_sc` ou `sinasc_2022_sc_clean`) estão disponíveis no schema configurado.

---

## 10. Exemplo de Consulta e Insight

A pipeline de dados modelada no dbt permite a extração de insights relevantes sobre os nascimentos em Santa Catarina de 2022. A seguir, um exemplo de consulta SQL que pode ser utilizada por analistas ou dashboards de BI para identificar padrões importantes na saúde pública.

*Insight*: Identificação da Taxa de Nascimentos de Baixo Peso por Município

Um dos indicadores mais importantes da saúde de recém-nascidos é o peso ao nascer. Bebês com baixo peso (geralmente abaixo de 2.500 gramas) estão mais vulneráveis a problemas de saúde. A consulta abaixo identifica a taxa de nascimentos de baixo peso por município, permitindo que a Health Insights Brasil direcione esforços para as áreas com maior necessidade.

WITH nascimentos_municipio AS (
    SELECT
        l.local_nascimento AS municipio,
        COUNT(f.nascimento_id) AS total_nascimentos,
        SUM(CASE WHEN f.peso < 2500 THEN 1 ELSE 0 END) AS total_baixo_peso
    FROM
        {{ ref('fato_nascimento') }} AS f
    JOIN
        {{ ref('dim_localidade') }} AS l
    ON
        f.cod_municipio = l.cod_municipio
    GROUP BY
        l.local_nascimento
)

SELECT
    municipio,
    total_nascimentos,
    total_baixo_peso,
    (total_baixo_peso * 100.0 / total_nascimentos) AS taxa_baixo_peso_percentual
FROM
    nascimentos_municipio
WHERE
    total_nascimentos > 100 -- Filtro para municípios com volume significativo de nascimentos
ORDER BY
    taxa_baixo_peso_percentual DESC;

*Resultado e Relevância*

Esta consulta gera uma tabela que lista os municípios com a maior proporção de nascimentos de baixo peso. Essa informação é crucial para a saúde pública, pois:

- Identifica áreas geográficas que podem necessitar de mais recursos e atenção pré-natal.
- Ajuda a monitorar a eficácia de políticas de saúde materna e infantil.
- Permite a criação de dashboards dinâmicos que alertam sobre picos anormais de nascimentos de baixo peso.

👤 **Autor**: [Marisa Pereira de Souza](https://www.linkedin.com/in/marisapereiradesouza)  
