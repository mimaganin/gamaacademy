-- SOMA TOTAL DE PRODUTOS EM ESTOQUE

SELECT SUM(estoque.quantidade) as quantidadeTotalEmEstoque
from estoque
