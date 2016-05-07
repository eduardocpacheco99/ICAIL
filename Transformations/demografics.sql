-- relatório Natalhie
-- todas as perguntas


-- idade companheiro
select count(cliente) ,replace(pergunta,'"',''), concat(left(right(concat('000',replace(resposta,'"','')),2),1),'0 -',left(right(concat('000',replace(resposta,'"','')),2),1),'9') from respostas
where pergunta  like '%idade_companheiro%'
 group by pergunta, left(right(concat('000',replace(resposta,'"','')),2),1)

-- idade
select count(cliente) ,replace(pergunta,'"',''), concat(left(right(concat('000',replace(resposta,'"','')),2),1),'0 -',left(right(concat('000',replace(resposta,'"','')),2),1),'9') from respostas
where pergunta  like '%idade"'
 group by pergunta, left(right(concat('000',replace(resposta,'"','')),2),1)

-- sexo
select count(id), ifnull(sexo,'desconhecido') sexo from leads_zoho where sexo in ('m','f',' ') group by sexo;

-- sonho
select count(id), objetivo from leads_zoho group by objetivo;

-- ocupacao
select count(cliente) ,replace(pergunta,'"',''), resposta from respostas
where pergunta  like '%ocupacao%'
 group by pergunta, resposta
having count(cliente) >1;

create table faixas_renda ( id int auto_increment primary key, qtde int, faixa varchar(32))



-- renda
insert faixas_renda
select 0,count(cliente) ,concat( concat(left(right(concat('000000',replace(rtrim(replace(replace(replace(replace(resposta,'"',''),'R$',''),';00',''),'.','')),' ','')),6),3),'000'),' - ', concat(left(right(concat('000000',replace(rtrim(replace(replace(replace(replace(resposta,'"',''),'R$',''),';00',''),'.','')),' ','')),6),3),'999')) from respostas
where pergunta  like '%renda%"' and pergunta not like '%renda_mensal_companheiro%'
 group by concat(left(right(concat('000000',replace(rtrim(replace(replace(replace(replace(resposta,'"',''),'R$',''),';00',''),'.','')),' ','')),6),3),'000')
having count(cliente)>1

-- região
select count(id)/(select count(id) from leads_zoho where estado is not null), estado from leads_zoho where  estado is not null
group by estado;

-- dependentes
select count(cliente) ,replace(pergunta,'"',''), resposta from respostas
where pergunta  like '%tem_dependen%'
 group by pergunta, resposta
having count(cliente) >1;

-- companheiro
select count(cliente) ,replace(pergunta,'"',''), resposta from respostas
where pergunta  like '%tem_companheiro%'
 group by pergunta, resposta
having count(cliente) >5;

