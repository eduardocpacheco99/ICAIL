use ods;
-- ligações totais por pa
-- SELECT A.dest_num, A.dur, A.dest_dn,A.starttime, B.from_no, B.to_no, B.duration
SELECT COUNT(idcalldetail) total_ligacoes, B.from_no ramal
FROM
	calldetails A inner join 
	callhistory3 B on A .idcallhistory2 = B.idcallhistory3
inner join ramais C on B.from_no = C.ramal
	WHERE (A.status=5 OR A.status=6)
	and A.is_tooutside = 1
	and length(to_no) >4
	and month(A.starttime) = month(curtime())
	and year(A.starttime) = year(curtime())
	and C.categoria = 'vendas'
GROUP BY B.from_no

-- ligações atendidas
SELECT COUNT(distinct idcalldetail) total_ligacoes_atendidas, B.from_no ramal
FROM
	calldetails A inner join 
	callhistory3 B on A .idcallhistory2 = B.idcallhistory3
inner join ramais C on B.from_no = C.ramal
	WHERE (A.status=5 OR A.status=6)
	and A.is_tooutside = 1
	and length(to_no) >4
	and month(A.starttime) = month(curtime())-1
	and year(A.starttime) = year(curtime())
	and C.categoria = 'vendas'
	and dur > '00:00:20'
GROUP BY B.from_no

-- clientes atendidos

SELECT COUNT(distinct to_no) total_clientes, B.from_no ramal
FROM
	calldetails A inner join 
	callhistory3 B on A .idcallhistory2 = B.idcallhistory3
inner join ramais C on B.from_no = C.ramal
	WHERE (A.status=5 OR A.status=6)
	and A.is_tooutside = 1
	and length(to_no) >4
	and month(A.starttime) = month(curtime())
	and year(A.starttime) = year(curtime())
	and C.categoria = 'vendas'
	and A.dur > TIME_FORMAT('00:00:20','%T')
GROUP BY B.from_no




--tma
SELECT COUNT(distinct to_no) total_clientes, B.from_no ramal
SELECT  SEC_TO_TIME( SUM( TIME_TO_SEC( TIME_FORMAT(dur,'%T')) )/ count(to_no) )  
FROM
	calldetails A inner join 
	callhistory3 B on A .idcallhistory2 = B.idcallhistory3
inner join ramais C on B.from_no = C.ramal
	WHERE (A.status=5 OR A.status=6)
	and A.is_tooutside = 1
	and length(to_no) >4
	and month(A.starttime) = month(curtime())
	and year(A.starttime) = year(curtime())
	and C.categoria = 'vendas'
and  TIME_FORMAT(dur,'%T') > TIME_FORMAT('00:00:20','%T')

SELECT  SEC_TO_TIME( SUM( TIME_TO_SEC( TIME_FORMAT(dur,'%T')) )/ count(to_no) )  
FROM
	calldetails A inner join 
	callhistory3 B on A .idcallhistory2 = B.idcallhistory3
inner join ramais C on B.from_no = C.ramal
	WHERE (A.status=5 OR A.status=6)
	and A.is_tooutside = 1
	and length(to_no) >4
	and month(A.starttime) = month(curtime())
	and year(A.starttime) = year(curtime())
	and C.categoria = 'vendas'
and from_no = 1009
and  TIME_FORMAT(dur,'%T') > TIME_FORMAT('00:00:20','%T')



select  SEC_TO_TIME( SUM( TIME_TO_SEC( TIME_FORMAT(dur,'%T')) ) )  / COUNT( to_no) from calldetails
	and month(starttime) = month(curtime())
	and year(starttime) = year(curtime())

--pedidos desse pa

select REPLACE(REPLACE(REPLACE(REPLACE(phone,'-',''),' ',''),'(',''),')',''),REPLACE(REPLACE(REPLACE(REPLACE(mobile,'-',''),' ',''),'(',''),')','') from propostas_zoho A inner join clientes_zoho B on trim(A.contactid) = trim(B.contactid) 

select * from propostas_zoho

select distinct count(distinct A.id), C.ramal from propostas_zoho A inner join clientes_zoho B on trim(A.contactid) = trim(B.contactid) 

