create table valoresparcela ( id int auto_increment primary key, objetivo varchar(32), valorcarta float, valorparcela float)

use ods;


select B.id, rtrim(objetivo) as objetivo, REPLACE(rtrim(respostas),",00", ";00") as respostas from respostas_site_novo A
	inner join leads_zoho B on A.email = B.email 
where B.id not in (select distinct cliente  from respostas)

select count(id) from leads_zoho

select * from leads_zoho where idade is not null;

select * from modeloscorevenda;

alter table leads_zoho add column leadid varchar(64)

select * from leads_zoho where leadid='604131000005687047'

select count(id) from clientes_zoho;

truncate table leads_zoho;

update cargaZoho set lastRecord=0;

select * from modeloscorevenda;

select count(id) from propostas_zoho;

select * from cargaZoho

select * from leads_zoho  A inner join respostas B on A.id = B.cliente
where valor_carta is not null

update table respostas A inner join (select id,cliente,REPLACE(pergunta,'"',"") as perguntasemaspas,REPLACE(resposta,'"',"") as respostasemaspas from respostas) B on A.id = B.id
set A.pergunta = B.perguntasemaspas, A.resposta = B.respostasemaspas ;

select id,cliente,REPLACE(pergunta,'"',"") as perguntasemaspas,REPLACE(resposta,'"',"") as respostasemaspas from respostas;

select * from respostas;

 resposta = REPLACE(resposta, '"','');

select distinct pergunta from respostas;

create view leads_zoho_extendida as (
  select
    id,
    case when pergunta = "\"idade\"" then resposta end as idade,
    case when pergunta = "\"ocupacao\"" then resposta end as ocupacao,
    case when pergunta = "\"valor_carro\"" then resposta end as valor_carro,
    case when pergunta = "\"renda_mensal\"" then resposta end as renda_mensal,
    case when pergunta = "\"perfil_consumo\"" then resposta end as perfil_consumo,
    case when pergunta = "\"valor_guardado\"" then resposta end as valor_guardado
  from history
);

create view leads_zoho_respostas_pivot as (
  select 
    id, 
    coalesce(A, 0) as A, 
    coalesce(B, 0) as B, 
    coalesce(C, 0) as C 
  from history_itemvalue_pivot 
);

select * from history_itemvalue_pivot_pretty;

--aplica regras para sexo
update leads_zoho set sexo = 'm'  where right(nome, 2) in ('as','sé','or','el','pe','os','as','on') and sexo is null;

update leads_zoho set sexo = 'f' where right(nome, 1) in ('a') and sexo is  null;

update leads_zoho set sexo = 'm' where right(nome,1) in ('o') and sexo is null;


--aplica aprendizado baseado no algoritmo OneRule: quando alguém for gravado com determinado sexo, isso determina as futuras classificações
update leads_zoho  A  inner join
	(select distinct nome ,sexo from leads_zoho where sexo is not null) B on A.nome = B.nome
set A.sexo = B.sexo
where A.sexo is null ;



alter table leads_zoho add column score1 varchar(64);

select * from leads_zoho



select count(id) from leads_zoho where sexo is null ;

select * from modeloscorevenda

select * from respostas;

select * from clientes_zoho


select * from respostas


create table cargaZoho (lastRecord int , data timestamp) ;

create table clientes_zoho (id int auto_increment primary key, nome varchar(64),  sobrenome varchar(64),sexo varchar(16), email varchar(64), dtnascimento datetime,celular varchar(16),telefone varchar(16),  facebookid varchar(64), origem varchar(16),  data_registro datetime)


update clientes_site_novo set sexo = 'm'  where right(nome, 2) in ('as','sé','or','el','pe','os','as','on') and sexo is not null

update clientes_site_novo set sexo = 'f' where right(nome, 1) in ('a') and sexo is not null

update clientes_site_novo set sexo = 'm' where right(nome,1) in ('o') and sexo is not null

select * from clientes_site_novo 

drop table clientes

truncate table clientes
select * from clientes
update cargaZoho
set PotentialsLastRecord = 0, lastRecord=0, costumersLastrecord = 0;
truncate table leads_zoho;
truncate table clientes_zoho;
truncate table propostas_zoho;
truncate table respostas;
truncate table respostas_site_novo;


select * from leads_zoho


select * from modeloscorevenda

create table modeloscorevendateste
as select *, 0 as score from modeloscorevenda 

select * from modeloscorevendateste

truncate table modeloscorevendateste


select count(id) from leads_zoho


insert cargaZoho (lastRecord)
values
(0)

truncate table cargaZoho


select CostumerslastRecord+1 as fromIndex, CostumerslastRecord+200 as toIndex, '38c5eee6a971a4a242c09abe631f4835' as authtoken, 'crmapi' as scope from cargaZoho


