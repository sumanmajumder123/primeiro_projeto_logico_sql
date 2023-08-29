USE ecommerce;

-- Produtos do Fornecedor 1 ordenado por valor
SELECT Pname AS Produto, category AS Categoria, Pdescription AS Descrição, Pvalue AS Valor
    FROM productSupplier, product 
    WHERE idPsSupplier = 1 AND idPsProduct = idProduct
    ORDER BY Pvalue;

-- Total de produtos agrupados por local de armazenamento onde o total é maior que 2, o que exclui o armazenamento 3
SELECT locations AS Localização, COUNT(idLproduct) AS 'Total de produtos'
    FROM productStorage
    GROUP BY locations
    HAVING COUNT(idLproduct) > 2;

-- Total de pedidos feitos por cada cliente em resposta a "Quantos pedidos foram feitos por cada cliente?"
SELECT c.cName AS Cliente, COUNT(o.idOrder) AS 'Total de pedidos'
    FROM clients c
    LEFT JOIN orders o ON c.idClient = o.idOrderClient
    GROUP BY c.cName;

-- Verificando se algum vendedor também é fornecedor em resposta a "Algum vendedor também é fornecedor?"
SELECT CONCAT(se.SocialName, ' tambem é o ', su.SocialName) AS 'Vendedor/Fornecedor'
    FROM seller se, supplier su
    WHERE se.CNPJ = su.CNPJ;

-- Relação de produtos de cada fornecedor relacionado ao nome do produto e seus respectivos estoques em resposta a "Relação de produtos fornecedores e estoques;" e "Relação de nomes dos fornecedores e nomes dos produtos;"
SELECT SocialName AS Fornecedor, Pname AS Produto, quantity AS Quantidade
    FROM productSupplier, supplier, product
    WHERE idPsSupplier = idSupplier AND idPsProduct = idProduct;

-- Total gasto por cliente na loja desconsiderando o valor do frete e compras canceladas
SELECT c.cName AS Cliente, ROUND(SUM(Pvalue * poQuantity),2) AS 'Total gasto'
    FROM clients c
    LEFT JOIN orders o ON c.idClient = o.idOrderClient AND orderStatus <> 'Cancelado'
    LEFT JOIN productOrder po ON po.idPOorder = o.idOrder
    LEFT JOIN product p ON po.idPOproduct = p.idProduct
    GROUP BY c.cName;
