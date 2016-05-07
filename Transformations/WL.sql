use WL;

create database WL;

drop table modeloscorevenda;

select * from modeloscorevenda;

create table modeloscorevenda(
id integer primary key auto_increment,
sexo varchar(16), idade integer, faixaidade varchar(32),cidade varchar(64), estado varchar(32),estadocivil varchar(32), rendamensal integer, valorcarta integer,valorparcela integer,  parcelasobrerenda double, faixaparcelasobrerenda varchar(32),  ocupacao varchar(64), empresa varchar(128), categoriaocupacao varchar(64),celular varchar(64), telefone varchar(64), codigoarea varchar(43),  pedidovenda varchar(32))

insert modeloscorevenda
-- usar o ktr "baixa leads" do projeto WL
select '',  sexo,2014 - left(DataDeNascimento,4)  as idade,'', A.Cidade, A.Estado, A.EstadoCivil,TipoConsorcio, renda_mensal,valorCarta , ValorParcela, round(valorParcela/Renda_mensal *100)  as parcelasobrerenda,'', Profissao, razaosocial, '',Mobile, Phone, '', Stage as Pedido_Venda from ods.clientes_zoho  A inner join ods.propostas_zoho B on trim(A.contactid) = trim(B.contactid)
where year(closingdate) in (2013,2014) and potentialId not in (select distinct potentialid from propostas_zoho where contactid in (select distinct contactid from propostas_zoho where stage='Venda') and stage <> 'Venda') limit 20000;

select * from modeloscorevenda

ATUALIZA FAIXAIDADE
update modeloscorevenda 
set faixaidade = 'desconhecido' where idade is null;

update modeloscorevenda 
set faixaidade = '<= 20' where idade <= 20;

update modeloscorevenda 
set faixaidade = '21-30' where idade >20 and idade < 31;
update modeloscorevenda 
set faixaidade = '31-40' where idade >30 and idade < 41;
update modeloscorevenda 
set faixaidade = '41-50' where idade >40 and idade < 51;
update modeloscorevenda 
set faixaidade = '51-60' where idade >50 and idade < 61;
update modeloscorevenda 
set faixaidade = '>=60' where idade >=60 ;


update modeloscorevenda set parcelasobrerenda= (valorparcela / rendamensal)*100;

ATUALIZA FAIXA PARCELASOBRERENDA
update modeloscorevenda 
set faixaparcelasobrerenda = 'desconhecido' where parcelasobrerenda is null;
update modeloscorevenda 
set faixaparcelasobrerenda = '<= 10%' where parcelasobrerenda <= 10;
update modeloscorevenda 
set faixaparcelasobrerenda = '10 ~ 15' where parcelasobrerenda > 10 and parcelasobrerenda <=15;
update modeloscorevenda 
set faixaparcelasobrerenda = '15 ~ 20' where parcelasobrerenda > 15 and parcelasobrerenda <=20;
update modeloscorevenda 
set faixaparcelasobrerenda = '20 ~ 25' where parcelasobrerenda > 20 and parcelasobrerenda <=25;
update modeloscorevenda 
set faixaparcelasobrerenda = '25 ~ 30' where parcelasobrerenda > 25 and parcelasobrerenda <=30;
update modeloscorevenda 
set faixaparcelasobrerenda = '30 ~ 35' where parcelasobrerenda > 30 and parcelasobrerenda <=35;
update modeloscorevenda 
set faixaparcelasobrerenda = '>35' where parcelasobrerenda > 35 ;



CATEGORIA OCUPACAO

update modeloscorevenda
set categoriaocupacao = 'assalariado';

update modeloscorevenda
set categoriaocupacao = 'autonomo ou empresario'
where ocupacao like '%tonom%'
or ocupacao like '%empres%'
or empresa like '%tonom%'
or empresa like '%empres%'
or empresa like '%N/A%'
or empresa is null
or empresa like '%diarista%'
or ocupacao like '%comerci%'
or ocupacao like '%cabeleleir%'
or ocupacao like '%pedreir%'
or ocupacao like '%garçom%'
or ocupacao like '%costureir%'
or ocupacao like '%medic%'
or ocupacao like '%eletricista%'
or ocupacao like '%frentist%'
or ocupacao like '%mecanic%'
or ocupacao like '%conta%'
or ocupacao like '%advogad%'
or ocupacao like '%serviço%'
or ocupacao like '%pintor%'
or ocupacao like '%domestic%'
or ocupacao like '%altonom%'
or ocupacao like '%carpinteir%'
or ocupacao like '%manicure%'
or ocupacao like '%cozinheir%'
or ocupacao like '%marceneir%'
or ocupacao like '%automon%'
or ocupacao like '%faxineir%'
or ocupacao like '%obra%'
or ocupacao like '%serralheiro%'





