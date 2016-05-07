a ideia é tirar os TRs

TIREI UM </TD>

</a><br /> -> </a><br /></TD>


use icail;


create table controleprocessamento (id int auto_increment primary key, identifier varchar(32))

drop table teste;
create table teste(id int auto_increment primary key, teste varchar(200000))



 select * from cabecalho;
 

select * from preacordao;

select * from arquivoacordao;

select * from arquivoacordaoconteudo;

select * from controlecarga;

use icail;
select * from cargalexml;


use icail;
insert into controlecarga
select null,2005,365459,0,'http://www.lexml.gov.br/busca/SRU?operation=searchRetrieve','&query=urn+="2005"&maximumRecords=1&startRecord=1'


select  * from cargalexml where localidade = '12ª Região - Santa Catarina' order by id desc limit 1000;

alter table cargalexml modify column description varchar(5000)

select count(id) from cargalexml where rtrim(localidade) like '%12%'

select count(id) from siteprocesso;

select * from siteprocesso;



truncate table siteprocesso;

select count(distinct identifier) from cargalexml where rtrim(localidade) like '%12%';

select distinct localidade from cargalexml;

select * from WL.wikimunicipios where rtrim(estado) = 'SC'

select distinct estado from  WL.wikimunicipios

alter table WL.wikimunicipios modify densidade double;

select * from WL.wikimunicipios where estado = 'SC' order by densidade desc;
update WL.wikimunicipios set area = 211 where id = 468 = replace(area,' ','')

select * from WL.wikimunicipios where  municipio like '%flori%'



update WL.wikimunicipios set  populacao = replace(populacao,'\n','')31030 where id =341
update WL.wikimunicipios set densidade = CAST(populacao AS UNSIGNED)/CAST(area AS UNSIGNED) where estado ='SC'


select * from WL.wikimunicipios where estado = 'SC'

select * from cargalexml where id > 392870

select count(id)  from cargalexml 
where urn is not null and localidade = '12ª Região - Santa Catarina' ;

alter table siteprocesso add column cargalexml

select count(id) from siteprocesso;

select * from cargalexml where identifier in ( select identifier from cargalexml group by identifier having count(identifier) >1 ) order by identifier;


use WL;
update wikimunicipios set pib_per_capita = rtrim(replace(pib_per_capita,'reais',''));

update wikimunicipios set pib_per_capita = rtrim(replace(pib_per_capita,'mil',''));

update wikimunicipios set pib_per_capita = rtrim(replace(pib_per_capita,'}}',''));


update wikimunicipios set pib_per_capita = replace(replace(replace(left(pib_per_capita,length(pib_per_capita)-3),' ',''),'.',''),',','')   where left(right(pib_per_capita,3),1) in ('.',',');



update wikimunicipios set dist_capital = rtrim(replace(dist_capital,"'",''));


update wikimunicipios set dist_capital = rtrim(replace(dist_capital,":",''));


update wikimunicipios set dist_capital = rtrim(replace(dist_capital,"}",''));


update wikimunicipios set dist_capital = rtrim(replace(dist_capital,"linha reta",''));

update wikimunicipios set dist_capital = rtrim(replace(dist_capital,"cerca de",''));


update wikimunicipios set dist_capital = replace(replace(replace(left(dist_capital,length(dist_capital)-2),' ',''),'.',''),',','')   where left(right(dist_capital,2),1) in ('.',',');

update wikimunicipios set dist_capital = replace(replace(replace(left(dist_capital,length(dist_capital)-3),' ',''),'.',''),',','')   where left(right(dist_capital,3),1) in ('.',',');


update wikimunicipios set populacao = replace(populacao,'.','')

update wikimunicipios set area= replace(replace(replace(left(area,length(area)-2),' ',''),'.',''),',','')   where left(right(area,2),1) in ('.',',',' ');

update wikimunicipios set area = replace(replace(replace(left(area,length(area)-3),' ',''),'.',''),',','')   where left(right(area,3),1) in ('.',',',' ');

update wikimunicipios set area = replace(replace(replace(left(area,length(area)-4),' ',''),'.',''),',','')   where left(right(area,4),1) in ('.',',',' ');

update wikimunicipios set area = replace(replace(replace(left(area,length(area)-4),' ',''),'.',''),',','')   where left(right(area,4),1) in ('.',',',' ');

update wikimunicipios set populacao = replace (populacao,' ','')


select * from WL.wikimunicipios where estado = 'SC'

update wikimunicipios set area = replace(replace(replace(area,' ',''),'.',''),',','')   ;


select site endereco, A.identifier identifier,concat('/home/ubuntu/pentaho/icail/trt12/identifier_',identifier,'.xml') arquivo  from cargalexml A inner join siteprocesso B on  A.id = B.cargalexml
where A.localidade = '12ª Região - Santa Catarina'
and B.site is not null;


select DISTINCT(denominacaoparteativa) from cabecalho;




select * from WL.wikimunicipios where rtrim(municipio) like '%fraiburgo%'

select * from WL.wikimunicipios where estado = 'SC' order by idh asc;

select count(A.id)  from cargalexml A inner join siteprocesso B on  A.id = B.cargalexml
where A.localidade = '12ª Região - Santa Catarina'
and B.site is not null;

delete from cabecalho where denominacaoparteativa is null;

select * from cabecalho;

select * from WL.wikimunicipios;

<td valign="top" width="215" align="left">
			
			
		 
	<a target="_blank" href="DocumentoListar.do?pidDoc=276171&amp;plocalConexao=sap2&amp;ptipo=PDF">VER ACÓRDÃO</a>
		<br>                       
				<a target="_blank" href="DocumentoListar.do?pidDoc=276171&amp;plocalConexao=sap2&amp;ptipo=RTF">VER ACÓRDÃO FORMATO RTF</a>
			     
        </td>

select site endereco, A.identifier identifier,concat('/home/ubuntu/pentaho/icail/trt12/identifier_',identifier,'.xml') arquivo  from cargalexml A inner join siteprocesso B on  A.id = B.cargalexml
where A.localidade = '12ª Região - Santa Catarina'
and B.site is not null
and A.identifier not in (select distinct identifier from cabecalho);
