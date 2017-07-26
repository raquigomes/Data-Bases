drop schema public cascade;
create schema public;

CREATE TABLE clienteViaVerde(
NIB VARCHAR (21),
NIF VARCHAR (15),
IdViaVerde VARCHAR (20), 
Matricula VARCHAR(8),
Nome CHAR(20),
Morada VARCHAR(70),
Cidade CHAR(50),
PRIMARY KEY (IdViaVerde)
);

CREATE TABLE clienteViaVerdePass (
IdViaVerde VARCHAR(20),
NPassp VARCHAR,
PRIMARY KEY (IdViaVerde),
FOREIGN KEY (IdViaVerde) references clienteViaVerde on delete restrict
);

CREATE TABLE clienteViaVerdeBi (
IdViaVerde VARCHAR(20),
NPBI VARCHAR,
PRIMARY KEY (IdViaVerde),
FOREIGN KEY (IdViaVerde) references clienteViaVerde on delete restrict
);

CREATE TABLE clienteServico (
NIF VARCHAR(20),
NIB VARCHAR,
Nome CHAR(20),
Morada VARCHAR(70),
Cidade CHAR(25),
PRIMARY KEY (NIF)
);

CREATE TABLE servico (
NIF VARCHAR(20),
IdLocal VARCHAR(10),
NomeLocal CHAR(70),
PRIMARY KEY (IdLocal),
FOREIGN KEY (NIF) references clienteServico on delete restrict
);

CREATE TABLE bomba (
IdLocal VARCHAR(10),
Morada VARCHAR(70),
Cidade CHAR(25),
PRIMARY KEY (IdLocal),
FOREIGN KEY (IdLocal) references Servico on delete restrict
);

CREATE TABLE ponte (
IdLocal VARCHAR(10),
Valor INTEGER CHECK (Valor>0),
PRIMARY KEY (IdLocal),
FOREIGN KEY (IdLocal) references Servico on delete restrict
);

CREATE TABLE parque ( 
IdLocal VARCHAR(10),
ValorMinuto  float ,
Data timestamp,
PRIMARY KEY (IdLocal),
FOREIGN KEY (IdLocal) references Servico on delete restrict
);

CREATE TABLE portagemAutoEstrada (
IdLocal  VARCHAR(10),
Km INTEGER CHECK (Km>0),
Saida CHAR(5),
Valor INTEGER CHECK (Valor>0),
PRIMARY KEY (IdLocal),
FOREIGN KEY (IdLocal) references Servico on delete restrict
);

CREATE TABLE tem (
IdLocal  VARCHAR(10),
IdLocalP VARCHAR(10),
PRIMARY KEY (IdLocalP),
FOREIGN KEY (IdLocal) references servico on delete restrict
);

CREATE TABLE cancelaParq (
IdViaVerde VARCHAR(20),
IdLocalP VARCHAR(10),
EntradaSaida CHAR(15),
data timestamp not null,
PRIMARY KEY (IdViaVerde, IdLocalP, EntradaSaida),
FOREIGN KEY (IdViaVerde) references clienteViaVerde on delete restrict,
FOREIGN KEY (IdLocalP) references tem on delete restrict
);

CREATE TABLE passagemAE (
IdViaVerde VARCHAR(20),
IdLocalP VARCHAR (10),
Data TIMESTAMP,
PRIMARY KEY (IdlocalP, data),
FOREIGN KEY (IdViaVerde) references clienteViaVerde on delete restrict,
FOREIGN KEY (idLocalP) references tem on delete restrict
);

CREATE TABLE abastecimento (
IdViaVerde VARCHAR (20),
IdLocalP VARCHAR(10),
Data TIMESTAMP,
Valor INTEGER CHECK (Valor>0),
PRIMARY KEY (IdViaVerde),
FOREIGN KEY (IdViaVerde) references clienteViaVerde on delete restrict,
FOREIGN KEY (IdLocalP) references tem on delete restrict
);


