-- (a) Mostre o prefixo da aeronave e nome da companhia a qual ele pertence;
	-- The INNER JOIN keyword selects records that have matching values in both tables.
	-- aeronave aeronv muda o nome de aeronave para aeronv, o mesmo ocorre com companhia
	-- colocar uma abreviação na frente do nome da tabela, pode renomea-la(apelido)
	-- cod_companhia esta presente nas duas tabelas. Logo, esta coluna vai ser a condição de junção entre as duas
	-- o SELECT mostra quais colunas eu quero recuperar e FROM qual tabela
	-- INNER JOIN fará a junção da tabela específicada no select com a companhia
	-- ON apresenta a condição de junção
select aeronv.num_prefixo, comp.nom_companhia 
	from aeronave 			as aeronv
	inner join companhia	as comp 
		on comp.cod_companhia = aeronv.cod_companhia;

-- (b) Mostre o número, o preço e a distância de todos os vôos 
-- que tenham a cidade de “BELO HORIZONTE” como origem;
-- SELECIONE AS COLUNAS DA TABELA VOO
select nom_cidade, num_voo, vlr_preco, vlr_distancia 
	from voo
	-- JUNTE COM A TABELA AEROPORTO
	inner join aeroporto
		-- CONDIÇÃO DE JUNTAO (FK||PK = FK||PK)
		on cod_aeroporto_origem = cod_aeroporto
			where nom_cidade = 'BELO HORIZONTE';

-- (c) Mostre o número, o preço, o nome do aeroporto de destino, a distância de 
-- todos os vôos que tenham a cidade de “BELO HORIZONTE” como destino;
select nom_cidade, num_voo, vlr_preco, cod_aeroporto_destino, vlr_distancia
	from voo
	inner join aeroporto 
		on cod_aeroporto_destino = cod_aeroporto
			where nom_cidade = 'BELO HORIZONTE';

-- (d) Apresente o nome do tripulante e o nome do cargo que ele 
-- ocupa para todos tripulantes alocados a uma base doméstica;
select base.ind_base, tripulante.nom_tripulante, cargo.nom_cargo -- SELECIONA AS COLUNAS
	from tripulante inner join cargo inner join base -- JUNTA AS TABELAS
 		on tripulante.cod_cargo = cargo.cod_cargo -- ATRIBUI OS REQUISITOS DE JUNCAO
			and base.cod_base = tripulante.cod_base
				where base.ind_base = 'D';

-- (e) Apresente o nome de todos os aeroportos (origem e destino) 
-- que distam menos de 500km um do outro;
select  origem.nom_aeroporto from voo 
	join aeroporto as origem
		on origem.cod_aeroporto = voo.cod_aeroporto_origem
	join aeroporto as destino
		on destino.cod_aeroporto = voo.cod_aeroporto_destino
			where voo.vlr_distancia < 500;

-- (f) Mostre o número do vôo, o nome do aeroporto de origem e o 
-- nome aeroporto de destino para todos os vôos que tenham um 
-- aeroporto brasileiro como origem;
select voo.num_voo, orig.nom_aeroporto, dest.nom_aeroporto
		from voo
			inner join aeroporto as orig
            inner join aeroporto as dest
				on  dest.cod_aeroporto = voo.cod_aeroporto_destino
                and orig.cod_aeroporto = voo.cod_aeroporto_origem
			where orig.nom_pais = 'BRASIL';
		
-- (g) Mostre nome do aeroporto e o nome do país para todos os
-- aeroportos que foram destinos de algum vôo que decolou em 2006. 
-- A consulta deverá ser ordenada alfabeticamente pelo nome do país 
-- e depois pelo nome do aeroporto;
select aero.nom_aeroporto, aero.nom_pais, esc.dat_voo 
	from aeroporto as aero
		inner join escala as esc
			where esc.dat_voo between '2006-01-1' and '2006-12-31';

-- (h) Mostre o número(quantidade) de escalas realizadas na cidade 
-- de “SÃO PAULO” entre os anos de 2004 e 2006;
select * from escala
	inner join aeroporto
		on escala.cod_aeroporto = aeroporto.cod_aeroporto
			where escala.dat_voo between '2004-01-1' and '2006-12-31'
            and aeroporto.nom_cidade = 'SAO PAULO';

