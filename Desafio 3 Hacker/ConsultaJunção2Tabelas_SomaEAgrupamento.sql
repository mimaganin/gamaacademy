-- JUNÇÃO DE DUAS TABELAS COM OPERAÇÃO DE SOMA -- (SOMA DO PREÇO DOS PRODUTOS POR DEPARTAMENTO)

SELECT SUM(produtos.preco) as SomaPrecosProdutos, departamentos.nome
from produtos
inner join departamentos
on produtos.departamentoid = departamentos.id
group by departamentos.id; 