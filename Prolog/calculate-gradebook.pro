% Problema 2: Escreva um predicado verificanota(L) que recebe uma lista com as notas de diversos
% alunos e, para cada aluno, o programa deverá imprimir na tela a nota do aluno com o seu status:
% aprovado, recuperação ou reprovado.

% Para isso considere:
% - reprovado: nota >= 0 e nota < 30
% - recuperação: nota >= 30 e nota < 60
% - aprovado: nota >= 60 e nota < 100

% Por exemplo: verificaNota([65, 99, 45.7, 23.9, 15.2, 36.7, 83.5]).
% 65 aprovado
% 99 aprovado
% 45.7 recuperacao
% 23.9 reprovado
% 15.2 reprovado
% 36.7 recuperacao
% 83.5 aprovado

verificaNota([]).
verificaNota([Head|Tail]) :- 
    Head >=  0,	Head =<  30, format('Reprovado!   ~w ~n',Head);
    Head >= 30,	Head =<  60, format('Recuperação! ~w ~n',Head);
    Head >= 60,	Head =< 100, format('Aprovado!    ~w ~n',Head);
verificaNota(Tail).