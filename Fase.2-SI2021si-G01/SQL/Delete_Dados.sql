-- A eliminação tem de ser feita em ordem contrária a inserção e separada por tabelas.

drop view vwlote;

delete from lote;

delete from pagamento;

delete from detalheencomenda;

delete from encomenda;

delete from produto;

delete from cliente;



