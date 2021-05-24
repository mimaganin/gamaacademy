-- VALOR TOTAL DO PREÇO DOS PRODUTOS DISPONÍVEIS EM ESTOQUE

SELECT SUM(produtos.preco) as valorTotalDosProdutos
from produtos
where produtos.disponivel = "sim"