inner join (SELECT distinct to_no , B.from_no ramal
FROM
	calldetails A inner join 
	callhistory3 B on A .idcallhistory2 = B.idcallhistory3
inner join ramais C on B.from_no = C.ramal
	WHERE (A.status=5 OR A.status=6)
	and A.is_tooutside = 1
	and length(to_no) >4
	and month(A.starttime) = month(curtime()) 
	and year(A.starttime) = year(curtime())
	and C.categoria = 'vendas'
	and A.dur > TIME_FORMAT('00:00:20','%T')
) C
on (RIGHT(REPLACE(REPLACE(REPLACE(REPLACE(B.phone,'-',''),' ',''),'(',''),')',''),8) = RIGHT(trim(to_no),8)
or RIGHT(REPLACE(REPLACE(REPLACE(REPLACE(B.mobile,'-',''),' ',''),'(',''),')',''),8) = RIGHT(trim(to_no),8) )
where A.Stage in ('Pedido','Pedido Cancelado')
group by C.ramal


select distinct Stage from propostas_zoho

and 
use ods;

truncate table callhistory3
truncate table calldetails;

select * from propostas_zoho A inner join clientes_zoho B on trim(A.contactid) = trim(B.contactid) 

inner join (SELECT distinct to_no , B.from_no ramal
FROM
	calldetails A inner join 
	callhistory3 B on A .idcallhistory2 = B.idcallhistory3
inner join ramais C on B.from_no = C.ramal
	WHERE (A.status=5 OR A.status=6)
	and A.is_tooutside = 1
	and length(to_no) >4
	and month(A.starttime) = month(curtime())
	and year(A.starttime) = year(curtime())
	and C.categoria = 'vendas'
	and TIME_FORMAT(A.dur,'%T') > TIME_FORMAT('00:00:30','%T')
) C
on (RIGHT(REPLACE(REPLACE(REPLACE(REPLACE(B.phone,'-',''),' ',''),'(',''),')',''),8) = RIGHT(trim(to_no),8)
or RIGHT(REPLACE(REPLACE(REPLACE(REPLACE(B.mobile,'-',''),' ',''),'(',''),')',''),8) = RIGHT(trim(to_no),8) )
where A.Stage='Pedido'
and month(A.ClosingDate)  = month(curtime()) 
and year(A.ClosingDate) = year(curtime())
and C.ramal = 1011
group by C.ramal


select * from propostas_zoho where Stage='Pedido'
and month(ClosingDate)  = month(curtime()) 
and year(ClosingDate) = year(curtime())
and conversao = 'area_vendas'



alter table callhistory3 modify column idcallhistory3 varchar(12) primary key

-- volume de pedidos
select distinct A.id, A.ContactName, valorCarta, tipoConsorcio,A.Email,Phone,Mobile, ramal   from propostas_zoho A inner join clientes_zoho B on trim(A.contactid) = trim(B.contactid) 

select * from calldetails;

VENDAS
select count(distinct A.id),ramal   from propostas_zoho A inner join clientes_zoho B on trim(A.contactid) = trim(B.contactid) 
inner join (SELECT distinct to_no , B.from_no ramal
FROM
	calldetails A inner join 
	callhistory3 B on A .idcallhistory2 = B.idcallhistory3
inner join ramais C on B.from_no = C.ramal
	WHERE (A.status=5 OR A.status=6)
	and length(to_no) >4
	and month(A.starttime) = month(curtime()) 
	and year(A.starttime) = year(curtime())
	and C.categoria = 'vendas'
	and TIME_FORMAT(A.dur,'%T') > TIME_FORMAT('00:00:20','%T')
) C
on (RIGHT(REPLACE(REPLACE(REPLACE(REPLACE(B.phone,'-',''),' ',''),'(',''),')',''),8) = RIGHT(trim(to_no),8)
or RIGHT(REPLACE(REPLACE(REPLACE(REPLACE(B.mobile,'-',''),' ',''),'(',''),')',''),8) = RIGHT(trim(to_no),8) )
where A.Stage in ('Venda','Venda Cancelada','Venda Inadimplente','Venda a confirmar')
and month(A.ClosingDate)  = month(curtime()) 
and year(A.ClosingDate) = year(curtime())
group by C.ramal


