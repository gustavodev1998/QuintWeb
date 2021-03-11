-- EXE 7
	A)
-- Alinea A.1) 
select nomecliente, email, telemovel, morada from cliente
where tipocliente = 'individual' and idcliente = 100005;

 -- Alinea B.1) 
select nomecliente, designaproduto from cliente as c, produto as p
join detalheencomenda as d on d.idproduto = p.idproduto 
join encomenda as e on d.idencomenda = e.idencomenda
where p.designaproduto = 'Batatas' and (e.dataencomenda between '01/01/2019' and '31/12/2019') and c.idcliente = e.idcliente
except (select nomecliente, designaproduto from cliente as c, produto as p
join detalheencomenda as d on d.idproduto = p.idproduto 
join encomenda as e on d.idencomenda = e.idencomenda
where e.dataencomenda >= '01/01/2020' and p.designaproduto = 'Batatas' and c.idcliente = e.idcliente);

-- Alinea C Alternativa I) 
select f.designaproduto, f.maiorDesigna from (
(select max(t.maior) as maiorDesigna 
	from (select p.designaproduto, sum(quantidade) as maior from produto as p
	join detalheencomenda as d on d.idproduto = p.idproduto 
	join encomenda as e on d.idencomenda = e.idencomenda
	group by p.designaproduto) as t) as w
	
	join (select p.designaproduto, sum(quantidade) as maior from produto as p
		join detalheencomenda as d on d.idproduto = p.idproduto 
		join encomenda as e on d.idencomenda = e.idencomenda
		group by p.designaproduto) as p on w.maiorDesigna = p.maior) as f;
	
	
-- Alinea C Alternativa II)
select t.designaproduto, t.maior from (
	select p.designaproduto, sum(quantidade) as maior from produto as p
	join detalheencomenda as d on d.idproduto = p.idproduto 
	join encomenda as e on d.idencomenda = e.idencomenda
	group by p.designaproduto) as t
order by t.maior desc 
-- LIMIT 1 -- apenas retorna a tabela com uma linha; dependende SGBD PostgreSQL
FETCH FIRST 1 ROWS only; -- standard SQL:2008


-- Alinea D.1) 
select nomecliente, c.morada from cliente as c  
join encomenda as e on e.idcliente = c.idcliente 
join pagamento as p on p.idencomenda = e.idencomenda 
where p.estado = 'divida' and p.datalimite < current_date;

-- Alinea E.1) 
select t.designaproduto, t.media , t.numEnc from (
	select p.designaproduto, avg(quantidade) as media, count(quantidade) as numEnc  
	from produto as p, detalheencomenda as d
	join encomenda as e on d.idencomenda = e.idencomenda
	where d.idproduto = p.idproduto
	group by p.designaproduto) as t
order by t.numEnc desc 
FETCH FIRST 1 ROWS only;


-- Alinea F.1) 
select nomecliente, nomelote, count(l.nomelote) as numMoradas, designaproduto 
	from cliente as c, lote as l, produto as p
	join detalheencomenda as d on d.idproduto = p.idproduto
	join encomenda as e on d.idencomenda = e.idencomenda 
	where p.tipoproduto = 'Agricola' and d.quantidade >= 10 and l.datamaturacao < e.dataencomenda 
	and e.idcliente = c.idcliente and l.idproduto = d.idproduto
	group by c.nomecliente,l.nomelote, p.designaproduto
order by nomelote asc;


-- 7 
	B) 
select p.idproduto, designaproduto, nomecliente, tipocliente from produto as p, cliente as c
join encomenda as e on e.idcliente = c.idcliente 
join detalheencomenda as d on d.idencomenda = e.idencomenda 
join pagamento as pg on pg.idencomenda = e.idencomenda 
where not(pg.estado = 'divida' and pg.datalimite < current_date) and d.idproduto = p.idproduto
and  e.dataencomenda between '01/01/2020' and '31/12/2020'
order by designaproduto, nomecliente asc;

-- 7 
	C)
select nomecliente, e.idencomenda, dataencomenda from cliente as c, encomenda as e
join detalheencomenda as d on d.idencomenda = e.idencomenda
where e.dataencomenda between '01/01/2019' and '31/12/2019' and e.idcliente = c.idcliente 
group by nomecliente, dataencomenda, e.idencomenda 
having count(e.idencomenda) >= 2 

-- 7
	D)
select nomecliente, sum(quantidade * custounidade) as custototal
	from cliente as c,produto as p
	join detalheencomenda as d on d.idproduto = p.idproduto
	join encomenda as e on d.idencomenda = e.idencomenda 
	where e.dataencomenda between '01/01/2019' and '31/12/2019' and c.idcliente = e.idcliente
	group by c.nomecliente
order by custototal desc 
 


 -- 7 
	E) 
select nomecliente, pais, designaproduto from cliente as c, produto as p
	join detalheencomenda as d on d.idproduto = p.idproduto
	join encomenda as e on d.idencomenda = e.idencomenda 
where (e.dataencomenda between '01/01/2019' and '31/12/2019') and c.idcliente = e.idcliente and quantidade >= 20
except (select nomecliente, pais, designaproduto from cliente as c, produto as p
	join detalheencomenda as d on d.idproduto = p.idproduto
	join encomenda as e on d.idencomenda = e.idencomenda 
where e.dataencomenda >= '01/01/2020' and c.idcliente = e.idcliente and quantidade >= 20)


 -- 7 
	F) 
create view vwLote as 
select designaproduto, nomelote, p.idproduto, arealote, quantidadeprevista from produto as p, lote as l
where p.idproduto = l.idproduto;

select * from vwLote;

