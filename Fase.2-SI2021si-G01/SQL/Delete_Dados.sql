-- A elimina��o tem de ser feita em ordem contr�ria a inser��o e separada por tabelas.

drop view vwlote;

delete from lote;

delete from pagamento;

delete from detalheencomenda;

delete from encomenda;

delete from produto;

delete from cliente;