INSERT INTO clienteViaVerde VALUES ('000132000645087006408', '658125472', '123', '23-45-AA', 'Silva', 'Rua das Ortencias', 'Tomar');
INSERT INTO clienteViaVerde VALUES ('005172000097001423600', '142946493', '124', '22-45-AA', 'Santos', 'Avenidade S.Pedro de Assis', 'Castelo Branco');
INSERT INTO clienteViaVerde VALUES ('001322000640000010358', '294639271', '125', '21-45-AA', 'Gomes', 'Rua da Pontinha', 'Setúbal');
INSERT INTO clienteViaVerde VALUES ('000023240000012010300', '917392342', '126', '14-45-AA', 'Vang Berg', 'Travessa das Astúrias', 'Faro');
INSERT INTO clienteViaVerde VALUES ('005054001450000104580', '458761245', '127', '15-H3-C4', 'Pereira', 'Rua dos portos perdidos', 'Beja');


INSERT INTO clienteViaVerdePass VALUES ('126', 91794393824);


INSERT INTO clienteViaVerdeBi VALUES ('123', '01739278329');
INSERT INTO clienteViaVerdeBi VALUES ('124', '92749272493');
INSERT INTO clienteViaVerdeBi VALUES ('125', '15203727102');
INSERT INTO clienteViaVerdeBi VALUES ('127', '24504561021');


INSERT INTO clienteServico VALUES ('5000', '3337050', 'Brisa', 'Quinta Torre da Aguilha');
INSERT INTO clienteServico VALUES ('4287', '2139501', 'Galp', 'Vila de Tomás Salgueiro');
INSERT INTO clienteServico VALUES ('1825', '1082360', 'Lusoponte', 'Avenida Fernando Pessoa');
INSERT INTO clienteServico VALUES ('9354', '2133120', 'BragaParques', 'Avenidade Heróis de Angola');


INSERT INTO servico VALUES ('5000', '001', 'Brisa A2');
INSERT INTO servico VALUES ('5000', '002', 'Brisa A2');
INSERT INTO servico VALUES ('5000', '003', 'Brisa A2');
INSERT INTO servico VALUES ('5000', '004', 'Brisa A1');
INSERT INTO servico VALUES ('5000', '005', 'Brisa A1');
INSERT INTO servico VALUES ('5000', '006', 'Brisa A1');
INSERT INTO servico VALUES ('5000', '007', 'Brisa A6');
INSERT INTO servico VALUES ('5000', '008', 'Brisa A6');
INSERT INTO servico VALUES ('5000', '009', 'Brisa A6');
INSERT INTO servico VALUES ('4287', '013', 'GalpEvora');
INSERT INTO servico VALUES ('4287', '023', 'Galp Grandola');
INSERT INTO servico VALUES ('1825', '024', ' Vasco da Gama');
INSERT INTO servico VALUES ('1825', '027', ' 25 de Abril');
INSERT INTO servico VALUES ('9354', '087', 'Entrada1 Parque de Estacionamento de Évora');
INSERT INTO servico VALUES ('9354', '088', 'Saida1 Parque de Estacionamento de Évora');
INSERT INTO servico VALUES ('9354', '089', 'Entrada2 Parque de Estacionamento de Évora');
INSERT INTO servico VALUES ('9354', '090', 'Saida2 Parque de Estacionamento de Évora');
INSERT INTO servico VALUES ('9354', '091', 'Entrada3 Parque de Estacionamento de Évora');
INSERT INTO servico VALUES ('9354', '092', 'Saida3 Parque de Estacionamento de Évora');
INSERT INTO servico VALUES ('9354', '032', 'Entrada1 Parque de Estacionamento de Lisboa');
INSERT INTO servico VALUES ('9354', '033', 'Saida1 Parque de Estacionamento de Lisboa');
INSERT INTO servico VALUES ('9354', '034', 'Entrada2 Parque de Estacionamento de Lisboa');
INSERT INTO servico VALUES ('9354', '035', 'Saida2 Parque de Estacionamento de Lisboa');
INSERT INTO servico VALUES ('9354', '036', 'Entrada3 Parque de Estacionamento de Lisboa');
INSERT INTO servico VALUES ('9354', '037', 'Saida3 Parque de Estacionamento de Lisboa');
INSERT INTO servico VALUES ('4287', '100', 'Galp Estremoz');


