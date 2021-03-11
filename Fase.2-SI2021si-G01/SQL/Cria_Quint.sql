-- PostgreSQL
-- #### Schema ou Database ####

-- DROP SCHEMA Empresa CASCADE;

-- #### Cria a base de dados Empresa ####
CREATE SCHEMA QuintWeb;

-- #### Posiciona como Database corrente ####
-- Torna a execucao independente da selecao acima: 'Active Catalog/Schema'

SET search_path TO QuintWeb;


-- O Esquema da base de dados Cliente
CREATE TABLE cliente (
  IdCliente INT NOT NULL,
  NifCliente INT NOT NULL,
  NomeCliente varchar(255) NOT NULL,
  Morada varchar(255) NOT NULL,
  Pais varchar(255) NOT NULL,
  Email varchar(255) NOT NULL,
  Telemovel INT NOT NULL,
  TipoCliente varchar(255) NOT NULL,
  PRIMARY KEY (IdCliente)
);

-- O Esquema da base de dados Produto
CREATE TABLE produto (
  IdProduto INT NOT NULL,
  CustoUnidade FLOAT NOT NULL,
  DesignaProduto varchar(255) NOT NULL,
  QuantidadeDisponivel int NOT NULL,
  TipoProduto varchar(255) not NULL,
  Peso varchar(255),
  DataNascimento date,
  PRIMARY KEY (IdProduto)
);

CREATE TABLE encomenda (
  IdEncomenda INT NOT NULL,
  DataEncomenda date NOT NULL,
  IdCliente INT NOT NULL,
  Morada varchar(255) not null,
  TipoEncomenda varchar(255) not null,
  PRIMARY KEY (IdEncomenda),
  FOREIGN KEY (IdCliente) REFERENCES Cliente (IdCliente)
);

CREATE TABLE detalheencomenda (
  IdEncomenda INT NOT NULL,
  IdProduto INT NOT NULL,
  Quantidade INT NOT NULL,
  PRIMARY KEY (IdEncomenda, IdProduto),
  FOREIGN KEY (IdEncomenda) REFERENCES Encomenda (IdEncomenda),
  FOREIGN KEY (IdProduto) REFERENCES Produto (IdProduto)
);

create table pagamento (
	IdEncomenda INT not null,
	Estado varchar(255) not NULL,
	DataLimite date not null, 
	primary key (DataLimite, IdEncomenda),
	FOREIGN KEY (IdEncomenda) REFERENCES Encomenda (IdEncomenda)
);

create table lote (
	IdProduto int not null,
	NomeLote varchar(255) not null,
	DataMaturacao date not null,
	QuantidadePrevista varchar(255) not null,
	AreaLote varchar(255) not null,
	primary key (NomeLote, IdProduto),
	FOREIGN KEY (IdProduto) REFERENCES Produto (IdProduto)
);
