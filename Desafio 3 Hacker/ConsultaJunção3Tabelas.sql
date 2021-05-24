-- JUNÇÃO ENTRE AS TABELAS CLIENTES, ENDEREÇOS E CIDADESESTADOS

SELECT * FROM clientes
Inner join enderecos
on clientes.id = enderecos.cliente
inner join cidadesestados
on enderecos.cidadesestados = cidadesestados.id