--VOLUME  
select sum(distinct valorcarta),A.id  from propostas_zoho A inner join clientes_zoho B on trim(A.contactid) = trim(B.contactid) 
inner join (SELECT distinct to_no , B.from_no ramal
FROM
	calldetails A inner join 
	callhistory3 B on A .idcallhistory2 = B.idcallhistory3
inner join ramais C on B.from_no = C.ramal
	WHERE (A.status=5 OR A.status=6)
	and length(to_no) >4
	and month(A.starttime) = month(curtime()) -1 
	and year(A.starttime) = year(curtime())
	and C.categoria = 'vendas'
	and TIME_FORMAT(A.dur,'%T') > TIME_FORMAT('00:00:20','%T')
) C
on (RIGHT(REPLACE(REPLACE(REPLACE(REPLACE(B.phone,'-',''),' ',''),'(',''),')',''),8) = RIGHT(trim(to_no),8)
or RIGHT(REPLACE(REPLACE(REPLACE(REPLACE(B.mobile,'-',''),' ',''),'(',''),')',''),8) = RIGHT(trim(to_no),8) )
where A.Stage in ('Venda','Venda Cancelada','Venda Inadimplente','Venda a confirmar')
and month(A.ClosingDate)  = month(curtime()) 
and year(A.ClosingDate) = year(curtime())
group by A.id


select * from calldetails;


SELECT count(idcalldetail) as  total_ligacoes_atendidas, C.ramal
FROM
	calldetails A inner join 
	callhistory3 B on A .idcallhistory2 = B.idcallhistory3
inner join ramais C on B.from_no = C.ramal
	WHERE (A.status=5 OR A.status=6)
	and A.is_tooutside = 1
	and length(to_no) >4
	and month(A.starttime) = month(curtime()) -1
	and year(A.starttime) = year(curtime())
	and C.categoria = 'vendas'
	and TIME_FORMAT(dur,'%T') > TIME_FORMAT('00:00:30','%T')
group By C.Ramal


SELECT *
FROM
	calldetails A inner join 
	callhistory3 B on A .idcallhistory2 = B.idcallhistory3
inner join ramais C on B.from_no = C.ramal
	WHERE (A.status=5 OR A.status=6)
	and A.is_tooutside = 1
	and length(to_no) >4
	and month(A.starttime) = month(curtime()) -1
	and year(A.starttime) = year(curtime())
	and C.categoria = 'vendas'
	and TIME_FORMAT(dur,'%T') > TIME_FORMAT('00:00:30','%T')
group By C.Ramal



	select sum( valorcarta)  from propostas_zoho A inner join clientes_zoho B on trim(A.contactid) = trim(B.contactid) 
	inner join (SELECT distinct to_no , B.from_no ramal
	FROM
		calldetails A inner join 
		callhistory3 B on A .idcallhistory2 = B.idcallhistory3
	inner join ramais C on B.from_no = C.ramal
		WHERE (A.status=5 OR A.status=6)
		and length(to_no) >4
		and month(A.starttime) = month(curtime())  
		and year(A.starttime) = year(curtime())
		and C.categoria = 'vendas'
		and TIME_FORMAT(A.dur,'%T') > TIME_FORMAT('00:00:30','%T')
	) C
	on (RIGHT(REPLACE(REPLACE(REPLACE(REPLACE(B.phone,'-',''),' ',''),'(',''),')',''),8) = RIGHT(trim(to_no),8)
	or RIGHT(REPLACE(REPLACE(REPLACE(REPLACE(B.mobile,'-',''),' ',''),'(',''),')',''),8) = RIGHT(trim(to_no),8) )
	where A.Stage in ('Pedido')
	and month(A.ClosingDate)  = month(curtime()) 
	and year(A.ClosingDate) = year(curtime())
group by A.id



select *   from propostas_zoho A inner join clientes_zoho B on trim(A.contactid) = trim(B.contactid) 
inner join (SELECT distinct to_no , B.from_no ramal
FROM
	calldetails A inner join 
	callhistory3 B on A .idcallhistory2 = B.idcallhistory3
inner join ramais C on B.from_no = C.ramal
	WHERE (A.status=5 OR A.status=6)
	and length(to_no) >4
	and month(A.starttime) = month(curtime()) 
	and year(A.starttime) = year(curtime())
	and C.categoria = 'vendas'
	and TIME_FORMAT(A.dur,'%T') > TIME_FORMAT('00:00:20','%T')
) C
on (RIGHT(REPLACE(REPLACE(REPLACE(REPLACE(B.phone,'-',''),' ',''),'(',''),')',''),8) = RIGHT(trim(to_no),8)
or RIGHT(REPLACE(REPLACE(REPLACE(REPLACE(B.mobile,'-',''),' ',''),'(',''),')',''),8) = RIGHT(trim(to_no),8) )
where contactName like '%divino%'

