USE restaurante;

-- SELECT COUNT(*) FROM pedidos;

-- SELECT * FROM pedidos; -- id_cliente registra quem comprou.

SELECT COUNT(DISTINCT id_cliente) FROM pedidos;

-- SELECT * FROM produtos;

SELECT AVG(preco) FROM produtos;

SELECT MIN(preco), MAX(preco) FROM produtos;

-- SELECT nome, preco, RANK() OVER (ORDER BY preco DESC) AS 'ranking' FROM produtos LIMIT 5;

SELECT nome, preco, ROW_NUMBER() OVER (ORDER BY preco DESC) AS 'ranking' FROM produtos LIMIT 5;

SELECT categoria, AVG(preco) FROM produtos GROUP BY categoria;

-- SELECT * FROM info_produtos;

SELECT fornecedor, COUNT(id_produto) FROM info_produtos GROUP BY fornecedor;

SELECT fornecedor, COUNT(id_produto) FROM info_produtos GROUP BY fornecedor HAVING COUNT(id_produto) > 1;

-- SELECT * FROM pedidos;

SELECT id_cliente, COUNT(id_pedido) FROM pedidos GROUP BY id_cliente HAVING COUNT(id_pedido) = 1;

