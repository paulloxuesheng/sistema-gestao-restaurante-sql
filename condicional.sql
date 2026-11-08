USE restaurante;

-- SELECT * FROM pedidos;

SELECT * FROM pedidos WHERE id_funcionario = 4 AND `status` = 'Pendente';

SELECT * FROM pedidos WHERE `status` <> 'Concluído';

SELECT * FROM pedidos WHERE id_produto IN(1, 3, 5, 7, 8);

SELECT * FROM clientes WHERE nome like 'C%';

SELECT * FROM info_produtos WHERE (ingredientes LIKE '%carne%' OR ingredientes LIKE '%frango%');

SELECT * FROM produtos WHERE preco BETWEEN 20 AND 30;

UPDATE pedidos SET `status` = NULL WHERE id_pedido = 6;

SELECT * FROM pedidos WHERE `status` IS NULL;

SELECT id_pedido, IFNUll(`status`, 'Cancelado') AS status_tratado FROM pedidos;

SELECT 
  nome,
  cargo, 
  salario,
CASE
  WHEN salario > 3000 THEN 'Acima da média'
  ELSE 'Abaixo da média'
 END AS media_salario
FROM funcionarios;