divino
luiz fernando


select *,score1 *1000 from scorevenda2  order by score1 desc

select *  from propostas_zoho A inner join clientes_zoho B on trim(A.contactid) = trim(B.contactid)

use ods;

select count(id) from propostas_zoho

select count(id) from clientes_zoho

truncate table propostas_zoho

use ods;
truncate table clientes_zoho;

select count(id) from clientes_zoho;

select count(id) from propostas_zoho;


truncate table callhistory3

use ods;
SELECT COUNT(idcalldetail) total_ligacoes
FROM
	calldetails A inner join 
	callhistory3 B on A .idcallhistory2 = B.idcallhistory3
inner join ramais C on B.from_no = C.ramal
	WHERE (A.status=5 OR A.status=6)
	and A.is_tooutside = 1
	and length(to_no) >4
	and month(A.starttime) = month(curtime())
	and year(A.starttime) = year(curtime())
	and C.categoria = 'vendas'

select count(id) from propostas_zoho where stage in ('Venda Cancelada','Venda Inadimplente')


truncate table calldetails

select * from cargaZoho

--
update leads_zoho set sexo = 'm' where sexo in ('Masculino','Homem')
update leads_zoho set sexo = 'f' where sexo in ('Feminino','Mulher')


update leads_zoho set sexo = 'm'  where right(nome, 2) in ('as','sé','or','el','pe','os','as','on','me','eu') and sexo is null;


update leads_zoho set sexo = 'f'  where right(nome, 2) in ('li','en','le', 'ne','re','te') and sexo is null;

update leads_zoho set sexo = 'f' where right(nome, 1) in ('a') and sexo is  null;

update leads_zoho set sexo = 'm' where right(nome,1) in ('o') and sexo is null;

update leads_zoho  A  inner join
	(select distinct nome ,sexo from leads_zoho where sexo is not null) B on A.nome = B.nome
set A.sexo = B.sexo
where A.sexo is null ;

--
select * from leads_zoho

select count(id) from leads_zoho


select count(id) from leads_zoho where sexo ='f'


select count(id) from leads_zoho where email  not like '%gmail.%' and email not like '%msn.%' and email not like '%hotmail.%' and email not like '%uol.%' and email not like '%bol.%' and email not like '%@yahoo.%' and email not like '%@terra.%' and email not like '%@ig.%' and email not like '%live.%' and email not like '%aol.%' and email not like '%outlook.%'

select count(id)  from clientes_zoho where email  not like '%gmail.%' and email not like '%msn.%' and email not like '%hotmail.%' and email not like '%uol.%' and email not like '%bol.%' and email not like '%@yahoo.%' and email not like '%@terra.%' and email not like '%@ig.%' and email not like '%live.%' and email not like '%aol.%' and email not like '%outlook.%'

select count(id) from clientes_zoho
select count(id) from clientes_zoho where sexo = 'f'

 : sexo, celular-valido, email-empresa, tipo_consorcio, valor_carta 
select * from clientes_zoho

update cargaZoho set PotentialsLastRecord = 0, costumersLastRecord=0, lastRecord=0;

truncate table leads_zoho


select * from propostas_zoho

select * from leads_zoho
select * from clientes_zoho




preciso fazer um score para medir a chance de conversão de um LEAD para um PEDIDO. o ponto é
PRIORIDADE. Logo, não precisa ser um score de "leads", mas de prioridade de agente.

lead da base: tipo_consórcio, valor da carta, sexo




idade, assalariado, funcionario publico, autonomo / empresario, renda, estado_civil, sexo, 

select * from  leads_zoho limit 100000


SELECT  date_format(avg(TIME_FORMAT(A.DUR, '%T')),'%T') as TMA, B.from_no ramal
FROM
	calldetails A inner join 
	callhistory3 B on A .idcallhistory2 = B.idcallhistory3
