select * from cabecalho3 where juizrelator is not null limit 5000;

select 


select identifier from cabecalho3 where juizrelator is not null order by identifier desc;

select * from cabecalho3;


 create table cabecalho(identifier varchar(9) primary key, dataautuacao varchar(32), urlprimeirograu varchar(128), juizrelator varchar(64), juizredator varchar(64), nomeparteativa varchar(64), nomepartepassiva varchar(64))

insert cabecalho

select * from cabecalho3 limit 100000

drop table controleprocessamentoacordao;
create table controleprocessamentoacordao ( link varchar(256))

select * from movimentacao;
select count(distinct link), count(link) from controleprocessamentoacordao;

select * from movimentacao where left(link,4) <> 'http'


select id, identifier, concat('http://consultas.trt12.jus.br/SAP2/',link) linkarcordao , concat('/home/ubuntu/pentaho/icail/trt12/acordaos/',identifier,'.xml') arquivo from movimentacao where left(link,4) <> 'http'
and link not in (select link from controleprocessamentoacordao )