select count(id), ocupacao from modeloscorevenda group by ocupacao order by count(id) desc


update modeloscorevenda
set categoriaocupacao = 'funcionario publico'
where empresa like '%secretaria%' or empresa like '%prefeitura%' or empresa like '%estado%'
or empresa like '%governo%' or empresa like '%municip%' or empresa like '%policia%' or empresa like '%força%'
or empresa like '%caixa%' or empresa like '%banco do brasil%' or empresa like '%metro%' or ocupacao like '%servidor%' or empresa like '%federal%'

ATUALIZA SEXO
update modeloscorevenda 
set sexo = 'm' where sexo in ('Masculino','male');

update modeloscorevenda 
set sexo = 'f' where sexo in ('Feminino','female');

TRATA ESTADO CIVILL
update modeloscorevenda
set estadocivil = 'Solteiro' where estadocivil like '%viuv%';

update modeloscorevenda
set estadocivil = 'Casado' where estadocivil like '%uniao esta%';

LIMPA NULOS
update modeloscorevenda


select * from leads_zoho


ATUALIZA OS PEDIDOS

update modeloscorevenda
set pedidovenda = 'Venda' where pedidovenda in ('Venda','Venda Cancelada','Venda Inadimplente');

update modeloscorevenda
set pedidovenda='Não Venda' where pedidovenda not in ('Venda','Venda Cancelada','Venda Inadimplente');


select categoriaocupacao, count(id) from modeloscorevenda group by categoriaocupacao;



	select sexo,faixaidade,cidade,estado,estadocivil, faixaparcelasobrerenda,categoriaocupacao,pedidovenda  from modeloscorevenda where pedidovenda is not null limit 3000;

select * from leads_zoho_historico;

use ods;

select distinct cidade from leads_zoho;

select distinct replace(replace(cidade,'São Paulo','São Paulo (cidade)'),'Rio de Janeiro','Rio de Janeiro (cidade)') from modeloscorevenda;

Rio de Janeiro_(cidade)


CREATE FUNCTION ucfirst(x varchar(255)) returns varchar(255)
return concat( upper(substring(x,1,1)),lower(substring(x,2)) );


select count(id) from modeloscorevenda where pedidovenda = 'Venda';


update modeloscorevenda
set estado = 'RJ' where estado like '%Rio de Janeiro%'


use WL;

show tables;
drop table wikimunicipios;

alter table wikimunicipios modify column pib_per_capita varchar(256)

	limit 6000; where municipio like '%Água Santa%'

create table wikimunicipios (id int auto_increment primary key, municipio varchar(1024), estado varchar(512),urlwiki varchar(128),dist_capital int, pib_per_capita int, idh double, populacao int, area double, densidade double ) ;

update wikimunicipios set densidade = populacao/ area;

drop table wikimunicipioswebmining;
use WL;

update wikimunicipios set pib_per_capita = replace(replace(replace(left(dist_capital,length(dist_capital)-2),' ',''),'.',''),',','')   where left(right(dist_capital,2),1) in ('.',',');


select count(id) from wikimunicipios where idh is not null;

select * from wikimunicipios where municipio like '%São Paulo%'

 dist_capital like '%silia%';

update wikimunicipios set dist_capital = rtrim(replace(pib_per_capita,'\'',''));
update wikimunicipios set dist_capital = rtrim(replace(replace(pib_per_capita,'\'',''),'}',''));

select replace(replace(replace(left(pib_per_capita,length(pib_per_capita)-3),' ',''),'.',''),',','') as campotratado,left(pib_per_capita,length(pib_per_capita)-3) ,pib_per_capita, length(pib_per_capita) from wikimunicipios where left(right(pib_per_capita,3),1) in ('.',',')

update wikimunicipios set pib_per_capita = replace(replace(replace(left(pib_per_capita,length(pib_per_capita)-3),' ',''),'.',''),',','')   where left(right(pib_per_capita,3),1) in ('.',',')



update wikimunicipios set idh=null where id >4700;

use ods;

use ods;
select count(id) from leads_zoho;


use WL;

select * from wikimunicipios WHERE municipio like '%SAO BENTO DO SUL%'
S?O BENTO DO SUL
   ITAJAí 
   


create table wikimunicipioswebmining (id int auto_increment primary key, municipioid int, urlwiki varchar(128), conteudo varchar(65000))

use WL;
truncate table wikimunicipios;

select * from wikimunicipiosmining;
delete from wikimunicipios where municipio like '%xml%' or municipio like '%Municípios do Brasil%' 
or municipio like '%Toponímia do Brasil%'  or municipio like '% Lista de municípios do Brasil por unidade da Federação%' 
or municipio like '% Lista de municípios do Brasil acima de cem mil habitantes%'
