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