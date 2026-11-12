USE restaurante;

-- SELECT * FROM produtos;
-- SELECT * FROM info_produtos;
-- SELECT * FROM clientes;
-- SELECT * FROM funcionarios;
-- SELECT * FROM pedidos;

-- Inner Join entre produtos e info_produtos

SELECT produtos.id_produto, produtos.nome, produtos.descricao,info_produtos.ingredientes
FROM produtos
INNER JOIN info_produtos ON produtos.id_produto = info_produtos.id_produto;

-- INNER JOIN entre pedidos e clientes.

SELECT pedidos.id_pedido, pedidos.quantidade, pedidos.data_pedido, clientes.nome, clientes.email
FROM pedidos
INNER JOIN clientes ON pedidos.id_cliente = clientes.id_cliente;

-- Inner Join entre pedidos, clientes e funcionários.

SELECT pedidos.id_pedido, pedidos.quantidade, pedidos.data_pedido,
clientes.nome AS nome_cliente,  clientes.email,
funcionarios.nome As nome_funcionario
FROM pedidos
INNER JOIN clientes ON pedidos.id_cliente = clientes.id_cliente
INNER JOIN funcionarios ON pedidos.id_funcionario = funcionarios.id_funcionario;

-- Inner Join entre pedidos, clientes, funcionarios e produtos. 

SELECT pedidos.id_pedido, pedidos.quantidade, pedidos.data_pedido,
clientes.nome AS nome_cliente, clientes.email,
funcionarios.nome AS nome_funcionario,
produtos.nome AS nome_produto, produtos.preco
FROM pedidos
INNER JOIN clientes ON pedidos.id_cliente = clientes.id_cliente
INNER JOIN funcionarios ON pedidos.id_funcionario = funcionarios.id_funcionario
INNER JOIN produtos ON pedidos.id_produto = produtos.id_produto;

-- JOIN selecionando os nomes dos clientes com pedidos com status pendente.

SELECT clientes.nome, pedidos.id_pedido, pedidos.status
FROM clientes
INNER JOIN pedidos On clientes.id_cliente = pedidos.id_cliente
WHERE pedidos.status = 'Pendente'
ORDER BY pedidos.id_pedido DESC;

-- LEFT OUTER JOIN entre clientes e pedidos

SELECT clientes.nome, pedidos.id_pedido
FROM clientes
LEFT JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente
WHERE pedidos.id_pedido IS NULL;

-- Total de pedidos por cliente

SELECT clientes.nome, COUNT(pedidos.id_pedido) AS total_pedidos
FROM clientes
INNER JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente
GROUP BY clientes.nome;

-- Selecionando o preço total de cada pedido

SELECT pedidos.id_pedido, SUM(pedidos.quantidade * produtos.preco) AS total_gasto
FROM produtos
INNER JOIN pedidos ON pedidos.id_produto = produtos.id_produto
GROUP BY pedidos.id_pedido;