select lastRecord+1, lastRecord+200 from cargaZoho

select * from clientes_site_novo


select SUBSTRING_INDEX(ContactName, ' ', 1) nome from Propostas where Stage = 'Pedido'

truncate table Propostas
drop table Propostas


--aplica regras para sexo
update Propostas set sex = 'm'  where right(SUBSTRING_INDEX(ContactName, ' ', 1), 2) in ('as','sé','or','el','pe','os','as','on') and sex is null;

update Propostas set sex = 'f' where right(SUBSTRING_INDEX(ContactName, ' ', 1), 1) in ('a') and sex is  null;

update Propostas set sex = 'm' where right(SUBSTRING_INDEX(ContactName, ' ', 1),1) in ('o') and sex is null;


--aplica aprendizado baseado no algoritmo OneRule: quando alguém for gravado com determinado sexo, isso determina as futuras classificações
update Propostas  A  inner join
	(select distinct ContactName,sex from Propostas where sex is not null) B on SUBSTRING_INDEX(A.ContactName, ' ', 1) = SUBSTRING_INDEX(B.ContactName, ' ', 1)
set A.sex = B.sex
where A.sex is null ;


select * from cargaZoho
drop table Propostas
update cargaZoho set CostumerslastRecord = 0

select CostumerslastRecord+1 as fromIndex, CostumerslastRecord+200 as toIndex, '38c5eee6a971a4a242c09abe631f4835' as authtoken, 'crmapi' as scope from cargaZoho

create table propostas_zoho (id int auto_increment primary key, potentialId varchar(32),
PotentialOwner varchar(32),PotentialName varchar(64),  ClosingDate datetime, Stage varchar(32), LeadSource varchar(32), 
ContactName varchar(128), Sex varchar(16), cpf varchar(16), BirthDate datetime, EstadoCivil varchar(16), 
NomePlano varchar(64) , PrazoPagto varchar(8), NomeAdministradora varchar(32), DataInicio datetime, TipoConsorcio varchar(16), 
ValorCarta varchar(16), ValorParcela varchar(16), LinkProposta varchar(256), LinkBoleto varchar(256), Conversao varchar(32), DataBoleto datetime, PaymentStatus varchar(16), PaymentType varchar(32), VendaConfirmada varchar(16) , MesFechamento varchar(16), LeadConversionTime varchar(16), BoletoPago varchar(16), ComoFoiConvertido varchar(32), 
SeguroVida varchar(16), Cidade varchar(32), Email varchar(64), Ocupacao varchar(32), RendaMensal varchar(16), Estado varchar(32), ValorCarro varchar(32), QuantidadeCarta varchar(16), TemImovelProprio varchar(8))



create table Metadata_KPIs (id int primary key auto_increment, indicador varchar(32), descricao varchar(256),  area varchar(32), unidade varchar(32),  formula varchar(128), origem varchar(128))

RENAME TABLE clientes TO leads, clientes_zoho TO leads_zoho, clientes_site_novo TO leads_site_novo;

SELECT COUNT(DISTINCT IDCALLHISTORY2) AS LIGACOES_TOTAIS, COUNT(DISTINCT DEST_NUM) AS NUMEROS_VALIDOS, COUNT(DISTINCT DEST_NUM) / COUNT(DISTINCT IDCALLHISTORY2) AS NUMEROS_SOBRE_TOTAL
,  FROM calldetails WHERE   (status=5 OR status=6) 


 AND YEAR(STARTTIME) = YEAR(curdate())
AND MONTH(STARTTIME) = MONTH(curdate())


select * from leads_site_novo

SELECT COUNT(DISTINCT dest_num) 

 FROM calldetails WHERE   (status=5 OR status=6) 
 AND YEAR(STARTTIME) = 2014
AND MONTH(STARTTIME) = 09 


SELECT * FROM calldetails

CREATE TABLE callhistory3
(
  idcallhistory3 int,
  callid varchar(255) NOT NULL,
  starttime timestamp ,
  answertime timestamp ,
  endtime timestamp ,
  duration varchar(64) NOT NULL,
  is_answ boolean NOT NULL,
  is_fail boolean NOT NULL,
  is_compl boolean NOT NULL,
  is_fromoutside boolean,
  mediatype integer,
  from_no varchar(255),
  to_no varchar(255),
  callerid varchar(255),
  dialednumber varchar(255),
  lastcallerid varchar(255),
  lastdialednumber varchar(255),
  group_no varchar(255),
  line_no varchar(255),
  rate numeric,
  totalcost numeric,
  billprefix varchar(255),
  billratename varchar(255),
  grpanswdetail integer,
  recfile varchar(511),
  callchain varchar(128),
  is_visible boolean NOT NULL DEFAULT true,
  caller_display_name varchar(128)
)
