INSERT INTO quintweb.cliente (idcliente,nifcliente,nomecliente,morada,pais,email,telemovel,tipocliente) VALUES
	 (47576,123456789,'Gustavo','Lisboa','Portugal','A47576@alunos.isel.pt',926065477,'individual'),
	 (47587,987654321,'Leonor','Luanda','Angola','A47588@alunos.isel.pt',920000000,'empresa'),
	 (47594,246813579,'Tiago','Berlim','Alemanha','A47599@alunos.isel.pt',926044444,'individual'),
	 (100005, 765842901,'Jaquim','Setubal', 'Portugal','ficticio@gmail.com',921111111,'individual');

INSERT INTO quintweb.produto (idproduto,custounidade,designaproduto,quantidadedisponivel,tipoproduto,peso,datanascimento) VALUES
	 (100,1.99,'12xOvos',10,'Derivado',null,null),
	 (50,4.99,'Frango',6,'Pecuario','1kg/unidade','09/09/2020'),
	 (200,0.99,'Feijao-Verde',10,'Agricola','1kg/unidades',null),
	 (150,2.14,'Batatas',30,'Agricola','1kg/unidades',null);
-- Quantidade vem em Quilos
-- Ovos em Caixas

INSERT INTO quintweb.encomenda (idencomenda,dataencomenda,idcliente,morada,tipoencomenda) VALUES
	 (1,'15/11/2020',47576,'Lisboa','Enc_Individual'),
	 (2,'16/11/2019',47587,'Luanda','Enc_Empresarial'),
	 (3,'17/11/2019',47594,'Berlim','Enc_Individual'),
	 (4,'15/01/2019',100005,'Setubal','Enc_Individual'),
	 (5,'18/07/2020',100005,'Setubal','Enc_Individual'),
	 (6,'20/11/2019',47576,'Porto','Enc_Individual');

INSERT INTO quintweb.detalheencomenda (idencomenda,idproduto,quantidade) VALUES
	 (1,100,5),
	 (1,150,10),
	 (2,200,12),
	 (2,50,3),
	 (3,100,20),
	 (4,150,25),
	 (5,50,20),
	 (6,150,11);
	 
INSERT INTO quintweb.pagamento (idencomenda,estado,datalimite) VALUES
	 (1,'divida', '20/11/2020'),
	 (2,'liquidado', '21/11/2020'),
	 (3,'liquidado', '22/11/2020'),
	 (4,'liquidado', '20/01/2019'),
	 (5,'divida', '23/07/2021'),
	 (6,'liquidado', '19/11/2021');
	 
INSERT INTO quintweb.lote (idproduto,NomeLote,DataMaturacao,QuantidadePrevista,AreaLote) VALUES
	 (150,'Lote1','10/01/2019','10kg/unidades','1000m2'),
	 (150,'Lote2','10/11/2020','20kg/unidades','2000m2'),
	 (200,'Lote3','01/11/2020','10kg/unidades','1000m2');
	