select count(*) from escala
	inner join aeroporto
		on escala.cod_aeroporto = aeroporto.cod_aeroporto
			where escala.dat_voo between '2004-01-1' and '2006-12-31'
            and aeroporto.nom_cidade = 'SAO PAULO';
		
-- (i) Mostre a quantidade de vôos cuja data de programação esteja no ano 
-- de 2004, a escala tenha hora prevista de chegada entre 13h00min e 16h00min
-- e tenha um aeroporto de origem no Brasil;
select count(*) from programacao as prog
	inner join voo 
	inner join escala as esc
    inner join aeroporto as aerop
		on prog.num_voo = voo.num_voo
		and aerop.cod_aeroporto = voo.cod_aeroporto_origem
        and aerop.cod_aeroporto = esc.cod_aeroporto		
			where prog.dat_voo between '2004-01-1' and '2004-12-31'
            and esc.hor_prevista_chegada between '13:00:00' and '16:00:00'
            and aerop.nom_pais = 'BRASIL';
            
select count(*) from programacao as prog
	inner join voo 						on prog.num_voo = voo.num_voo
	inner join aeroporto 	as aerop 	on voo.cod_aeroporto_origem = aerop.cod_aeroporto
    inner join escala 		as esc 		on esc.cod_aeroporto = aerop.cod_aeroporto 
    
	where prog.dat_voo 					between '2004-01-1' and '2004-12-31'
		and esc.hor_prevista_chegada 	between '13:00:00'	and '16:00:00'
        and aerop.nom_pais = 'BRASIL';
            
-- (j) Mostre o nome do tripulante, o número do prefixo da aeronave,
-- o número da escala, o número do voo, a data do vôo, a hora prevista 
-- de chegada e a hora prevista de sa´ıda das escalas que tenham sido 
-- realizadas no ano de 2004 e que tenham hora prevista de chegada entre 15:00 e 18:00;
select tri.nom_tripulante, aer.num_prefixo, pro.num_voo, esc.num_escala, esc.hor_prevista_chegada, esc.hor_prevista_saida, esc.dat_voo
		from escala as esc
			inner join programacao	as pro on esc.num_voo = pro.num_voo and esc.dat_voo = pro.dat_voo
			inner join aeronave		as aer on pro.num_prefixo = aer.num_prefixo
			inner join equipe_voo 	as eqp on pro.num_voo = eqp.num_voo
			inner join tripulante 	as tri on eqp.cod_tripulante = tri.cod_tripulante
		where esc.dat_voo between '2004-01-1' and '2004-12-31'
			and esc.hor_prevista_chegada between '15:00:00' and '18:00:00';

-- (k) Mostre os números de vôos que tenham como destino “PORTUGAL”;
select voo.num_voo from voo
	inner join aeroporto as aer
		on voo.cod_aeroporto_destino = aer.cod_aeroporto
	where aer.nom_pais = "PORTUGAL";

-- (l) Mostre os nomes de aeroportos que sejam destinos dos
-- comissários (cargo cod 2) cujos nomes terminem por ‘ALMEIDA’;
select tri.nom_tripulante	from tripulante as tri
	inner join equipe_voo	as eqp	
		on tri.cod_tripulante = eqp.cod_tripulante
	inner join programacao	as pro	
			on eqp.num_voo = pro.num_voo
	inner join escala 		as esc	
			on pro.num_voo = esc.num_voo
	inner join aeroporto 	as aer	
		on esc.cod_aeroporto = aer.cod_aeroporto
			where tri.cod_cargo = '2'
				and tri.nom_tripulante	like '%ALMEIDA' ;
				and aer.nom_pais		like "PORTUGAL";

-- (m) Apresente os nomes de todos tripulantes e, para aqueles
-- que voaram em 2004, as datas dos vôos;
select tri.nom_tripulante, eqp.dat_voo from tripulante as tri
	inner join equipe_voo as eqp
		on tri.cod_tripulante = eqp.cod_tripulante
	where eqp.dat_voo between '2004-01-01' and '2004-12-31';
		



