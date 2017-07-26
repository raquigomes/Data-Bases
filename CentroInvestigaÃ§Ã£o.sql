﻿drop schema public cascade;
create schema public;

CREATE TABLE autor(
nome_prop CHAR(30),
apelido CHAR(40),
PRIMARY KEY (nome_prop,apelido)
);

CREATE TABLE autor_Email(
nome_prop CHAR(30),
apelido CHAR(40),
email VARCHAR(50),
PRIMARY KEY(nome_prop, apelido),
FOREIGN KEY (nome_prop, apelido) references autor on delete restrict
);

CREATE TABLE autor_Orcid(
nome_prop CHAR(30),
apelido CHAR(40),
ORCID VARCHAR,
PRIMARY KEY (nome_prop,apelido),
FOREIGN KEY (nome_prop, apelido) references autor on delete restrict
);

CREATE TABLE autor_DeGois(
nome_prop CHAR(30),
apelido CHAR(40),
DeGois INTEGER CHECK(DeGois>0),
PRIMARY KEY(nome_prop,apelido),
FOREIGN KEY (nome_prop, apelido) references autor on delete restrict
);

CREATE TABLE instituicao(
nome CHAR(30),
localidade VARCHAR(50),
PRIMARY KEY(nome,localidade)
);

CREATE TABLE vinculo(
nome_prop CHAR(30),
apelido CHAR(40),
nome CHAR(50),
localidade VARCHAR(50),
data_inicio TIMESTAMP,
data_fim TIMESTAMP,
PRIMARY KEY(nome_prop,apelido,nome,localidade),
FOREIGN KEY (nome_prop, apelido) references autor on delete restrict,
FOREIGN KEY (nome, localidade) references intituicao on delete restrict
);

CREATE TABLE patente(
cod VARCHAR(20),
descrição VARCHAR(70),
data_criação TIMESTAMP,
período VARCHAR,
PRIMARY KEY(cod),
FOREIGN KEY (cod) references X on delete restrict
);

CREATE TABLE X(
nome_prop CHAR(30),
apelido CHAR(40),
cod VARCHAR(20),
PRIMARY KEY(nome_prop,apelido,cod),
FOREIGN KEY (nome_prop,apelido) references autor on delete restrict,
FOREIGN KEY (cod) references patente on delete restrict
);

CREATE TABLE artigo(
ID VARCHAR(10),
PRIMARY KEY(ID)
);

CREATE TABLE Y(
ID VARCHAR(15),
nome CHAR(30),
localidade VARCHAR(50),
PRIMARY KEY(ID,nome,localidade),
FOREIGN KEY (ID) references artigo on delete restrict,
FOREIGN KEY (nome, localidade) references instituicao on delete restrict
);

CREATE TABLE W(
ID VARCHAR(15),
nome_prop CHAR(30),
apelido CHAR(40),
PRIMARY KEY(ID,nome_prop,apelido),
FOREIGN KEY (ID) references artigo on delete restrict,
FOREIGN KEY (nome_prop,apelido) references autor on delete restrict
);

CREATE TABLE cap_liv(
ID VARCHAR(15),
tit_cap VARCHAR(30),
tit_liv VARCHAR(50),
ano_liv INTEGER CHECK (ano_liv>0),
PRIMARY KEY(ID),
FOREIGN KEY (ID) references artigo on delete restrict
);

CREATE TABLE cap_liv_pag(
ID VARCHAR(15),
paginas INTEGER CHECK (paginas>0),
PRIMARY KEY(ID),
FOREIGN KEY (ID) references artigo on delete restrict
);

CREATE TABLE cap_liv_edit(
ID VARCHAR(15),
editora VARCHAR(30),
PRIMARY KEY(ID),
FOREIGN KEY (ID) references artigo on delete restrict
);

CREATE TABLE acta(
ID VARCHAR(15),
tit_art VARCHAR(50),
tit_conf VARCHAR(40),
ano_conf INTEGER CHECK (ano_conf>0),
PRIMARY KEY(ID),
FOREIGN KEY (ID) references artigo on delete restrict
);

CREATE TABLE acta_edit(
ID VARCHAR(15),
editora VARCHAR(30),
PRIMARY KEY(ID),
FOREIGN KEY (ID) references artigo on delete restrict
);

CREATE TABLE acta_pag(
ID VARCHAR(15),
paginas INTEGER CHECK(paginas>0),
PRIMARY KEY(ID),
FOREIGN KEY (ID) references artigo on delete restrict
);

CREATE TABLE acta_loc(
ID VARCHAR(15),
local_conf VARCHAR(50),
PRIMARY KEY(ID),
FOREIGN KEY (ID) references artigo on delete restrict
);

CREATE TABLE artigo_Rev(
ID VARCHAR(15),
tit_rev VARCHAR(50),
nome_rev VARCHAR(50),
ano_rev INTEGER CHECK(ano_rev>0),
PRIMARY KEY(ID),
FOREIGN KEY (ID) references artigo on delete restrict
);

CREATE TABLE artigo_Rev_pag(
ID VARCHAR(15),
pag INTEGER CHECK(pag>0),
PRIMARY KEY(ID),
FOREIGN KEY (ID) references artigo on delete restrict
);

CREATE TABLE artigo_Rev_num(
ID VARCHAR(15),
nrev INTEGER CHECK(nrev>0),
PRIMARY KEY(ID),
FOREIGN KEY (ID) references artigo on delete restrict
);

