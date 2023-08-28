-- criacao do banco de dados para e-commerce
create database ecommercefinal;
use ecommercefinal;

-- cliente
CREATE TABLE Clientes(
	Id_Cliente INT NOT NULL AUTO_INCREMENT primary key,
	Nome VARCHAR(45) NOT NULL,
	CPF CHAR(11) NOT NULL,
	Endereco VARCHAR(255) NULL,
	constraint unique_cpf_Cliente unique (CPF)
    );
    alter table Clientes auto_increment = 1;
    desc Clientes;
    
-- produtos table product
CREATE TABLE Produto(
	Id_Produto INT NOT NULL AUTO_INCREMENT primary key , 
	Produto_Nome VARCHAR(45) NULL,
    Classificacao_kids bool default null,
    Categoria ENUM("ELETRONICO", "CAMA MESA", "ROUPA", "BRINQUEDO", "ALIMENTO"),
	Avaliacao float default 0,
    Size varchar(10)
);
alter table Produto auto_increment = 1;
                      
-- Pedido table orders 
CREATE TABLE Pedido(
	id_Pedido int auto_increment primary key,
	idOrdens_Cliente INT,
    Status_Pedido ENUM("Em falta", "Disponivel", "Faturado", "Em processamento", "Enviado", "Entregue") default "Em processamento",
	Frete FLOAT default 10,
	Tipo_Pagamento bool default false
);
alter table Pedido auto_increment = 1;     
desc Pedido;

-- tabela estoque table product sotorage
CREATE TABLE Estoque(
	id_Estoque int auto_increment primary key,
    Localizacao varchar (255) not null,
    quantidade int default 0 
);
alter table Estoque auto_increment = 1;

    -- Produtos_Estoque --  table product _storager Location
CREATE TABLE Produtos_Estoque(
	PProduto_id_produto INT,
    PEstoque_id_Estoque INT,
	Quantidade_estoque INT default 0,
    Location varchar(255) not null,
	PRIMARY KEY (PEstoque_id_Estoque, PProduto_id_produto ),
    constraint fk_PProduto_id_produto  foreign key (PProduto_id_produto) references produto (id_Produto),
	constraint fk_PEstoque_id_Estoque foreign key (PEstoque_id_Estoque) references Estoque (id_Estoque)
    );

-- tabela fornecedor  table supplier
CREATE TABLE Fornecedor(
  id_fornecedor INT AUTO_INCREMENT NOT NULL primary key ,
  RazaoSocial VARCHAR(45) NOT NULL,
  CNPJ char(15),
  CPF char(9),
  Contato char(11) NULL,
  Cidade VARCHAR(45) NULL,
  Pais VARCHAR(45) NULL,
  E_mail VARCHAR(45) NULL,
  Produto_Fornecido VARCHAR(45) NULL,
  constraint unique_Fornecedor unique (CNPJ)
);
alter table Fornecedor auto_increment = 1;

-- tabela Vendedor  table Seller
CREATE TABLE Vendedor(
	id_Vendedor INT AUTO_INCREMENT NOT NULL primary key,
	Razao_Social VARCHAR(255) NOT NULL,
	CNPJ char(15),
	CPF char(9),
	Contato_Vendedor VARCHAR (45),
    Contato char(11) not null,
	Localidade VARCHAR(255) NOT NULL,
   constraint unique_cnpj_Fornecedor unique (CNPJ),
   constraint unique_cpf_Fornecedor unique (CPF)
    );
    alter table Vendedor auto_increment = 1;
    
 -- produtos vendedor producSeller
  CREATE TABLE Produto_Vendedor(
  id_PVendedor INT,
  id_Prod_Produto INT ,
  Quantidade int default 1,
  PRIMARY KEY (id_PVendedor, id_Prod_Produto),
  CONSTRAINT fk_Produto_Vendedor foreign key (id_PVendedor) references Vendedor(id_Vendedor),
  CONSTRAINT fk_Prod_Produto foreign key (id_Prod_Produto ) references Produto(Id_Produto)
 );

CREATE table Disp_produto(
  id_disp_fornecedor INT NOT NULL,
  id_disp_produto INT NOT NULL,
  CONSTRAINT fk_id_disp_fornecedor foreign key (id_disp_fornecedor) references Fornecedor(id_fornecedor),
  CONSTRAINT id_disp_produto foreign key (id_disp_produto) references Produto(Id_Produto)
   );

CREATE TABLE Ordens_Pedidos(
  id_PoProduto INT,
  id_Popedido int,
  Po_Quantidade int,
  Po_Status ENUM("Disponivel", "Sem estoque") default "Disponivel",
  primary key (id_PoProduto, id_Popedido),
  CONSTRAINT fk_Ordens_Pedido foreign key (id_PoProduto) references Produto(id_Produto),
  CONSTRAINT fk_id_Popedido foreign key (id_Popedido) references pedido (id_Pedido)
  );