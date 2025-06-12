-- 1. Clientes com pelo menos um pedido > R$100 (usando IN)
SELECT nome
FROM clientes
WHERE id_cliente IN (
SELECT id_cliente
FROM pedidos
WHERE valor > 100
);
GO
-- 2. Clientes com pedidos acima da m�dia
SELECT nome
FROM clientes
WHERE id_cliente IN (
	SELECT id_cliente
	FROM pedidos
	WHERE valor > (
		SELECT AVG(valor)
		FROM pedidos
)
);
GO
-- 3. Clientes que ainda n�o fizeram nenhum pedido,
SELECT nome
FROM clientes
WHERE id_cliente NOT IN (
SELECT id_cliente
FROM pedidos
);
GO
-- 4. Nome dos clientes e valor do maior pedido (subconsulta no SELECT)
SELECT nome,
(SELECT MAX(valor)
FROM pedidos
WHERE pedidos.id_cliente = clientes.id_cliente) AS maior_pedido
FROM clientes;
GO
-- 5. Nome dos clientes e soma dos valores de seus pedidos
SELECT nome,
(SELECT SUM(valor)
FROM pedidos
WHERE pedidos.id_cliente = clientes.id_cliente) AS total_pedidos
FROM clientes;
GO
-- 6. Cidades com pelo menos um cliente que fez pedido (com EXISTS), que faz uma consulta que mostra algo, como a cidade que possui muitos pedidos sem repetir a consulta
SELECT DISTINCT cidade
FROM clientes c
WHERE EXISTS (
SELECT 1
FROM pedidos p
WHERE p.id_cliente = c.id_cliente
);
GO
-- 7. Clientes com mais de um pedido (com COUNT)
SELECT nome
FROM clientes
WHERE (
SELECT COUNT(*)
FROM pedidos
WHERE pedidos.id_cliente = clientes.id_cliente) > 1;
-- 8. Clientes com pedidos exatamente iguais � m�dia dos pedidos
SELECT nome
FROM clientes
WHERE id_cliente IN (
SELECT id_cliente
FROM pedidos
WHERE valor = (
SELECT AVG(valor)
FROM pedidos
)
);
GO
-- 9. Cidades onde o maior valor de pedido de um cliente da cidade � > R$150
SELECT cidade
FROM clientes
WHERE (
SELECT MAX(valor)
FROM pedidos
WHERE pedidos.id_cliente = clientes.id_cliente
) > 150;
-- 10. Nome de cada cliente com valor do pedido mais recente (usando TOP 1)
SELECT nome,
(SELECT TOP 1 valor
FROM pedidos p
WHERE p.id_cliente = c.id_cliente
ORDER BY data_pedido DESC) AS pedido_mais_recente
FROM clientes c;
GO