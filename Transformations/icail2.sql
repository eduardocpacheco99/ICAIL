use icail;


select * from siteprocesso;

select concat('http://www.lexml.gov.br/urn/',A.urn) as urn, concat(replace(site, SUBSTRING_INDEX( site , '/', -2 ),''), B.urlprimeirograu)  as urlprimeirograu, A.identifier identifier, 2 as instancia, ltrim(rtrim(B.juizrelator)) as juiz, 'TRT12' as tribunal, ltrim(rtrim(B.numeracaoantiga)), ltrim(rtrim(B.numeracaounica)),  STR_TO_DATE(replace(replace(dataautuacao,'\n',''),' ',''), '%m/%d/%Y') as data1, origem as tribunalorigem,  ltrim(rtrim(orgaojulgador)) orgaojulgador, ltrim(rtrim(nomeparteativa)) parte1, ltrim(rtrim(nomepartepassiva)) parte2      from 
 cargalexml A 
	inner join cabecalho B on A.identifier = B.identifier
	inner join siteprocesso C on rtrim(concat('http://www.lexml.gov.br/urn/',A.urn)) = rtrim(C.urn) 


update siteprocesso2 C  inner join cargalexml A on rtrim(concat('http://www.lexml.gov.br/urn/',A.urn)) = rtrim(C.urn) 
set C.cargaid = A.id



kill "227435";
show processlist;


select * from siteprocesso;

create table siteprocesso2 (id int auto_increment primary key, urn varchar(256), site varchar(256), arquivo varchar(256), cargaid int)


insert siteprocesso2
select 0, urn, site, arquivo, 0 from siteprocesso;


select * from siteprocesso2;

select concat('http://www.lexml.gov.br/urn/',A.urn) as urn, concat(replace(site, SUBSTRING_INDEX( site , '/', -2 ),''), B.urlprimeirograu)  as urlprimeirograu, A.identifier identifier, 2 as instancia, ltrim(rtrim(B.juizrelator)) as juiz, 'TRT12' as tribunal, ltrim(rtrim(B.numeracaoantiga)), ltrim(rtrim(B.numeracaounica)),  STR_TO_DATE(replace(replace(dataautuacao,'\n',''),' ',''), '%m/%d/%Y') as data1, origem as tribunalorigem,  ltrim(rtrim(orgaojulgador)) orgaojulgador, ltrim(rtrim(nomeparteativa)) parte1, ltrim(rtrim(nomepartepassiva)) parte2      from 
 cargalexml A 
	inner join cabecalho B on A.identifier = B.identifier


select * from cabecalho;
select * from preprocesso;

select * from siteprocesso;


select concat('http://www.lexml.gov.br/urn/',A.urn) as urn, concat(replace(site, SUBSTRING_INDEX( site , '/', -2 ),''), B.urlprimeirograu)  as urlprimeirograu, A.identifier identifier, 2 as instancia, ltrim(rtrim(B.juizrelator)) as juiz, 'TRT12' as tribunal, ltrim(rtrim(B.numeracaoantiga)), ltrim(rtrim(B.numeracaounica)),  STR_TO_DATE(replace(replace(dataautuacao,'\n',''),' ',''), '%m/%d/%Y') as data1, origem as tribunalorigem,  ltrim(rtrim(orgaojulgador)) orgaojulgador, ltrim(rtrim(nomeparteativa)) parte1, ltrim(rtrim(nomepartepassiva)) parte2      from 
 cargalexml A 
	inner join cabecalho B on A.identifier = B.identifier
	inner join siteprocesso C on rtrim(concat('http://www.lexml.gov.br/urn/',A.urn)) = rtrim(C.urn) 

alter table preprocesso modify parte2 varchar(512)




select * from preacordao;


alter table arquivoacordaoconteudo modify conteudo varchar(65500)


select * from arquivoacordaoconteudo WHERE conteudo like '%DAR-LHE%'


select * from arquivoacordaoconteudo WHERE conteudo like '%DAR PROVIMENTO%'

select * from arquivoacordaoconteudo WHERE conteudo like '%NEGAR%'

1. Pegar todas as informações da 1 instância com import.io;
2. Preparar information extraction e ler as decisões.
3. aplicar import.io para a segunda instância. 
4. Ler todas as informações disponíveis.
5. Fazer as associações nas tableas. Usar IBGE também.
6. Construir modelo preditivo. [
7. Minerar.
8. Aplicar para vários anos.

use icail;


show tables;



	

select * from arquivoacordaoconteudo;


select * from preprocesso;

select concat('http://consultas.trt12.jus.br',urlprimeirograu) endereco, identifier identifier,concat('/home/ubuntu/pentaho/icail/trt12/1instancia/',identifier,'.xml.xml') arquivo  from cabecalho
where urlprimeirograu is not null;

use icail;


update cabecalho set denominacaopartepassiva = 'Réu' where instancia = 1;

select count(id) from cabecalho where instancia = 1 and dataautuacao is not null and nomepartepassiva like '%BRF%'


select * from cabecalho where identifier ='8188058'

-- quando cria a 2 instancia já cria a 1
insert cabecalho
select 0,identifier,0,null,null,origem,null, concat('http://consultas.trt12.jus.br',urlprimeirograu), origem,null,null,'Autor', null, 'Réu',null, 1,0     from cabecalho
where urlprimeirograu is not null
group by identifier,origem
having count(identifier) <2;

delete from cabecalho where instancia = 1;

select * from movimentacao;

delete from movimentacao where instancia = 1;

alter table movimentacao modify column evento varchar(8000)

alter table movimentacao add column instancia int;
update movimentacao set instancia = 2;


select count(id) from siteprocesso;

select 
select * from cabecalho;

select * from preprocesso;





select id,  concat('/home/ubuntu/pentaho/icail/urn/urn_',id,'.xml')  as arquivo, concat('http://www.lexml.gov.br/urn/',urn) as endereco  from cargalexml where id < 20000
and urn is not null and localidade = '12ª Região - Santa Catarina' and  id > 500 limit 5000;

select * from cargalexml;

select * from controlecarga;


delete from controlecarga where ano = 2013

insert controlecarga
select 3,'2013',240974,0,'http://www.lexml.gov.br/busca/SRU?operation=searchRetrieve','&query=urn+="2013"&maximumRecords=1&startRecord=1'


select concat('/home/ubuntu/pentaho/icail/',ano,'/',ano,'_' ,processados,'to',processados+100,'.xml')  as arquivo, urlbase as endereco, ano , processados inicio,100 qtde ,  'urn=2013' as query from controlecarga where processados+100 <= total_registros and ano=2013

alter table cabecalho modify column dataautuacao varchar(128);