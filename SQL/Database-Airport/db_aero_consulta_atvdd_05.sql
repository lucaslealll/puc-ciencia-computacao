-- a) Recupere o nome de todos os páıses com aeroportos
	-- select distinct = return only distinct (different) values.
select distinct nom_pais from aeroporto;

-- b) Selecione o código e o nome das companhias
	-- SELECT statement is used to select data from a database.
select cod_companhia, nom_companhia from companhia;

-- c) Selecione todos tripulantes que ganham mais de 1200.00
	-- WHERE clause is used to filter records.
select * from tripulante
	where vlr_salario > 1200.00;
    
-- d) Selecione o nome do aeroporto e o nome de sua cidade
select nom_aeroporto, nom_cidade from aeroporto;

-- e) Selecione todos tripulantes admitidos em 1978 e que tnham 'A' no nome
	-- The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
select * from tripulante
	where nom_tripulante like '%A%'
		and dat_admissao between '1978-01-01' and '1978-12-31';
    
-- f) Mostre a data de admissão mais antiga da tabela tripulante
select min(dat_admissao) from tripulante;

-- g) Mostre a data de admissão mais recente da tabela tripulante
select max(dat_admissao) from tripulante;

-- h) Mostre o maior salário de um tripulante
select max(vlr_salario) from tripulante;

-- i) Mostre o menor salário de um tripulante
select min(vlr_salario) from tripulante;

-- j) Mostre a média salarial dos tripulantes
select avg(vlr_salario) from tripulante;

-- k) Mostre soma salarial dos tripulantes
select sum(vlr_salario) from tripulante;

-- l) Mostre todos tripulantes cujo salário +50% <= 2000
-- select * from tripulante where vlr_salario * 1.5 <= 2000
select * from tripulante
	where ((vlr_salario * 50) / 100) <= 2000;

-- m) Selecione todos vôos que tenham 'PLU' como origem ou destino
select * from voo 
	where cod_aeroporto_origem like '%PLU%'
		or cod_aeroporto_destino like '%PLU%';

-- n) Liste em ordem alfabetica crescente todos os tripulantes cujo salário <1500
select * from tripulante
	where vlr_salario < 1500.00
		order by nom_tripulante asc;

-- o) Liste em ordem alfabetica decrescente todos os tripulantes cujo salário >1500
select * from tripulante
	where vlr_salario > 1500
		order by nom_tripulante desc;

-- p) Liste a data do vôo, a hora de chegada e saída de todas as escalas de fevereiro de 2006
select dat_voo, hor_prevista_chegada, hor_prevista_saida from escala
	where dat_voo between '2006-02-01' and '2006-02-28'
		or dat_voo between '2006-02-01' and '2006-02-29';

-- q) Mostre o número de prefixos das aeronaves que voaram em 2006
select * from programacao
	where dat_voo between '2006-01-01' and '2006-12-31';

-- r) Mostre os nomes dos aeroportos cujo cod. comece com 'C' e termine com 'H'
select nom_aeroporto from aeroporto
	where nom_aeroporto like 'C%H';
    
-- s) Apresente as escalas realizadas no mês determinado e fora do horário comercial