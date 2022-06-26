-- a) Selecione todos os vôos com origem no Brasil e destino no exterior.
select * from voo as voo_ori inner join aeroporto as aer_ori
	on voo_ori.cod_aeroporto_origem = aer_ori.cod_aeroporto
		where aer_ori.nom_pais= 'BRASIL' -- VERIFICA QUE O AEROPORTO DE ORIGEM É DO BRASIL
		and exists (select 'x' from voo as voo_des inner join aeroporto as aer_des -- FAZ A VERIFICAÇÃO DE EXISTÊNCIA 
			on voo_des.cod_aeroporto_destino = aer_des.cod_aeroporto -- CONECTA AS TABELAS
				where voo_ori.num_voo = voo_des.num_voo -- CONDIÇÃO ONDE O NUM DO VOO DE ORIGEM É IGUAL AO NUM DO VOO DE DESTINO
					and aer_des.nom_pais <> 'BRASIL'); -- E O NOM DO PAIS DE DESTINO É DIFERENTE DE BRASIL
            
select * from voo as v1 inner join aeroporto as a1
	on v1.cod_aeroporto_origem = a1.cod_aeroporto
		where a1.nom_pais = 'BRASIL' and exists
        (select 'x' from aeroporto as a2
			where a2.cod_aeroporto = v1.cod_aeroporto_destino
				and a2.nom_pais <> 'BRASIL');
                
-- b) Selecione países com aeroportos em fusos horários diferentes;
select distinct aer1.nom_pais from aeroporto as aer1
	where exists
    (select 'x' from aeroporto as aer2
		where aer2.nom_pais = aer1.nom_pais
			and aer2.vlr_fuso_horario <> aer1.vlr_fuso_horario);

-- c) Selecione os aeroportos cujo número de vôos destinados nele seja menor que de vôos partindo dele;
select aer.cod_aeroporto from aeroporto as aer
	where
    (select count(*) from voo where voo.cod_aeroporto_destino = aer.cod_aeroporto)
	<
	(select count(*) from voo where voo.cod_aeroporto_origem = aer.cod_aeroporto);
	
-- d) Selecione o número de vôos de cada empresa, ordenando descendentemente por este valor;
SELECT pro.num_voo, com.cod_companhia, com.nom_companhia FROM companhia as com
	inner join aeronave		as aer 
		on com.cod_companhia = aer.cod_companhia
	inner join programacao	as pro 
		on aer.num_prefixo = pro.num_prefixo
	order by pro.num_voo;

-- e) Selecione os nomes dos aeroportos de origem, escala e destino de 
-- todos os vôos que tenham menos de três escalas.
select ori.nom_aeroporto, esc.nom_aeroporto, des.nom_aeroporto from aeroporto as ori
	inner join aeroporto as esc
		on ori.nom_aeroporto;
	inner join aeroporto as des
		on 

SELECT v1.num_voo, ao1.nom_aeroporto origem, ad1.nom_aeroporto destino, ae1.nom_aeroporto escala
FROM voo v1 
    INNER JOIN escala e1		ON e1.num_voo = v1.num_voo
    INNER JOIN aeroporto ao1	ON ao1.cod_aeroporto = v1.cod_aeroporto_origem
    INNER JOIN aeroporto ad1	ON ad1.cod_aeroporto = v1.cod_aeroporto_destino
    INNER JOIN aeroporto ae1	ON ae1.cod_aeroporto = e1.cod_aeroporto
WHERE(
	SELECT COUNT(*) FROM escala e2 WHERE e2.num_voo = v1.num_voo
) < 3

-- f) Selecione o número do vôo e as cidades de origem e destino de cada vôo;



-- g) Selecione o(s) vôo(s) com maior número de escalas;



-- h) Selecione aeroportos que não sejam utilizados para escalas;



-- i) Selecione a quantidade de vôos de cada empresa;



-- j) Mostre o nome do tripulante que voará (ou voou) em uma aeronave alocada em na mesma base que ele;



-- k) Mostre o nome do tripulante mais antigo da empresa;



-- l) Mostre o nome do tripulante mais novo da empresa;



-- m) Mostre o número do vôo cujo o preço é menor que a média de preços de todos os vôos;



-- n) Mostre o número do vôo e o nome da cidade do vôo mais barato para cada cidade que é um destino;



-- o) Mostre o número do prefixo do avião mais novo de cada companhia;