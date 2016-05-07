-- arrumar score

-- arrumar pedido e venda


use ods;


select count(id) from scores where score > 500 order by score desc;


select count(id) from leads_zoho;



select * from valoresparcela limit 5000;


-- pedido e venda:
-> O que tem conexão com a tabela orders tem um pedido. Gravar como pedido.
-> O que não tem é apenas um lead. Gravar como lead



select m.leads_zoho_id, replace(v.valorcarta,'R$',''), min(v.valorparcela) valorparcela from modeloscorevendateste AS m 
inner join valoresparcela AS v on replace(v.valorcarta,'R$','') >= m.valorcarta and trim(v.objetivo = m.sonho
group by replace(v.valorcarta,'R$',''), m.leads_zoho_id



select * from modeloscorevendateste;


select * from valoresparcela;

olivar: não ( e não preencheu o site)
jamil: está aqui ( e foi importado)
joão acilon : não está aqui

select * from leads_zoho where sobrenome like '%shirabe%'


1. Olivar.
Está aqui. A carta está como 30mil e o paulo diz que é 50mil.

2.Jamil Pereira da Rocha. 
Está aqui. A carta está como 70mil e o paulo diz 70390.

3.João Acilon Rangel Arruda Junior.
Está e o valor da carta bate.

5. Sara Barreto Cardoso.
Está, 50mil vs 50360

6. Guilherme Rohan
Está, 37500 vs 40000

7. Maria Beatriz Ferro de Omena
ok

8.Nei Oliveira dos Santos
35000 vs 39510

9. Juliano Rossato
ok
api key: 76a2293324c69556f4e5c18a50523118-us9
https://us29.api.mailchimp.com/2.0/lists/batch-subscribe.json


create table listasmailchimp(id int auto_increment primary key, nome varchar(128), mailchimpid varchar(32), membros int, unsubscribes int, taxa_abertura double, taxa_clique double)


create table CampanhasMailChimp ( id int auto_increment primary key, cid varchar(32), title varchar(256), subject varchar(256))


select cid from CampanhasMailChimp;

create table EstatisticasCampanhasMailChimp (id int auto_increment primary key, cid varchar(32), clicks int, opens int)

drop table EstatisticasCampanhasMailChimp;


alter table CampanhasMailChimp add column send_date datetime;

select * from CampanhasMailChimp;

select account_id, average_cpc,month,day, ctr,clicks, cost, impressions from AW_ReportAccount
AW_ReportCampaign


select * from adwordsCampaignReport;


select sum(cost) as custo, sum(impressions) as impressoes, sum(clicks) as cliques,sum(cost)/sum(clicks) as cpc, sum(clicks)/sum(impressions) as ctr,  nomeCampanha, B.qtde as leads, ifnull(C.qtde,0) as Pedidos, ifnull(D.qtde,0) as Vendas from adwordsCampaignReport  A
inner join (select count(id) qtde, utm_campaign campanha  from utm_tracker where utm_medium = 'cpc'
and month(created_at) = month(now()) and year(created_at) = year(now())
 group by utm_campaign) B on rtrim(A.nomeCampanha) = rtrim(B.campanha)
left join (select ifnull(count(B.id),0) qtde, utm_campaign campanha  from utm_tracker A inner join leads_zoho B  on A.user_id = B.user_id where utm_medium = 'cpc'
and month(created_at) = month(now()) and year(created_at) = year(now()) and B.pedido_venda in ('Pedido','Venda Cancelada','Venda','Venda a Confirmar')  group by utm_campaign
 ) C on rtrim(A.nomeCampanha) = rtrim(C.campanha)
left join (select ifnull(count(B.id),0) qtde, utm_campaign campanha  from utm_tracker A inner join leads_zoho B  on A.user_id = B.user_id where utm_medium = 'cpc'
and month(created_at) = month(now()) and year(created_at) = year(now()) and B.pedido_venda in ('Venda','Venda a Confirmar')  group by utm_campaign
 ) D on rtrim(A.nomeCampanha) = rtrim(D.campanha)
where month(data) = month(now()) and year(data) = year(now())
group by nomeCampanha

 java -Xmx1G -jar /home/ubuntu/aw-reporting/aw-reporting/target/aw-reporting.jar -startDate 20140101 -endDate 20151231 -file /home/ubuntu/aw-reporting/aw-reporting/src/main/resources/aw-report-sample.properties -verbose


/home/ubuntu/pentaho/data-integration/pan.sh -file="/home/ubuntu/pentaho/pdi/Adwords/AdwordsToODS.ktr"

select * from adwordsCampaignReport

select count(B.id) qtde, utm_campaign campanha  from utm_tracker A inner join leads_zoho B  on A.user_id = B.user_id where utm_medium = 'cpc'
and month(created_at) = month(now()) and year(created_at) = year(now()) and B.pedido_venda in ('Pedido','Venda Cancelada','Venda','Venda a Confirmar')  group by utm_campaign

select count(id) qtde, utm_campaign campanha  from utm_tracker where utm_medium = 'cpc'
and month(created_at) = month(now()) and year(created_at) = year(now())
 group by utm_campaign

select * from leads_zoho where pedido_venda ='Venda a Confirmar'

select * from 

select * from utm_tracker where utm_campaign='desafiofabio'

select * from EstatisticasCampanhasMailChimp;

select * from listasmailchimp;

select nome,sexo,email,   

select
 nome,A.sexo,A.email,  B.categoriaocupacao as profissao, tipo_consorcio sonho,estado_civil,faixaidade,faixaparcelasobrerenda ,B.estado, null as cluster1, null as cluster2, null as cluster3
from leads_zoho
A inner join modeloscorevendateste B on A.leadid = B.leads_zoho_id
limit 100000





select  '76a2293324c69556f4e5c18a50523118-us9' as hapikey, 1000 as "limit" ,

concat('{    "apikey": "76a2293324c69556f4e5c18a50523118-us9", "id" : "e8ddcb79ed" }, batch : [ {  "email": {  "email": "' ,ifnull(A.email,''),'" }, "merge_vars" : { "First Name" : "',ifnull(nome,''),'", "sexo" : "',ifnull(A.sexo,'desconhecido'),'", "profissao" : "',ifnull(B.categoriaocupacao,'desconhecido'),'", "sonho" : "',ifnull(tipo_consorcio,'desconhecido'),'", "estado_civil" : "',ifnull(estado_civil,'desconhecido'),'", "faixaidade" : "',ifnull(faixaidade,'desconhecido'),'", "faixaparcelasobrerenda" : "',ifnull(faixaparcelasobrerenda,'desconhecido'),'", "estado" : "',ifnull(B.estado,'desconhecido'),'"   } } ]') as request,

'e8ddcb79ed' as idlista

 from leads_zoho
A inner join modeloscorevendateste B on A.leadid = B.leads_zoho_id
limit 100000


truncate table controleprocessamentomailchimp;

drop table controleprocessamentomailchimp
create table controleprocessamentomailchimp ( japrocessado varchar(128))

-- salva na base os emails que já foram enviados ao mailchimp
insert controleprocessamentomailchimp  

select
nome,A.sexo,A.email,  B.categoriaocupacao, tipo_consorcio sonho,estado_civil,faixaidade,faixaparcelasobrerenda ,B.estado, null as cluster1, null as cluster2, null as cluster3
from leads_zoho
A inner join modeloscorevendateste B on A.leadid = B.leads_zoho_id
where A.email not in (select distinct japrocessado from controleprocessamentomailchimp)
limit 100000



select * from leads_zoho;

select count(id) from leads_zoho;


select * from utm_source;



select *  from leads_zoho 
where pedido_venda in ('Venda','Venda a Confirmar')
and year(data_registro) = year(curtime())


os 4 são: Jamil
Acilion
Sara
ISAQUE



SELECT DISTINCT(b.id),A.id as lead_id, split_part(A.name, ' ', 1) AS nome,split_part(A.name, split_part(A.name, ' ', 1), 2) AS sobrenome,
A.date_birth,A.gender,A.mobile_phone, A.email,A.landline, A.occupation ,A.crm_lead_id,A.current_sign_in_ip, A.last_sign_in_ip ,A.created_at,'avante' AS origem 
, D.name as plano, g.slug AS objetivo, D.valor_da_carta as valor_da_carta, D.numero_parcelas, D.valor_da_parcela, D.custo_total_calculado , selling_state as status_venda 
FROM users A
LEFT JOIN orders B ON A.id = B.user_id
LEFT JOIN products C ON B.product_id = C.id
LEFT JOIN consorcios D ON D.id = C.productable_id
LEFT JOIN asset_fsp_product_types_goals E ON E.asset_fsp_product_type_id = C.asset_fsp_product_type_id
INNER JOIN profiles F ON A.id = F.owner_id
INNER JOIN goals G ON g.id = F.goal_id;