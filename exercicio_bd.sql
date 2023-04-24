create table tbvendas (
cdven integer primary key,
agecli decimal, 
dtven date,
mailcli varchar (50),
cdcli integer,
canal integer,
estdcli integer,
telcli varchar (15),
cidcli integer
);

create table tbpro (
cdpro integer primary key,
nmpro varchar (30),
tppro integer,
undpro integer
);

create table tbloja (
cdloja integer primary key,
cdvdd integer,
nmvdd varchar (100),
percomissao integer
);

alter table tbvendas add column cdpro integer;

alter table tbvendas add constraint cdpro foreign key (cdpro) references tbpro (cdpro);

alter table tbvendas add column cdloja integer;
alter table tbvendas add column cdvdd integer;

alter table tbvendas add constraint cdloja foreign key (cdloja) references tbloja (cdloja);
alter table tbvendas add constraint cdvdd foreign key (cdvdd) references tbloja (cdvdd);

'pg_dump'






CREATE TABLE TBPRO (
nmpro integer, 
cdpro integer primary key,
tppro integer,
undpro integer,
slpro integer,
stpro integer)

CREATE TABLE TBVEN (
cdven integer primary key,
dtven date,
agecli varchar (3),
nmcli varchar (100),
cdcli integer,
clacli varchar (10),
sxcli varchar (10) check (sxcli in ('masculino', 'feminino', 'outro')),
cidcli varchar (100),
estdcli varchar (3),
paiscli varchar (100),
canal varchar (100),
stven varchar (100),
cdvdd integer)

CREATE TABLE TBVDD (
cdvdd integer primary key,
nmvdd varchar (100),
sxvdd varchar (10) check (sxvdd in ('masculino', 'feminino', 'outro')),
percomissao integer,
matfunc integer,
idtbven integer)

CREATE TABLE TBVENITEM (
cdvenitem integer primary key,
cdpro integer,
qtven numeric,
crtven integer,
vruven integer,
cdven integer, foreign key (cdven) references TBVEN (cdven))

CREATE TABLE TBDEP (
cddep integer primary key,
inepescola varchar (100),
nmdep varchar (100),
dtnasc date,
sxdep varchar (10) check (sxdep in ('masculino', 'feminino', 'outro'))
)

ALTER TABLE TBVENITEM add constraint cdpro foreign key (cdpro) references TBPRO (cdpro) 

ALTER TABLE TBVEN add constraint cdvdd foreign key (cdvdd) references TBVDD (cdvdd) 

ALTER TABLE TBPRO ALTER COLUMN nmpro type varchar (100)

INSERT INTO TBVEN 
VALUES (12, '20221202', 21, 'maria', 'fortaleza', 'A', 'Fortaleza', 'CE', 'BR', 'Loja', 12, 158)

select * from tbven





-- Questão 1: Apresente a query para listar o código e 
-- o nome do vendedor com maior número de vendas (contagem) e que estas vendas estejam com status concluído.

SELECT cdvdd as codigovendedor, nmvdd as nomevendedor from tbvdd where cdvdd is not null and nmvdd is not null
group by cdvdd, nmvdd
order by cdvdd desc

-- Questão 2: Apresente a query para listar o código e o nome do produto mais vendido entre as datas 
-- 2014-02-03 até 2018-02-02.

SELECT cdpro as codigoproduto, nmpro as nomeproduto from tbpro where cdpro is not null and
tbpro is not null group by cdpro, nmpro where dtven between 2014-02-03 to 2018-02-02










-- Questão 1: Apresente a query para listar o código e 
-- o nome do vendedor com maior número de vendas (contagem) e que estas vendas estejam com status concluído.

SELECT cdvdd as codigovendedor, nmvdd as nomevendedor from tbvdd where cdvdd is not null and nmvdd is not null
group by cdvdd, nmvdd
order by cdvdd desc

-- Questão 2: Apresente a query para listar o código e o nome do produto mais vendido entre as datas 
-- 2014-02-03 até 2018-02-02.

SELECT cdpro as codigoproduto, nmpro as nomeproduto, dtven
from tbven
join tbpro on cdpro = cdpro
where dtven between '2014-02-03' and '2018-02-02'

-- Questão 3: Apresente a query para listar o código e o nome do cliente com maior gasto na loja.
-- As colunas presentes no resultado devem ser codigocliente (cdcli), nomecliente (nmcli),
-- e gasto, esta última representando o somatório das vendas atribuídas ao cliente.

SELECT cdcli as codigocliente, nmcli as nomecliente, 
SUM(vrtven) as gasto
from tbven
join tbven_item on tbven.cdcli = tbven.cdcli
group by cdcli, nmcli

-- Questão 4: Apresente a query para listar o código, nome e data de nascimento dos dependentes
-- do vendedor com menor valor total bruto em vendas (não sendo zero). As colunas presentes no documento
-- devem ser codigodependente (cddep), nomedependente (nmdep), datanascimento (dtnasc).

SELECT cddep as codigodependente, nmdep as nomedependente, dtnasc as datanascimento,
from tbdep where 
join tbdep on cddep = cddep

-- Questão 5: Apresente a query para listar os 3 produtos menos vendidos pelos canais de e-commerce
-- ou matriz. As colunas presentes devem ser canalvendas (canal), codigoproduto (cdpro), nomeproduto (nmpro),
-- e quantidade_vendas.

SELECT cdpro as codigoproduto, nmpro as nomeproduto, canal as canalvendas, sum(qtven) as quantidade_vendas
from tbven
join tbpro on tbven.cdpro = tbpro.cdpro