INSERT INTO bomba VALUES ('013', 'Rua das Oliveiras nº14', 'Évora');
INSERT INTO bomba VALUES ('023', 'Travessa das Ortigas nº31', 'Grandola');
INSERT INTO bomba VALUES ('100', 'Avenida dps Prazeres nº12', 'Estremoz');


INSERT INTO ponte VALUES ('024', '2');
INSERT INTO ponte VALUES ('027', '1');



INSERT INTO parque VALUES ('088', 0.03);
INSERT INTO parque VALUES ('090', 0.03);
INSERT INTO parque VALUES ('092', 0.03);
INSERT INTO parque VALUES ('033', 0.04);
INSERT INTO parque VALUES ('035', 0.04);
INSERT INTO parque VALUES ('037', 0.04);


INSERT INTO portagemAutoEstrada VALUES('001', '57', '1', '3');
INSERT INTO portagemAutoEstrada VALUES('002', '74', '2', '3');
INSERT INTO portagemAutoEstrada VALUES('003', '115', '3', '3');
INSERT INTO portagemAutoEstrada VALUES('004', '63', '1', '3');
INSERT INTO portagemAutoEstrada VALUES('005', '87', '2', '3');
INSERT INTO portagemAutoEstrada VALUES('006', '157', '3', '3');
INSERT INTO portagemAutoEstrada VALUES('007', '37', '1', '3');
INSERT INTO portagemAutoEstrada VALUES('008', '70', '2', '3');
INSERT INTO portagemAutoEstrada VALUES('009', '97', '3', '3');


INSERT INTO tem VALUES('001', '001');
INSERT INTO tem VALUES('002', '002');
INSERT INTO tem VALUES('003', '003');
INSERT INTO tem VALUES('004', '004');
INSERT INTO tem VALUES('005', '005');
INSERT INTO tem VALUES('006', '006');
INSERT INTO tem VALUES('007', '007');
INSERT INTO tem VALUES('008', '008');
INSERT INTO tem VALUES('009', '009');
INSERT INTO tem VALUES('013', '013');
INSERT INTO tem VALUES('087', '087');
INSERT INTO tem VALUES('088', '088');
INSERT INTO tem VALUES('089', '089');
INSERT INTO tem VALUES('090', '090');
INSERT INTO tem VALUES('091', '091');
INSERT INTO tem VALUES('092', '092');
INSERT INTO tem VALUES('032', '032');
INSERT INTO tem VALUES('033', '033');
INSERT INTO tem VALUES('034', '034');
INSERT INTO tem VALUES('035', '035');
INSERT INTO tem VALUES('036', '036');
INSERT INTO tem VALUES('037', '037');
INSERT INTO tem VALUES('024', '024');
INSERT INTO tem VALUES('023', '023');
INSERT INTO tem VALUES('027', '027');
INSERT INTO tem VALUES('100', '100');


INSERT INTO cancelaParq VALUES('123', '032', 'Entrada', '12-10-2014 18:33:00');
INSERT INTO cancelaParq VALUES('123', '033', 'Saida', '13-10-2014 8:12:00');
INSERT INTO cancelaParq VALUES('124', '087', 'Entrada', '10-10-2014 11:22:00');
INSERT INTO cancelaParq VALUES('124', '088', 'Saida', '13-10-2014 13:00:00');
INSERT INTO cancelaParq VALUES('126', '091', 'Entrada', '07-08-2014 11:04:20');
INSERT INTO cancelaParq VALUES('126', '092', 'Saida', '07-08-2014 13:21:03');




INSERT INTO passagemAE VALUES('125', '001', '12-11-2009 14:05:00');
INSERT INTO passagemAE VALUES('125', '002', '12-11-2009 15:00:00');
INSERT INTO passagemAE VALUES('125', '027', '01-11-2009 18:05:00');
INSERT INTO passagemAE VALUES('124', '003', '05-09-2013 19:27:17');


INSERT INTO abastecimento VALUES('125', '013', '11-10-2009 21:00:00', '50');
INSERT INTO abastecimento VALUES('124', '023', '08-11-2013 11:11:00', '20');
INSERT INTO abastecimento VALUES('123', '013', '14-11-2014 23:54:13', '35');
INSERT INTO abastecimento VALUES('127', '100', '23-10-2014 08:10:48', '80');