USE TechSales;

SELECT @@VERSION;


-- REALIZANDO CONSULTAS NO BANCO DE DADOS 'TechSales'; 


/*listando o nome dos produtos e os precos, que constam na categoria 'monitores'*/

SELECT * FROM produtos;

SELECT produto,preco FROM produtos
WHERE categoria_produto = 'MONITORES';
GO


CREATE VIEW categoria_monitores AS 
SELECT produto,preco FROM produtos
WHERE categoria_produto = 'MONITORES';
GO;

SELECT * FROM categoria_monitores;


/* calculando o valor total de cada venda utilizando JOIN e SUM */

SELECT * FROM tabela_vendas;
SELECT * FROM tabela_item_vendas;

SELECT i.id_venda, SUM(i.preco_unitario * i.quantidade) AS Valor_total_venda
FROM tabela_vendas v 
INNER JOIN tabela_item_vendas i 
ON v.id_venda = i.id_venda
GROUP BY i.id_venda;


/* filtrando os clientes que residem no estado de São Paulo */

SELECT * FROM tabela_clientes;

WITH clientes_SP AS(
SELECT nome,email 
	FROM tabela_clientes
WHERE estado = 'SP')
SELECT * FROM clientes_SP;



/* *ordenando os produtos por preço de forma decrescente*/ 

SELECT TOP 5 * FROM produtos;

SELECT produto,preco FROM produtos
ORDER BY preco DESC;


/* filtrando vendas com valor total superior a 1000 utilizando HAVING */

SELECT i.id_venda,SUM(i.preco_unitario * i.quantidade) AS Valor_total
FROM tabela_vendas v
JOIN tabela_item_vendas i
ON v.id_venda = i.id_venda
GROUP BY i.id_venda
HAVING SUM(i.preco_unitario * i.quantidade) > 1000
ORDER BY Valor_total DESC;


/* encontrando produtos com preço superior à média geral utilizando subconsulta */

SELECT * FROM produtos;

SELECT produto,preco FROM produtos
WHERE preco > (SELECT AVG(preco) AS preco_medio FROM produtos);

-- UTILIZANDO O MÉTODO COALESCE

SELECT *,COALESCE(CAST(preco AS VARCHAR(250)),'Não identificado') AS preco FROM produtos;


/* classificando produtos por faixa de preço utilizando CASE */

SELECT produto,preco,
(CASE 
WHEN preco > 100 THEN 'Produto Premium'
ELSE 'Produto Standard' END) AS categoria_produto
FROM produtos;

SELECT produto,preco,
CASE
WHEN preco > 100 THEN 'Produto Premium'
ELSE 'Produto Standard' 
END AS categoria_produto
FROM produtos;



/* listando todos os clientes e suas vendas utilizando LEFT JOIN */

SELECT TOP 5 * FROM dbo.tabela_clientes;
SELECT TOP 5 * FROM dbo.tabela_vendas;

SELECT v.id_venda,c.nome 
FROM dbo.tabela_clientes c 
LEFT JOIN dbo.tabela_vendas v 
ON c.id_cliente = v.id_cliente;


/* encontrando a ordem de preços dos produtos utilizando ROW_NUMBER */ 

SELECT produto,preco,
ROW_NUMBER() OVER(ORDER BY preco DESC) AS posicao
FROM produtos;


