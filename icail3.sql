manoel antonio pinto 382, paraisópolis



create database icail;
use icail;

select count(identifier) from cabecalho3 where  urlprimeirograu <> '0'

select count(distinct identifier) from controleprocessamento;

select count(link) from controleprocessamentoacordao;

select count(identifier) from movimentacao;

create table cabecalho2 (id int auto_increment primary key,identifier varchar(16), numeracaoantiga varchar(32), dataautuacao varchar(64), numeracaounica varchar(32), origem varchar(64), primeirograu varchar(64), urlprimeirograu varchar(256), orgaojulgador varchar(128), juizrelator varchar(64), juizredator varchar(64), denominacaoparteativa varchar(16), nomeparteativa varchar(64),denominacaopartepassiva varchar(16), nomepartepassiva varchar(64), instancia int, valorcausa varchar(32))

use icail;

create table cabecalho3(identifier varchar(9) primary key, dataautuacao varchar(32), urlprimeirograu varchar(128), juizrelator varchar(64), juizredator varchar(64), nomeparteativa varchar(64), nomepartepassiva varchar(64))


select  identifier identifier,concat('/home/ubuntu/pentaho/icail/trt12/identifier_',identifier,'.xml.xml') arquivo  from cabecalho3 
where identifier not in (select distinct identifier from cabecalho3 where juizredator is not null and instancia=2)
limit 50;

select max( length(urlprimeirograu)) from cabecalho2;

select distinct identifier, numeracaoantiga,dataautuacao,numeracaounica,origem,primeirograu,urlprimeirograu,orgaojulgador,juizrelator,juizredator,denominacaoparteativa,nomeparteativa,denominacaopartepassiva,nomepartepassiva,instancia,valorcausa  from cabecalho;
use icail


select count(identifier) from controleprocessamento;

truncate table movimentacao;

truncate table cabecalho;

update cabecalho3 set juizrelator=null;

select count(identifier)  from cabecalho3 where juizrelator is not null;

select count(right(dataautuacao,4)), right(dataautuacao,4) from cabecalho3 where juizrelator is not null group by right(dataautuacao,4);


select max(identifier)-100  from cabecalho3 where juizrelator is not null;


select distinct count(juizrelator), juizrelator from cabecalho group by juizrelator;

select  identifier ,concat('/home/ubuntu/pentaho/icail/trt12/identifier_',identifier,'.xml.xml') arquivo  from cabecalho3 
where identifier not in (select distinct identifier from cabecalho3 where juizredator is not null )
and identifier > (select max(identifier)  from cabecalho3 where juizrelator is not null)
order by identifier asc
limit 15;

select  identifier identifier,concat('/home/ubuntu/pentaho/icail/trt12/identifier_',identifier,'.xml.xml') arquivo  from cabecalho3 
where identifier not in (select distinct identifier from cabecalho3 where juizredator is not null )
and identifier > 4206275
order by identifier asc
limit 15;


select count(link) from controleprocessamentoacordao


select identifier  from movimentacao where left(link,4) <> 'http'
and link not in (select link from controleprocessamentoacordao )
 limit 22999, 23000;


kill 11
select * from movimentacao;

show processlist;

kill 146

select * from cabecalho3;


select * from

alter table cabecalho3 modify nomepartepassiva varchar(128);

select  identifier identifier,concat('/home/ubuntu/pentaho/icail/trt12/identifier_',identifier,'.xml.xml') arquivo  from cabecalho3 
where identifier not in (select distinct identifier from cabecalho3 where juizredator is not null )
limit 50;

show processlist;

CREATE TABLE `movimentacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(16) DEFAULT NULL,
  `datamovimentacao` varchar(32) DEFAULT NULL,
  `evento` varchar(8000) DEFAULT NULL,
  `destino` varchar(256) DEFAULT NULL,
  `observacao` varchar(256) DEFAULT NULL,
  `link` varchar(256) DEFAULT NULL,
  `instancia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=831 DEFAULT CHARSET=latin1;


alter table movimentacao modify evento varchar(16)