CREATE TABLE artigo_Rev_mes(
ID VARCHAR(15),
mes CHAR(20),
PRIMARY KEY(ID),
FOREIGN KEY (ID) references artigo on delete restrict
);

CREATE TABLE bibliometria(
ID VARCHAR(15),
PRIMARY KEY(ID),
FOREIGN KEY (ID) references artigo on delete restrict
);


INSERT INTO autor VALUES ('Augusto', 'Madeiros');
INSERT INTO autor VALUES ('Pedro', 'Castro');
INSERT INTO autor VALUES ('Filipe', 'Santos');
INSERT INTO autor VALUES ('António', 'Pires');
INSERT INTO autor VALUES ('Clara', 'Sousa');

INSERT INTO autor_Email VALUES ('Augusto', 'Madeiros', 'am@gmail.com');
INSERT INTO autor_Email VALUES ('Pedro', 'Castro', 'pc@gmail.com');
INSERT INTO autor_Email VALUES ('Clara', 'Sousa', 'cs@gmail.com');

INSERT INTO autor_Orcid VALUES ('Augusto', 'Madeiros', '123');
INSERT INTO autor_Orcid VALUES ('António', 'Pires', '147');

INSERT INTO autor_DeGois VALUES ('Flipe', 'Santos', '434632');
INSERT INTO autor_DeGois VALUES ('Clara', 'Sousa', '555444');

INSERT INTO instituicao VALUES ('Universidade de Évora', 'Évora');
INSERT INTO instituicao VALUES ('Instituto Superior Técnico', 'Lisboa');
INSERT INTO instituicao VALUES ('Universidade do Minho', 'Minho');
INSERT INTO instituicao VALUES ('Universidade do Porto', 'Porto');
INSERT INTO instituicao VALUES ('Universidade de Coimbra', 'Coimbra');

INSERT INTO vinculo VALUES ('Augusto', 'Medeiros', 'Universidade de Évora', 'Évora', '23-7-2014 10:32:12', '23-7-2014 12:24:12');
INSERT INTO vinculo VALUES ('Pedro', 'Santos', 'Instituto Superior Técnico', 'Lisboa', '7-9-2014 14:54:52', '7-9-2014 17:54:23');
INSERT INTO vinculo VALUES ('Filipe Santos', 'Universidade do Minho', 'Minho', '14-12-2014 16:45:21', '14-12-2014 18:22:34');
INSERT INTO vinculo VALUES ('António', 'Pires', 'Universidade do Porto', 'Porto', '21-4-2014 12:12:12', '21-4-2014 17:00:21');

INSERT INTO patente VALUES ('123', 'eletromagnetismo', '27-5-2014 23:45:00', '1');
INSERT INTO patente VALUES ('435', 'radiação', '30-3-2014 14:45:21', '3');

INSERT INTO artigo VALUES ('214584');
INSERT INTO artigo VALUES ('845965');
INSERT INTO artigo VALUES ('100245');
INSERT INTO artigo VALUES ('547875');
INSERT INTO artigo VALUES ('457985');

INSERT INTO X VALUES ('Augusto', 'Medeiros', '123');
INSERT INTO X VALUES ('Filipe', 'Santos', '435');

INSERT INTO Y VALUES ('214584', 'Universidade de Évora', 'Évora');
INSERT INTO Y VALUES ('845965', 'Instituto Superior Técnico', 'Lisboa');
INSERT INTO Y VALUES ('100245', 'Unversidade do Minho', 'Minho');
INSERT INTO Y VALUES ('547875', 'Universidade de Coimbra', 'Coimbra');
INSERT INTO Y VALUES ('457985', 'Universidade do Porto', 'Porto');

INSERT INTO W VALUES ('214584','Pedro','Santos');
INSERT INTO W VALUES ('845965', 'António', 'Pires');
INSERT INTO W VALUES ('100245', 'Augusto', 'Medeiros');
INSERT INTO W VALUES ('547875', 'Clara', 'Sousa');
INSERT INTO W VALUES ('457985', 'Filipe', 'Santos');

INSERT INTO cap_liv VALUES ('214584', 'Dias díficeis', 'A vida', '2014');
INSERT INTO cap_liv VALUES ('547875', 'Passeio por Singapura', 'Viagem pelo mundo', '2014');

INSERT INTO cap_liv_pag VALUES ('214584', '154');
INSERT INTO cap_liv_pag VALUES ('547875', '245');

INSERT INTO cap_liv_edit VALUES ('214584', 'Porto Editora');
INSERT INTO cap_liv_edit VALUES ('547875', 'Portuguesa');

INSERT INTO acta VALUES ('845965', 'Paleontologia', 'Tempo dos dinaussauros', '2014');
INSERT INTO acta VALUES ('457985', 'Depressão aguda', 'Saúde Mental', '2014');

INSERT INTO acta_edit VALUES ('845965', 'Portuguesa');
INSERT INTO acta_edit VALUES ('457985', 'Porto Editora');

INSERT INTO acta_pag VALUES ('845965', '24');
INSERT INTO acta_pag VALUES ('457985', '245');

INSERT INTO acta_loc VALUES ('845965', 'Porto');
INSERT INTO acta_loc VALUES ('457985', 'Setúbal');

INSERT INTO artigo_Rev VALUES ('100245', 'Vida no deserto', 'National Geographic');

INSERT INTO artigo_Rev_pag VALUES ('100245','45');

INSERT INTO artigo_Rev_num VALUES ('100245', '7');

INSERT INTO artigo_Rev_mes VALUES ('100245', 'Março');