inner join ramais C on B.from_no = C.ramal
	WHERE (A.status=5 OR A.status=6)
	and A.is_tooutside = 1
	and length(to_no) >4
	and month(A.starttime) = month(curtime())
	and year(A.starttime) = year(curtime())
	and C.categoria = 'vendas'
GROUP BY B.from_no

USE ods;
select count(id) from clientes_zoho
alter table propostas_zoho modify column TemImovelProprio varchar(128)



truncate table callhistory3;

truncate table calldetails;


select distinct(stage) from propostas_zoho


select * from propostas_zoho

select * from leads_zoho

select * from clientes_zoho A inner join propostas_zoho B
on A.CONTACTID = B.PotentialName

select count(id) from propostas_zoho where Stage='Venda' and email is not null

886 com email de um total de 1041 pedidos
337 com email de um total de 556 vendas

367/
556

select * from clientes_zoho

select count(id) from propostas_zoho 

truncate table propostas_zoho

truncate table scorevenda;
cinsreate temporary table scorevenda


select sexo,'salksaklsaklakslaklssaklkslaklaslksa' as idade,A.Cidade, A.Estado, A.EstadoCivil,proposito_compra ,  NomePlano, TipoConsorcio, renda_mensal,valorCarta , ValorParcela, 'assaljksakjlsakljkljsakljsalkjas' as parcela_sobre_renda, Stage as Pedido_Venda from clientes_zoho  A inner join propostas_zoho B on trim(A.contactid) = trim(B.contactid)
where potentialId not in (select distinct potentialid from propostas_zoho where contactid in (select distinct contactid from propostas_zoho where stage='Venda') and stage <> 'Venda') limit 5000;


drop table scorevenda;

truncate table scorevenda2
use ods;
select * from scorevenda2 order by score1 desc

select * from scorevenda2
where pedido_venda not in ('Pedido','Venda')

create  table scorevenda2



select sexo,2014 - left(DataDeNascimento,4)  as idade,A.Cidade, A.Estado, A.EstadoCivil,proposito_compra ,  NomePlano, TipoConsorcio, renda_mensal,valorCarta , ValorParcela, round(valorParcela/Renda_mensal *100)  as parcela_sobre_renda, Stage as Pedido_Venda from clientes_zoho  A inner join propostas_zoho B on trim(A.contactid) = trim(B.contactid)
where potentialId not in (select distinct potentialid from propostas_zoho where contactid in (select distinct contactid from propostas_zoho where stage='Venda') and stage <> 'Venda') limit 5000;


select count(distinct A.id) from clientes_zoho  A inner join propostas_zoho B on trim(A.contactid) = trim(B.contactid)
where year(closingDate) = 2014
and Stage in ('Venda','Venda Cancelada')



select distinct Stage from clientes_zoho  A inner join propostas_zoho B on trim(A.contactid) = trim(B.contactid)
where year(closingDate) = 2014
and Stage = 'Venda'



potentialID - proposta
contact id = cliente

alter table scorevenda
add column faixaidade varchar(36)

	alter table scorevenda2
	add column score1 varchar(36)



select * from scorevenda2


update scorevenda
set Pedido_Venda = 'Pedido' where Pedido_Venda <> 'Venda';

update scorevenda 
set sexo = 'm' where sexo in ('Masculino','male');

update scorevenda 
set sexo = 'f' where sexo in ('Feminino','female');


select * from scorevenda limit 5000;

select count(*) from scorevenda where idade is null

select * from scorevenda where faixaidade is null


update scorevenda 
set faixaidade = '<= 20' where idade <= 20;
update scorevenda 
set faixaidade = '21-30' where idade >20 and idade < 31;
update scorevenda 
set faixaidade = '31-40' where idade >30 and idade < 41;
update scorevenda 
set faixaidade = '41-50' where idade >40 and idade < 51;
update scorevenda 
set faixaidade = '51-60' where idade >50 and idade < 61;
update scorevenda 
set faixaidade = '>=60' where idade >=60 ;

