USE restaurante;

-- SELECT * FROM clientes;
-- SELECT * FROM funcionarios;
-- SELECT * FROM info_pedidos;
-- SELECT * FROM pedidos;
-- SELECT * FROM produtos;

-- Criando View resumo_pedido

CREATE VIEW resumo_pedido AS
SELECT pe.id_pedido, pe.quantidade, pe.data_pedido, 
c.nome AS nome_cliente, c.email, 
f.nome AS nome_funcionario,
pr.nome AS nome_produto, pr.preco
FROM pedidos pe 
JOIN clientes c ON pe.id_cliente = c.id_cliente
JOIN funcionarios f ON pe.id_funcionario = f.id_funcionario
JOIN produtos pr ON  pe.id_produto = pr.id_produto;

-- SELECT * FROM resumo_pedido;

SELECT id_pedido, nome_cliente, SUM(quantidade * preco) AS preco_total
FROM resumo_pedido
GROUP BY id_pedido, nome_cliente;

-- Atualização da View resumo_pedido, campo total

CREATE OR REPLACE VIEW resumo_pedido AS
SELECT pe.id_pedido, pe.quantidade, pe.data_pedido, 
c.nome AS nome_cliente, c.email, 
f.nome AS nome_funcionario,
pr.nome AS nome_produto, pr.preco, pe.quantidade * pr.preco AS total
FROM pedidos pe 
JOIN clientes c ON pe.id_cliente = c.id_cliente
JOIN funcionarios f ON pe.id_funcionario = f.id_funcionario
JOIN produtos pr ON  pe.id_produto = pr.id_produto;

SELECT id_pedido, nome_cliente, total
FROM resumo_pedido;

EXPLAIN SELECT id_pedido, nome_cliente, total
FROM resumo_pedido;

-- Criando função BuscaIngredientesProduto
-- SELECT * FROM info_produtos;

DELIMITER //
CREATE FUNCTION BuscaIngredientesProduto (id_produto_entrada INT) 
RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
  DECLARE ingredientes_resultado VARCHAR(255); -- Criando a variável
  SELECT ingredientes INTO ingredientes_resultado FROM info_produtos WHERE id_info = id_produto_entrada;
  RETURN ingredientes_resultado;
END //
DELIMITER ;

-- Testando a função BuscaIngredientesProduto

Select BuscaIngredientesProduto(10);

-- Criando a função mediapedido
-- SELECT * FROM resumo_pedido;

DELIMITER //
CREATE FUNCTION mediapedido(id_pedido_entrada INT)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
  DECLARE valor_pedido DECIMAL(10,2);  -- Para guardar o valor do pedido.
  DECLARE valor_media DECIMAL(10,2);   -- Para a media de todos os pedidos.
  DECLARE mensagem_final VARCHAR(100);  -- Para a mensagem final após comparar os dois valores.
  
  SELECT COALESCE(total, 0) INTO valor_pedido FROM resumo_pedido WHERE id_pedido = id_pedido_entrada;
  SELECT AVG(total) INTO valor_media FROM resumo_pedido;
  
  SET mensagem_final =
  CASE
      WHEN valor_pedido > valor_media THEN 'Acima'
      WHEN valor_pedido < valor_media THEN 'Abaixo'
      ELSE 'Igual'
  END;
  
  RETURN mensagem_final;
  
END //

DELIMITER ;

-- Executando a função mediapedido

SELECT mediapedido(5);
SELECT mediapedido(6);

