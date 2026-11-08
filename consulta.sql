USE restaurante;

SELECT nome, categoria FROM produtos WHERE preco > 30;

SELECT nome, telefone, data_nascimento FROM clientes WHERE data_nascimento < '1985-01-01';

SELECT id_produto, ingredientes FROM info_produtos WHERE ingredientes LIKE '%carne%';

SELECT nome, categoria FROM produtos ORDER BY categoria ASC, nome ASC;

SELECT nome, preco FROM produtos ORDER BY preco DESC LIMIT 5;

SELECT nome, categoria FROM produtos WHERE categoria = 'Prato Principal' LIMIT 2 OFFSET 5;

CREATE TABLE backup_pedidos AS SELECT * FROM pedidos;
 
-- DESC pedidos;
-- DESC backup_pedidos;

-- SELECT * FROM pedidos;
-- SELECT * FROM backup_pedidos;