update scorevenda 
set faixaparcelasobrerenda = '<= 10%' where parcela_sobre_renda <= 10;
update scorevenda 
set faixaparcelasobrerenda = '10 ~ 15' where parcela_sobre_renda > 10 and parcela_sobre_renda <=15;
update scorevenda 
set faixaparcelasobrerenda = '15 ~ 20' where parcela_sobre_renda > 15 and parcela_sobre_renda <=20;
update scorevenda 
set faixaparcelasobrerenda = '20 ~ 25' where parcela_sobre_renda > 20 and parcela_sobre_renda <=25;
update scorevenda 
set faixaparcelasobrerenda = '25 ~ 30' where parcela_sobre_renda > 25 and parcela_sobre_renda <=30;
update scorevenda 
set faixaparcelasobrerenda = '30 ~ 35' where parcela_sobre_renda > 30 and parcela_sobre_renda <=35;
update scorevenda 
set faixaparcelasobrerenda = '>35' where parcela_sobre_renda > 35 ;







retira todas as propostas- vendas de todas as pessoas que tem vendas

select * from propostas_zoho

select * from cargaZoho
update cargaZoho set PotentialsLastRecord = 0


select count(A.id) from propostas_zoho A inner join clientes_zoho B on trim(A.contactid) = trim(B.contactid) 


2411+152

select count(id) from propostas_zoho where contactid not in ( select distinct contactid from clientes_zoho)
select count(id) from propostas_zoho where contactid is not null


select count(contactid) from clientes_zoho where contactid is not null


alter table propostas_zoho add column contactid varchar(32)

inner join  clientes_zoho B
on B.FirstName = A.ContactName and B.LeadSource = A.LeadSource

select count(id) from propostas_zoho where email is  null 

contactname, leadsouorce

select count(id) from leads_zoho 

select max(id) from leads_zoho

create table proposta_clientes_zoho( id int auto_increment primary key, proposta varchar(32), contact varchar(32),  Phone varchar(32))

select * from leads_zoho where email not like '%gmail.com' and email not like '%@hotmail.com'  and email not like '%@live.com' and email not like '%@bol.com.br'


truncate table propostas_zoho


--agora carga clientes


teste cluster: aqueles com valor de carta foram até o fim.	

select origem, renda_mensal, tem_companheiro, ocupacao, tem_veiculo, tem_dinheiro, tipo_consorcio, valor_carta from leads_zoho

select * from cargaZoho

truncate table leads

update cargaZoho set lastRecord = 0


create table clientes_zoho( id int primary key auto_increment,
CONTACTID varchar(128),
SMOWNERID varchar(128),
ContactOwner varchar(128),
LeadSource varchar(128),
FirstName varchar(128),
LastName varchar(128),
Email varchar(128),
Phone varchar(128),
Mobile varchar(128),
SMCREATORID varchar(128),
CreatedBy varchar(128),
CreatedTime varchar(128),
Sexo varchar(128),
CPF varchar(128),
RG varchar(128),
DataDeNascimento varchar(128),
Bairro varchar(128),
Profissao varchar(128),
Cidade varchar(128),
Estado varchar(128),
CEP varchar(128),
EstadoCivil varchar(128),
RazaoSocial varchar(128),
FoiContemplado varchar(128),
Rua varchar(128),
Numero varchar(128),
orgao_emissor_rg varchar(128),
nome_pai varchar(128),
nome_mae varchar(128),
cidade_nascimento varchar(128),
nacionalidade varchar(128),
servidor_publico_governo_sp varchar(128),
sp_previdencia varchar(128),
der_sp varchar(128),
hc_sp varchar(128),
servidor_public_bb varchar(128),
renda_mensal varchar(128),
tipo_de_endereco varchar(128),
uf_rg varchar(128),
proposito_compra varchar(128),
data_da_admissao varchar(128),
complemento varchar(128))

select * from cargaZoho


select * from cargaZoho

select * from propostas_zoho

select * from leads_s

ite_novo

select * from leads

drop table leads_zoho

select * from leads
create table leads_zoho ( id int auto_increment primary key, nome varchar(128), sobrenome varchar(128), sexo varchar(16), email varchar(128), dtnascimento varchar(32), celular varchar(32), telefone varchar(32), facebookid varchar(128), origem varchar(128), data_registro varchar(128),renda_mensal varchar(32), tem_companheiro varchar(16), ocupacao varchar(64), tem_veiculo varchar(16), tem_dinheiro varchar(32), tipo_consorcio varchar(32), valor_carta varchar(16), created_time datetime)


select  avg(TIME_FORMAT(DUR, '%T')) from calldetails



select * from propostas_zoho


select * from propostas_zogo