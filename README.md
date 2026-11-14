🍽️ Sistema de Gerenciamento e Análise de Dados para Restaurante (SQL)

📌 Sobre o Projeto

Este projeto é um banco de dados relacional completo desenvolvido para gerenciar e analisar as operações de um restaurante. Ele foi desenvolvido como um exercício prático de simulação durante o curso de formação em Análise de Dados. O objetivo principal é demonstrar a aplicação prática de SQL, desde a estruturação inicial das tabelas até a extração de métricas complexas de negócios (Business Intelligence).

🛠️ Tecnologias Utilizadas

Banco de Dados: MySQL

Linguagem: SQL (DDL, DML, DQL)

Conceitos Aplicados: Modelagem Relacional, Funções de Janela (Window Functions), Agregações, Lógica Condicional e Limpeza de Dados.

📂 Estrutura dos Arquivos (Scripts)

O projeto foi dividido em 5 etapas lógicas para facilitar a manutenção e leitura do código (Clean Code):

definicao.sql (Estruturação - DDL):

Criação do banco de dados restaurante.

Modelagem das tabelas principais (funcionarios, clientes, produtos, info_produtos, pedidos) utilizando chaves primárias (PK) e estrangeiras (FK) para garantir a integridade referencial.

manipulacao.sql (Alimentação - DML):

Inserção de dados realistas para simular o ambiente de produção (cadastros de clientes, cardápio, fornecedores e histórico de pedidos).

Atualização (UPDATE) e deleção (DELETE) de registros de funcionários com controle de segurança (SQL_SAFE_UPDATES).

consulta.sql (Buscas Básicas - DQL):

Consultas com filtros de datas, valores e padrões de texto (LIKE).

Paginação de resultados (LIMIT e OFFSET) e criação de tabelas de backup.

condicional_2.sql (Lógica Avançada e Tratamento):

Tratamento de valores nulos (IS NULL, IFNULL) para limpeza de dados.

Criação de colunas dinâmicas baseadas em regras de negócio usando a estrutura CASE WHEN (ex: categorização de média salarial).

agregacao_2.sql (Métricas e Insights Analíticos):

Uso de funções de agregação (COUNT, AVG, MIN, MAX) combinadas com GROUP BY para gerar relatórios gerenciais (ex: média de preço por categoria).

Aplicação do filtro HAVING para regras pós-agrupamento (ex: fornecedores com múltiplos produtos).

Criação de pódios e ranqueamento limpo utilizando Funções de Janela (ROW_NUMBER()).

🚀 Como Executar

Para testar este projeto no seu ambiente local:

Abra o MySQL Workbench (ou seu SGBD de preferência).

Execute primeiro o script definicao.sql para criar a estrutura vazia.

Execute o script manipulacao.sql para popular as tabelas.

Utilize os demais scripts (consulta, condicional_2, agregacao_2) para gerar os relatórios e extrair os insights.

### 🔗 Consultas Complexas e Relacionamento de Tabelas (multiplas_tabelas.sql)
Nesta etapa, o banco de dados foi explorado em sua totalidade, conectando múltiplas tabelas simultaneamente para extrair relatórios gerenciais avançados.
- **`INNER JOIN`**: Conexão estrita entre até 4 tabelas (`pedidos`, `clientes`, `funcionarios`, `produtos`) mantendo a integridade referencial através das chaves primárias e estrangeiras.
- **`LEFT JOIN`**: Análise de dados isolados (ex: identificação de clientes sem pedidos), combinando a junção à esquerda com a condição matemática de ausência absoluta (`WHERE ... IS NULL`).
- **Agregações em Múltiplas Tabelas**: Uso de matemática financeira interna (`quantidade * preco`), funções agregadoras (`SUM`, `COUNT`) e organização em blocos (`GROUP BY`), com tratamento de ambiguidades de colunas via apelidos (`AS`).

- ### ⚙️ Consultas Avançadas e Automação (consultas_avancadas.sql)
Nesta etapa final, o foco foi a otimização de performance, criação de rotinas automatizadas e a aplicação de programação defensiva diretamente no motor do banco de dados.
- **`CREATE VIEW` (Vitrines Virtuais)**: Encapsulamento de junções complexas (`JOIN`) e cálculos matemáticos financeiros diretos (`quantidade * preco`) em tabelas virtuais (`resumo_pedido`), simplificando e padronizando as consultas recorrentes.
- **Auditoria de Performance (`EXPLAIN`)**: Análise avançada do plano de execução do banco de dados para diagnosticar o comportamento do motor sob o capô, monitorando gargalos e varreduras em tabelas.
- **Funções e Lógica Condicional (`CREATE FUNCTION`)**: Criação de máquinas de automação e regras de negócio com declaração de variáveis (`DECLARE`), matemática agregada (`AVG`) e cardápios de decisão limpos (`CASE WHEN`).
- **Programação Defensiva (`COALESCE`)**: Aplicação de redes de proteção em cálculos de variáveis para interceptar valores nulos (`NULL`) e evitar quebras de sistema, garantindo estabilidade e segurança na extração dos dados.
