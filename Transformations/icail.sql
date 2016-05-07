use icail;


select * from siteprocesso;

alter table preprocesso add column orgaojulgador varchar(256);

//*[@id="content"]/table[2]/tbody/tr/td/table[1]/tbody/tr/td[2]
	


select * from cargalexml where identifier = '7395538'

select * from cargalexml;

select site, A.urn from cargalexml A inner join siteprocesso B on concat('http://www.lexml.gov.br/urn/',rtrim(A.urn)) = rtrim(B.urn)
where A.localidade = '8ª Região - Pará e Amapá'

select * from preacordao;

select * from preprocesso;

select * from processo;

select * from tramitacao;